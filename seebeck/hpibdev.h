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
    ~HPIBDev();
    void close();
    int cmdReset();
    int cmdIDN(char *buf, int bufLen);
    bool isOpen();
    int open(int boardNum, int PAD, int SAD);
    int readValue(char *buf, int bufLen);
    int sendCmd(const char *cmd);
};

#endif // HPIBDEV_H
