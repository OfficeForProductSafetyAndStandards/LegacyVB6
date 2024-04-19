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

        public static bool metric = false;

        public frmMeasurementSelection()
        {
            InitializeComponent();
            metric = false;
            Program.xlsheetResultsMeasurement.Cells[25, 5] = "Metric";
            Program.xlsheetResultsMeasurement.Cells[24, 5] = "Class I";
            Program.xlsheetResultsMeasurement.Cells[27, 5] = "No";

            Program.xlbookResults.Save();
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

            Program.xlsheetResultsMeasurement.Cells[24, 5] = "Class II";
        }

        private void cmdNextScreen_Click(object sender, EventArgs e)
        {
            this.Close();
            this.Dispose();
            Form frmVOLCompenationForm = new frmVOLCompensationForm();
            frmVOLCompenationForm.ShowDialog();
        }

        private void cmdSetUpLaser_Click(object sender, EventArgs e)
        {
            string units= "";
            if (optImperial.Checked == true)
            {
                Program.xlsheetResultsMeasurement.Cells[25, 5] = "Imperial";
                units = "UE";
            }
            else
            {
                Program.xlsheetResultsMeasurement.Cells[25, 5] = "Metric";
                units = "UM";
            }
            Program.SetUp_Flexi_Laser(units);
            Program.Setup_Rigid_Laser(units);
            cmdSetUpLaser.Enabled = false;
        }

        private void frmMeasurementSelection_Load(object sender, EventArgs e)
        {

        }

        private void optMetric_CheckedChanged(object sender, EventArgs e)
        {
            //  optImperial.Checked = false;
            metric = false;
            Program.xlsheetResultsMeasurement.Cells[25, 5] = "Metric";

        }

        private void optImperial_CheckedChanged(object sender, EventArgs e)
        {
            // optMetric.Checked = false;
            metric = true;
            Program.xlsheetResultsMeasurement.Cells[25, 5] = "Imperial";
        }

        private void cmdAgilient1339_Click(object sender, EventArgs e)
        {
            Program.xlsheetResultsMeasurement.Cells[27, 2] = "Agilent 1339";
            cmdAgilient1339.Enabled = false;

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Program.xlsheetResultsMeasurement.Cells[24, 5] = "Class I";
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {

            Program.xlsheetResultsMeasurement.Cells[24, 5] = "Class III";
        }

        private void optYes_CheckedChanged(object sender, EventArgs e)
        {

            Program.xlsheetResultsMeasurement.Cells[27, 5] = "Yes";
        }

        private void optNo_CheckedChanged(object sender, EventArgs e)
        {

            Program.xlsheetResultsMeasurement.Cells[27, 5] = "No";
        }

        private void fraComposite_Enter(object sender, EventArgs e)
        {

        }
    }
}
