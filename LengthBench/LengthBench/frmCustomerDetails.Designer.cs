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
            SuspendLayout();
            // 
            // lblCustomerName
            // 
            lblCustomerName.AutoSize = true;
            lblCustomerName.Location = new Point(38, 34);
            lblCustomerName.Name = "lblCustomerName";
            lblCustomerName.Size = new Size(188, 32);
            lblCustomerName.TabIndex = 0;
            lblCustomerName.Text = "Customer Name";
            // 
            // lblDepartmentNumber
            // 
            lblDepartmentNumber.AutoSize = true;
            lblDepartmentNumber.Location = new Point(38, 89);
            lblDepartmentNumber.Name = "lblDepartmentNumber";
            lblDepartmentNumber.Size = new Size(237, 32);
            lblDepartmentNumber.TabIndex = 1;
            lblDepartmentNumber.Text = "Department Number";
            // 
            // lblNumberOfPoints
            // 
            lblNumberOfPoints.AutoSize = true;
            lblNumberOfPoints.Location = new Point(47, 141);
            lblNumberOfPoints.Name = "lblNumberOfPoints";
            lblNumberOfPoints.Size = new Size(202, 32);
            lblNumberOfPoints.TabIndex = 2;
            lblNumberOfPoints.Text = "Number of Points";
            // 
            // lblTapeMaterial
            // 
            lblTapeMaterial.AutoSize = true;
            lblTapeMaterial.Location = new Point(47, 187);
            lblTapeMaterial.Name = "lblTapeMaterial";
            lblTapeMaterial.Size = new Size(157, 32);
            lblTapeMaterial.TabIndex = 3;
            lblTapeMaterial.Text = "Tape Material";
            // 
            // lblCoefficientOfThermalExpansion
            // 
            lblCoefficientOfThermalExpansion.AutoSize = true;
            lblCoefficientOfThermalExpansion.Location = new Point(47, 235);
            lblCoefficientOfThermalExpansion.Name = "lblCoefficientOfThermalExpansion";
            lblCoefficientOfThermalExpansion.Size = new Size(367, 32);
            lblCoefficientOfThermalExpansion.TabIndex = 4;
            lblCoefficientOfThermalExpansion.Text = "Coefficient of Thermal Expansion";
            // 
            // lblReferenceTemperature
            // 
            lblReferenceTemperature.AutoSize = true;
            lblReferenceTemperature.Location = new Point(47, 282);
            lblReferenceTemperature.Name = "lblReferenceTemperature";
            lblReferenceTemperature.Size = new Size(262, 32);
            lblReferenceTemperature.TabIndex = 5;
            lblReferenceTemperature.Text = "Reference Temperature";
            // 
            // lblTensionWeight
            // 
            lblTensionWeight.AutoSize = true;
            lblTensionWeight.Location = new Point(47, 334);
            lblTensionWeight.Name = "lblTensionWeight";
            lblTensionWeight.Size = new Size(179, 32);
            lblTensionWeight.TabIndex = 6;
            lblTensionWeight.Text = "Tension Weight";
            // 
            // lblDate
            // 
            lblDate.AutoSize = true;
            lblDate.Location = new Point(47, 387);
            lblDate.Name = "lblDate";
            lblDate.Size = new Size(142, 32);
            lblDate.TabIndex = 8;
            lblDate.Text = "Date of Test";
            lblDate.Click += label9_Click;
            // 
            // dateTimePicker1
            // 
            dateTimePicker1.Location = new Point(630, 387);
            dateTimePicker1.Name = "dateTimePicker1";
            dateTimePicker1.Size = new Size(157, 39);
            dateTimePicker1.TabIndex = 10;
            dateTimePicker1.ValueChanged += dateTimePicker1_ValueChanged;
            // 
            // txtCustomerName
            // 
            txtCustomerName.Location = new Point(630, 27);
            txtCustomerName.Name = "txtCustomerName";
            txtCustomerName.Size = new Size(157, 39);
            txtCustomerName.TabIndex = 11;
            txtCustomerName.TextChanged += txtCustomerName_TextChanged;
            // 
            // txtTensionWeight
            // 
            txtTensionWeight.Location = new Point(631, 331);
            txtTensionWeight.Name = "txtTensionWeight";
            txtTensionWeight.Size = new Size(157, 39);
            txtTensionWeight.TabIndex = 16;
            txtTensionWeight.TextChanged += txtTensionWeight_TextChanged;
            // 
            // txtReferenceTemperature
            // 
            txtReferenceTemperature.Location = new Point(631, 282);
            txtReferenceTemperature.Name = "txtReferenceTemperature";
            txtReferenceTemperature.Size = new Size(157, 39);
            txtReferenceTemperature.TabIndex = 17;
            // 
            // txtNumberOfPoints
            // 
            txtNumberOfPoints.Location = new Point(631, 134);
            txtNumberOfPoints.Name = "txtNumberOfPoints";
            txtNumberOfPoints.Size = new Size(157, 39);
            txtNumberOfPoints.TabIndex = 19;
            txtNumberOfPoints.TextChanged += txtNumberOfPoints_TextChanged;
            // 
            // txtDepartmentNumber
            // 
            txtDepartmentNumber.Location = new Point(631, 82);
            txtDepartmentNumber.Name = "txtDepartmentNumber";
            txtDepartmentNumber.Size = new Size(157, 39);
            txtDepartmentNumber.TabIndex = 20;
            txtDepartmentNumber.TextChanged += txtDepartmentNumber_TextChanged;
            // 
            // comboBox1
            // 
            comboBox1.FormattingEnabled = true;
            comboBox1.Items.AddRange(new object[] { "Aluminium", "Brass", "Bronze", "Invar", "Nickel Steel", "Steel", "Stainless Steel", "Other" });
            comboBox1.Location = new Point(631, 184);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(159, 40);
            comboBox1.TabIndex = 21;
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            // 
            // cmdGotoNextScreen
            // 
            cmdGotoNextScreen.Location = new Point(635, 469);
            cmdGotoNextScreen.Name = "cmdGotoNextScreen";
            cmdGotoNextScreen.Size = new Size(130, 49);
            cmdGotoNextScreen.TabIndex = 22;
            cmdGotoNextScreen.Text = "OK?";
            cmdGotoNextScreen.UseVisualStyleBackColor = true;
            cmdGotoNextScreen.Click += cmdGotoNextScreen_Click;
            // 
            // txtCoefficient
            // 
            txtCoefficient.AcceptsReturn = true;
            txtCoefficient.Location = new Point(631, 230);
            txtCoefficient.Name = "txtCoefficient";
            txtCoefficient.Size = new Size(157, 39);
            txtCoefficient.TabIndex = 23;
            // 
            // frmCustomerDetails
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(861, 534);
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
    }
}