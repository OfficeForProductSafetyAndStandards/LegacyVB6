#include "hpib.h"

HPIB::HPIB()
{
}

Addr4882_t *HPIB::FindLstn(int boardId)
{
    // addresses:
    // 0    - master
    // 1-30 - devices
    // 31   - all devices?
    const Addr4882_t PIDsLstnTest[] = {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
        17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, NOADDR
    };

    SendIFC(boardId);
    if ((Ibsta() & ERR) != 0)
        return NULL;

    Addr4882_t *PIDsLstn = new Addr4882_t[ARRAY_SIZE(PIDsLstnTest)];
    ::FindLstn(boardId, PIDsLstnTest, PIDsLstn, ARRAY_SIZE(PIDsLstnTest) - 1);
    if (Ibsta() & ERR) {
        delete[] PIDsLstn;
        return NULL;
    }

    PIDsLstn[Ibcnt()] = NOADDR;

    return PIDsLstn;
}
