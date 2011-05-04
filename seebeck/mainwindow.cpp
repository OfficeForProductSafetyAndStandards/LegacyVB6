#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <windows.h>
#include "gpib488.h"


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
    // TODO
}
