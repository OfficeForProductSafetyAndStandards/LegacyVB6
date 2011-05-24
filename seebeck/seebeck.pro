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
    scpi.cpp

HEADERS  += mainwindow.h \
    gpib488.h \
    common.h \
    gpib.h \
    scpi.h

FORMS    += mainwindow.ui

OTHER_FILES += \
    gpib488.obj
