#include <QThread>
#include "qgbib.h"

// TODO: doc
class QGPIBCmd : QThread
{
private:
    QByteArray str;
    GPIB gpib;

public:
    void run();
    void start(QString cmd, Priority priority = InheritPriority);
};

void QGPIBCmd::run()
{

}

void QGPIBCmd::start(QString cmd, Priority priority)
{
    this->str = cmd.toUtf8();
    QThread::start(priority);
}

QGBIB::QGBIB(QObject *parent) :
    QObject(parent)
{
}
