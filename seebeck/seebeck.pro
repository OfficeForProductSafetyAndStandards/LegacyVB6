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
    hpibdev.cpp \
    hpib.cpp

HEADERS  += mainwindow.h \
    gpib488.h \
    hpibdev.h \
    hpib.h \
    common.h

FORMS    += mainwindow.ui

OTHER_FILES += \
    gpib488.obj
