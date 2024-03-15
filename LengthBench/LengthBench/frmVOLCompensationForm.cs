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
            catch (Exception ex)
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

            try
            {
                Program.temperature = Convert.ToDouble(txtTemperature.Text);
            }
            catch (Exception ex)
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
            catch (Exception ex)
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
            Program.xlsheetResultsVOLandCustomerData.Cells[10, 2] = txtHumidity.Text.ToString();
            Program.xlsheetResultsVOLandCustomerData.Cells[11, 2] = txtBarometer.Text.ToString();
            try
            {
                Program.laser.setParameter(LaserParameters.OP_AIRTEMP, Convert.ToDouble(txtTemperature.Text));
            }
            catch (Exception ex)
            {
                MessageBox.Show("Please enter a valid Temperature");
            }
            try
            {
                Program.laser.setParameter(LaserParameters.OP_RELHUMI, Convert.ToDouble(txtHumidity.Text));
            }
            catch (Exception ex)
            {
                MessageBox.Show("Please enter a valid Humidity");
            }
            try
            {
                Program.laser.setParameter(LaserParameters.OP_AIRPRES, Convert.ToDouble(txtBarometer.Text));
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
            Program.laser.setParameter(LaserParameters.OP_ALLCOMP, vol);
            txtVOL.Text = vol.ToString();

        }
    }
}

