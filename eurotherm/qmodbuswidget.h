#ifndef QMODBUSWIDGET_H
#define QMODBUSWIDGET_H

#include <QSpinBox>
#include <QWidget>
#include <modbus.h>
#include "modbus_dev.h"

class QModbusWidget : public QWidget
{
    Q_OBJECT
public:
    explicit QModbusWidget(QWidget *parent, modbus_t *modbus_, const ModbusReg *modbusReg_);

signals:

public slots:
private:
    modbus_t *modbus_;
    const ModbusReg *modbusReg_;
    QSpinBox *spinBox_;

};

#endif // QMODBUSWIDGET_H
