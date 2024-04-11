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
        }

        private Color check(double x)
        {
            Color backColor = Color.Green;
            if (x < 18.0) backColor = Color.Blue;
            if (x > 22.0) backColor = Color.Red;
            return backColor;
        }


        private void CorrectEdale(int NoOfProbes)
        {
            string[] txtManualEdale = new string[10];
            double x = 0;
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
                            Color color = check(x);
                            txtManual11.ForeColor = Color.White;
                            txtManual11.BackColor = color;
                            txtManual11.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 1:
                        if (checkBox2.Checked == true && txtManual2.Text != "")
                        {
                            try
                            {
                                x = Convert.ToDouble(txtManual2.Text);
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show("Please enter a valid number");
                            }

                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = x;
                            Program.xlsheet.Cells[22, 2] = x;
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual2.Text);
                            Color color = check(x);
                            txtManual12.ForeColor = Color.White;
                            txtManual12.BackColor = color;
                            txtManual12.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 2:
                        if (checkBox3.Checked == true && txtManual3.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual3.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual3.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual3.Text);
                            Color color = check(x);
                            txtManual13.ForeColor = Color.White;
                            txtManual13.BackColor = color;
                            txtManual13.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 3:
                        if (checkBox4.Checked == true && txtManual4.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 3, Program.Rownumber] = Convert.ToDouble(txtManual4.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual4.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual4.Text);
                            Color color = check(x);
                            txtManual14.ForeColor = Color.White;
                            txtManual14.BackColor = color;
                            txtManual14.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 4:
                        if (checkBox5.Checked == true && txtManual5.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual5.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual5.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual5.Text);
                            Color color = check(x);
                            txtManual15.ForeColor = Color.White;
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
                            Color color = check(x);
                            txtManual16.ForeColor = Color.White;
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
                            Color color = check(x);
                            txtManual17.ForeColor = Color.White;
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
                            Color color = check(x);
                            txtManual18.ForeColor = Color.White;
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
                            Color color = check(x);
                            txtManual19.ForeColor = Color.White;
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
                            Color color = check(x);
                            txtManual20.ForeColor = Color.White;
                            txtManual20.BackColor = color;
                            txtManual20.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;

                }
            }
        }


        public void button1_Click(object sender, EventArgs e)
        {
            string Thermometer;

            myTimer.Stop();
            mscomm.OnComm -= new DMSCommEvents_OnCommEventHandler(OnCommEvent);

            Program.xlsheet = Program.xlCorrectionBook.Worksheets["IB5390"]; // goes to module TakeTemperature with name of thermometer
            CorrectEdale(10); //goes to sub CorrectEdale  with 10 as number of probes


            /*
                if (Program.ProbeCounter == (int)Program.CONSTANTS.EDALE)
                    lblTemperatureOk.Visible = True 'make these 3 buttons visible
                    cmdResultsNotOk.Visible = True
                    cmdResultsOk.Visible = True
                */



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
                    this.Text = "VOL Temperature Dialog";
                    break;
                case (int)Program.CONSTANTS.INITIAL:
                    this.Text = "Initial Temperature Dialog";
                    break;
                case (int)Program.CONSTANTS.INTERMEDIATE:
                    this.Text = "Intermediate Temperature Dialog";
                    break;
                case (int)Program.CONSTANTS.FINAL:
                    this.Text = "Final Temperature Dialog";
                    break;
            }
            // restore state from EDALE for selected probes
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
                // set checkbox state for all probes
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
                Program.ProbeCounter++;
                return;
            }


            if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
            {
                Form frmLaserReadings = new frmLaserReadings1();
                frmLaserReadings.ShowDialog();
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

        private void mscomm_OnComm()
        {
            switch (mscomm.CommEvent)
            {

                /*
                case DMSCommEventsConstants.comEvReceive:
                    // Handle incoming data
                    string dataReceived = mscomm.Input;
                    Console.WriteLine("Data Received: " + dataReceived);
                    break;
                case DMSCommEventsConstants.comEvSend:
                    // Handle completion of data transmission
                    Console.WriteLine("Data Sent");
                    break;
                    // Add cases for other events you want to handle
                */
            }
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
                                switch(probe_no)
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
       


            void radioButton1_CheckedChanged(object sender, EventArgs e)
            {
                // MSCommLib.MSComm mscomm = new MSCommLib.MSCommClass();
                mscomm = new MSComm();
                mscomm.CommPort = 2;

                // Set the port number
                // ManualEdale (11) 'when digital edale clicked go to sub ManualEdale with no of probes as 11
                mscomm.PortOpen = true;  // Open comm port for EDALE
                mscomm.Output = "ManualEdale (11)";
                // read port#
                mscomm.RThreshold = 1;  // Fire OnComm event after any data is received

                // Handle OnComm event to read data
                // mscomm.OnComm += new DMSCommEvents_OnCommEventHandler(OnCommEvent); // Assigns the event handler
                // Declare the timer
                System.Windows.Forms.Timer myTimer = new System.Windows.Forms.Timer();
                myTimer.Interval = 1000;
                myTimer.Tick += new EventHandler(RefreshEvent);
                myTimer.Start();


                //mscomm.OnComm += new EventHandler(OnCommEvent); // Assigns the event handler

                // mscomm.PortOpen = false; // Close comm port for EDALE

            }

            void txtManual1_TextChanged(object sender, EventArgs e)
            {
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            // MSCommLib.MSComm mscomm = new MSCommLib.MSCommClass();
            mscomm = new MSComm();
            mscomm.CommPort = 2;

            // Set the port number
            // ManualEdale (11) 'when digital edale clicked go to sub ManualEdale with no of probes as 11
            mscomm.PortOpen = true;  // Open comm port for EDALE
            mscomm.Output = "ManualEdale (11)";
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
    }
   }
