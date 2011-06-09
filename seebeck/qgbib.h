#ifndef QGBIB_H
#define QGBIB_H

#include <QObject>
#include "gpib.h"

class QGBIB : public QObject
{
    Q_OBJECT
public:
    explicit QGBIB(QObject *parent = 0);

signals:

public slots:

};

#endif // QGBIB_H
