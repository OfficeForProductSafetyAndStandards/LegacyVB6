#include "hpibdev.h"

HPIBDev::HPIBDev()
{
    boardNum = 0;
    PAD = 0;
    SAD = 0;
    devId = -1;
}

int HPIBDev::open(int boardNum, int PAD, int SAD)
{
   char spr;

   devId = ibdev(boardNum, PAD, SAD, 12, 1, 0);
   if (devId >= 0) {
      ibclr(devId);
      ibrsp(devId, &spr);
      ibtmo(devId, T3s);                    /* Set timeout to 3 seconds */
      cmdReset();
   }
   return devId;
}

int HPIBDev::sendCmd(const char *cmd)
{
   size_t cmdlength;

   cmdlength = strlen(cmd);
   ibwrt(devId, cmd, cmdlength);
   if (Ibcnt() != cmdlength || Ibsta() & ERR)
      return -1;
   else
      return 0;
}

int HPIBDev::cmdReset()
{
    const char cmd[] = "*RST";
    if (sendCmd(cmd) == -1)
        return -1;

    return 0;
}

int HPIBDev::cmdIDN(char *buf, int bufLen)
{
    const char cmd[] = "*IDN?";
    if (sendCmd(cmd) == -1)
        return -1;

    if (readValue(buf, bufLen) <= 0)
        return -1;

    return 0;
}

int HPIBDev::readValue(char *buf, int bufLen)
{
   int len;

   ibrd(devId, buf, bufLen);
   len = Ibcnt();
   if (len == bufLen || len == 0 || Ibsta() & ERR)
      return -1;

   buf[len-1] = '\0';    /* Terminate string */

   return len;
}
