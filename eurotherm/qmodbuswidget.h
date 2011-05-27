#ifndef QMODBUSWIDGET_H
#define QMODBUSWIDGET_H

#include <QComboBox>
#include <QSpinBox>
#include <QTimer>
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
    void read();

private:
    modbus_t *modbus_;
    const ModbusReg *modbusReg_;
    QComboBox *comboBox_;
    QSpinBox *spinBox_;
    QTimer timer;
};

#endif // QMODBUSWIDGET_H
