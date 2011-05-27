#ifndef GPIBDETECTDIALOG_H
#define GPIBDETECTDIALOG_H

#include <QDialog>
#include <QAbstractButton>

namespace Ui {
    class GPIBDetectDialog;
}

class GPIBDetectDialog : public QDialog
{
    Q_OBJECT

public:
    explicit GPIBDetectDialog(QWidget *parent = 0);
    ~GPIBDetectDialog();
    bool getResult(int *GPIBBrdNum, int *devAddr);

private slots:
    void on_buttonBox_accepted();
    void on_pushButton_clicked();

private:
    Ui::GPIBDetectDialog *ui;
    int GPIBBrdNum_, devAddr_;

    void refresh();
};

#endif // GPIBDETECTDIALOG_H
