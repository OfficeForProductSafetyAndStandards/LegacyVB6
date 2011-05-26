#include "qeurotherm.h"
#include "ui_qeurotherm.h"

QEurotherm::QEurotherm(QWidget *parent) :
    QFrame(parent),
    ui(new Ui::QEurotherm)
{
    ui->setupUi(this);
}

QEurotherm::~QEurotherm()
{
    delete ui;
}
