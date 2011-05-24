#include "scpi.h"
#include <stdio.h>

SCPI::SCPI()
{
}

SCPI::~SCPI()
{
}

/**
  Send command to device, of command is not query appends
  *OPC? at command end.
  @param cmd Buffer with command (zero terminated string).
  @param isQuery Indicate whatewer command is query.
  @return On success return 0, on error -1.
  */
int SCPI::sendCmd(const char *cmd, bool isQuery)
{
   int len = strlen(cmd);

   if (!isQuery) {
       const char opc[] = ";*OPC?";
       char buf[len + sizeof(opc) - 1];

       memcpy(buf, cmd, len);
       memcpy(buf + len, opc, sizeof(opc) - 1);
       len += sizeof(opc) - 1;
       return GPIB::sendCmd(buf, len);
   }
   else
       return GPIB::sendCmd(cmd, len);
}

int SCPI::cmdConf(mode_t mode, int channel)
{
    const char cmd[] = "conf:%s (@%i)";
    char buf[64];

    sprintf(buf, cmd, strMode(mode), channel);
    if (sendCmd(buf, false) == -1)
        return -1;

    return readValue();
}

int SCPI::cmdError(char *buf, int bufLen)
{
    const char cmd[] = "syst:err?";

    if (sendCmd(cmd, true) == -1)
        return -1;

    return GPIB::readValue(buf, bufLen);
}

int SCPI::cmdIDN(char *buf, int bufLen)
{
    const char cmd[] = "*IDN?";

    if (sendCmd(cmd, true) == -1)
        return -1;

    return GPIB::readValue(buf, bufLen);
}

int SCPI::cmdMeas(char *buf, int bufLen)
{
    //const char cmd[] = "meas?";
    const char cmd[] = "meas? (@101,102,103,104,105,106,107,108)";
    //const char cmd[] = "meas? (@101,102,103,104)";

    if (sendCmd(cmd, true) == -1)
        return -1;

    return GPIB::readValue(buf, bufLen);
}

int SCPI::cmdReset()
{
    const char cmd[] = "*RST";

    if (sendCmd(cmd, false) == -1)
        return -1;

    return readValue();
}

int SCPI::readValue()
{
    char buf[8];
    int len;

    len = GPIB::readValue(buf, sizeof(buf));
    if (len != 1)
        return -1;

    if (buf[0] != '1')
        return -1;

    return 0;
}

/**
  Convert channel measurement mode to its textual representation.
  @param mode Specified channel mode.
  @return Pointer to constatn string with textual mode representation.
  */
const char* SCPI::strMode(mode_t mode)
{
    switch (mode) {
    case modeCount:
        return "cont";
    case modeCurrAC:
        return "curr:ac";
    case modeCurrDC:
        return "curr:dc";
    case modeDiod:
        return "diod";
    case modeFreq:
        return "freq";
    case modePeriod:
        return "per";
    case modeRes2W:
        return "res";
    case modeVoltAC:
        return "volt:ac";
    case modeVoltDC:
        return "volt:dc";
    default:
        return "N/A";
    }
}

