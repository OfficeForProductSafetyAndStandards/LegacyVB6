#include "qmodbuswidget.h"

QModbusWidget::QModbusWidget(QWidget *parent, modbus_t *modbus, const ModbusReg *modbusCfg) :
    QWidget(parent)
{
    this->modbus = modbus;
}
