#include "gpibdetectdialog.h"
#include "ui_gpibdetectdialog.h"
#include "scpi.h"

GPIBDetectDialog::GPIBDetectDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::GPIBDetectDialog)
{
    ui->setupUi(this);
    refresh();
}

GPIBDetectDialog::~GPIBDetectDialog()
{
    delete ui;
}

void GPIBDetectDialog::on_buttonBox_accepted()
{
    QTableWidgetItem *item;
    bool ok;
    int row;
    QVariant x;

    row = ui->devicesTableWidget->currentRow();
    if (row < 0) {
        devAddr_ = -1;
        GPIBBrdNum_ = -1;
        return;
    }

    item = ui->devicesTableWidget->item(row, 0);

    x.setValue(item->text());
    GPIBBrdNum_ = x.toInt(&ok);
    if (!ok)
        GPIBBrdNum_ = -1;

    item = ui->devicesTableWidget->item(row, 2);
    x.setValue(item->text());
    devAddr_ = x.toInt(&ok);
    if (!ok)
        devAddr_ = -1;
}

bool GPIBDetectDialog::getResult(int *GPIBBrdNum, int *devAddr)
{
    if (GPIBBrdNum_ == -1 || devAddr_ == -1)
        return false;

    *GPIBBrdNum = GPIBBrdNum_;
    *devAddr = devAddr_;

    return true;
}

void GPIBDetectDialog::refresh()
{
    char buf[256];
    SCPI dev;
    int GPIBCardNr;
    Addr4882_t *PADs;
    int row = 0;

    ui->devicesTableWidget->setRowCount(0);

    for (GPIBCardNr = 0; GPIBCardNr <= 99; GPIBCardNr++) {
        PADs = GPIB::findLstn(GPIBCardNr);
        if (PADs == NULL) {
            int err;

            err = ThreadIberr();
            if (err == 0)
                continue;

            QString strErr("Failed to find listeners err no: %1");
            ui->msgLabel->setText(strErr.arg(err));
            return;
        }

        for (int x = 0; PADs[x] != NOADDR; x++) {
            QString str("%1");
            QTableWidgetItem *item;
            int PAD = PADs[x];

            ui->devicesTableWidget->insertRow(row);

            item = new QTableWidgetItem(str.arg(GPIBCardNr));
            ui->devicesTableWidget->setItem(row, 0, item);

            item = new QTableWidgetItem(str.arg(PAD));
            ui->devicesTableWidget->setItem(row, 2, item);

            if (dev.open(GPIBCardNr, PAD, 0) >= 0) {
                char bufDevID[256];

                dev.cmdReset();
                if (dev.cmdIDN(bufDevID, sizeof(bufDevID)) >= 0) {
                    item = new QTableWidgetItem(bufDevID);
                    ui->devicesTableWidget->setItem(row, 1, item);
                }

                // detect individual boards
                for (int y = 1; y <= 3; y++) {
                    row++;

                    if (dev.cmdBoardIDN(buf, sizeof(buf), y * 100) < 0) {
                        ui->msgLabel->setText("Err");
                        break;
                    }

                    // No cart in slot
                    if (QString(buf).endsWith(",0,0,0"))
                        continue;

                    ui->devicesTableWidget->insertRow(row);

                    item = new QTableWidgetItem(str.arg(GPIBCardNr));
                    ui->devicesTableWidget->setItem(row, 0, item);

                    item = new QTableWidgetItem(bufDevID);
                    ui->devicesTableWidget->setItem(row, 1, item);

                    item = new QTableWidgetItem(str.arg(PAD));
                    ui->devicesTableWidget->setItem(row, 2, item);

                    item = new QTableWidgetItem(str.arg(y * 100));
                    ui->devicesTableWidget->setItem(row, 4, item);

                    item = new QTableWidgetItem(buf);
                    ui->devicesTableWidget->setItem(row, 3, item);
                }
            }

            row++;
            dev.close();
        }

        ui->devicesTableWidget->resizeColumnsToContents();
        delete[] PADs;
    }

    ui->msgLabel->setText("Searching for devices finished.");
}

void GPIBDetectDialog::on_pushButton_clicked()
{
    refresh();
}
