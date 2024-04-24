using MSCommLib;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Windows.Media.Capture;
using Windows.UI.Composition.Interactions;
using static System.ComponentModel.Design.ObjectSelectorEditor;
using static System.Net.Mime.MediaTypeNames;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.IO.Ports;


namespace LengthBench
{
    public partial class frmTempMeasure : Form
    {
        public MSComm mscomm;
        public int counter = 0;
        public System.Windows.Forms.Timer myTimer;
        public frmTempMeasure()
        {
            InitializeComponent();
            /* Flexi has 10 probes Rigid has 6 */
            if (Program.RigidLaserFound)
            {
                checkBox7.Visible = false;
                checkBox8.Visible = false;
                checkBox9.Visible = false;
                checkBox10.Visible = false;

                txtManual7.Visible = false;
                txtManual8.Visible = false;
                txtManual9.Visible = false;
                txtManual10.Visible = false;

                txtManual17.Visible = false;
                txtManual18.Visible = false;
                txtManual19.Visible = false;
                txtManual20.Visible = false;

            }
        }

        private Color check(double x)
        {
            Color backColor = Color.PaleGreen;
            if (x < 18.0) backColor = Color.LightSteelBlue;
            if (x > 22.0) backColor = Color.LightSalmon;
            if (x == -2146826246) backColor = Color.LemonChiffon;
             return backColor;
        }


        private void CorrectEdale(int NoOfProbes)
        {
            string[] txtManualEdale = new string[10];
            double x = 0;
            double y = 0;
            Color backColor = Color.Green;



            // convert vb to csharp
            for (int ProbeCounter = 0; ProbeCounter < NoOfProbes; ProbeCounter++)
            {
                switch (ProbeCounter)
                { // this is the probe number
                    case 0:
                        if (checkBox1.Checked == true && txtManual1.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual1.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual1.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);

                            x = Convert.ToDouble(txtManual1.Text);
                        
                            txtManual11.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual11.Text);
                            Color color = check(y);
                            txtManual11.ForeColor = Color.Black;
                            txtManual11.BackColor = color;
                        }
                        break;

                    case 1:
                        if (checkBox2.Checked == true && txtManual2.Text != "")
                        {

                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual2.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual2.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);

                            x = Convert.ToDouble(txtManual2.Text);

                            txtManual12.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual12.Text);
                            Color color = check(y);
                            txtManual12.ForeColor = Color.Black;
                            txtManual12.BackColor = color;
                        }
                        break;

                    case 2:
                        if (checkBox3.Checked == true && txtManual3.Text != "")
                        {

                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual3.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual3.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);

                            x = Convert.ToDouble(txtManual3.Text);

