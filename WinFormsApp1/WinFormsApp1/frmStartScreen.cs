using frmStartScreen;

namespace WinFormsApp1
{
    public partial class frmStartScreen : Form
    {
        public frmStartScreen()
        {
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form frmFlexiMeasurementsSelection = new frmFlexiMeasurementsSelection();
            frmFlexiMeasurementsSelection.Show();
        }

        private void frmStartScreen_Load(object sender, EventArgs e)
        {

        }
    }
}
