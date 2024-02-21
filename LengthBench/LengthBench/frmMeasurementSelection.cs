using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LengthBench
{
    public partial class frmMeasurementSelection : Form
    {
        public frmMeasurementSelection()
        {
            InitializeComponent();
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void cmdNextScreen_Click(object sender, EventArgs e)
        {
            Form frmVOLCompenationForm = new frmVOLCompensationForm();
            frmVOLCompenationForm.Show();
        }
    }
}
