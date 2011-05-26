#-------------------------------------------------
#
# Project created by QtCreator 2011-05-26T14:46:46
#
#-------------------------------------------------

QT       += core gui

TARGET = eurotherm
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    qeurotherm.cpp \
    modbus_dev.cpp \
    qmodbuswidget.cpp

HEADERS  += mainwindow.h \
    qeurotherm.h \
    qmodbuswidget.h \
    modbus_dev.h

FORMS    += mainwindow.ui \
    qeurotherm.ui

LIBS     += -lmodbus

QMAKE_LIBDIR += ../../libmodbus/src/.libs 

INCLUDEPATH  += ../../libmodbus/src
