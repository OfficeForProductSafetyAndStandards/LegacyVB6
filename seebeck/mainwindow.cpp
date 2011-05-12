#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "hpib.h"


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

    PADs = HPIB::FindLstn(0);
    if (PADs == NULL) {
        // TODO
        return;
    }
    for (int x = 0; PADs[x] != NOADDR; x++) {
        QTableWidgetItem *item = new QTableWidgetItem(QString("%1").arg(PADs[x]));
        ui->devicesTableWidget->insertRow(0);
        ui->devicesTableWidget->setItem(0, 1, item);

        HPIBDev *dev = new HPIBDev();
        if (dev->open(0, PADs[x], 0) < 0)
            break;

        if (dev->cmdIDN(buf, sizeof(buf)) < 0)
            break;

        item = new QTableWidgetItem(QString(buf));
        ui->devicesTableWidget->setItem(0, 0, item);

        delete dev;
    }

    delete[] PADs;
}
