#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "gpib.h"
#include "scpi.h"


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_refreshPushButton_clicked()
{
    char buf[256];
    Addr4882_t *PADs;

    ui->devicesTableWidget->setRowCount(0);
    PADs = GPIB::findLstn(0);
    if (PADs == NULL) {
        // TODO
        return;
    }
    for (int x = 0; PADs[x] != NOADDR; x++) {
        QTableWidgetItem *item = new QTableWidgetItem(QString("%1").arg(PADs[x]));
        ui->devicesTableWidget->insertRow(0);
        ui->devicesTableWidget->setItem(0, 1, item);

        SCPI *dev = new SCPI();
        if (dev->open(0, PADs[x], 0) >= 0) {
            dev->cmdReset();
            //dev->cmdClear();
            if (dev->cmdIDN(buf, sizeof(buf)) >= 0) {
                item = new QTableWidgetItem(QString(buf));
                ui->devicesTableWidget->setItem(0, 0, item);
            }
        }

        delete dev;
    }

    delete[] PADs;
}

void MainWindow::on_measurePushButton_clicked()
{
    char buf[256];

    if (dev.cmdRead(buf, sizeof(buf)) == -1)
        return;

    ui->resultLineEdit->setText(buf);
}

void MainWindow::on_errorPushButton_clicked()
{
    int len;
    char buf[256];

    len = dev.cmdError(buf, sizeof(buf));
    if (len == -1)
        return;

    ui->errorTableWidget->insertRow(0);

    QTableWidgetItem *item = new QTableWidgetItem(buf);
    ui->errorTableWidget->setItem(0, 0, item);
}

void MainWindow::on_openPushButton_clicked()
{
    int PAD, SAD = 0;
    int row;
    bool ok;

    row = ui->devicesTableWidget->currentRow();
    if (row < 0)
        return;

    PAD = ui->devicesTableWidget->item(row, 1)->text().toInt(&ok);
    if (dev.open(0, PAD, SAD) == -1)
        return;

    ui->configurePushButton->setEnabled(true);
    ui->closePushButton->setEnabled(true);
    ui->errorPushButton->setEnabled(true);
    ui->measurePushButton->setEnabled(true);
    ui->openPushButton->setEnabled(false);
}

void MainWindow::on_configurePushButton_clicked()
{
    const int channels[] = {109, 110, 111, 112, 113, 114, 115, 116, -1};
    if (dev.cmdConf(SCPI::modeVoltDC, channels) == -1)
        return;

    ui->configurePushButton->setEnabled(false);
}

void MainWindow::on_closePushButton_clicked()
{
    dev.close();

    ui->configurePushButton->setEnabled(false);
    ui->closePushButton->setEnabled(false);
    ui->errorPushButton->setEnabled(false);
    ui->measurePushButton->setEnabled(false);
    ui->openPushButton->setEnabled(true);
}
