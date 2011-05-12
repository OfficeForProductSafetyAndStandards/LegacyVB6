#ifndef HPIB_H
#define HPIB_H

#include <common.h>
#include <windows.h>
#include <gpib488.h>

class HPIB
{
public:
    HPIB();
    static Addr4882_t *FindLstn(int boardId);
};

#endif // HPIB_H
