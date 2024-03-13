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
            //var x = Program.laser.ReadBeamStrength();
            //pbBeamStrength.Value = (int)x;

            // stub for now use timer to generate a random number
            Random Random = new Random();
            decimal x = Random.Next(0, 100);
            decimal y = Random.Next(0, 100);
            //var y = Program.laser.ReadSample();
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
            // stub for now use timer to generate a random number var x = Program.laser.ReadSample();
            Random Random = new Random();
            decimal x = Random.Next(0, 100);
            switch (iPts)
            {
                case 0:
                    txtLaserReading0.Text = x.ToString();
                    break;
                case 1:
                    txtLaserReading1.Text = x.ToString();
                    break;
                case 2:
                    txtLaserReading2.Text = x.ToString();
                    break;
                case 3:
                    txtLaserReading3.Text = x.ToString();
                    break;
                case 4:
                    txtLaserReading4.Text = x.ToString();
                    break;
                case 5:
                    txtLaserReading5.Text = x.ToString();
                    break;
                case 6:
                    txtLaserReading6.Text = x.ToString();
                    break;
                case 7:
                    txtLaserReading7.Text = x.ToString();
                    break;
                case 8:
                    txtLaserReading8.Text = x.ToString();
                    break;
                case 9:
                    txtLaserReading9.Text = x.ToString();
                    break;
                case 19:
                    txtLaserReading19.Text = x.ToString();
                    break;
            }
            Program.xlsheetResultsMeasurement.Cells[iPts + 3, 2] = x;
            iPts += 1;

            //DispLaserReading(txtLaserReading(iPts), x)
            //PutReadingInExcel(dbReading, iPts, LaserTestSetNo)

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
            // save the results
            Program.xlbookResults.Save();
        }
    }
}
