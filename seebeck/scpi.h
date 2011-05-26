#ifndef HPIBDEV_H
#define HPIBDEV_H

#include "gpib.h"

class SCPI : public GPIB
{
public:
    typedef enum {
        modeCount,
        modeCurrAC,
        modeCurrDC,
        modeDiod,
        modeFreq,
        modePeriod,
        modeRes2W,
        modeVoltAC,
        modeVoltDC,
    } mode_t;

    SCPI();
    ~SCPI();
    int cmdConf(mode_t mode, const int channels[]);
    int cmdError(char *buf, int bufLen);
    int cmdIDN(char *buf, int bufLen);
    int cmdInit();
    int cmdMeas(char *buf, int bufLen, const int channels[]);
    int cmdRead(char *buf, int bufLen);
    int cmdReset();

protected:
    const char* strMode(mode_t mode);
    int readValue();
    int sendCmd(const char *cmd, bool isQuery);
};

#endif // HPIBDEV_H
