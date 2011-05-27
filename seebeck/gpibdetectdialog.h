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

private slots:
    void on_buttonBox_accepted();

    void on_buttonBox_clicked(QAbstractButton *button);

private:
    Ui::GPIBDetectDialog *ui;

    void refresh();
};

#endif // GPIBDETECTDIALOG_H
