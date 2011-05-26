#ifndef QMODBUSWIDGET_H
#define QMODBUSWIDGET_H

#include <QWidget>
#include <modbus.h>
#include "modbus_dev.h"

class QModbusWidget : public QWidget
{
    Q_OBJECT
public:
    explicit QModbusWidget(QWidget *parent, modbus_t *modbus, const ModbusReg *modbusCfg);

signals:

public slots:
private:
    modbus_t *modbus;

};

#endif // QMODBUSWIDGET_H
