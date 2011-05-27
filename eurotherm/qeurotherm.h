#ifndef QEUROTHERM_H
#define QEUROTHERM_H

#include <QFrame>

namespace Ui {
    class QEurotherm;
}

class QEurotherm : public QFrame
{
    Q_OBJECT

public:
    explicit QEurotherm(QWidget *parent = 0);
    ~QEurotherm();

private:
    Ui::QEurotherm *ui;
};

#endif // QEUROTHERM_H
