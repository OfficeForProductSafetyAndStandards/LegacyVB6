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
    public partial class frmCustomerDetails : Form
    {
        public frmCustomerDetails()
        {
            InitializeComponent();
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void txtDepartmentNumber_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void cmdGotoNextScreen_Click(object sender, EventArgs e)
        {
            Program.xlsheetResultsVOLandCustomerData.Cells[1, 2] = txtCustomerName.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[2, 2] = txtDepartmentNumber.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[3, 2] = txtNumberOfPoints.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[4, 2] = txtTensionWeight.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[5, 2] = comboBox1.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[6, 2] = comboBox1.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[7, 2] = txtReferenceTemperature.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[8, 2] = dateTimePicker1.Text;


            Form frmLaserReadings1 = new frmLaserReadings1();
            frmLaserReadings1.Show();
        }

        private void txtCustomerName_TextChanged(object sender, EventArgs e)
        {

        }

        private void frmCustomerDetails_Load(object sender, EventArgs e)
        {

        }
    }
}
