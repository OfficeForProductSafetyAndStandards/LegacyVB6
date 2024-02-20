using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace frmStartScreen
{
    public partial class frmVOLCompensationForm : Form
    {
        public frmVOLCompensationForm()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

            Form frmTinsleyLaserReading = new frmTinsleyLaserReading();
            frmTinsleyLaserReading.Show();
        }

        private void button11_Click(object sender, EventArgs e)
        {
            Form frmManualEdaleEntry = new frmManualEdaleEntry();
            frmManualEdaleEntry.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form frmCustomerDetails = new frmCustomerDetails();
            frmCustomerDetails.Show();
        }

        private void button15_Click(object sender, EventArgs e)
        {
            /*
            Form frmStartScreen = new frmStartScreen();
            frmStartScreen.Show();
            */

        }

        private void frmVOLCompensationForm_Load(object sender, EventArgs e)
        {

        }
    }
}
