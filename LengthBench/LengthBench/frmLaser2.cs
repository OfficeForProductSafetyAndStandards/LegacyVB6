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
    public partial class frmLaser2 : Form
    {
        public frmLaser2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form frmMeasurementSelection = new frmMeasurementSelection();
            frmMeasurementSelection.Show();
        }
    }
}
