#include "qmodbuswidget.h"
#include <QBoxLayout>

QModbusWidget::QModbusWidget(QWidget *parent, modbus_t *modbus, const ModbusReg *modbusReg) :
    QWidget(parent), modbus_(modbus), modbusReg_(modbusReg)
{
    QBoxLayout *layout;
    QWidget *w;
    uint16_t val = 0;

    if (modbusReg->read)
        modbus_read_registers(modbus, modbusReg->regNum, 1, &val);

    if (!modbusReg->valNames) {
        w = spinBox_ = new QSpinBox(this);
        spinBox_->setRange(modbusReg_->valueMin, modbusReg_->valueMax);
        if (modbusReg_->specialValueName)
            spinBox_->setSpecialValueText(modbusReg_->specialValueName);
        spinBox_->setValue(val);
    } else {
        const ValueName *valueName = modbusReg->valNames;
        int idx;

        w = comboBox_ = new QComboBox(this);
        for (int x = 0; x < modbusReg->namesCount; x++)
            comboBox_->addItem(valueName[x].name, valueName[x].value);
        idx = comboBox_->findData(val);
        comboBox_->setCurrentIndex(idx);
    }

    layout = new QBoxLayout(QBoxLayout::LeftToRight);
    layout->addWidget(w);
    this->setLayout(layout);
}
