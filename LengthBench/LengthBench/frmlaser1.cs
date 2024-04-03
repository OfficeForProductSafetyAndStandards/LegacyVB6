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
    public partial class frmlaser1 : Form
    {

        public static int x = 0;
        public frmlaser1(int p)
        {
            InitializeComponent();
            string s = (p-3).ToString();
            label1.Text = "Length of interval No. " + s + " in " + Program.Units;
        }

        public void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        public void textPoint_TextChanged(object sender, EventArgs e)
        {
            string y = (sender as TextBox).Text;
            try
            {
                x = Convert.ToInt32(y);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Please enter a valid number");
            }
        }

        private void frmlaser1_Load(object sender, EventArgs e)
        {

        }
    }
}
