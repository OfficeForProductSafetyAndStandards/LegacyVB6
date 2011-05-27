#ifndef MODBUS_DEV_H
#define MODBUS_DEV_H

#include <inttypes.h>

#ifndef ARRAY_SIZE
#define ARRAY_SIZE(x) (sizeof(x)/sizeof(x[0]))
#endif

/**
  Assign text representation to value of busmod register.
  */
struct ValueName {
    int value;
    const char *name;
};

/**
  Description of busmod register.
  */
struct ModbusReg {
    uint16_t regNum;   /** Register number */
    const char *regName;    /** Register description */
    bool read;      /** If true, value can be readed */
    bool write;     /** Register can be writen */
    bool realtime;  /** If true, this variable changes in time (eg. current temperature). */
    int valueMin;
    int valueMax;
    const char *specialValueName;   /** Textual description of special value (equeal to rangeMin) or NULL. */
    int namesCount;  /** Number of items in enumNames */
    const ValueName *valNames;  /** List of assignements of values to its names. */
};

/* Register definitions for specific devices. */
extern const ModbusReg eurotherm3216[];

#endif // MODBUS_DEV_H
