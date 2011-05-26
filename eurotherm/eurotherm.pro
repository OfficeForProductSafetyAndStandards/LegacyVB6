#-------------------------------------------------
#
# Project created by QtCreator 2011-05-26T14:46:46
#
#-------------------------------------------------

QT       += core gui

TARGET = eurotherm
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui

LIBS     += -lmodbus

QMAKE_LIBDIR += ../../libmodbus/src/.libs 

INCLUDEPATH  += ../../libmodbus/src
