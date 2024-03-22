using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Windows.ApplicationModel.ConversationalAgent;
using static System.Net.Mime.MediaTypeNames;

namespace LengthBench
{
    public partial class frmCustomerDetails : Form
    {
        public frmCustomerDetails()
        {
            InitializeComponent();
            txtDepartmentNumber.Text = Program.dept;
            txtReferenceTemperature.Text = "20";
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
            Program.xlsheetResultsVOLandCustomerData.Cells[5, 2] = txtCoefficient.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[6, 2] = comboBox1.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[7, 2] = txtReferenceTemperature.Text;
            string Datestring = DateTime.Now.ToString("MM/dd/yyyy");
            string Timestring = DateTime.UtcNow.ToString("hh:mm tt");
            Program.xlsheetResultsVOLandCustomerData.Cells[8, 2] = Datestring;
            Program.xlsheetResultsVOLandCustomerData.Cells[8, 3] = "Time of test " + Timestring;
            int y=0;

            try
            {
                y = Convert.ToInt32(txtNumberOfPoints.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Please enter a number of points");
                return;
            }
            y = y + 4;

            for (int x = 4; x < y; x++)
            {
                Form frmlaser1 = new frmlaser1();
                frmlaser1.ShowDialog();
                int Point = 0;
                Program.xlsheetResultsMeasurement.Cells[x, 7] = LengthBench.frmlaser1.x;
            }

            Program.xlbookResults?.Save();

            Form frmTempMeasure1 = new frmTempMeasure();
            frmTempMeasure1.Show();

           // Form frmLaserReadings1 = new frmLaserReadings1();
           // frmLaserReadings1.Show();
        }

        private void txtCustomerName_TextChanged(object sender, EventArgs e)
        {

        }

        private void frmCustomerDetails_Load(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            double coef = 0;

            string mat = comboBox1.Text;
            switch (mat)
            {
                case "Aluminium":
                    coef = 23.1;
                    break;
                case "Brass":
                    coef = 17.5;
                    break;
                case "Bronze":
                    coef = 17.3;
                    break;
                case "Invar":
                    coef = 0.76;
                    break;
                case "Nickel Steel":
                    coef = 11.42;
                    break;
                case "Steel":
                    coef = 10.7;
                    break;
                case "Stainless Steel":
                    coef = 14.7;
                    break;
                case "Carbon Steel":
                    coef = 12.5;
                    break;

            }

            Program.xlsheetResultsVOLandCustomerData.Cells[5, 2] = coef;
            txtCoefficient.Text = coef.ToString();
        }

        private void txtNumberOfPoints_TextChanged(object sender, EventArgs e)
        { 
            try
            {
                Program.NoOfPoints = Convert.ToInt32(txtNumberOfPoints.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Please enter a number for points");
            }   
        }
    }
}
