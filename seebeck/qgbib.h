#ifndef QGBIB_H
#define QGBIB_H

#include <QObject>
#include "gpib.h"

class QGPIBCmd;

class QGBIB : public QObject
{
    Q_OBJECT

private:
    QGPIBCmd thread;

public:
    explicit QGBIB(QObject *parent = 0);

signals:

public slots:

};

#endif // QGBIB_H
