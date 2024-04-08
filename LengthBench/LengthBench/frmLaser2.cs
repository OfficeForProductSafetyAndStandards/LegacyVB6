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
            this.Close();
            this.Dispose();
            // NewFileName = InputBox("What File for saving results, use Department No for simplicity")
            string Datestring = DateTime.Now.ToString("dd MMM yyyy");
            string Timestring = DateTime.UtcNow.ToString("hh-mm");
            if (Program.FlexiPath == null)
            {
                Program.NewFileName = "c:\\metrology\\@private\\@mu\\Length Results\\Flexi\\" + Program.dept + ' ' + Datestring + ' ' + Timestring;
            }
            else
            {
                Program.NewFileName = Program.FlexiPath + "\\" + Program.dept + ' ' + Datestring + ' ' + Timestring;
            }
            Program.xlsheetResultsVOLandCustomerData.Cells[2, 2] = Program.NewFileName;

            Program.xlbookResults.SaveAs(Program.NewFileName);
            Program.xlsheetResultsMeasurement.Cells[26, 5] = Program.metrologist;
            Program.NewFileName1 = textBox1.Text;
            // Program.xlsheetResultsVOLandCustomerData.Cells[12, 2] = Program.NewFileName1;

            Form frmMeasurementSelection = new frmMeasurementSelection();
            frmMeasurementSelection.ShowDialog();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            Program.daybook = textBox1.Text;
        }

        private void frmLaser2_Load(object sender, EventArgs e)
        {

        }
    }
}
