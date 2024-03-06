using System.Reflection.Metadata.Ecma335;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace LengthBench
{
    public partial class frmStartScreen : Form
    {
        public frmStartScreen()
        {
            InitializeComponent();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            // NewFileName = InputBox("What File for saving results, use Department No for simplicity")
            Program.xlsheetResultsVOLandCustomerData.Cells[2, 2] = Program.NewFileName;
            string Datestring = DateTime.Now.ToString ("dd mmm yyyy");
            string Timestring = DateTime.UtcNow.ToString("hh-mm");
            Program.NewFileName = "c:\\metrology\\@private\\@mu\\Length Results\\Flexi\\" + Program.NewFileName + ' ' + Datestring + ' ' + Timestring;
            Program.xlbookResults.SaveAs(Program.NewFileName);

            Form frmLaser = new frmLaser();
            frmLaser.Show();

            /*
            using (Form frmLaser2 = new frmLaser2())
            {
                frmLaser2.Show();
            }*/

        }

        private void button2_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.Exit();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
                Program.metrologist = comboBox1.Text;
        }
    }
}
