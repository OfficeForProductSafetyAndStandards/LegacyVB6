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
            this.Visible = false;
            // this.Dispose();
            // NewFileName = InputBox("What File for saving results, use Department No for simplicity")
            Program.xlsheetResultsVOLandCustomerData.Cells[2, 2] = Program.NewFileName;
            string Datestring = DateTime.Now.ToString("dd mmm yyyy");
            string Timestring = DateTime.UtcNow.ToString("hh-mm");
            Program.NewFileName = "c:\\metrology\\@private\\@mu\\Length Results\\Flexi\\" + Program.NewFileName + ' ' + Datestring + ' ' + Timestring;
            // Program.xlbookResults.SaveAs(Program.NewFileName);

            Form frmLaser = new frmLaser();
            frmLaser.ShowDialog();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.Exit();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] email = comboBox1.Text.Split();
            // first name and last name
            Program.metrologist = email[0] + email[1];
            Program.email = email[2];
            button1.Enabled = true;
        }

        private void frmStartScreen_Load(object sender, EventArgs e)
        {
            Program.Setup_Rigid_Laser("UM");
            Program.Setup_Flexi_Laser("UM");

            if (Program.RigidLaserFound)
            {
                this.Text = "Rigid Length Laser Detected";
                label1.Visible = false;
                label2.Visible = true;
            }
            if (Program.FlexiLaserFound)
            {
                this.Text = "Flexi Length Laser Detected";
                label2.Visible = false;
                label1.Visible = true;
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
