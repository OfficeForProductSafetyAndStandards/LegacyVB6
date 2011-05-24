#include "gpib.h"
#include <ctype.h>

GPIB::GPIB()
{
    devId = -1;
}

GPIB::~GPIB()
{
    close();
}

/**
  Find all listeners.
  @param boardId Id/number of board for listing
  @return Pointer to list of Addr4882_t containing numbers of all
    listening devices, this list should be free by delete[]
  */
Addr4882_t *GPIB::findLstn(int boardId)
{
    /** valid GIPB addresses:
     0    - master
     1-30 - valid device addresses
     31   - all devices? */
    const Addr4882_t PIDsLstnTest[] = {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
        17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, NOADDR
    };
    Addr4882_t *PIDsLstn;

    SendIFC(boardId);
    if ((Ibsta() & ERR))
        return NULL;

    PIDsLstn = new Addr4882_t[ARRAY_SIZE(PIDsLstnTest)];
    ::FindLstn(boardId, PIDsLstnTest, PIDsLstn, ARRAY_SIZE(PIDsLstnTest) - 1);
    if (Ibsta() & ERR) {
        delete[] PIDsLstn;
        return NULL;
    }

    PIDsLstn[Ibcnt()] = NOADDR;

    return PIDsLstn;
}

/**
  Close opened device connected to GPIB
  */
void GPIB::close()
{
    if (isOpen()) {
        ibsre(devId, 0);
        ibonl(devId, 0);
    }
}

/**
  Check whathewer device os open.
  @return Return true if device is open, false otherwise.
  */
bool GPIB::isOpen()
{
    return devId >= 0;
}

/**
  Open device connected to GPIB.
  @param boardNum Id/number of board to open.
  @param PAD Primary device address in range 1-30 @see PIDsLstnTest
  @param SAD Secondary device address.
  */
int GPIB::open(int boardNum, int PAD, int SAD)
{
    SendIFC(boardNum);
    if ((Ibsta() & ERR) != 0) {
        return -1;
    }

    devId = ibdev(boardNum, PAD, SAD, T1s, 1, 0);
    if (devId >= 0) {
       ibclr(devId);
       ibrsp(devId, &poll);
       ibtmo(devId, T1s);
       SendLLO(boardNum);
    }

    return devId;
}

/**
  Read response from device.
  @param buf Pointer to char array to store text data.
  @param bufLen Lenght of buffer.
  @return Return number of bytes read, or -1 on error.
  */
int GPIB::readValue(char *buf, int bufLen)
{
    int len;

    ibrd(devId, buf, bufLen);
    len = Ibcnt();
    if (len == bufLen || len == 0 || Ibsta() & ERR)
       return -1;

    // strip end of string from whitespaces
    while (isspace(buf[--len])) {
        if (!len)
            return -1;
    }

    buf[++len] = 0;

    return len;
}

/**
  Send command (text) to device.
  @param buf Buffer with text to send.
  @param len Number of bytes to send.
  @return On success returns 0, on error -1.
  */
int GPIB::sendCmd(const char *buf, size_t len)
{
    ibwrt(devId, buf, len);
    if (Ibsta() & ERR ||
            Ibcnt() != len)
       return -1;

    return 0;
}
