#include "qmodbuswidget.h"
#include <QBoxLayout>

QModbusWidget::QModbusWidget(QWidget *parent, modbus_t *modbus, const ModbusReg *modbusReg) :
    QWidget(parent), modbus_(modbus), modbusReg_(modbusReg)
{
    QBoxLayout *layout;

    spinBox_ = new QSpinBox(this);
    layout = new QBoxLayout(QBoxLayout::LeftToRight);
    layout->addWidget(spinBox_);
    this->setLayout(layout);

    spinBox_->setRange(modbusReg_->valueMin, modbusReg_->valueMax);
    if (modbusReg_->specialValueName)
        spinBox_->setSpecialValueText(modbusReg_->specialValueName);
}
