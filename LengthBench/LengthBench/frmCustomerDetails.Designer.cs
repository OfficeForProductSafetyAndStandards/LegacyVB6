namespace LengthBench
{
    partial class frmCustomerDetails
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lblCustomerName = new Label();
            lblDepartmentNumber = new Label();
            lblNumberOfPoints = new Label();
            lblTapeMaterial = new Label();
            lblCoefficientOfThermalExpansion = new Label();
            lblReferenceTemperature = new Label();
            lblTensionWeight = new Label();
            lblDate = new Label();
            dateTimePicker1 = new DateTimePicker();
            txtCustomerName = new TextBox();
            txtTensionWeight = new TextBox();
            txtReferenceTemperature = new TextBox();
            txtNumberOfPoints = new TextBox();
            txtDepartmentNumber = new TextBox();
            comboBox1 = new ComboBox();
            cmdGotoNextScreen = new Button();
            txtCoefficient = new TextBox();
            comboBox2 = new ComboBox();
            SuspendLayout();
            // 
            // lblCustomerName
            // 
            lblCustomerName.AutoSize = true;
            lblCustomerName.Location = new Point(20, 16);
            lblCustomerName.Margin = new Padding(2, 0, 2, 0);
            lblCustomerName.Name = "lblCustomerName";
            lblCustomerName.Size = new Size(94, 15);
            lblCustomerName.TabIndex = 0;
            lblCustomerName.Text = "Customer Name";
            // 
            // lblDepartmentNumber
            // 
            lblDepartmentNumber.AutoSize = true;
            lblDepartmentNumber.Location = new Point(20, 42);
            lblDepartmentNumber.Margin = new Padding(2, 0, 2, 0);
            lblDepartmentNumber.Name = "lblDepartmentNumber";
            lblDepartmentNumber.Size = new Size(117, 15);
            lblDepartmentNumber.TabIndex = 1;
            lblDepartmentNumber.Text = "Department Number";
            // 
            // lblNumberOfPoints
            // 
            lblNumberOfPoints.AutoSize = true;
            lblNumberOfPoints.Location = new Point(25, 66);
            lblNumberOfPoints.Margin = new Padding(2, 0, 2, 0);
            lblNumberOfPoints.Name = "lblNumberOfPoints";
            lblNumberOfPoints.Size = new Size(132, 15);
            lblNumberOfPoints.TabIndex = 2;
            lblNumberOfPoints.Text = "Number of Graduations";
            lblNumberOfPoints.Click += lblNumberOfPoints_Click;
            // 
            // lblTapeMaterial
            // 
            lblTapeMaterial.AutoSize = true;
            lblTapeMaterial.Location = new Point(25, 88);
            lblTapeMaterial.Margin = new Padding(2, 0, 2, 0);
            lblTapeMaterial.Name = "lblTapeMaterial";
            lblTapeMaterial.Size = new Size(76, 15);
            lblTapeMaterial.TabIndex = 3;
            lblTapeMaterial.Text = "Rule Material";
            // 
            // lblCoefficientOfThermalExpansion
            // 
            lblCoefficientOfThermalExpansion.AutoSize = true;
            lblCoefficientOfThermalExpansion.Location = new Point(25, 110);
            lblCoefficientOfThermalExpansion.Margin = new Padding(2, 0, 2, 0);
            lblCoefficientOfThermalExpansion.Name = "lblCoefficientOfThermalExpansion";
            lblCoefficientOfThermalExpansion.Size = new Size(182, 15);
            lblCoefficientOfThermalExpansion.TabIndex = 4;
            lblCoefficientOfThermalExpansion.Text = "Coefficient of Thermal Expansion";
            // 
            // lblReferenceTemperature
            // 
            lblReferenceTemperature.AutoSize = true;
            lblReferenceTemperature.Location = new Point(25, 132);
            lblReferenceTemperature.Margin = new Padding(2, 0, 2, 0);
            lblReferenceTemperature.Name = "lblReferenceTemperature";
            lblReferenceTemperature.Size = new Size(128, 15);
            lblReferenceTemperature.TabIndex = 5;
            lblReferenceTemperature.Text = "Reference Temperature";
            // 
            // lblTensionWeight
            // 
            lblTensionWeight.AutoSize = true;
            lblTensionWeight.Location = new Point(25, 157);
            lblTensionWeight.Margin = new Padding(2, 0, 2, 0);
            lblTensionWeight.Name = "lblTensionWeight";
            lblTensionWeight.Size = new Size(88, 15);
            lblTensionWeight.TabIndex = 6;
            lblTensionWeight.Text = "Tension Weight";
            // 
            // lblDate
            // 
            lblDate.AutoSize = true;
            lblDate.Location = new Point(25, 181);
            lblDate.Margin = new Padding(2, 0, 2, 0);
            lblDate.Name = "lblDate";
            lblDate.Size = new Size(68, 15);
            lblDate.TabIndex = 8;
            lblDate.Text = "Date of Test";
            lblDate.Click += label9_Click;
            // 
            // dateTimePicker1
            // 
            dateTimePicker1.Location = new Point(339, 181);
            dateTimePicker1.Margin = new Padding(2, 1, 2, 1);
            dateTimePicker1.Name = "dateTimePicker1";
            dateTimePicker1.Size = new Size(86, 23);
            dateTimePicker1.TabIndex = 7;
            dateTimePicker1.ValueChanged += dateTimePicker1_ValueChanged;
            // 
            // txtCustomerName
            // 
            txtCustomerName.Location = new Point(339, 13);
            txtCustomerName.Margin = new Padding(2, 1, 2, 1);
            txtCustomerName.Name = "txtCustomerName";
            txtCustomerName.Size = new Size(86, 23);
            txtCustomerName.TabIndex = 0;
            txtCustomerName.TextChanged += txtCustomerName_TextChanged;
            // 
            // txtTensionWeight
            // 
            txtTensionWeight.Location = new Point(340, 155);
            txtTensionWeight.Margin = new Padding(2, 1, 2, 1);
            txtTensionWeight.Name = "txtTensionWeight";
            txtTensionWeight.Size = new Size(86, 23);
            txtTensionWeight.TabIndex = 5;
            txtTensionWeight.TextChanged += txtTensionWeight_TextChanged;
            // 
            // txtReferenceTemperature
            // 
            txtReferenceTemperature.Location = new Point(340, 132);
            txtReferenceTemperature.Margin = new Padding(2, 1, 2, 1);
            txtReferenceTemperature.Name = "txtReferenceTemperature";
            txtReferenceTemperature.Size = new Size(86, 23);
            txtReferenceTemperature.TabIndex = 11;
            // 
            // txtNumberOfPoints
            // 
            txtNumberOfPoints.Location = new Point(340, 63);
            txtNumberOfPoints.Margin = new Padding(2, 1, 2, 1);
            txtNumberOfPoints.Name = "txtNumberOfPoints";
            txtNumberOfPoints.Size = new Size(86, 23);
            txtNumberOfPoints.TabIndex = 2;
            txtNumberOfPoints.TextChanged += txtNumberOfPoints_TextChanged;
            // 
            // txtDepartmentNumber
            // 
            txtDepartmentNumber.Location = new Point(340, 38);
            txtDepartmentNumber.Margin = new Padding(2, 1, 2, 1);
            txtDepartmentNumber.Name = "txtDepartmentNumber";
            txtDepartmentNumber.Size = new Size(86, 23);
            txtDepartmentNumber.TabIndex = 1;
            txtDepartmentNumber.TextChanged += txtDepartmentNumber_TextChanged;
            // 
            // comboBox1
            // 
            comboBox1.FormattingEnabled = true;
            comboBox1.Items.AddRange(new object[] { "Aluminium", "Brass", "Bronze", "Invar", "Nickel Steel", "Steel", "Stainless Steel", "Other" });
            comboBox1.Location = new Point(340, 86);
            comboBox1.Margin = new Padding(2, 1, 2, 1);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(87, 23);
            comboBox1.TabIndex = 3;
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            // 
            // cmdGotoNextScreen
            // 
            cmdGotoNextScreen.Location = new Point(342, 220);
            cmdGotoNextScreen.Margin = new Padding(2, 1, 2, 1);
            cmdGotoNextScreen.Name = "cmdGotoNextScreen";
            cmdGotoNextScreen.Size = new Size(70, 23);
            cmdGotoNextScreen.TabIndex = 8;
            cmdGotoNextScreen.Text = "OK?";
            cmdGotoNextScreen.UseVisualStyleBackColor = true;
            cmdGotoNextScreen.Click += cmdGotoNextScreen_Click;
            // 
            // txtCoefficient
            // 
            txtCoefficient.AcceptsReturn = true;
            txtCoefficient.Location = new Point(340, 108);
            txtCoefficient.Margin = new Padding(2, 1, 2, 1);
            txtCoefficient.Name = "txtCoefficient";
            txtCoefficient.Size = new Size(86, 23);
            txtCoefficient.TabIndex = 4;
            // 
            // comboBox2
            // 
            comboBox2.FormattingEnabled = true;
            comboBox2.Items.AddRange(new object[] { "Upper", "Lower" });
            comboBox2.Location = new Point(340, 157);
            comboBox2.Margin = new Padding(2, 1, 2, 1);
            comboBox2.Name = "comboBox2";
            comboBox2.Size = new Size(87, 23);
            comboBox2.TabIndex = 12;
            comboBox2.SelectedIndexChanged += comboBox2_SelectedIndexChanged;
            // 
            // frmCustomerDetails
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(464, 250);
            Controls.Add(comboBox2);
            Controls.Add(txtCoefficient);
            Controls.Add(cmdGotoNextScreen);
            Controls.Add(comboBox1);
            Controls.Add(txtDepartmentNumber);
            Controls.Add(txtNumberOfPoints);
            Controls.Add(txtReferenceTemperature);
            Controls.Add(txtTensionWeight);
            Controls.Add(txtCustomerName);
            Controls.Add(dateTimePicker1);
            Controls.Add(lblDate);
            Controls.Add(lblTensionWeight);
            Controls.Add(lblReferenceTemperature);
            Controls.Add(lblCoefficientOfThermalExpansion);
            Controls.Add(lblTapeMaterial);
            Controls.Add(lblNumberOfPoints);
            Controls.Add(lblDepartmentNumber);
            Controls.Add(lblCustomerName);
            Margin = new Padding(2, 1, 2, 1);
            Name = "frmCustomerDetails";
            Text = "Customer Details";
            Load += frmCustomerDetails_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lblCustomerName;
        private Label lblDepartmentNumber;
        private Label lblNumberOfPoints;
        private Label lblTapeMaterial;
        private Label lblCoefficientOfThermalExpansion;
        private Label lblReferenceTemperature;
        private Label lblTensionWeight;
        private Label lblDate;
        private DateTimePicker dateTimePicker1;
        private TextBox txtCustomerName;
        private TextBox txtTensionWeight;
        private TextBox txtReferenceTemperature;
        private TextBox txtNumberOfPoints;
        private TextBox txtDepartmentNumber;
        private ComboBox comboBox1;
        private Button cmdGotoNextScreen;
        private TextBox txtCoefficient;
        private ComboBox comboBox2;
    }
}