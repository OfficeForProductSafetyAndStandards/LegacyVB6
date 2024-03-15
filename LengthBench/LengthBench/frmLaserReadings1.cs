using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Windows.ApplicationModel.Background;
using Timer = System.Windows.Forms.Timer;

namespace LengthBench
{
    public partial class frmLaserReadings1 : Form
    {
        private int iPts = 0;
        private void timer_Tick(object sender, EventArgs e)
        {
            var x = Program.laser.ReadBeamStrength() * 100;
            pbBeamStrength.Value = (int)x;

            // stub for now use timer to generate a random number
            //Random Random = new Random();
            //decimal x = Random.Next(0, 100);
            //decimal y = Random.Next(0, 100);
            var y = Program.laser.ReadSample();
            label2.Text = y.ToString();
            pbBeamStrength.Value = (int)x;

        }
        public frmLaserReadings1()
        {
            InitializeComponent();
            pbBeamStrength.Maximum = 100;
            pbBeamStrength.Minimum = 0;
            pbBeamStrength.Value = 50;
            pbBeamStrength.BackColor = System.Drawing.Color.White;
            pbBeamStrength.ForeColor = System.Drawing.Color.Red;
            Timer timer = new Timer();
            timer.Interval = 1000;
            timer.Tick += new EventHandler(timer_Tick);
            timer.Start();

        }


        private void button1_Click(object sender, EventArgs e)
        {

            if (iPts < 0)
            {
                return;
            }
            // stub for now use timer to generate a random number var x = Program.laser.ReadSample();
            Random Random = new Random();
            //decimal x = Random.Next(0, 100);
            double x = Program.laser.ReadSample();
            switch (iPts)
            {
                case 0:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading0.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtFinalZeroReading.Text = x.ToString();
                    }
                    break;
                case 1:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading1.Text = x.ToString();

                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun1.Text = x.ToString();
                    }
                    break;
                case 2:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading2.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun2.Text = x.ToString();
                    }
                    break;
                case 3:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading3.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun3.Text = x.ToString();
                    }
                    break;
                case 4:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading4.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun4.Text = x.ToString();
                    }
                    break;
                case 5:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading5.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun5.Text = x.ToString();
                    }
                    break;
                case 6:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading6.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun6.Text = x.ToString();
                    }
                    break;
                case 7:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading7.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun7.Text = x.ToString();
                    }
                    break;
                case 8:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading8.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun8.Text = x.ToString();
                    }
                    break;
                case 9:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading9.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun9.Text = x.ToString();
                    }
                    break;
                case 10:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading10.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun10.Text = x.ToString();
                    }
                    break;
                case 11:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading11.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun11.Text = x.ToString();
                    }
                    break;
                case 12:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading12.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun12.Text = x.ToString();
                    }
                    break;
                case 13:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading13.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun13.Text = x.ToString();
                    }
                    break;
                case 14:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading14.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun14.Text = x.ToString();
                    }
                    break;
                case 15:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading15.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun15.Text = x.ToString();
                    }
                    break;
                case 16:
                    if (Program.ProbeCounter == 1)
                    {
                        txtLaserReading16.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == 2)
                    {
                        txtLaserRun16.Text = x.ToString();
                    }
                    break;
            }
            Program.xlsheetResultsMeasurement.Cells[iPts + 3, 1+Program.ProbeCounter] = x.ToString();

            if (Program.ProbeCounter == 1)
            { // counting forwards
                iPts += 1; // increment the point number
            }
            if (Program.ProbeCounter == 2)
            { // counting backwards
                iPts -= 1; // decrement the point number
            }

            if (iPts > Program.NoOfPoints)
            {
                Form form = new frmTempMeasure();
                form.Show();
                iPts--;
            }
        }

        private void frmLaserReadings1_Load(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void cmdResetLaser_Click(object sender, EventArgs e)
        {
            Program.laser.Reset();
        }

        private void txtLaserReading_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            Form frmTempMeasure = new frmTempMeasure();
            frmTempMeasure.ShowDialog();
            // save the results
            Program.xlbookResults.Save();
        }

        private void txtLaserReading5_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtLaserReading2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
