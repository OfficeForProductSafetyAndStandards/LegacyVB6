#include "hpib.h"

HPIB::HPIB()
{
}

Addr4882_t *HPIB::FindLstn(int boardId)
{
    Addr4882_t addrlist[32];
    Addr4882_t *results = new Addr4882_t[ARRAY_SIZE(addrlist)];

    for (unsigned int x = 0; x < ARRAY_SIZE(addrlist) - 1; x++) {
        addrlist[x] = x + 1;
    }
    addrlist[ARRAY_SIZE(addrlist) - 1] = NOADDR;
    ::FindLstn(boardId, addrlist, results, ARRAY_SIZE(addrlist) - 1);

    int Num_Listeners = Ibcnt();
    results[Num_Listeners] = NOADDR;

    return results;
}
