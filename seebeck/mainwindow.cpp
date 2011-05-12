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

    for (int PAD = 1; PAD <= 31; PAD++) {
        HPIBDev *dev = new HPIBDev();

        do {
            if (dev->open(0, PAD, 0) < 0)
                break;

            if (dev->cmdIDN(buf, sizeof(buf)) < 0)
                break;

            QTableWidgetItem *item = new QTableWidgetItem(QString(buf));
            ui->devicesTableWidget->insertRow(0);
            ui->devicesTableWidget->setItem(0, 0, item);
        }while(0);

        delete dev;
    }
}
