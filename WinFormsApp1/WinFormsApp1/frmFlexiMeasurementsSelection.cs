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
    public partial class frmFlexiMeasurementsSelection : Form
    {
        public frmFlexiMeasurementsSelection()
        {
            InitializeComponent();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form frmCustomerDetails = new frmCustomerDetails();
            frmCustomerDetails.Show();
        }

        private void frmFlexiMeasurementsSelection_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

            Form frmVOLCompensationForm= new frmVOLCompensationForm();
            frmVOLCompensationForm.Show();
        }
    }
}
