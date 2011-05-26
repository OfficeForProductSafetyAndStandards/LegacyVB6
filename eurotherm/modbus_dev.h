#ifndef MODBUS_DEV_H
#define MODBUS_DEV_H

#include <inttypes.h>

/**
  Assign text representation to value of busmod register.
  */
typedef struct {
    int value;
    const char *name;
} ValueName;

/**
  Description of busmod register.
  */
typedef struct {
    uint16_t regNum;   /** Register number */
    const char *regName;    /** Register description */
    bool read;      /** If true, value can be readed */
    bool write;     /** Register can be writen */
    bool realtime;  /** If true, this variable changes in time (eg. current temperature). */
    int rangeMin;
    int rangeMax;
    int speciaValue;    /** Special value for ranged values (eg. 0 -> off). */
    const char *specialValueName;   /** Textual description of special value */
    int namesCount;  /** Number of items in enumNames */
    const ValueName *valNames;  /** List of assignements of values to its names. */
} ModbusReg;

/* Enumeration of all used names. */
extern const ValueName enumNamesOnOff[];

/* Register definitions for specific devices. */
extern const ModbusReg eurotherm3216[];

#endif // MODBUS_DEV_H
