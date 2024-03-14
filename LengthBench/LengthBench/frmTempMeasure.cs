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
    public partial class frmTempMeasure : Form
    {
        public frmTempMeasure()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
                Program.xlsheetResultsTemperatureUncorrected.Cells[2, 3 + Program.ProbeCounter] = txtManual1.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[3, 3 + Program.ProbeCounter] = txtManual2.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[4, 3 + Program.ProbeCounter] = txtManual3.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[5, 3 + Program.ProbeCounter] = txtManual4.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[6, 3 + Program.ProbeCounter] = txtManual5.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[7, 3 + Program.ProbeCounter] = txtManual6.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[8, 3 + Program.ProbeCounter] = txtManual7.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[9, 3 + Program.ProbeCounter] = txtManual8.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[10, 3 + Program.ProbeCounter] = txtManual9.Text;
                Program.xlsheetResultsTemperatureUncorrected.Cells[11, 3 + Program.ProbeCounter] = txtManual10.Text;

                Program.xlsheetResultsTemperature.Cells[2, 3 + Program.ProbeCounter] = txtManual11.Text;
                Program.xlsheetResultsTemperature.Cells[3, 3 + Program.ProbeCounter] = txtManual12.Text;
                Program.xlsheetResultsTemperature.Cells[4, 3 + Program.ProbeCounter] = txtManual13.Text;
                Program.xlsheetResultsTemperature.Cells[5, 3 + Program.ProbeCounter] = txtManual14.Text;
                Program.xlsheetResultsTemperature.Cells[6, 3 + Program.ProbeCounter] = txtManual15.Text;
                Program.xlsheetResultsTemperature.Cells[7, 3 + Program.ProbeCounter] = txtManual16.Text;
                Program.xlsheetResultsTemperature.Cells[8, 3 + Program.ProbeCounter] = txtManual17.Text;
                Program.xlsheetResultsTemperature.Cells[9, 3 + Program.ProbeCounter] = txtManual18.Text;
                Program.xlsheetResultsTemperature.Cells[10, 3 + Program.ProbeCounter] = txtManual19.Text;
                Program.xlsheetResultsTemperature.Cells[11, 3 + Program.ProbeCounter] = txtManual20.Text;
                Program.xlbookResults.Save();

            Program.ProbeCounter++;

            Form frmLaserReadings = new frmLaserReadings1();
            frmLaserReadings.ShowDialog();
        }

        private void frmTempMeasure_Load(object sender, EventArgs e)
        {


            
        }
    }
}
