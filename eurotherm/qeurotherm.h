#ifndef QEUROTHERM_H
#define QEUROTHERM_H

#include <QFrame>

namespace Ui {
    class QEurotherm;
}

typedef struct {
    int value;
    const char *name;
} valueName;

typedef struct {
    bool realtime;
    bool read;
    bool write;
    int rangeMin;
    int rangeMax;
    int speciaValue;
    const char *specialValueName;
    int enumCount;
    const valueName *enumNames;
} ModbusReg;

const valueName enumNamesOnOff[] =
{
    {
        0,
        "Off",
    }

};

const ModbusReg eurotherm3216[] = {
    {
        false,
        true,
        true,
        0,
        65535,
        -1,
        "Off",
        sizeof(enumNamesOnOff),
        enumNamesOnOff,
    },
};

class QEurotherm : public QFrame
{
    Q_OBJECT

public:
    explicit QEurotherm(QWidget *parent = 0);
    ~QEurotherm();

private:
    Ui::QEurotherm *ui;
};

#endif // QEUROTHERM_H
