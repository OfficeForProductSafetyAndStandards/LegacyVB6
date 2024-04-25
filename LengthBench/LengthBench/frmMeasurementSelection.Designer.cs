namespace LengthBench
{
    partial class frmMeasurementSelection
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
            components = new System.ComponentModel.Container();
            optImperial = new RadioButton();
            optMetric = new RadioButton();
            fraImperialMetric = new GroupBox();
            cmdSetUpLaser = new Button();
            cmdAgilient1339 = new Button();
            fraClass = new GroupBox();
            radioButton3 = new RadioButton();
            radioButton2 = new RadioButton();
            radioButton1 = new RadioButton();
            fraComposite = new GroupBox();
            optNo = new RadioButton();
            optYes = new RadioButton();
            label1 = new Label();
            cmdNextScreen = new Button();
            cmdNextScreenWithoutVol = new Button();
            timer1 = new System.Windows.Forms.Timer(components);
            timer2 = new System.Windows.Forms.Timer(components);
            groupBox1 = new GroupBox();
            radioButton4 = new RadioButton();
            radioButton5 = new RadioButton();
            fraImperialMetric.SuspendLayout();
            fraClass.SuspendLayout();
            fraComposite.SuspendLayout();
            groupBox1.SuspendLayout();
            SuspendLayout();
            // 
            // optImperial
            // 
            optImperial.AutoSize = true;
            optImperial.Location = new Point(63, 25);
            optImperial.Margin = new Padding(2, 1, 2, 1);
            optImperial.Name = "optImperial";
            optImperial.Size = new Size(68, 19);
            optImperial.TabIndex = 0;
            optImperial.Text = "Imperial";
            optImperial.UseVisualStyleBackColor = true;
            optImperial.CheckedChanged += optImperial_CheckedChanged;
            // 
            // optMetric
            // 
            optMetric.AutoSize = true;
            optMetric.Checked = true;
            optMetric.Location = new Point(165, 25);
            optMetric.Margin = new Padding(2, 1, 2, 1);
            optMetric.Name = "optMetric";
            optMetric.Size = new Size(59, 19);
            optMetric.TabIndex = 1;
            optMetric.TabStop = true;
            optMetric.Text = "Metric";
            optMetric.UseVisualStyleBackColor = true;
            optMetric.CheckedChanged += optMetric_CheckedChanged;
            // 
            // fraImperialMetric
            // 
            fraImperialMetric.Controls.Add(optMetric);
            fraImperialMetric.Controls.Add(optImperial);
            fraImperialMetric.Location = new Point(74, 12);
            fraImperialMetric.Margin = new Padding(2, 1, 2, 1);
            fraImperialMetric.Name = "fraImperialMetric";
            fraImperialMetric.Padding = new Padding(2, 1, 2, 1);
            fraImperialMetric.Size = new Size(255, 61);
            fraImperialMetric.TabIndex = 2;
            fraImperialMetric.TabStop = false;
            fraImperialMetric.Text = "Imperial or Metric";
            // 
            // cmdSetUpLaser
            // 
            cmdSetUpLaser.Location = new Point(69, 77);
            cmdSetUpLaser.Margin = new Padding(2, 1, 2, 1);
            cmdSetUpLaser.Name = "cmdSetUpLaser";
            cmdSetUpLaser.Size = new Size(268, 38);
            cmdSetUpLaser.TabIndex = 3;
            cmdSetUpLaser.Text = "Set Up Laser for Metric or Imperial";
            cmdSetUpLaser.UseVisualStyleBackColor = true;
            cmdSetUpLaser.Click += cmdSetUpLaser_Click;
            // 
            // cmdAgilient1339
            // 
            cmdAgilient1339.Location = new Point(11, 124);
            cmdAgilient1339.Margin = new Padding(2, 1, 2, 1);
            cmdAgilient1339.Name = "cmdAgilient1339";
            cmdAgilient1339.Size = new Size(88, 88);
            cmdAgilient1339.TabIndex = 4;
            cmdAgilient1339.Text = "Agilent 1339";
            cmdAgilient1339.UseVisualStyleBackColor = true;
            cmdAgilient1339.Click += cmdAgilient1339_Click;
            // 
            // fraClass
            // 
            fraClass.Controls.Add(radioButton3);
            fraClass.Controls.Add(radioButton2);
            fraClass.Controls.Add(radioButton1);
            fraClass.Location = new Point(234, 124);
            fraClass.Margin = new Padding(2, 1, 2, 1);
            fraClass.Name = "fraClass";
            fraClass.Padding = new Padding(2, 1, 2, 1);
            fraClass.Size = new Size(98, 84);
            fraClass.TabIndex = 5;
            fraClass.TabStop = false;
            fraClass.Text = "Class of Rule";
            fraClass.Enter += fraClass_Enter;
            // 
            // radioButton3
            // 
            radioButton3.AutoSize = true;
            radioButton3.Location = new Point(17, 65);
            radioButton3.Margin = new Padding(2, 1, 2, 1);
            radioButton3.Name = "radioButton3";
            radioButton3.Size = new Size(64, 19);
            radioButton3.TabIndex = 2;
            radioButton3.TabStop = true;
            radioButton3.Text = "Class III";
            radioButton3.UseVisualStyleBackColor = true;
            radioButton3.CheckedChanged += radioButton3_CheckedChanged;
            // 
            // radioButton2
            // 
            radioButton2.AutoSize = true;
            radioButton2.Location = new Point(17, 41);
            radioButton2.Margin = new Padding(2, 1, 2, 1);
            radioButton2.Name = "radioButton2";
            radioButton2.Size = new Size(61, 19);
            radioButton2.TabIndex = 1;
            radioButton2.TabStop = true;
            radioButton2.Text = "Class II";
            radioButton2.UseVisualStyleBackColor = true;
            radioButton2.CheckedChanged += radioButton2_CheckedChanged;
            // 
            // radioButton1
            // 
            radioButton1.AutoSize = true;
            radioButton1.Checked = true;
            radioButton1.Location = new Point(17, 18);
            radioButton1.Margin = new Padding(2, 1, 2, 1);
            radioButton1.Name = "radioButton1";
            radioButton1.Size = new Size(58, 19);
            radioButton1.TabIndex = 0;
            radioButton1.TabStop = true;
            radioButton1.Text = "Class I";
            radioButton1.UseVisualStyleBackColor = true;
            radioButton1.CheckedChanged += radioButton1_CheckedChanged;
            // 
            // fraComposite
            // 
            fraComposite.Controls.Add(optNo);
            fraComposite.Controls.Add(optYes);
            fraComposite.Location = new Point(365, 128);
            fraComposite.Margin = new Padding(2, 1, 2, 1);
            fraComposite.Name = "fraComposite";
            fraComposite.Padding = new Padding(2, 1, 2, 1);
            fraComposite.Size = new Size(85, 84);
            fraComposite.TabIndex = 6;
            fraComposite.TabStop = false;
            fraComposite.Text = "Composite";
            fraComposite.Enter += fraComposite_Enter;
            // 
            // optNo
            // 
            optNo.AutoSize = true;
            optNo.Checked = true;
            optNo.Location = new Point(9, 51);
            optNo.Margin = new Padding(2, 1, 2, 1);
            optNo.Name = "optNo";
            optNo.Size = new Size(41, 19);
            optNo.TabIndex = 4;
            optNo.TabStop = true;
            optNo.Text = "No";
            optNo.UseVisualStyleBackColor = true;
            optNo.CheckedChanged += optNo_CheckedChanged;
            // 
            // optYes
            // 
            optYes.AutoSize = true;
            optYes.Location = new Point(9, 31);
            optYes.Margin = new Padding(2, 1, 2, 1);
            optYes.Name = "optYes";
            optYes.Size = new Size(42, 19);
            optYes.TabIndex = 3;
            optYes.Text = "Yes";
            optYes.UseVisualStyleBackColor = true;
            optYes.CheckedChanged += optYes_CheckedChanged;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(69, 240);
            label1.Margin = new Padding(2, 0, 2, 0);
            label1.Name = "label1";
            label1.Size = new Size(289, 30);
            label1.TabIndex = 7;
            label1.Text = "Make appropriate selections above and select \r\nwhether to take VOL before taking laser measurments";
            // 
            // cmdNextScreen
            // 
            cmdNextScreen.Location = new Point(74, 279);
            cmdNextScreen.Margin = new Padding(2, 1, 2, 1);
            cmdNextScreen.Name = "cmdNextScreen";
            cmdNextScreen.Size = new Size(142, 73);
            cmdNextScreen.TabIndex = 8;
            cmdNextScreen.Text = "Take VOL";
            cmdNextScreen.UseVisualStyleBackColor = true;
            cmdNextScreen.Click += cmdNextScreen_Click;
            // 
            // cmdNextScreenWithoutVol
            // 
            cmdNextScreenWithoutVol.Location = new Point(261, 279);
            cmdNextScreenWithoutVol.Margin = new Padding(2, 1, 2, 1);
            cmdNextScreenWithoutVol.Name = "cmdNextScreenWithoutVol";
            cmdNextScreenWithoutVol.Size = new Size(136, 73);
            cmdNextScreenWithoutVol.TabIndex = 9;
            cmdNextScreenWithoutVol.Text = "No VOL";
            cmdNextScreenWithoutVol.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(radioButton4);
            groupBox1.Controls.Add(radioButton5);
            groupBox1.Location = new Point(120, 128);
            groupBox1.Margin = new Padding(2, 1, 2, 1);
            groupBox1.Name = "groupBox1";
            groupBox1.Padding = new Padding(2, 1, 2, 1);
            groupBox1.Size = new Size(110, 84);
            groupBox1.TabIndex = 7;
            groupBox1.TabStop = false;
            groupBox1.Text = "Select Class        of Calibration";
            // 
            // radioButton4
            // 
            radioButton4.AutoSize = true;
            radioButton4.Location = new Point(8, 61);
            radioButton4.Margin = new Padding(2, 1, 2, 1);
            radioButton4.Name = "radioButton4";
            radioButton4.Size = new Size(62, 19);
            radioButton4.TabIndex = 4;
            radioButton4.Text = "Class B";
            radioButton4.UseVisualStyleBackColor = true;
            // 
            // radioButton5
            // 
            radioButton5.AutoSize = true;
            radioButton5.Checked = true;
            radioButton5.Location = new Point(7, 40);
            radioButton5.Margin = new Padding(2, 1, 2, 1);
            radioButton5.Name = "radioButton5";
            radioButton5.Size = new Size(63, 19);
            radioButton5.TabIndex = 3;
            radioButton5.TabStop = true;
            radioButton5.Text = "Class A";
            radioButton5.UseVisualStyleBackColor = true;
            // 
            // frmMeasurementSelection
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(461, 406);
            Controls.Add(groupBox1);
            Controls.Add(cmdNextScreenWithoutVol);
            Controls.Add(cmdNextScreen);
            Controls.Add(label1);
            Controls.Add(fraComposite);
            Controls.Add(fraClass);
            Controls.Add(cmdAgilient1339);
            Controls.Add(cmdSetUpLaser);
            Controls.Add(fraImperialMetric);
            Margin = new Padding(2, 1, 2, 1);
            Name = "frmMeasurementSelection";
            Text = "Laser System Setup";
            Load += frmMeasurementSelection_Load;
            fraImperialMetric.ResumeLayout(false);
            fraImperialMetric.PerformLayout();
            fraClass.ResumeLayout(false);
            fraClass.PerformLayout();
            fraComposite.ResumeLayout(false);
            fraComposite.PerformLayout();
            groupBox1.ResumeLayout(false);
            groupBox1.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private RadioButton optImperial;
        private RadioButton optMetric;
        private GroupBox fraImperialMetric;
        private Button cmdSetUpLaser;
        private Button cmdAgilient1339;
        private GroupBox fraClass;
        private RadioButton radioButton3;
        private RadioButton radioButton2;
        private RadioButton radioButton1;
        private GroupBox fraComposite;
        private RadioButton optNo;
        private RadioButton optYes;
        private Label label1;
        private Button cmdNextScreen;
        private Button cmdNextScreenWithoutVol;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Timer timer2;
        private GroupBox groupBox1;
        private RadioButton radioButton4;
        private RadioButton radioButton5;
    }
}