namespace LengthBench
{
    partial class frmLaserReadings1
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
            label1 = new Label();
            label2 = new Label();
            label3 = new Label();
            cmdLaserReading = new Button();
            cmdResetLaser = new Button();
            label4 = new Label();
            label6 = new Label();
            label7 = new Label();
            txtLaserReading0 = new TextBox();
            txtLaserRun4 = new TextBox();
            txtFinalZeroReading = new TextBox();
            txtLaserRun3 = new TextBox();
            txtLaserRun1 = new TextBox();
            txtLaserRun2 = new TextBox();
            txtLaserRun9 = new TextBox();
            txtLaserRun8 = new TextBox();
            txtLaserRun7 = new TextBox();
            txtLaserRun6 = new TextBox();
            txtLaserRun5 = new TextBox();
            pbBeamStrength = new ProgressBar();
            label8 = new Label();
            timer1 = new System.Windows.Forms.Timer(components);
            timer2 = new System.Windows.Forms.Timer(components);
            label9 = new Label();
            button2 = new Button();
            button3 = new Button();
            timer3 = new System.Windows.Forms.Timer(components);
            timer4 = new System.Windows.Forms.Timer(components);
            timer5 = new System.Windows.Forms.Timer(components);
            timer6 = new System.Windows.Forms.Timer(components);
            timer7 = new System.Windows.Forms.Timer(components);
            timer8 = new System.Windows.Forms.Timer(components);
            groupBox1 = new GroupBox();
            txtLaserReading9 = new TextBox();
            txtLaserReading8 = new TextBox();
            txtLaserReading7 = new TextBox();
            txtLaserReading6 = new TextBox();
            txtLaserReading5 = new TextBox();
            txtLaserReading4 = new TextBox();
            txtLaserReading3 = new TextBox();
            txtLaserReading2 = new TextBox();
            txtLaserReading1 = new TextBox();
            label5 = new Label();
            txtLaserReading10 = new TextBox();
            txtLaserReading11 = new TextBox();
            txtLaserReading12 = new TextBox();
            txtLaserReading13 = new TextBox();
            txtLaserReading14 = new TextBox();
            txtLaserReading15 = new TextBox();
            txtLaserReading16 = new TextBox();
            txtLaserRun10 = new TextBox();
            txtLaserRun11 = new TextBox();
            txtLaserRun12 = new TextBox();
            txtLaserRun13 = new TextBox();
            txtLaserRun14 = new TextBox();
            txtLaserRun15 = new TextBox();
            txtLaserRun16 = new TextBox();
            textBox1 = new TextBox();
            label10 = new Label();
            label11 = new Label();
            groupBox1.SuspendLayout();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 12F);
            label1.ForeColor = Color.Red;
            label1.Location = new Point(27, 11);
            label1.Margin = new Padding(2, 0, 2, 0);
            label1.Name = "label1";
            label1.Size = new Size(324, 21);
            label1.TabIndex = 0;
            label1.Text = "Click on 'Take Laser Readings'/Record to start";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Times New Roman", 24F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label2.Location = new Point(96, 30);
            label2.Margin = new Padding(2, 0, 2, 0);
            label2.Name = "label2";
            label2.Size = new Size(127, 36);
            label2.TabIndex = 1;
            label2.Text = "0.000 00";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(589, 45);
            label3.Margin = new Padding(2, 0, 2, 0);
            label3.Name = "label3";
            label3.Size = new Size(29, 15);
            label3.TabIndex = 2;
            label3.Text = "mm";
            // 
            // cmdLaserReading
            // 
            cmdLaserReading.BackColor = Color.Cyan;
            cmdLaserReading.Location = new Point(227, 71);
            cmdLaserReading.Margin = new Padding(2, 1, 2, 1);
            cmdLaserReading.Name = "cmdLaserReading";
            cmdLaserReading.Size = new Size(183, 33);
            cmdLaserReading.TabIndex = 3;
            cmdLaserReading.Text = "Take Laser Readings";
            cmdLaserReading.UseVisualStyleBackColor = false;
            cmdLaserReading.Visible = false;
            cmdLaserReading.Click += button1_Click;
            // 
            // cmdResetLaser
            // 
            cmdResetLaser.BackColor = Color.MediumSpringGreen;
            cmdResetLaser.Location = new Point(108, 71);
            cmdResetLaser.Margin = new Padding(2, 1, 2, 1);
            cmdResetLaser.Name = "cmdResetLaser";
            cmdResetLaser.Size = new Size(83, 38);
            cmdResetLaser.TabIndex = 4;
            cmdResetLaser.Text = "Reset Laser";
            cmdResetLaser.UseVisualStyleBackColor = false;
            cmdResetLaser.Click += cmdResetLaser_Click_1;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(108, 126);
            label4.Margin = new Padding(2, 0, 2, 0);
            label4.Name = "label4";
            label4.Size = new Size(109, 15);
            label4.TabIndex = 5;
            label4.Text = "Initial Zero Reading";
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Location = new Point(332, 126);
            label6.Margin = new Padding(2, 0, 2, 0);
            label6.Name = "label6";
            label6.Size = new Size(40, 15);
            label6.TabIndex = 7;
            label6.Text = "RUN 2";
            // 
            // label7
            // 
            label7.AutoSize = true;
            label7.Location = new Point(420, 126);
            label7.Margin = new Padding(2, 0, 2, 0);
            label7.Name = "label7";
            label7.Size = new Size(105, 15);
            label7.TabIndex = 8;
            label7.Text = "Final Zero Reading";
            // 
            // txtLaserReading0
            // 
            txtLaserReading0.Location = new Point(127, 149);
            txtLaserReading0.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading0.Name = "txtLaserReading0";
            txtLaserReading0.Size = new Size(86, 23);
            txtLaserReading0.TabIndex = 10;
            // 
            // txtLaserRun4
            // 
            txtLaserRun4.Location = new Point(326, 212);
            txtLaserRun4.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun4.Name = "txtLaserRun4";
            txtLaserRun4.Size = new Size(86, 23);
            txtLaserRun4.TabIndex = 13;
            // 
            // txtFinalZeroReading
            // 
            txtFinalZeroReading.Location = new Point(420, 149);
            txtFinalZeroReading.Margin = new Padding(2, 1, 2, 1);
            txtFinalZeroReading.Name = "txtFinalZeroReading";
            txtFinalZeroReading.Size = new Size(86, 23);
            txtFinalZeroReading.TabIndex = 14;
            txtFinalZeroReading.TextChanged += txtFinalZeroReading_TextChanged;
            // 
            // txtLaserRun3
            // 
            txtLaserRun3.Location = new Point(327, 191);
            txtLaserRun3.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun3.Name = "txtLaserRun3";
            txtLaserRun3.Size = new Size(86, 23);
            txtLaserRun3.TabIndex = 15;
            // 
            // txtLaserRun1
            // 
            txtLaserRun1.Location = new Point(327, 149);
            txtLaserRun1.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun1.Name = "txtLaserRun1";
            txtLaserRun1.Size = new Size(86, 23);
            txtLaserRun1.TabIndex = 16;
            // 
            // txtLaserRun2
            // 
            txtLaserRun2.Location = new Point(327, 170);
            txtLaserRun2.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun2.Name = "txtLaserRun2";
            txtLaserRun2.Size = new Size(86, 23);
            txtLaserRun2.TabIndex = 17;
            // 
            // txtLaserRun9
            // 
            txtLaserRun9.Location = new Point(327, 318);
            txtLaserRun9.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun9.Name = "txtLaserRun9";
            txtLaserRun9.Size = new Size(86, 23);
            txtLaserRun9.TabIndex = 22;
            // 
            // txtLaserRun8
            // 
            txtLaserRun8.Location = new Point(327, 297);
            txtLaserRun8.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun8.Name = "txtLaserRun8";
            txtLaserRun8.Size = new Size(86, 23);
            txtLaserRun8.TabIndex = 23;
            // 
            // txtLaserRun7
            // 
            txtLaserRun7.Location = new Point(327, 276);
            txtLaserRun7.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun7.Name = "txtLaserRun7";
            txtLaserRun7.Size = new Size(86, 23);
            txtLaserRun7.TabIndex = 24;
            // 
            // txtLaserRun6
            // 
            txtLaserRun6.Location = new Point(327, 255);
            txtLaserRun6.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun6.Name = "txtLaserRun6";
            txtLaserRun6.Size = new Size(86, 23);
            txtLaserRun6.TabIndex = 25;
            // 
            // txtLaserRun5
            // 
            txtLaserRun5.Location = new Point(327, 233);
            txtLaserRun5.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun5.Name = "txtLaserRun5";
            txtLaserRun5.Size = new Size(86, 23);
            txtLaserRun5.TabIndex = 26;
            // 
            // pbBeamStrength
            // 
            pbBeamStrength.Location = new Point(50, 537);
            pbBeamStrength.Margin = new Padding(2, 1, 2, 1);
            pbBeamStrength.Name = "pbBeamStrength";
            pbBeamStrength.Size = new Size(610, 55);
            pbBeamStrength.TabIndex = 32;
            // 
            // label8
            // 
            label8.AutoSize = true;
            label8.Location = new Point(11, 557);
            label8.Margin = new Padding(2, 0, 2, 0);
            label8.Name = "label8";
            label8.Size = new Size(17, 15);
            label8.TabIndex = 33;
            label8.Text = "%";
            // 
            // label9
            // 
            label9.AutoSize = true;
            label9.Font = new Font("Segoe UI", 12F);
            label9.ForeColor = Color.Red;
            label9.Location = new Point(452, 182);
            label9.Margin = new Padding(2, 0, 2, 0);
            label9.Name = "label9";
            label9.Size = new Size(146, 21);
            label9.TabIndex = 34;
            label9.Text = "Are the results OK ?";
            // 
            // button2
            // 
            button2.BackColor = Color.Cyan;
            button2.Location = new Point(459, 204);
            button2.Margin = new Padding(2, 1, 2, 1);
            button2.Name = "button2";
            button2.Size = new Size(83, 38);
            button2.TabIndex = 35;
            button2.Text = "Yes";
            button2.UseVisualStyleBackColor = false;
            button2.Visible = false;
            button2.Click += button2_Click_1;
            // 
            // button3
            // 
            button3.BackColor = Color.Cyan;
            button3.Location = new Point(459, 255);
            button3.Margin = new Padding(2, 1, 2, 1);
            button3.Name = "button3";
            button3.Size = new Size(83, 38);
            button3.TabIndex = 36;
            button3.Text = "No";
            button3.UseVisualStyleBackColor = false;
            button3.Visible = false;
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(txtLaserReading9);
            groupBox1.Controls.Add(txtLaserReading8);
            groupBox1.Controls.Add(txtLaserReading7);
            groupBox1.Controls.Add(txtLaserReading6);
            groupBox1.Controls.Add(txtLaserReading5);
            groupBox1.Controls.Add(txtLaserReading4);
            groupBox1.Controls.Add(txtLaserReading3);
            groupBox1.Controls.Add(txtLaserReading2);
            groupBox1.Controls.Add(txtLaserReading1);
            groupBox1.Location = new Point(225, 138);
            groupBox1.Margin = new Padding(2, 1, 2, 1);
            groupBox1.Name = "groupBox1";
            groupBox1.Padding = new Padding(2, 1, 2, 1);
            groupBox1.Size = new Size(88, 206);
            groupBox1.TabIndex = 37;
            groupBox1.TabStop = false;
            // 
            // txtLaserReading9
            // 
            txtLaserReading9.Location = new Point(3, 180);
            txtLaserReading9.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading9.Name = "txtLaserReading9";
            txtLaserReading9.Size = new Size(86, 23);
            txtLaserReading9.TabIndex = 46;
            // 
            // txtLaserReading8
            // 
            txtLaserReading8.Location = new Point(3, 159);
            txtLaserReading8.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading8.Name = "txtLaserReading8";
            txtLaserReading8.Size = new Size(86, 23);
            txtLaserReading8.TabIndex = 45;
            // 
            // txtLaserReading7
            // 
            txtLaserReading7.Location = new Point(3, 138);
            txtLaserReading7.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading7.Name = "txtLaserReading7";
            txtLaserReading7.Size = new Size(86, 23);
            txtLaserReading7.TabIndex = 44;
            // 
            // txtLaserReading6
            // 
            txtLaserReading6.Location = new Point(3, 116);
            txtLaserReading6.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading6.Name = "txtLaserReading6";
            txtLaserReading6.Size = new Size(86, 23);
            txtLaserReading6.TabIndex = 43;
            // 
            // txtLaserReading5
            // 
            txtLaserReading5.Location = new Point(3, 95);
            txtLaserReading5.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading5.Name = "txtLaserReading5";
            txtLaserReading5.Size = new Size(86, 23);
            txtLaserReading5.TabIndex = 42;
            txtLaserReading5.TextChanged += txtLaserReading5_TextChanged;
            // 
            // txtLaserReading4
            // 
            txtLaserReading4.Location = new Point(3, 74);
            txtLaserReading4.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading4.Name = "txtLaserReading4";
            txtLaserReading4.Size = new Size(86, 23);
            txtLaserReading4.TabIndex = 41;
            // 
            // txtLaserReading3
            // 
            txtLaserReading3.Location = new Point(3, 53);
            txtLaserReading3.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading3.Name = "txtLaserReading3";
            txtLaserReading3.Size = new Size(86, 23);
            txtLaserReading3.TabIndex = 40;
            // 
            // txtLaserReading2
            // 
            txtLaserReading2.Location = new Point(3, 32);
            txtLaserReading2.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading2.Name = "txtLaserReading2";
            txtLaserReading2.Size = new Size(86, 23);
            txtLaserReading2.TabIndex = 39;
            txtLaserReading2.Text = " ";
            txtLaserReading2.TextChanged += txtLaserReading2_TextChanged;
            // 
            // txtLaserReading1
            // 
            txtLaserReading1.Location = new Point(3, 11);
            txtLaserReading1.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading1.Name = "txtLaserReading1";
            txtLaserReading1.Size = new Size(86, 23);
            txtLaserReading1.TabIndex = 38;
            txtLaserReading1.TextChanged += textBox1_TextChanged;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(234, 126);
            label5.Margin = new Padding(2, 0, 2, 0);
            label5.Name = "label5";
            label5.Size = new Size(40, 15);
            label5.TabIndex = 6;
            label5.Text = "RUN 1";
            // 
            // txtLaserReading10
            // 
            txtLaserReading10.Location = new Point(228, 343);
            txtLaserReading10.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading10.Name = "txtLaserReading10";
            txtLaserReading10.Size = new Size(86, 23);
            txtLaserReading10.TabIndex = 47;
            // 
            // txtLaserReading11
            // 
            txtLaserReading11.Location = new Point(228, 368);
            txtLaserReading11.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading11.Name = "txtLaserReading11";
            txtLaserReading11.Size = new Size(86, 23);
            txtLaserReading11.TabIndex = 48;
            // 
            // txtLaserReading12
            // 
            txtLaserReading12.Location = new Point(228, 393);
            txtLaserReading12.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading12.Name = "txtLaserReading12";
            txtLaserReading12.Size = new Size(86, 23);
            txtLaserReading12.TabIndex = 49;
            // 
            // txtLaserReading13
            // 
            txtLaserReading13.Location = new Point(227, 418);
            txtLaserReading13.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading13.Name = "txtLaserReading13";
            txtLaserReading13.Size = new Size(86, 23);
            txtLaserReading13.TabIndex = 50;
            // 
            // txtLaserReading14
            // 
            txtLaserReading14.Location = new Point(228, 443);
            txtLaserReading14.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading14.Name = "txtLaserReading14";
            txtLaserReading14.Size = new Size(86, 23);
            txtLaserReading14.TabIndex = 51;
            // 
            // txtLaserReading15
            // 
            txtLaserReading15.Location = new Point(228, 468);
            txtLaserReading15.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading15.Name = "txtLaserReading15";
            txtLaserReading15.Size = new Size(86, 23);
            txtLaserReading15.TabIndex = 52;
            // 
            // txtLaserReading16
            // 
            txtLaserReading16.Location = new Point(227, 493);
            txtLaserReading16.Margin = new Padding(2, 1, 2, 1);
            txtLaserReading16.Name = "txtLaserReading16";
            txtLaserReading16.Size = new Size(86, 23);
            txtLaserReading16.TabIndex = 53;
            // 
            // txtLaserRun10
            // 
            txtLaserRun10.Location = new Point(326, 343);
            txtLaserRun10.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun10.Name = "txtLaserRun10";
            txtLaserRun10.Size = new Size(86, 23);
            txtLaserRun10.TabIndex = 54;
            // 
            // txtLaserRun11
            // 
            txtLaserRun11.Location = new Point(327, 368);
            txtLaserRun11.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun11.Name = "txtLaserRun11";
            txtLaserRun11.Size = new Size(86, 23);
            txtLaserRun11.TabIndex = 55;
            // 
            // txtLaserRun12
            // 
            txtLaserRun12.Location = new Point(326, 393);
            txtLaserRun12.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun12.Name = "txtLaserRun12";
            txtLaserRun12.Size = new Size(86, 23);
            txtLaserRun12.TabIndex = 56;
            // 
            // txtLaserRun13
            // 
            txtLaserRun13.Location = new Point(326, 418);
            txtLaserRun13.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun13.Name = "txtLaserRun13";
            txtLaserRun13.Size = new Size(86, 23);
            txtLaserRun13.TabIndex = 57;
            // 
            // txtLaserRun14
            // 
            txtLaserRun14.Location = new Point(327, 443);
            txtLaserRun14.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun14.Name = "txtLaserRun14";
            txtLaserRun14.Size = new Size(86, 23);
            txtLaserRun14.TabIndex = 58;
            // 
            // txtLaserRun15
            // 
            txtLaserRun15.Location = new Point(326, 468);
            txtLaserRun15.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun15.Name = "txtLaserRun15";
            txtLaserRun15.Size = new Size(86, 23);
            txtLaserRun15.TabIndex = 59;
            // 
            // txtLaserRun16
            // 
            txtLaserRun16.Location = new Point(326, 493);
            txtLaserRun16.Margin = new Padding(2, 1, 2, 1);
            txtLaserRun16.Name = "txtLaserRun16";
            txtLaserRun16.Size = new Size(86, 23);
            txtLaserRun16.TabIndex = 60;
            // 
            // textBox1
            // 
            textBox1.Location = new Point(541, 325);
            textBox1.Margin = new Padding(2, 1, 2, 1);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(137, 23);
            textBox1.TabIndex = 61;
            // 
            // label10
            // 
            label10.AutoSize = true;
            label10.Font = new Font("Segoe UI", 12F);
            label10.ForeColor = Color.Red;
            label10.Location = new Point(458, 297);
            label10.Margin = new Padding(2, 0, 2, 0);
            label10.Name = "label10";
            label10.Size = new Size(102, 21);
            label10.TabIndex = 62;
            label10.Text = "Email Results";
            label10.Click += label10_Click;
            // 
            // label11
            // 
            label11.AutoSize = true;
            label11.Font = new Font("Segoe UI", 12F);
            label11.ForeColor = Color.Red;
            label11.Location = new Point(421, 322);
            label11.Margin = new Padding(2, 0, 2, 0);
            label11.Name = "label11";
            label11.Size = new Size(106, 21);
            label11.TabIndex = 64;
            label11.Text = "Email address";
            label11.Click += label11_Click;
            // 
            // frmLaserReadings1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.Silver;
            ClientSize = new Size(683, 577);
            Controls.Add(label11);
            Controls.Add(label10);
            Controls.Add(textBox1);
            Controls.Add(txtLaserRun16);
            Controls.Add(txtLaserRun15);
            Controls.Add(txtLaserRun14);
            Controls.Add(txtLaserRun13);
            Controls.Add(txtLaserRun12);
            Controls.Add(txtLaserRun11);
            Controls.Add(txtLaserRun10);
            Controls.Add(txtLaserReading16);
            Controls.Add(txtLaserReading15);
            Controls.Add(txtLaserReading14);
            Controls.Add(txtLaserReading13);
            Controls.Add(txtLaserReading12);
            Controls.Add(txtLaserReading11);
            Controls.Add(txtLaserReading10);
            Controls.Add(groupBox1);
            Controls.Add(button3);
            Controls.Add(button2);
            Controls.Add(label9);
            Controls.Add(label8);
            Controls.Add(pbBeamStrength);
            Controls.Add(txtLaserRun5);
            Controls.Add(txtLaserRun6);
            Controls.Add(txtLaserRun7);
            Controls.Add(txtLaserRun8);
            Controls.Add(txtLaserRun9);
            Controls.Add(txtLaserRun2);
            Controls.Add(txtLaserRun1);
            Controls.Add(txtLaserRun3);
            Controls.Add(txtFinalZeroReading);
            Controls.Add(txtLaserRun4);
            Controls.Add(txtLaserReading0);
            Controls.Add(label7);
            Controls.Add(label6);
            Controls.Add(label5);
            Controls.Add(label4);
            Controls.Add(cmdResetLaser);
            Controls.Add(cmdLaserReading);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(label1);
            Margin = new Padding(2, 1, 2, 1);
            Name = "frmLaserReadings1";
            Text = "Laser Class I";
            Load += frmLaserReadings1_Load;
            groupBox1.ResumeLayout(false);
            groupBox1.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label label2;
        private Label label3;
        private Button cmdLaserReading;
        private Button cmdResetLaser;
        private Label label4;
        private Label label6;
        private Label label7;
        private TextBox txtLaserReading0;
        private TextBox txtLaserRun4;
        private TextBox txtFinalZeroReading;
        private TextBox txtLaserRun3;
        private TextBox txtLaserRun1;
        private TextBox txtLaserRun2;
        private TextBox txtLaserRun9;
        private TextBox txtLaserRun8;
        private TextBox txtLaserRun7;
        private TextBox txtLaserRun6;
        private TextBox txtLaserRun5;
        private ProgressBar pbBeamStrength;
        private Label label8;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Timer timer2;
        private Label label9;
        private Button button2;
        private Button button3;
        private System.Windows.Forms.Timer timer3;
        private System.Windows.Forms.Timer timer4;
        private System.Windows.Forms.Timer timer5;
        private System.Windows.Forms.Timer timer6;
        private System.Windows.Forms.Timer timer7;
        private System.Windows.Forms.Timer timer8;
        private GroupBox groupBox1;
        private Label label5;
        private TextBox txtLaserReading1;
        private TextBox txtLaserReading2;
        private TextBox txtLaserReading3;
        private TextBox txtLaserReading4;
        private TextBox txtLaserReading8;
        private TextBox txtLaserReading7;
        private TextBox txtLaserReading6;
        private TextBox txtLaserReading5;
        private TextBox txtLaserReading9;
        private TextBox txtLaserReading10;
        private TextBox txtLaserReading11;
        private TextBox txtLaserReading12;
        private TextBox txtLaserReading13;
        private TextBox txtLaserReading14;
        private TextBox txtLaserReading15;
        private TextBox txtLaserReading16;
        private TextBox txtLaserRun10;
        private TextBox txtLaserRun11;
        private TextBox txtLaserRun12;
        private TextBox txtLaserRun13;
        private TextBox txtLaserRun14;
        private TextBox txtLaserRun15;
        private TextBox txtLaserRun16;
        private TextBox textBox1;
        private Label label10;
        private Label label11;
    }
}