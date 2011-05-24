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
    void close();
    int cmdConf(mode_t unit, int channel);
    int cmdError(char *buf, int bufLen);
    int cmdIDN(char *buf, int bufLen);
    int cmdMeas(char *buf, int bufLen);
    int cmdReset();

protected:
    const char* strMode(mode_t mode);
    int readValue();
    int sendCmd(const char *cmd, bool isQuery);
};

#endif // HPIBDEV_H
