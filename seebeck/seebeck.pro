#-------------------------------------------------
#
# Project created by QtCreator 2011-05-04T02:39:45
#
#-------------------------------------------------

QT       += core gui

TARGET = seebeck
TEMPLATE = app

LIBS    += -L. $${PWD}/gpib488.obj

SOURCES += main.cpp\
        mainwindow.cpp \
    gpib.cpp \
    scpi.cpp \
    gpibdetectdialog.cpp \
    qgbib.cpp

HEADERS  += mainwindow.h \
    gpib488.h \
    common.h \
    gpib.h \
    scpi.h \
    gpibdetectdialog.h \
    qgbib.h

FORMS    += mainwindow.ui \
    gpibdetectdialog.ui

OTHER_FILES += \
    gpib488.obj
