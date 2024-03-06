﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Windows.ApplicationModel.ConversationalAgent;

namespace LengthBench
{
    public partial class frmCustomerDetails : Form
    {
        public frmCustomerDetails()
        {
            InitializeComponent();
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void txtDepartmentNumber_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void cmdGotoNextScreen_Click(object sender, EventArgs e)
        {
            Program.xlsheetResultsVOLandCustomerData.Cells[1, 2] = txtCustomerName.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[2, 2] = txtDepartmentNumber.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[3, 2] = txtNumberOfPoints.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[4, 2] = txtTensionWeight.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[5, 2] = txtCoefficient.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[6, 2] = comboBox1.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[7, 2] = txtReferenceTemperature.Text;
            Program.xlsheetResultsVOLandCustomerData.Cells[8, 2] = dateTimePicker1.Text;


            Form frmLaserReadings1 = new frmLaserReadings1();
            frmLaserReadings1.Show();
        }

        private void txtCustomerName_TextChanged(object sender, EventArgs e)
        {

        }

        private void frmCustomerDetails_Load(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            double coef=0;

            string mat = comboBox1.Text;
            switch(mat)
            { 
                case "Aluminium":
                    coef= 23.1;
                    break;
                case "Brass":
                    coef= 17.5;
                    break;
                case "Bronze":
                    coef = 17.3;
                    break;
                case "Invar":
                    coef = 0.76;
                    break;
                case "Nickel Steel":
                    coef = 11.42;
                    break;
                case "Steel":
                    coef = 10.7;
                    break;
                case "Stainless Steel":
                    coef = 14.7;
                    break;
                case "Carbon Steel":
                    coef = 12.5;
                    break;

            }

            Program.xlsheetResultsVOLandCustomerData.Cells[5, 2] = coef;
            txtCoefficient.Text = coef.ToString();
        }
    }
}
