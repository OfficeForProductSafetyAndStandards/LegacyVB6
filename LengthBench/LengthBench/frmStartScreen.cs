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

            Form frmLaser = new frmLaser();
            frmLaser.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.Exit();
        }
    }
}
