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
    SCPI dev;
    int PAD, SAD;
    int row;
    bool ok;
    char buf[256];

    row = ui->devicesTableWidget->currentRow();
    if (row < 0)
        return;

    PAD = ui->devicesTableWidget->item(row, 1)->text().toInt(&ok);
    SAD = 0; //ui->devicesTableWidget->item(row, 2)->text().toInt(&ok);

    if (dev.open(0, PAD, SAD) == -1)
        return;

    if (dev.cmdConf(SCPI::modeVoltDC, 101) == -1)
        return;

    if (dev.cmdMeas(buf, sizeof(buf)) == -1)
        return;

    ui->resultLineEdit->setText(buf);
}

void MainWindow::on_errorPushButton_clicked()
{
    SCPI dev;
    int PAD, SAD = 0;
    int len, row;
    bool ok;
    char buf[256];

    row = ui->devicesTableWidget->currentRow();
    if (row < 0)
        return;
    PAD = ui->devicesTableWidget->item(row, 1)->text().toInt(&ok);
    if (dev.open(0, PAD, SAD) == -1)
        return;

    len = dev.cmdError(buf, sizeof(buf));
    if (len == -1)
        return;

    ui->errorTableWidget->insertRow(0);

    QTableWidgetItem *item = new QTableWidgetItem(buf);
    ui->errorTableWidget->setItem(0, 0, item);
}
