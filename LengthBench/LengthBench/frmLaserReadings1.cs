﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Timer = System.Windows.Forms.Timer;

namespace LengthBench
{
    public partial class frmLaserReadings1 : Form
    {
        
        private void timer_Tick(object sender, EventArgs e)
        {
            // var x = Program.laser.ReadSample();
            // pbBeamStrength.Value = x;

            // stub for now use timer to generate a random number
            Random Random = new Random();
            decimal x = Random.Next(0, 100);
            label2.Text = x.ToString();
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
    }
}