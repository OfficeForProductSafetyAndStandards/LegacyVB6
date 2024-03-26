namespace LengthBench
{
    partial class frmVOLCompensationForm
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
            txtTemperature = new TextBox();
            txtHumidity = new TextBox();
            txtBarometer = new TextBox();
            txtVOL = new TextBox();
            lblTemperature = new Label();
            lblVOL = new Label();
            lblHumidity = new Label();
            lblPressure = new Label();
            cmdClose = new Button();
            cmdRetrurnToMainMenu = new Button();
            cmdEndProgram = new Button();
            cmdPrintout = new Button();
            cmdTinsley = new Button();
            cmdTakeTemperature = new Button();
            cmdHumidityIB5269 = new Button();
            cmdIB5270 = new Button();
            cmdIB5271 = new Button();
            cmdIB5277 = new Button();
            cmdIB5276 = new Button();
            cmdIB5211 = new Button();
            cmdTakeVOL = new Button();
            textBox1 = new TextBox();
            SuspendLayout();
            // 
            // txtTemperature
            // 
            txtTemperature.Location = new Point(11, 78);
            txtTemperature.Margin = new Padding(4, 2, 4, 2);
            txtTemperature.Name = "txtTemperature";
            txtTemperature.Size = new Size(206, 39);
            txtTemperature.TabIndex = 0;
            txtTemperature.TextChanged += txtTemperature_TextChanged;
            // 
            // txtHumidity
            // 
            txtHumidity.Location = new Point(11, 241);
            txtHumidity.Margin = new Padding(4, 2, 4, 2);
            txtHumidity.Name = "txtHumidity";
            txtHumidity.Size = new Size(206, 39);
            txtHumidity.TabIndex = 1;
            txtHumidity.TextChanged += txtHumidity_TextChanged;
            // 
            // txtBarometer
            // 
            txtBarometer.Location = new Point(13, 170);
            txtBarometer.Margin = new Padding(4, 2, 4, 2);
            txtBarometer.Name = "txtBarometer";
            txtBarometer.Size = new Size(206, 39);
            txtBarometer.TabIndex = 2;
            txtBarometer.TextChanged += txtBarometer_TextChanged;
            // 
            // txtVOL
            // 
            txtVOL.Location = new Point(13, 354);
            txtVOL.Margin = new Padding(4, 2, 4, 2);
            txtVOL.Name = "txtVOL";
            txtVOL.Size = new Size(206, 39);
            txtVOL.TabIndex = 3;
            // 
            // lblTemperature
            // 
            lblTemperature.AutoSize = true;
            lblTemperature.Location = new Point(312, 81);
            lblTemperature.Margin = new Padding(4, 0, 4, 0);
            lblTemperature.Name = "lblTemperature";
            lblTemperature.Size = new Size(149, 32);
            lblTemperature.TabIndex = 4;
            lblTemperature.Text = "Temperature";
            lblTemperature.Click += label1_Click;
            // 
            // lblVOL
            // 
            lblVOL.AutoSize = true;
            lblVOL.Location = new Point(321, 361);
            lblVOL.Margin = new Padding(4, 0, 4, 0);
            lblVOL.Name = "lblVOL";
            lblVOL.Size = new Size(57, 32);
            lblVOL.TabIndex = 6;
            lblVOL.Text = "VOL";
            lblVOL.Click += label2_Click;
            // 
            // lblHumidity
            // 
            lblHumidity.AutoSize = true;
            lblHumidity.Location = new Point(312, 255);
            lblHumidity.Margin = new Padding(4, 0, 4, 0);
            lblHumidity.Name = "lblHumidity";
            lblHumidity.Size = new Size(112, 32);
            lblHumidity.TabIndex = 7;
            lblHumidity.Text = "Humidity";
            // 
            // lblPressure
            // 
            lblPressure.AutoSize = true;
            lblPressure.Location = new Point(312, 173);
            lblPressure.Margin = new Padding(4, 0, 4, 0);
            lblPressure.Name = "lblPressure";
            lblPressure.Size = new Size(103, 32);
            lblPressure.TabIndex = 8;
            lblPressure.Text = "Pressure";
            lblPressure.Click += label4_Click;
            // 
            // cmdClose
            // 
            cmdClose.Enabled = false;
            cmdClose.Location = new Point(41, 425);
            cmdClose.Margin = new Padding(4, 2, 4, 2);
            cmdClose.Name = "cmdClose";
            cmdClose.Size = new Size(232, 128);
            cmdClose.TabIndex = 9;
            cmdClose.Text = "Continue to Customer Details";
            cmdClose.UseVisualStyleBackColor = true;
            cmdClose.Click += cmdClose_Click;
            // 
            // cmdRetrurnToMainMenu
            // 
            cmdRetrurnToMainMenu.Location = new Point(344, 425);
            cmdRetrurnToMainMenu.Margin = new Padding(4, 2, 4, 2);
            cmdRetrurnToMainMenu.Name = "cmdRetrurnToMainMenu";
            cmdRetrurnToMainMenu.Size = new Size(232, 128);
            cmdRetrurnToMainMenu.TabIndex = 10;
            cmdRetrurnToMainMenu.Text = "Return to Main Menu";
            cmdRetrurnToMainMenu.UseVisualStyleBackColor = true;
            cmdRetrurnToMainMenu.Click += cmdRetrurnToMainMenu_Click;
            // 
            // cmdEndProgram
            // 
            cmdEndProgram.Location = new Point(669, 425);
            cmdEndProgram.Margin = new Padding(4, 2, 4, 2);
            cmdEndProgram.Name = "cmdEndProgram";
            cmdEndProgram.Size = new Size(232, 128);
            cmdEndProgram.TabIndex = 11;
            cmdEndProgram.Text = "End Program";
            cmdEndProgram.UseVisualStyleBackColor = true;
            // 
            // cmdPrintout
            // 
            cmdPrintout.Location = new Point(947, 425);
            cmdPrintout.Margin = new Padding(4, 2, 4, 2);
            cmdPrintout.Name = "cmdPrintout";
            cmdPrintout.Size = new Size(232, 128);
            cmdPrintout.TabIndex = 12;
            cmdPrintout.Text = "Printout VOL";
            cmdPrintout.UseVisualStyleBackColor = true;
            cmdPrintout.Click += button4_Click;
            // 
            // cmdTinsley
            // 
            cmdTinsley.Location = new Point(505, 36);
            cmdTinsley.Margin = new Padding(4, 2, 4, 2);
            cmdTinsley.Name = "cmdTinsley";
            cmdTinsley.Size = new Size(139, 77);
            cmdTinsley.TabIndex = 13;
            cmdTinsley.Text = "Tinsley";
            cmdTinsley.UseVisualStyleBackColor = true;
            cmdTinsley.Click += cmdTinsley_Click;
            // 
            // cmdTakeTemperature
            // 
            cmdTakeTemperature.Location = new Point(693, 36);
            cmdTakeTemperature.Margin = new Padding(4, 2, 4, 2);
            cmdTakeTemperature.Name = "cmdTakeTemperature";
            cmdTakeTemperature.Size = new Size(139, 77);
            cmdTakeTemperature.TabIndex = 14;
            cmdTakeTemperature.Text = "Edales";
            cmdTakeTemperature.UseVisualStyleBackColor = true;
            cmdTakeTemperature.Click += cmdTakeTemperature_Click;
            // 
            // cmdHumidityIB5269
            // 
            cmdHumidityIB5269.Location = new Point(505, 241);
            cmdHumidityIB5269.Margin = new Padding(4, 2, 4, 2);
            cmdHumidityIB5269.Name = "cmdHumidityIB5269";
            cmdHumidityIB5269.Size = new Size(139, 77);
            cmdHumidityIB5269.TabIndex = 15;
            cmdHumidityIB5269.Text = "IB5269";
            cmdHumidityIB5269.UseVisualStyleBackColor = true;
            cmdHumidityIB5269.Click += button1_Click;
            // 
            // cmdIB5270
            // 
            cmdIB5270.Location = new Point(693, 241);
            cmdIB5270.Margin = new Padding(4, 2, 4, 2);
            cmdIB5270.Name = "cmdIB5270";
            cmdIB5270.Size = new Size(139, 77);
            cmdIB5270.TabIndex = 16;
            cmdIB5270.Text = "IB5270";
            cmdIB5270.UseVisualStyleBackColor = true;
            cmdIB5270.Click += cmdIB5270_Click;
            // 
            // cmdIB5271
            // 
            cmdIB5271.Location = new Point(862, 233);
            cmdIB5271.Margin = new Padding(4, 2, 4, 2);
            cmdIB5271.Name = "cmdIB5271";
            cmdIB5271.Size = new Size(139, 77);
            cmdIB5271.TabIndex = 17;
            cmdIB5271.Text = "IB5271";
            cmdIB5271.UseVisualStyleBackColor = true;
            cmdIB5271.Click += cmdIB5271_Click;
            // 
            // cmdIB5277
            // 
            cmdIB5277.Location = new Point(862, 137);
            cmdIB5277.Margin = new Padding(4, 2, 4, 2);
            cmdIB5277.Name = "cmdIB5277";
            cmdIB5277.Size = new Size(139, 77);
            cmdIB5277.TabIndex = 18;
            cmdIB5277.Text = "IB5277";
            cmdIB5277.UseVisualStyleBackColor = true;
            cmdIB5277.Click += button4_Click_1;
            // 
            // cmdIB5276
            // 
            cmdIB5276.Location = new Point(693, 137);
            cmdIB5276.Margin = new Padding(4, 2, 4, 2);
            cmdIB5276.Name = "cmdIB5276";
            cmdIB5276.Size = new Size(139, 77);
            cmdIB5276.TabIndex = 19;
            cmdIB5276.Text = "IB5276";
            cmdIB5276.UseVisualStyleBackColor = true;
            cmdIB5276.Click += button5_Click;
            // 
            // cmdIB5211
            // 
            cmdIB5211.Location = new Point(505, 137);
            cmdIB5211.Margin = new Padding(4, 2, 4, 2);
            cmdIB5211.Name = "cmdIB5211";
            cmdIB5211.Size = new Size(139, 77);
            cmdIB5211.TabIndex = 20;
            cmdIB5211.Text = "IB5211";
            cmdIB5211.UseVisualStyleBackColor = true;
            cmdIB5211.Click += cmdIB5211_Click;
            // 
            // cmdTakeVOL
            // 
            cmdTakeVOL.Location = new Point(505, 341);
            cmdTakeVOL.Margin = new Padding(4, 2, 4, 2);
            cmdTakeVOL.Name = "cmdTakeVOL";
            cmdTakeVOL.Size = new Size(139, 77);
            cmdTakeVOL.TabIndex = 21;
            cmdTakeVOL.Text = "Take VOL";
            cmdTakeVOL.UseVisualStyleBackColor = true;
            cmdTakeVOL.Click += cmdTakeVOL_Click;
            // 
            // textBox1
            // 
            textBox1.Location = new Point(693, 361);
            textBox1.Margin = new Padding(4, 2, 4, 2);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(140, 39);
            textBox1.TabIndex = 22;
            // 
            // frmVOLCompensationForm
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1333, 642);
            Controls.Add(textBox1);
            Controls.Add(cmdTakeVOL);
            Controls.Add(cmdIB5211);
            Controls.Add(cmdIB5276);
            Controls.Add(cmdIB5277);
            Controls.Add(cmdIB5271);
            Controls.Add(cmdIB5270);
            Controls.Add(cmdHumidityIB5269);
            Controls.Add(cmdTakeTemperature);
            Controls.Add(cmdTinsley);
            Controls.Add(cmdPrintout);
            Controls.Add(cmdEndProgram);
            Controls.Add(cmdRetrurnToMainMenu);
            Controls.Add(cmdClose);
            Controls.Add(lblPressure);
            Controls.Add(lblHumidity);
            Controls.Add(lblVOL);
            Controls.Add(lblTemperature);
            Controls.Add(txtVOL);
            Controls.Add(txtBarometer);
            Controls.Add(txtHumidity);
            Controls.Add(txtTemperature);
            Margin = new Padding(4, 2, 4, 2);
            Name = "frmVOLCompensationForm";
            Text = "VOL Compensation Form";
            Load += frmVOLCompensationForm_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox txtTemperature;
        private TextBox txtHumidity;
        private TextBox txtBarometer;
        private TextBox txtVOL;
        private Label lblTemperature;
        private Label lblVOL;
        private Label lblHumidity;
        private Label lblPressure;
        private Button cmdClose;
        private Button cmdRetrurnToMainMenu;
        private Button cmdEndProgram;
        private Button cmdPrintout;
        private Button cmdTinsley;
        private Button cmdTakeTemperature;
        private Button cmdHumidityIB5269;
        private Button cmdIB5270;
        private Button cmdIB5271;
        private Button cmdIB5277;
        private Button cmdIB5276;
        private Button cmdIB5211;
        private Button cmdTakeVOL;
        private TextBox textBox1;
    }
}