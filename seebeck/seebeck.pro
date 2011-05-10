#-------------------------------------------------
#
# Project created by QtCreator 2011-05-04T02:39:45
#
#-------------------------------------------------

QT       += core gui

TARGET = seebeck
TEMPLATE = app

LIBS    += -L. -lgpib488.dll

SOURCES += main.cpp\
        mainwindow.cpp \
    hpibdev.cpp

HEADERS  += mainwindow.h \
    gpib488.h \
    hpibdev.h

FORMS    += mainwindow.ui

PRE_TARGETDEPS += libgpib488.dll.a
QMAKE_EXTRA_TARGETS += libgpib488.dll.a

libgpib488.dll.a.name = Build binding library for gpib488.dll 
libgpib488.dll.a.commands = dlltool -d \"$$PWD/gpib488.def\" -l libgpib488.dll.a

OTHER_FILES += \
    gpib488.def
