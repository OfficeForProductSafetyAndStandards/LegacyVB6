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
            button4 = new Button();
            button5 = new Button();
            cmdIB5211 = new Button();
            cmdTakeVOL = new Button();
            textBox1 = new TextBox();
            SuspendLayout();
            // 
            // txtTemperature
            // 
            txtTemperature.Location = new Point(6, 22);
            txtTemperature.Margin = new Padding(2, 1, 2, 1);
            txtTemperature.Name = "txtTemperature";
            txtTemperature.Size = new Size(113, 23);
            txtTemperature.TabIndex = 0;
            txtTemperature.TextChanged += txtTemperature_TextChanged;
            // 
            // txtHumidity
            // 
            txtHumidity.Location = new Point(6, 90);
            txtHumidity.Margin = new Padding(2, 1, 2, 1);
            txtHumidity.Name = "txtHumidity";
            txtHumidity.Size = new Size(113, 23);
            txtHumidity.TabIndex = 1;
            txtHumidity.TextChanged += txtHumidity_TextChanged;
            // 
            // txtBarometer
            // 
            txtBarometer.Location = new Point(6, 52);
            txtBarometer.Margin = new Padding(2, 1, 2, 1);
            txtBarometer.Name = "txtBarometer";
            txtBarometer.Size = new Size(113, 23);
            txtBarometer.TabIndex = 2;
            txtBarometer.TextChanged += txtBarometer_TextChanged;
            // 
            // txtVOL
            // 
            txtVOL.Location = new Point(6, 127);
            txtVOL.Margin = new Padding(2, 1, 2, 1);
            txtVOL.Name = "txtVOL";
            txtVOL.Size = new Size(141, 23);
            txtVOL.TabIndex = 3;
            // 
            // lblTemperature
            // 
            lblTemperature.AutoSize = true;
            lblTemperature.Location = new Point(153, 26);
            lblTemperature.Margin = new Padding(2, 0, 2, 0);
            lblTemperature.Name = "lblTemperature";
            lblTemperature.Size = new Size(73, 15);
            lblTemperature.TabIndex = 4;
            lblTemperature.Text = "Temperature";
            lblTemperature.Click += label1_Click;
            // 
            // lblVOL
            // 
            lblVOL.AutoSize = true;
            lblVOL.Location = new Point(167, 130);
            lblVOL.Margin = new Padding(2, 0, 2, 0);
            lblVOL.Name = "lblVOL";
            lblVOL.Size = new Size(29, 15);
            lblVOL.TabIndex = 6;
            lblVOL.Text = "VOL";
            lblVOL.Click += label2_Click;
            // 
            // lblHumidity
            // 
            lblHumidity.AutoSize = true;
            lblHumidity.Location = new Point(160, 90);
            lblHumidity.Margin = new Padding(2, 0, 2, 0);
            lblHumidity.Name = "lblHumidity";
            lblHumidity.Size = new Size(57, 15);
            lblHumidity.TabIndex = 7;
            lblHumidity.Text = "Humidity";
            // 
            // lblPressure
            // 
            lblPressure.AutoSize = true;
            lblPressure.Location = new Point(153, 56);
            lblPressure.Margin = new Padding(2, 0, 2, 0);
            lblPressure.Name = "lblPressure";
            lblPressure.Size = new Size(51, 15);
            lblPressure.TabIndex = 8;
            lblPressure.Text = "Pressure";
            lblPressure.Click += label4_Click;
            // 
            // cmdClose
            // 
            cmdClose.Location = new Point(22, 199);
            cmdClose.Margin = new Padding(2, 1, 2, 1);
            cmdClose.Name = "cmdClose";
            cmdClose.Size = new Size(125, 60);
            cmdClose.TabIndex = 9;
            cmdClose.Text = "Continue to Customer Details";
            cmdClose.UseVisualStyleBackColor = true;
            cmdClose.Click += cmdClose_Click;
            // 
            // cmdRetrurnToMainMenu
            // 
            cmdRetrurnToMainMenu.Location = new Point(185, 199);
            cmdRetrurnToMainMenu.Margin = new Padding(2, 1, 2, 1);
            cmdRetrurnToMainMenu.Name = "cmdRetrurnToMainMenu";
            cmdRetrurnToMainMenu.Size = new Size(125, 60);
            cmdRetrurnToMainMenu.TabIndex = 10;
            cmdRetrurnToMainMenu.Text = "Return to Main Menu";
            cmdRetrurnToMainMenu.UseVisualStyleBackColor = true;
            cmdRetrurnToMainMenu.Click += cmdRetrurnToMainMenu_Click;
            // 
            // cmdEndProgram
            // 
            cmdEndProgram.Location = new Point(360, 199);
            cmdEndProgram.Margin = new Padding(2, 1, 2, 1);
            cmdEndProgram.Name = "cmdEndProgram";
            cmdEndProgram.Size = new Size(125, 60);
            cmdEndProgram.TabIndex = 11;
            cmdEndProgram.Text = "End Program";
            cmdEndProgram.UseVisualStyleBackColor = true;
            // 
            // cmdPrintout
            // 
            cmdPrintout.Location = new Point(510, 199);
            cmdPrintout.Margin = new Padding(2, 1, 2, 1);
            cmdPrintout.Name = "cmdPrintout";
            cmdPrintout.Size = new Size(125, 60);
            cmdPrintout.TabIndex = 12;
            cmdPrintout.Text = "Printout VOL";
            cmdPrintout.UseVisualStyleBackColor = true;
            cmdPrintout.Click += button4_Click;
            // 
            // cmdTinsley
            // 
            cmdTinsley.Location = new Point(272, 17);
            cmdTinsley.Margin = new Padding(2, 1, 2, 1);
            cmdTinsley.Name = "cmdTinsley";
            cmdTinsley.Size = new Size(75, 36);
            cmdTinsley.TabIndex = 13;
            cmdTinsley.Text = "Tinsley";
            cmdTinsley.UseVisualStyleBackColor = true;
            // 
            // cmdTakeTemperature
            // 
            cmdTakeTemperature.Location = new Point(373, 17);
            cmdTakeTemperature.Margin = new Padding(2, 1, 2, 1);
            cmdTakeTemperature.Name = "cmdTakeTemperature";
            cmdTakeTemperature.Size = new Size(75, 36);
            cmdTakeTemperature.TabIndex = 14;
            cmdTakeTemperature.Text = "Edales";
            cmdTakeTemperature.UseVisualStyleBackColor = true;
            // 
            // cmdHumidityIB5269
            // 
            cmdHumidityIB5269.Location = new Point(272, 113);
            cmdHumidityIB5269.Margin = new Padding(2, 1, 2, 1);
            cmdHumidityIB5269.Name = "cmdHumidityIB5269";
            cmdHumidityIB5269.Size = new Size(75, 36);
            cmdHumidityIB5269.TabIndex = 15;
            cmdHumidityIB5269.Text = "IB5269";
            cmdHumidityIB5269.UseVisualStyleBackColor = true;
            cmdHumidityIB5269.Click += button1_Click;
            // 
            // cmdIB5270
            // 
            cmdIB5270.Location = new Point(373, 113);
            cmdIB5270.Margin = new Padding(2, 1, 2, 1);
            cmdIB5270.Name = "cmdIB5270";
            cmdIB5270.Size = new Size(75, 36);
            cmdIB5270.TabIndex = 16;
            cmdIB5270.Text = "IB5270";
            cmdIB5270.UseVisualStyleBackColor = true;
            // 
            // cmdIB5271
            // 
            cmdIB5271.Location = new Point(464, 109);
            cmdIB5271.Margin = new Padding(2, 1, 2, 1);
            cmdIB5271.Name = "cmdIB5271";
            cmdIB5271.Size = new Size(75, 36);
            cmdIB5271.TabIndex = 17;
            cmdIB5271.Text = "IB5271";
            cmdIB5271.UseVisualStyleBackColor = true;
            // 
            // button4
            // 
            button4.Location = new Point(464, 64);
            button4.Margin = new Padding(2, 1, 2, 1);
            button4.Name = "button4";
            button4.Size = new Size(75, 36);
            button4.TabIndex = 18;
            button4.Text = "IB5277";
            button4.UseVisualStyleBackColor = true;
            // 
            // button5
            // 
            button5.Location = new Point(373, 64);
            button5.Margin = new Padding(2, 1, 2, 1);
            button5.Name = "button5";
            button5.Size = new Size(75, 36);
            button5.TabIndex = 19;
            button5.Text = "IB5276";
            button5.UseVisualStyleBackColor = true;
            // 
            // cmdIB5211
            // 
            cmdIB5211.Location = new Point(272, 64);
            cmdIB5211.Margin = new Padding(2, 1, 2, 1);
            cmdIB5211.Name = "cmdIB5211";
            cmdIB5211.Size = new Size(75, 36);
            cmdIB5211.TabIndex = 20;
            cmdIB5211.Text = "IB5211";
            cmdIB5211.UseVisualStyleBackColor = true;
            // 
            // cmdTakeVOL
            // 
            cmdTakeVOL.Location = new Point(272, 160);
            cmdTakeVOL.Margin = new Padding(2, 1, 2, 1);
            cmdTakeVOL.Name = "cmdTakeVOL";
            cmdTakeVOL.Size = new Size(75, 36);
            cmdTakeVOL.TabIndex = 21;
            cmdTakeVOL.Text = "Take VOL";
            cmdTakeVOL.UseVisualStyleBackColor = true;
            cmdTakeVOL.Click += cmdTakeVOL_Click;
            // 
            // textBox1
            // 
            textBox1.Location = new Point(373, 169);
            textBox1.Margin = new Padding(2, 1, 2, 1);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(77, 23);
            textBox1.TabIndex = 22;
            // 
            // frmVOLCompensationForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(718, 301);
            Controls.Add(textBox1);
            Controls.Add(cmdTakeVOL);
            Controls.Add(cmdIB5211);
            Controls.Add(button5);
            Controls.Add(button4);
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
            Margin = new Padding(2, 1, 2, 1);
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
        private Button button4;
        private Button button5;
        private Button cmdIB5211;
        private Button cmdTakeVOL;
        private TextBox textBox1;
    }
}