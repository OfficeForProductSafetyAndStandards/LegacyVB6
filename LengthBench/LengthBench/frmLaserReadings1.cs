﻿using System;
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
using System.Net;
using System.Net.Mail;

namespace LengthBench
{
    public partial class frmLaserReadings1 : Form
    {
        private int iPts = 0;
        private void timer_Tick(object sender, EventArgs e)
        {
            if (Program.LaserFound == true)
            {
                var x = Program.laser.ReadBeamStrength() * 100;
                pbBeamStrength.Value = (int)x;
                var y = Program.laser.ReadSample();
                label2.Text = y.ToString();
                pbBeamStrength.Value = (int)x;
            }
            else
            {
                // stub for now use timer to generate a random number
                Random Random = new Random();
                decimal x = Random.Next(0, 100);
                decimal y = Random.Next(0, 100);
                label2.Text = y.ToString();
                pbBeamStrength.Value = (int)x;
            }

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
            timer.Interval = 100;
            timer.Tick += new EventHandler(timer_Tick);
            timer.Start();

        }


        private void button1_Click(object sender, EventArgs e)
        {

            if (iPts < 0)
            {
                return;
            }

            Random Random = new Random();
            double x = 0;
            if (Program.LaserFound)
            {
                x = Program.laser.ReadSample();
            }
            else
            {
                x = Random.Next(0, 100);
            }

            switch (iPts)
            {
                case 0:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading0.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtFinalZeroReading.Text = x.ToString();
                    }
                    break;
                case 1:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading1.Text = x.ToString();

                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun1.Text = x.ToString();
                    }
                    break;
                case 2:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading2.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun2.Text = x.ToString();
                    }
                    break;
                case 3:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading3.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun3.Text = x.ToString();
                    }
                    break;
                case 4:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading4.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun4.Text = x.ToString();
                    }
                    break;
                case 5:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading5.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun5.Text = x.ToString();
                    }
                    break;
                case 6:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading6.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun6.Text = x.ToString();
                    }
                    break;
                case 7:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading7.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun7.Text = x.ToString();
                    }
                    break;
                case 8:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading8.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun8.Text = x.ToString();
                    }
                    break;
                case 9:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading9.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun9.Text = x.ToString();
                    }
                    break;
                case 10:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading10.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun10.Text = x.ToString();
                    }
                    break;
                case 11:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading11.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun11.Text = x.ToString();
                    }
                    break;
                case 12:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading12.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun12.Text = x.ToString();
                    }
                    break;
                case 13:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading13.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun13.Text = x.ToString();
                    }
                    break;
                case 14:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading14.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun14.Text = x.ToString();
                    }
                    break;
                case 15:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading15.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun15.Text = x.ToString();
                    }
                    break;
                case 16:
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
                    {
                        txtLaserReading16.Text = x.ToString();
                    }
                    if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
                    {
                        txtLaserRun16.Text = x.ToString();
                    }
                    break;
            }
            Program.xlsheetResultsMeasurement.Cells[iPts + 3, 2 + Program.ProbeCounter] = x.ToString();

            if (Program.ProbeCounter == (int)Program.CONSTANTS.INITIAL)
            { // counting forwards
                iPts += 1; // increment the point number
            }
            if (Program.ProbeCounter == (int)Program.CONSTANTS.INTERMEDIATE)
            { // counting backwards
                iPts -= 1; // decrement the point number
            }

            if (iPts > Program.NoOfPoints)
            {
                Program.ProbeCounter++;
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
            Program.ProbeCounter++;
            Form frmTempMeasure = new frmTempMeasure();
            frmTempMeasure.ShowDialog();
            // save the results
            Program.xlbookResults.Save();
            Program.xlbookResults.Close();
            // thats all folks
            Application.Exit();
        }

        private void txtLaserReading5_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtLaserReading2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void label12_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            string user = "";
            string password = "";
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
            MailMessage mail = new MailMessage();
            mail.Subject = "Your Subject";
            mail.From = new MailAddress("m-hunt3@sky.com");
            mail.To.Add("m-hunt3@sky.com");
            mail.Body = "Hello! Your mail content goes here...";
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.tools.sky.com", 587);
            smtp.EnableSsl = true;

            user = textBox1.Text;
            password = textBox2.Text;

            NetworkCredential netCre = new NetworkCredential(user, password);
            smtp.Credentials = netCre;

            try
            {
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                // Handle the exception
                MessageBox.Show(ex.InnerException.ToString());
            }
        }
    }
}
