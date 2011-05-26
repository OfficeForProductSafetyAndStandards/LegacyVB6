#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <modbus.h>

namespace Ui {
    class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_openPushButton_clicked();

    void on_readPushButton_clicked();

    void on_writePushButton_clicked();

private:
    Ui::MainWindow *ui;
    modbus_t *modbus;
};

#endif // MAINWINDOW_H
