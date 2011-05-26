#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    modbus = NULL;
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_openPushButton_clicked()
{
    QString dev;

    dev = "COM3";

    modbus = modbus_new_rtu(dev.toUtf8().data(), 9600, 'N', 8, 1);
    if (!modbus)
        return;

    if (modbus_connect(modbus) < 0)
        return;

    if (modbus_set_slave(modbus, 1) < 0)
        return;

    ui->openPushButton->setEnabled(false);
    ui->readPushButton->setEnabled(true);
    ui->writePushButton->setEnabled(true);

    /*modbus_close(modbus);
    modbus_free(modbus);
    modbus = NULL;*/
}

void MainWindow::on_readPushButton_clicked()
{
    uint16_t dest;

    modbus_read_registers(modbus, ui->registerSpinBox->value(), 1, &dest);
    ui->valueSpinBox->setValue(dest);
}

void MainWindow::on_writePushButton_clicked()
{
    int reg, val;

    val = ui->valueSpinBox->value();
    reg = ui->registerSpinBox->value();
    if (modbus_write_register(modbus, reg, val) < 0)
        ui->errorLabel->setText(modbus_strerror(errno));
    else
        ui->errorLabel->setText("");
}
