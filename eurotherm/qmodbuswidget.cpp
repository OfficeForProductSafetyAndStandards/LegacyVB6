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
        if (!modbusReg->write)
            spinBox_->setReadOnly(true);
    } else {
        const ValueName *valueName = modbusReg->valNames;

        w = comboBox_ = new QComboBox(this);
        for (int x = 0; x < modbusReg->namesCount; x++)
            comboBox_->addItem(valueName[x].name, valueName[x].value);
        if (!modbusReg->write)
            comboBox_->setEditable(false);
    }

    if (modbusReg->realtime) {
        timer.setInterval(1000);
        timer.setSingleShot(false);
        QObject::connect(&timer, SIGNAL(timeout()), this, SLOT(read()));
        timer.start();
    }

    this->read();

    layout = new QBoxLayout(QBoxLayout::LeftToRight);
    layout->addWidget(w);
    this->setLayout(layout);
}

void QModbusWidget::read()
{
    uint16_t val = 0;

    if (!modbusReg_->read)
        return;

    modbus_read_registers(modbus_, modbusReg_->regNum, 1, &val);

    if (!modbusReg_->valNames)
        spinBox_->setValue(val);
    else {
        int idx;

        idx = comboBox_->findData(val);
        comboBox_->setCurrentIndex(idx);
    }
}
