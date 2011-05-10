#ifndef HPIBDEV_H
#define HPIBDEV_H

#include <windows.h>
#include "gpib488.h"

class HPIBDev
{
private:
    int boardNum, PAD, SAD;
    int devId;
public:
    HPIBDev();
    int open(int boardNum, int PAD, int SAD);
    int sendCmd(const char *cmd);
    int cmdReset();
    int cmdIDN(char *buf, int bufLen);
    int readValue(char *buf, int bufLen);
};

#endif // HPIBDEV_H
