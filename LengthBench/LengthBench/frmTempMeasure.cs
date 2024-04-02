using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Windows.Media.Capture;
using Windows.UI.Composition.Interactions;
using static System.Net.Mime.MediaTypeNames;

namespace LengthBench
{
    public partial class frmTempMeasure : Form
    {
        public frmTempMeasure()
        {
            InitializeComponent();
        }

        private Color check(double x)
        {
            Color backColor = Color.Green;
            if (x < 18.0) backColor = Color.Blue;
            if (x > 22.0) backColor = Color.Red;
            return BackColor;
        }


        private void CorrectEdale(int NoOfProbes)
        {
            string[] txtManualEdale = new string[10];
            double x = 0;
            Color backColor=Color.Green;
            

             
            // convert vb to csharp
            for (int ProbeCounter = 0; ProbeCounter < NoOfProbes; ProbeCounter++)
            {
                switch (ProbeCounter)
                {
                    case 0:
                        if (checkBox1.Checked == true && txtManual1.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual1.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual1.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);

                            x = Convert.ToDouble(txtManual1.Text);
                            Color color = check(x);
                            //txtManual11.ForeColor = Color.White;
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
                            //txtManual12.ForeColor = Color.White;
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
                            x = Convert.ToDouble(txtManual3.Text) - Math.Round(Convert.ToDouble(txtManual3.Text));
                            txtManual13.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 3:
                        if (checkBox4.Checked == true && txtManual4.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 3, Program.Rownumber] = Convert.ToDouble(txtManual4.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual4.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual4.Text) - Math.Round(Convert.ToDouble(txtManual4.Text));
                            txtManual14.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 4:
                        if (checkBox5.Checked == true && txtManual5.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual5.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual5.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual5.Text) - Math.Round(Convert.ToDouble(txtManual5.Text));
                            txtManual15.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 5:
                        if (checkBox6.Checked == true && txtManual6.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual6.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual6.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual6.Text) - Math.Round(Convert.ToDouble(txtManual6.Text));
                            txtManual16.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 6:
                        if (checkBox7.Checked == true && txtManual7.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual7.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual7.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual7.Text) - Math.Round(Convert.ToDouble(txtManual7.Text));
                            txtManual17.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 7:
                        if (checkBox8.Checked == true && txtManual8.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual8.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual8.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual8.Text) - Math.Round(Convert.ToDouble(txtManual8.Text));
                            txtManual18.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 8:
                        if (checkBox9.Checked == true && txtManual9.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual9.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual9.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual9.Text) - Math.Round(Convert.ToDouble(txtManual9.Text));
                            txtManual19.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;
                    case 9:
                        if (checkBox10.Checked == true && txtManual10.Text != "")
                        {
                            Program.xlsheetResultsTemperatureUncorrected.Cells[ProbeCounter + 2, Program.Rownumber] = Convert.ToDouble(txtManual10.Text);
                            Program.xlsheet.Cells[22, 2] = Convert.ToDouble(txtManual10.Text);
                            Program.xlsheet.Cells[22, 3] = Convert.ToDouble(ProbeCounter + 3);
                            x = Convert.ToDouble(txtManual10.Text) - Math.Round(Convert.ToDouble(txtManual10.Text));
                            txtManual20.Text = ((double)Program.xlsheet.Cells[22, 4].value2).ToString();
                        }
                        break;

                }
            }
        }

        public void button1_Click(object sender, EventArgs e)
        {
            string Thermometer;

            bool[] ProbesSelected = new bool[10];

            for (int probeCounter = 0; probeCounter < 10; probeCounter++)
            { // convert vb to csharp
                if (checkBox1.Checked == true)
                {
                    ProbesSelected[probeCounter] = true;
                }
                else
                {
                    ProbesSelected[probeCounter] = false;
                }

                // If the check box is ticked make ProbesSelected(Probecounter) = 1
                // signifying that this is selected
            }

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



            if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
            {
                // Program.ProbeCounter++;
                // Form frmLaserReadings = new frmLaserReadings1();
                // frmLaserReadings.ShowDialog();
            }

            if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
            { // intermediate reading
              // Program.ProbeCounter++;
                this.Close();
                //  return;
            }

            if (Program.ProbeCounter == (int)Program.CONSTANTS.FINAL)
            { // final reading - should close entire app
                this.Close();
            }

            if (Program.ProbeCounter == (int)Program.CONSTANTS.EDALE)
            { // edale reading

                // Program.ProbeCounter++;
                // this.Close();
            }


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
                Form frmLaserReadings = new frmLaserReadings1();
                frmLaserReadings.ShowDialog();
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
   
