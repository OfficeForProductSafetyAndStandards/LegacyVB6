#include "qmodbuswidget.h"
#include <QBoxLayout>

QModbusWidget::QModbusWidget(QWidget *parent, modbus_t *modbus, const ModbusReg *modbusReg) :
    QWidget(parent), modbus_(modbus), modbusReg_(modbusReg)
{
    QBoxLayout *layout;
    QWidget *w;

    if (!modbusReg->valNames) {
        w = spinBox_ = new QSpinBox(this);
        spinBox_->setRange(modbusReg_->valueMin, modbusReg_->valueMax);
        if (modbusReg_->specialValueName)
            spinBox_->setSpecialValueText(modbusReg_->specialValueName);
    } else {
        const ValueName *valueName = modbusReg->valNames;

        w = comboBox_ = new QComboBox(this);
        for (int idx = 0; idx < modbusReg->namesCount; idx++)
            comboBox_->addItem(valueName[idx].name, valueName[idx].value);
    }

    layout = new QBoxLayout(QBoxLayout::LeftToRight);
    layout->addWidget(w);
    this->setLayout(layout);
}
