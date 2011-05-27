#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "gpib.h"
#include "gpibdetectdialog.h"


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

    d.exec();
}
