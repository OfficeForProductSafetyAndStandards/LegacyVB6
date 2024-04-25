using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlTypes;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Runtime.ConstrainedExecution;
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
            string units = "UM";

            Program.SetUp_Flexi_Laser(units);
            Program.Setup_Rigid_Laser(units);

            Program.xlbookResults.Save();

            if (Program.RigidLaserFound)
            {
                cmdAgilient1339.Text = "HP-IB 3812";
                cmdNextScreen.Text = "Customer Details";
            }
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

            Program.xlsheetResultsMeasurement.Cells[24, 5] = "Class II";
        }

        private void cmdNextScreen_Click(object sender, EventArgs e)
        {
            this.Close();
            this.Dispose();
            if (Program.RigidLaserFound)
            {
                Form frmCustomerDetails = new frmCustomerDetails();
                frmCustomerDetails.ShowDialog();
            }
            else
            {
                Form frmVOLCompenationForm = new frmVOLCompensationForm();
                frmVOLCompenationForm.ShowDialog();
            }
        }

            private void cmdSetUpLaser_Click(object sender, EventArgs e)
        {
            string units = "UM";

            // Program.SetUp_Flexi_Laser(units);
            // Program.Setup_Rigid_Laser(units);


            if (Program.FlexiLaserFound)
            {
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
                // Program.SetUp_Flexi_Laser(units);
            }
            else if (Program.RigidLaserFound)
            {
                string Units = "";
                if (optImperial.Checked == true)
                {
                    Program.xlsheetResultsMeasurement.Cells[25, 5] = "Imperial";
                    Units = "UE";
                }
                else
                {
                    Program.xlsheetResultsMeasurement.Cells[25, 5] = "Metric";
                    Units = "UM";
                }
                string BenchUsed = "D2";
                int laser = Gpib488.ibdev(0, 3, 0, 13, 1, 0);
                // Define device desription
                Gpib488.ibwrt(laser, "M1" + (char)(10), 3);
                // Puts laser into distance mode
                Gpib488.ibwrt(laser, BenchUsed + (char)(10), 3);
                // Set laser to single pass (Flexi length) or double pass (Rigid length)
                Gpib488.ibwrt(laser, Units + (char)(10), 3);
                //Set units (UM for metric or UE for imperial, values passed from

                // Program.Setup_Rigid_Laser(units);
                // Call ibonl(laser, 0)
                // Places Laser interface offline
            }

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

        private void fraClass_Enter(object sender, EventArgs e)
        {

        }
    }
}
