using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Resolvers;

namespace LengthBench
{
    public partial class frmVOLCompensationForm : Form
    {
        public frmVOLCompensationForm()
        {
            InitializeComponent();
        }

        private void txtHumidity_TextChanged(object sender, EventArgs e)
        {
            Program.humidity = Convert.ToDouble(txtHumidity.Text);
            Program.xlsheetResultsVOLandCustomerData.Cells[10, 2] = Program.humidity;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void cmdClose_Click(object sender, EventArgs e)
        {
            Form frmCustomerDetails = new frmCustomerDetails();
            frmCustomerDetails.Show();
        }

        private void cmdRetrurnToMainMenu_Click(object sender, EventArgs e)
        {
            Program.xlbookResults?.Save();
        }

        private void txtTemperature_TextChanged(object sender, EventArgs e)
        {
            Program.temperature = Convert.ToDouble(txtTemperature.Text);
            Program.xlsheetResultsVOLandCustomerData.Cells[9, 2] = Program.temperature;
        }

        private void txtBarometer_TextChanged(object sender, EventArgs e)
        {
            Program.pressure = Convert.ToDouble(txtBarometer.Text);
            Program.xlsheetResultsVOLandCustomerData.Cells[11, 2] = Program.pressure;

        }

        private void frmVOLCompensationForm_Load(object sender, EventArgs e)
        {

        }
    }
}