                            txtManual13.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual13.Text);
                            Color color = check(y);
                            txtManual13.ForeColor = Color.Black;
                            txtManual13.BackColor = color;
                        }
                        break;

                    case 3:
                        if (checkBox4.Checked == true && txtManual4.Text != "")
                        {

                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual4.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual4.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);

                            x = Convert.ToDouble(txtManual4.Text);

                            txtManual14.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual14.Text);
                            Color color = check(y);
                            txtManual14.ForeColor = Color.Black;
                            txtManual14.BackColor = color;
                        }
                        break;

                    case 4:
                        if (checkBox5.Checked == true && txtManual5.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual5.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual5.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual5.Text);
                            txtManual15.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual15.Text);
                            Color color = check(y);
                            txtManual15.ForeColor = Color.Black;
                            txtManual15.BackColor = color;
                            txtManual15.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;

                    case 5:
                        if (checkBox6.Checked == true && txtManual6.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual6.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual6.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual6.Text);
                            txtManual16.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual16.Text);
                            Color color = check(y);
                            txtManual16.ForeColor = Color.Black;
                            txtManual16.BackColor = color;
                            txtManual16.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;

                    case 6:
                        if (checkBox7.Checked == true && txtManual7.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual7.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual7.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual7.Text);
                            txtManual17.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual17.Text);
                            Color color = check(y);
                            txtManual17.ForeColor = Color.Black;
                            txtManual17.BackColor = color;
                            txtManual17.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 7:
                        if (checkBox8.Checked == true && txtManual8.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual8.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual8.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual8.Text);
                            txtManual18.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual18.Text);
                            Color color = check(y);
                            txtManual18.ForeColor = Color.Black;
                            txtManual18.BackColor = color;
                            txtManual18.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 8:
                        if (checkBox9.Checked == true && txtManual9.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual9.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual9.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual9.Text);
                            txtManual19.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual19.Text);
                            Color color = check(y);
                            txtManual19.ForeColor = Color.Black;
                            txtManual19.BackColor = color;
                            txtManual19.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 9:
                        if (checkBox10.Checked == true && txtManual10.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual10.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual10.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual10.Text);
                            txtManual20.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                            y = Convert.ToDouble(txtManual20.Text);
                            Color color = check(y);
                            txtManual20.ForeColor = Color.Black;
                            txtManual20.BackColor = color;
                            txtManual20.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;

                }
            }
        }


        public void button1_Click(object sender, EventArgs e)
        {
            // string Thermometer;

            if (radioButton1.Checked)
            { // this blows up because its assuming temperature is automatic

                myTimer?.Stop();

                mscomm.OnComm -= new DMSCommEvents_OnCommEventHandler(OnCommEvent);
                mscomm.PortOpen = false; // Close comm port for EDALE
            }

            Program.xlsheet = Program.xlCorrectionBook.Worksheets["IB5390"]; // goes to module TakeTemperature with name of thermometer
            CorrectEdale(10); //goes to sub CorrectEdale  with 10 as number of probes
       

            button1.Visible = true;
            button2.Visible = true;
            label2.Visible = true;

            Program.xlsheetResultsTemperatureUncorrected.Cells[2, 3 + Program.ProbeCounter] = txtManual1.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[3, 3 + Program.ProbeCounter] = txtManual2.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[4, 3 + Program.ProbeCounter] = txtManual3.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[5, 3 + Program.ProbeCounter] = txtManual4.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[6, 3 + Program.ProbeCounter] = txtManual5.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[7, 3 + Program.ProbeCounter] = txtManual6.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[8, 3 + Program.ProbeCounter] = txtManual7.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[9, 3 + Program.ProbeCounter] = txtManual8.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[10, 3 + Program.ProbeCounter] = txtManual9.Text;
            Program.xlsheetResultsTemperatureUncorrected.Cells[11, 3 + Program.ProbeCounter] = txtManual10.Text;

            Program.xlsheetResultsTemperature.Cells[2, 3 + Program.ProbeCounter] = txtManual11.Text;
            Program.xlsheetResultsTemperature.Cells[3, 3 + Program.ProbeCounter] = txtManual12.Text;
            Program.xlsheetResultsTemperature.Cells[4, 3 + Program.ProbeCounter] = txtManual13.Text;
            Program.xlsheetResultsTemperature.Cells[5, 3 + Program.ProbeCounter] = txtManual14.Text;
            Program.xlsheetResultsTemperature.Cells[6, 3 + Program.ProbeCounter] = txtManual15.Text;
            Program.xlsheetResultsTemperature.Cells[7, 3 + Program.ProbeCounter] = txtManual16.Text;
            Program.xlsheetResultsTemperature.Cells[8, 3 + Program.ProbeCounter] = txtManual17.Text;
            Program.xlsheetResultsTemperature.Cells[9, 3 + Program.ProbeCounter] = txtManual18.Text;
            Program.xlsheetResultsTemperature.Cells[10, 3 + Program.ProbeCounter] = txtManual19.Text;
            Program.xlsheetResultsTemperature.Cells[11, 3 + Program.ProbeCounter] = txtManual20.Text;
            // Program.xlbookResults.Save();
        }

        private void frmTempMeasure_Load(object sender, EventArgs e)
        {
            switch (Program.ProbeCounter)
            {
                case (int)Program.CONSTANTS.EDALE:
                    this.Text = "VOL Temperature Details";
                    break;
                case (int)Program.CONSTANTS.INITIAL:
                    this.Text = "Initial Material Temperature Details";
                    break;
                case (int)Program.CONSTANTS.INTERMEDIATE:
                    this.Text = "Intermediate Material Temperature Details";
                    break;
                case (int)Program.CONSTANTS.FINAL:
                    this.Text = "Final Material Temperature Details";
                    break;
            }
            // restore state from INITIAL for selected probes
            checkBox1.Checked = Program.ProbesSelected[0];
            checkBox2.Checked = Program.ProbesSelected[1];
            checkBox3.Checked = Program.ProbesSelected[2];
            checkBox4.Checked = Program.ProbesSelected[3];
            checkBox5.Checked = Program.ProbesSelected[4];
            checkBox6.Checked = Program.ProbesSelected[5];
            checkBox7.Checked = Program.ProbesSelected[6];
            checkBox8.Checked = Program.ProbesSelected[7];
            checkBox9.Checked = Program.ProbesSelected[8];
            checkBox10.Checked = Program.ProbesSelected[9];

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Program.temperature = (double)Program.xlsheetResultsTemperature.Cells[16, 2].value2;
            Program.xlbookResults.Save();
            this.Close();
            if (Program.ProbeCounter == (int)Program.CONSTANTS.EDALE)
            {

                Program.ProbeCounter++;
                return;
            }


            if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
            {
                Program.ProbesSelected[0] = checkBox1.Checked;
                Program.ProbesSelected[1] = checkBox2.Checked;
                Program.ProbesSelected[2] = checkBox3.Checked;
                Program.ProbesSelected[3] = checkBox4.Checked;
                Program.ProbesSelected[4] = checkBox5.Checked;
                Program.ProbesSelected[5] = checkBox6.Checked;
                Program.ProbesSelected[6] = checkBox7.Checked;
                Program.ProbesSelected[7] = checkBox8.Checked;
                Program.ProbesSelected[8] = checkBox9.Checked;
                Program.ProbesSelected[9] = checkBox10.Checked;
                Form frmLaserReadings = new frmLaserReadings1();
                frmLaserReadings.ShowDialog();
                // set checkbox state for all probes

            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            txtManual1.Text = "0";
            txtManual2.Text = "0";
            txtManual3.Text = "0";
            txtManual4.Text = "0";
            txtManual5.Text = "0";
            txtManual6.Text = "0";
            txtManual7.Text = "0";
            txtManual8.Text = "0";
            txtManual9.Text = "0";
            txtManual10.Text = "0";
            txtManual11.Text = "0";
            txtManual12.Text = "0";
            txtManual13.Text = "0";
            txtManual14.Text = "0";
            txtManual15.Text = "0";
            txtManual16.Text = "0";
            txtManual17.Text = "0";
            txtManual18.Text = "0";
            txtManual19.Text = "0";
            txtManual20.Text = "0";

        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void txtManual11_TextChanged(object sender, EventArgs e)
        {

        }

        private void RefreshEvent(object myObject, EventArgs myEventArgs)
        {
            // txtManual1.Text = counter.ToString();
            // counter++;
            this.Refresh();
        }
        private void OnCommEvent()
        {
            switch (mscomm.CommEvent)
            {
                case 4: //DMSCommEventsConstants.comEvReceive:
                    // Handle incoming data
                    string dataReceived = mscomm.Input;
                    Console.WriteLine("Data Received: " + dataReceived);
                    if (dataReceived == null) return;
                    // this.Refresh();
                    string[] probes = dataReceived.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);
                    foreach (var probe in probes)
                    {
                        Console.WriteLine(probe);
                        if (probe.StartsWith('C'))
                        {
                            if (probe.Length > 9)
                            {
                                string probe_no = probe.Substring(2, 2);
                                string probe_val = probe.Substring(5, 5);
                                switch (probe_no)
                                {
                                    case "01":
                                        txtManual1.Text = probe_val;
                                        break;
                                    case "02":
                                        txtManual2.Text = probe_val;
                                        break;
                                    case "03":
                                        txtManual3.Text = probe_val;
                                        break;
                                    case "04":
                                        txtManual4.Text = probe_val;
                                        break;
                                    case "05":
                                        txtManual5.Text = probe_val;
                                        break;
                                    case "06":
                                        txtManual6.Text = probe_val;
                                        break;
                                    case "07":
                                        txtManual7.Text = probe_val;
                                        break;
                                    case "08":
                                        txtManual8.Text = probe_val;
                                        break;
                                    case "09":
                                        txtManual9.Text = probe_val;
                                        break;
                                    case "10":
                                        txtManual10.Text = probe_val;
                                        break;
                                }
                            }
                            else
                            {  // noise ?
                                return;
                            }
                        }

                    }

                    break;

            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            // MSCommLib.MSComm mscomm = new MSCommLib.MSCommClass();
            mscomm = new MSComm();
            mscomm.CommPort = 2;

            // Set the port number
            // ManualEdale (11) 'when digital edale clicked go to sub ManualEdale with no of probes as 11
            try
            {
                mscomm.PortOpen = true;  // Open comm port for EDALE
            }
            catch (Exception)
            {
            }
            // mscomm.Output = "ManualEdale (11)";
            // read port#
            mscomm.RThreshold = 1;  // Fire OnComm event after any data is received

            // Handle OnComm event to read data
            mscomm.OnComm += new DMSCommEvents_OnCommEventHandler(OnCommEvent); // Assigns the event handler
            // Declare the timer
            myTimer = new System.Windows.Forms.Timer();
            myTimer.Interval = 100;
            myTimer.Tick += new EventHandler(RefreshEvent);
            myTimer.Start();


            //mscomm.OnComm += new EventHandler(OnCommEvent); // Assigns the event handler

            // mscomm.PortOpen = false; // Close comm port for EDALE

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}
