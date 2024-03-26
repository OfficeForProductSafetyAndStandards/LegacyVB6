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
    public partial class frmLaser : Form
    {
        public frmLaser()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
            this.Dispose();
            Program.NewFileName = textBox1.Text;
            Form frmLaser2 = new frmLaser2();
            frmLaser2.ShowDialog();
           
            
        }

        private void frmLaser_Load(object sender, EventArgs e)
        {

        }
    }
}
