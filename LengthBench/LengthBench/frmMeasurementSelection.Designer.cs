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
            fraImperialMetric.SuspendLayout();
            fraClass.SuspendLayout();
            fraComposite.SuspendLayout();
            SuspendLayout();
            // 
            // optImperial
            // 
            optImperial.AutoSize = true;
            optImperial.Location = new Point(117, 53);
            optImperial.Name = "optImperial";
            optImperial.Size = new Size(131, 36);
            optImperial.TabIndex = 0;
            optImperial.TabStop = true;
            optImperial.Text = "Imperial";
            optImperial.UseVisualStyleBackColor = true;
            optImperial.CheckedChanged += optImperial_CheckedChanged;
            // 
            // optMetric
            // 
            optMetric.AutoSize = true;
            optMetric.Location = new Point(307, 53);
            optMetric.Name = "optMetric";
            optMetric.Size = new Size(113, 36);
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
            fraImperialMetric.Location = new Point(138, 26);
            fraImperialMetric.Name = "fraImperialMetric";
            fraImperialMetric.Size = new Size(473, 131);
            fraImperialMetric.TabIndex = 2;
            fraImperialMetric.TabStop = false;
            fraImperialMetric.Text = "Imperial or Metric";
            // 
            // cmdSetUpLaser
            // 
            cmdSetUpLaser.Location = new Point(129, 164);
            cmdSetUpLaser.Name = "cmdSetUpLaser";
            cmdSetUpLaser.Size = new Size(498, 81);
            cmdSetUpLaser.TabIndex = 3;
            cmdSetUpLaser.Text = "Set Up Laser for Metric or Imperial";
            cmdSetUpLaser.UseVisualStyleBackColor = true;
            cmdSetUpLaser.Click += cmdSetUpLaser_Click;
            // 
            // cmdAgilient1339
            // 
            cmdAgilient1339.Location = new Point(129, 265);
            cmdAgilient1339.Name = "cmdAgilient1339";
            cmdAgilient1339.Size = new Size(164, 188);
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
            fraClass.Location = new Point(316, 273);
            fraClass.Name = "fraClass";
            fraClass.Size = new Size(221, 180);
            fraClass.TabIndex = 5;
            fraClass.TabStop = false;
            fraClass.Text = "Class of Tape";
            // 
            // radioButton3
            // 
            radioButton3.AutoSize = true;
            radioButton3.Location = new Point(31, 138);
            radioButton3.Name = "radioButton3";
            radioButton3.Size = new Size(123, 36);
            radioButton3.TabIndex = 2;
            radioButton3.TabStop = true;
            radioButton3.Text = "Class III";
            radioButton3.UseVisualStyleBackColor = true;
            radioButton3.CheckedChanged += radioButton3_CheckedChanged;
            // 
            // radioButton2
            // 
            radioButton2.AutoSize = true;
            radioButton2.Location = new Point(31, 87);
            radioButton2.Name = "radioButton2";
            radioButton2.Size = new Size(117, 36);
            radioButton2.TabIndex = 1;
            radioButton2.TabStop = true;
            radioButton2.Text = "Class II";
            radioButton2.UseVisualStyleBackColor = true;
            radioButton2.CheckedChanged += radioButton2_CheckedChanged;
            // 
            // radioButton1
            // 
            radioButton1.AutoSize = true;
            radioButton1.Location = new Point(31, 38);
            radioButton1.Name = "radioButton1";
            radioButton1.Size = new Size(111, 36);
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
            fraComposite.Location = new Point(558, 284);
            fraComposite.Name = "fraComposite";
            fraComposite.Size = new Size(221, 180);
            fraComposite.TabIndex = 6;
            fraComposite.TabStop = false;
            fraComposite.Text = "Composite";
            fraComposite.Enter += fraComposite_Enter;
            // 
            // optNo
            // 
            optNo.AutoSize = true;
            optNo.Location = new Point(16, 109);
            optNo.Name = "optNo";
            optNo.Size = new Size(77, 36);
            optNo.TabIndex = 4;
            optNo.TabStop = true;
            optNo.Text = "No";
            optNo.UseVisualStyleBackColor = true;
            optNo.CheckedChanged += optNo_CheckedChanged;
            // 
            // optYes
            // 
            optYes.AutoSize = true;
            optYes.Location = new Point(16, 67);
            optYes.Name = "optYes";
            optYes.Size = new Size(79, 36);
            optYes.TabIndex = 3;
            optYes.TabStop = true;
            optYes.Text = "Yes";
            optYes.UseVisualStyleBackColor = true;
            optYes.CheckedChanged += optYes_CheckedChanged;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(129, 512);
            label1.Name = "label1";
            label1.Size = new Size(589, 64);
            label1.TabIndex = 7;
            label1.Text = "Make appropriate selections above and select \r\nwhether to take VOL before taking laser measurments";
            // 
            // cmdNextScreen
            // 
            cmdNextScreen.Location = new Point(138, 596);
            cmdNextScreen.Name = "cmdNextScreen";
            cmdNextScreen.Size = new Size(263, 155);
            cmdNextScreen.TabIndex = 8;
            cmdNextScreen.Text = "Take VOL";
            cmdNextScreen.UseVisualStyleBackColor = true;
            cmdNextScreen.Click += cmdNextScreen_Click;
            // 
            // cmdNextScreenWithoutVol
            // 
            cmdNextScreenWithoutVol.Location = new Point(485, 596);
            cmdNextScreenWithoutVol.Name = "cmdNextScreenWithoutVol";
            cmdNextScreenWithoutVol.Size = new Size(253, 155);
            cmdNextScreenWithoutVol.TabIndex = 9;
            cmdNextScreenWithoutVol.Text = "No VOL";
            cmdNextScreenWithoutVol.UseVisualStyleBackColor = true;
            // 
            // frmMeasurementSelection
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(857, 866);
            Controls.Add(cmdNextScreenWithoutVol);
            Controls.Add(cmdNextScreen);
            Controls.Add(label1);
            Controls.Add(fraComposite);
            Controls.Add(fraClass);
            Controls.Add(cmdAgilient1339);
            Controls.Add(cmdSetUpLaser);
            Controls.Add(fraImperialMetric);
            Name = "frmMeasurementSelection";
            Text = "Laser System Setup";
            Load += frmMeasurementSelection_Load;
            fraImperialMetric.ResumeLayout(false);
            fraImperialMetric.PerformLayout();
            fraClass.ResumeLayout(false);
            fraClass.PerformLayout();
            fraComposite.ResumeLayout(false);
            fraComposite.PerformLayout();
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
    }
}