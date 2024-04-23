using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
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
            try
            {
                Program.humidity = Convert.ToDouble(txtHumidity.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Please enter a valid number");
            }

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
            Program.Hygrometer = "IB5269";
        }

        private void cmdClose_Click(object sender, EventArgs e)
        {
            // save off the humidity and barometric pressure values
            Program.xlbookResults?.Save();
            Form frmCustomerDetails = new frmCustomerDetails();
            frmCustomerDetails.Show();
        }

        private void cmdRetrurnToMainMenu_Click(object sender, EventArgs e)
        {
            Program.xlbookResults?.Save();
            this.Close();
            // Form frmStartup = new frmStartScreen();
            // frmStartup.Show();
        }

        private void txtTemperature_TextChanged(object sender, EventArgs e)
        {
            try
            {
                Program.temperature = Convert.ToDouble(txtTemperature.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Please enter a valid number");
            }

            Program.xlsheetResultsVOLandCustomerData.Cells[9, 2] = Program.temperature;
        }

        private void txtBarometer_TextChanged(object sender, EventArgs e)
        {
            try
            {
                Program.pressure = Convert.ToDouble(txtBarometer.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Please enter a valid number");
            }

            Program.xlsheetResultsVOLandCustomerData.Cells[11, 2] = Program.pressure;

        }

        private void frmVOLCompensationForm_Load(object sender, EventArgs e)
        {

        }

        private void cmdTakeVOL_Click(object sender, EventArgs e)
        {
            cmdClose.Enabled = true;
            Program.xlsheetResultsVOLandCustomerData.Cells[10, 2] = txtHumidity.Text.ToString();
            Program.xlsheetResultsVOLandCustomerData.Cells[11, 2] = txtBarometer.Text.ToString();
            try
            {
                if (Program.FlexiLaserFound == true)
                {
                    Program.laser.setParameter(LaserParameters.OP_AIRTEMP, Convert.ToDouble(txtTemperature.Text));
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Please enter a valid Temperature");
            }
            try
            {
                if (Program.FlexiLaserFound == true)
                {
                    Program.laser.setParameter(LaserParameters.OP_RELHUMI, Convert.ToDouble(txtHumidity.Text));
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Please enter a valid Humidity");
            }
            try
            {
                if (Program.FlexiLaserFound == true)
                {
                    Program.laser.setParameter(LaserParameters.OP_AIRPRES, Convert.ToDouble(txtBarometer.Text));
                }
            }
            catch
            {
                MessageBox.Show("Please enter a valid Barometer Reading");
            }

            Program.xlbookResults.Save();
            // txtVOL = Program.xlsheetResultsVOLandCustomerData.Cells[13, 2];
            //place results from humidity and barometric pressure into spreadsheet
            //save the spreadsheet get VOL from calculated value sheet
            double PressuremmHg = Program.pressure / 1.33322;
            double F = (1 + (0.003661 * Program.temperature));
            double s = (3.033 * Math.Pow(10, -3) * Program.humidity * (Math.Exp(0.057627 * Program.temperature)));
            double n = ((0.3836391 * PressuremmHg) * (1 + (Math.Pow(10, -6) * PressuremmHg * (0.817 - (0.0133 * Program.temperature))))) / F - s;
            double vol1 = ((Math.Pow(10, 12)) / (n + Math.Pow(10, 6))); // - 999000;
            double vol_comp = vol1 / Math.Pow(10, 6);
            double vol = Math.Round(vol_comp, 15); // TODO ivor james will check
            if (Program.FlexiLaserFound == true)
            {
                Program.laser.setParameter(LaserParameters.OP_ALLCOMP, vol);
            }
            txtVOL.Text = vol.ToString();

        }

        private void cmdTakeTemperature_Click(object sender, EventArgs e)
        { // clicked edale
            Program.ProbeCounter = (int)Program.CONSTANTS.EDALE;
            Program.Thermometer = "Edale";
            Program.xlsheetResultsMeasurement.Cells[24, 2] = "IB5390";
            Program.xlsheetResultsMeasurement.Cells[27, 2] = "Agilent 1339";
            Program.xlsheetResultsMeasurement.Cells[28, 2] = "Edale";

            Form frmEdaleTempMeasure = new frmTempMeasure();
            frmEdaleTempMeasure.ShowDialog();
            txtTemperature.Text = Program.temperature.ToString();
        }

        private void cmdTinsley_Click(object sender, EventArgs e)
        {
            Program.Thermometer = "Tinsley";
            Program.xlsheetResultsMeasurement.Cells[24, 2] = "Tinsley";
        }

        private void cmdIB5211_Click(object sender, EventArgs e)
        {
            cmdIB5211.Enabled = false;
            Program.Barometer = "IB211";
            Program.xlsheetResultsMeasurement.Cells[25, 2] = "IB5211";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            cmdIB5276.Enabled = false;  
            Program.Barometer = "IB5276";
            Program.xlsheetResultsMeasurement.Cells[25, 2] = "IB5276";
        }

        private void button4_Click_1(object sender, EventArgs e)
        {   
            cmdIB5277.Enabled = false;
            Program.Barometer = "IB5277";
            Program.xlsheetResultsMeasurement.Cells[25, 2] = "IB5277";
        }

        private void cmdIB5270_Click(object sender, EventArgs e)
        {
            cmdIB5270.Enabled = false;
            Program.Hygrometer = "IB5270";
            Program.xlsheetResultsMeasurement.Cells[26, 2] = "IB5270";
        }

        private void cmdIB5271_Click(object sender, EventArgs e)
        {
            cmdIB5271.Enabled = false;
            Program.Hygrometer = "IB5271";
            Program.xlsheetResultsMeasurement.Cells[26, 2] = "IB5276";
        }

        private void cmdEndProgram_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.Exit();
            Program.excelAppEdale.DisplayAlerts = false;
            Program.excelAppEdale.Quit();
            Program.excelAppLength.DisplayAlerts = false;
            Program.excelAppLength.Quit();
        }
    }
}

