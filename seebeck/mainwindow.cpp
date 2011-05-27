#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "gpibdetectdialog.h"
#include <QFileDialog>

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

void MainWindow::on_toolButton_clicked()
{
    GPIBDetectDialog d(this);
    int GPIBBrdNum, devAddr;

    if (d.exec() != QDialog::Accepted)
        return;

    if (!d.getResult(&GPIBBrdNum, &devAddr))
        return;

    ui->GPIBBrdNumSpinBox->setValue(GPIBBrdNum);
    ui->GPIBDevAddrSpinBox->setValue(devAddr);
}

void MainWindow::on_resultsPathToolButton_clicked()
{
    QString dir;

    dir = ui->resultsPathLineEdit->text();
    dir = QFileDialog::getExistingDirectory(
                this, "Result directory path.", dir);
    if (dir.isEmpty())
        return;
    ui->resultsPathLineEdit->setText(dir);
}
