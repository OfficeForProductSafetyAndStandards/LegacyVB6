#ifndef HPIB_H
#define HPIB_H

#include <common.h>
#include <windows.h>
#include <gpib488.h>

class GPIB
{
private:
    int devId;
    char poll;

public:
    GPIB();
    ~GPIB();
    void close();
    static Addr4882_t *findLstn(int boardId);
    bool isOpen();
    int open(int boardNum, int PAD, int SAD);
    int readValue(char *buf, int bufLen);
    int sendCmd(const char *cmd, size_t len);
};

#endif // HPIB_H
