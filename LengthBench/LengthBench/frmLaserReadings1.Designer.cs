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
            label1.Location = new Point(50, 23);
            label1.Margin = new Padding(4, 0, 4, 0);
            label1.Name = "label1";
            label1.Size = new Size(660, 45);
            label1.TabIndex = 0;
            label1.Text = "Click on 'Take Laser Readings'/Record to start";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Times New Roman", 24F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label2.Location = new Point(178, 64);
            label2.Margin = new Padding(4, 0, 4, 0);
            label2.Name = "label2";
            label2.Size = new Size(256, 73);
            label2.TabIndex = 1;
            label2.Text = "0.000 00";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(1093, 97);
            label3.Margin = new Padding(4, 0, 4, 0);
            label3.Name = "label3";
            label3.Size = new Size(56, 32);
            label3.TabIndex = 2;
            label3.Text = "mm";
            // 
            // cmdLaserReading
            // 
            cmdLaserReading.BackColor = Color.Cyan;
            cmdLaserReading.Location = new Point(422, 151);
            cmdLaserReading.Margin = new Padding(4, 2, 4, 2);
            cmdLaserReading.Name = "cmdLaserReading";
            cmdLaserReading.Size = new Size(340, 70);
            cmdLaserReading.TabIndex = 3;
            cmdLaserReading.Text = "Take Laser Readings";
            cmdLaserReading.UseVisualStyleBackColor = false;
            cmdLaserReading.Visible = false;
            cmdLaserReading.Click += button1_Click;
            // 
            // cmdResetLaser
            // 
            cmdResetLaser.BackColor = Color.MediumSpringGreen;
            cmdResetLaser.Location = new Point(201, 151);
            cmdResetLaser.Margin = new Padding(4, 2, 4, 2);
            cmdResetLaser.Name = "cmdResetLaser";
            cmdResetLaser.Size = new Size(154, 81);
            cmdResetLaser.TabIndex = 4;
            cmdResetLaser.Text = "Reset Laser";
            cmdResetLaser.UseVisualStyleBackColor = false;
            cmdResetLaser.Click += cmdResetLaser_Click_1;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(201, 269);
            label4.Margin = new Padding(4, 0, 4, 0);
            label4.Name = "label4";
            label4.Size = new Size(221, 32);
            label4.TabIndex = 5;
            label4.Text = "Initial Zero Reading";
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Location = new Point(617, 269);
            label6.Margin = new Padding(4, 0, 4, 0);
            label6.Name = "label6";
            label6.Size = new Size(82, 32);
            label6.TabIndex = 7;
            label6.Text = "RUN 2";
            // 
            // label7
            // 
            label7.AutoSize = true;
            label7.Location = new Point(780, 269);
            label7.Margin = new Padding(4, 0, 4, 0);
            label7.Name = "label7";
            label7.Size = new Size(213, 32);
            label7.TabIndex = 8;
            label7.Text = "Final Zero Reading";
            // 
            // txtLaserReading0
            // 
            txtLaserReading0.Location = new Point(236, 318);
            txtLaserReading0.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading0.Name = "txtLaserReading0";
            txtLaserReading0.Size = new Size(156, 39);
            txtLaserReading0.TabIndex = 10;
            // 
            // txtLaserRun4
            // 
            txtLaserRun4.Location = new Point(605, 452);
            txtLaserRun4.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun4.Name = "txtLaserRun4";
            txtLaserRun4.Size = new Size(156, 39);
            txtLaserRun4.TabIndex = 13;
            // 
            // txtFinalZeroReading
            // 
            txtFinalZeroReading.Location = new Point(780, 318);
            txtFinalZeroReading.Margin = new Padding(4, 2, 4, 2);
            txtFinalZeroReading.Name = "txtFinalZeroReading";
            txtFinalZeroReading.Size = new Size(156, 39);
            txtFinalZeroReading.TabIndex = 14;
            txtFinalZeroReading.TextChanged += txtFinalZeroReading_TextChanged;
            // 
            // txtLaserRun3
            // 
            txtLaserRun3.Location = new Point(607, 407);
            txtLaserRun3.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun3.Name = "txtLaserRun3";
            txtLaserRun3.Size = new Size(156, 39);
            txtLaserRun3.TabIndex = 15;
            // 
            // txtLaserRun1
            // 
            txtLaserRun1.Location = new Point(607, 318);
            txtLaserRun1.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun1.Name = "txtLaserRun1";
            txtLaserRun1.Size = new Size(156, 39);
            txtLaserRun1.TabIndex = 16;
            // 
            // txtLaserRun2
            // 
            txtLaserRun2.Location = new Point(607, 363);
            txtLaserRun2.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun2.Name = "txtLaserRun2";
            txtLaserRun2.Size = new Size(156, 39);
            txtLaserRun2.TabIndex = 17;
            // 
            // txtLaserRun9
            // 
            txtLaserRun9.Location = new Point(607, 678);
            txtLaserRun9.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun9.Name = "txtLaserRun9";
            txtLaserRun9.Size = new Size(156, 39);
            txtLaserRun9.TabIndex = 22;
            // 
            // txtLaserRun8
            // 
            txtLaserRun8.Location = new Point(607, 634);
            txtLaserRun8.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun8.Name = "txtLaserRun8";
            txtLaserRun8.Size = new Size(156, 39);
            txtLaserRun8.TabIndex = 23;
            // 
            // txtLaserRun7
            // 
            txtLaserRun7.Location = new Point(607, 589);
            txtLaserRun7.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun7.Name = "txtLaserRun7";
            txtLaserRun7.Size = new Size(156, 39);
            txtLaserRun7.TabIndex = 24;
            // 
            // txtLaserRun6
            // 
            txtLaserRun6.Location = new Point(607, 544);
            txtLaserRun6.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun6.Name = "txtLaserRun6";
            txtLaserRun6.Size = new Size(156, 39);
            txtLaserRun6.TabIndex = 25;
            // 
            // txtLaserRun5
            // 
            txtLaserRun5.Location = new Point(607, 497);
            txtLaserRun5.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun5.Name = "txtLaserRun5";
            txtLaserRun5.Size = new Size(156, 39);
            txtLaserRun5.TabIndex = 26;
            // 
            // pbBeamStrength
            // 
            pbBeamStrength.Location = new Point(93, 1146);
            pbBeamStrength.Margin = new Padding(4, 2, 4, 2);
            pbBeamStrength.Name = "pbBeamStrength";
            pbBeamStrength.Size = new Size(1133, 117);
            pbBeamStrength.TabIndex = 32;
            // 
            // label8
            // 
            label8.AutoSize = true;
            label8.Location = new Point(20, 1188);
            label8.Margin = new Padding(4, 0, 4, 0);
            label8.Name = "label8";
            label8.Size = new Size(34, 32);
            label8.TabIndex = 33;
            label8.Text = "%";
            // 
            // label9
            // 
            label9.AutoSize = true;
            label9.Font = new Font("Segoe UI", 12F);
            label9.ForeColor = Color.Red;
            label9.Location = new Point(839, 388);
            label9.Margin = new Padding(4, 0, 4, 0);
            label9.Name = "label9";
            label9.Size = new Size(301, 45);
            label9.TabIndex = 34;
            label9.Text = "Are the results OK ?";
            // 
            // button2
            // 
            button2.BackColor = Color.Cyan;
            button2.Location = new Point(852, 435);
            button2.Margin = new Padding(4, 2, 4, 2);
            button2.Name = "button2";
            button2.Size = new Size(154, 81);
            button2.TabIndex = 35;
            button2.Text = "Yes";
            button2.UseVisualStyleBackColor = false;
            button2.Visible = false;
            button2.Click += button2_Click_1;
            // 
            // button3
            // 
            button3.BackColor = Color.Cyan;
            button3.Location = new Point(852, 544);
            button3.Margin = new Padding(4, 2, 4, 2);
            button3.Name = "button3";
            button3.Size = new Size(154, 81);
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
            groupBox1.Location = new Point(418, 294);
            groupBox1.Margin = new Padding(4, 2, 4, 2);
            groupBox1.Name = "groupBox1";
            groupBox1.Padding = new Padding(4, 2, 4, 2);
            groupBox1.Size = new Size(163, 439);
            groupBox1.TabIndex = 37;
            groupBox1.TabStop = false;
            // 
            // txtLaserReading9
            // 
            txtLaserReading9.Location = new Point(6, 384);
            txtLaserReading9.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading9.Name = "txtLaserReading9";
            txtLaserReading9.Size = new Size(156, 39);
            txtLaserReading9.TabIndex = 46;
            // 
            // txtLaserReading8
            // 
            txtLaserReading8.Location = new Point(6, 339);
            txtLaserReading8.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading8.Name = "txtLaserReading8";
            txtLaserReading8.Size = new Size(156, 39);
            txtLaserReading8.TabIndex = 45;
            // 
            // txtLaserReading7
            // 
            txtLaserReading7.Location = new Point(6, 294);
            txtLaserReading7.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading7.Name = "txtLaserReading7";
            txtLaserReading7.Size = new Size(156, 39);
            txtLaserReading7.TabIndex = 44;
            // 
            // txtLaserReading6
            // 
            txtLaserReading6.Location = new Point(6, 247);
            txtLaserReading6.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading6.Name = "txtLaserReading6";
            txtLaserReading6.Size = new Size(156, 39);
            txtLaserReading6.TabIndex = 43;
            // 
            // txtLaserReading5
            // 
            txtLaserReading5.Location = new Point(6, 203);
            txtLaserReading5.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading5.Name = "txtLaserReading5";
            txtLaserReading5.Size = new Size(156, 39);
            txtLaserReading5.TabIndex = 42;
            txtLaserReading5.TextChanged += txtLaserReading5_TextChanged;
            // 
            // txtLaserReading4
            // 
            txtLaserReading4.Location = new Point(6, 158);
            txtLaserReading4.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading4.Name = "txtLaserReading4";
            txtLaserReading4.Size = new Size(156, 39);
            txtLaserReading4.TabIndex = 41;
            // 
            // txtLaserReading3
            // 
            txtLaserReading3.Location = new Point(6, 113);
            txtLaserReading3.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading3.Name = "txtLaserReading3";
            txtLaserReading3.Size = new Size(156, 39);
            txtLaserReading3.TabIndex = 40;
            // 
            // txtLaserReading2
            // 
            txtLaserReading2.Location = new Point(6, 68);
            txtLaserReading2.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading2.Name = "txtLaserReading2";
            txtLaserReading2.Size = new Size(156, 39);
            txtLaserReading2.TabIndex = 39;
            txtLaserReading2.TextChanged += txtLaserReading2_TextChanged;
            // 
            // txtLaserReading1
            // 
            txtLaserReading1.Location = new Point(6, 23);
            txtLaserReading1.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading1.Name = "txtLaserReading1";
            txtLaserReading1.Size = new Size(156, 39);
            txtLaserReading1.TabIndex = 38;
            txtLaserReading1.TextChanged += textBox1_TextChanged;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(435, 269);
            label5.Margin = new Padding(4, 0, 4, 0);
            label5.Name = "label5";
            label5.Size = new Size(82, 32);
            label5.TabIndex = 6;
            label5.Text = "RUN 1";
            // 
            // txtLaserReading10
            // 
            txtLaserReading10.Location = new Point(423, 732);
            txtLaserReading10.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading10.Name = "txtLaserReading10";
            txtLaserReading10.Size = new Size(156, 39);
            txtLaserReading10.TabIndex = 47;
            // 
            // txtLaserReading11
            // 
            txtLaserReading11.Location = new Point(423, 785);
            txtLaserReading11.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading11.Name = "txtLaserReading11";
            txtLaserReading11.Size = new Size(156, 39);
            txtLaserReading11.TabIndex = 48;
            // 
            // txtLaserReading12
            // 
            txtLaserReading12.Location = new Point(423, 838);
            txtLaserReading12.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading12.Name = "txtLaserReading12";
            txtLaserReading12.Size = new Size(156, 39);
            txtLaserReading12.TabIndex = 49;
            // 
            // txtLaserReading13
            // 
            txtLaserReading13.Location = new Point(422, 892);
            txtLaserReading13.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading13.Name = "txtLaserReading13";
            txtLaserReading13.Size = new Size(156, 39);
            txtLaserReading13.TabIndex = 50;
            // 
            // txtLaserReading14
            // 
            txtLaserReading14.Location = new Point(423, 945);
            txtLaserReading14.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading14.Name = "txtLaserReading14";
            txtLaserReading14.Size = new Size(156, 39);
            txtLaserReading14.TabIndex = 51;
            // 
            // txtLaserReading15
            // 
            txtLaserReading15.Location = new Point(423, 998);
            txtLaserReading15.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading15.Name = "txtLaserReading15";
            txtLaserReading15.Size = new Size(156, 39);
            txtLaserReading15.TabIndex = 52;
            // 
            // txtLaserReading16
            // 
            txtLaserReading16.Location = new Point(422, 1052);
            txtLaserReading16.Margin = new Padding(4, 2, 4, 2);
            txtLaserReading16.Name = "txtLaserReading16";
            txtLaserReading16.Size = new Size(156, 39);
            txtLaserReading16.TabIndex = 53;
            // 
            // txtLaserRun10
            // 
            txtLaserRun10.Location = new Point(605, 732);
            txtLaserRun10.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun10.Name = "txtLaserRun10";
            txtLaserRun10.Size = new Size(156, 39);
            txtLaserRun10.TabIndex = 54;
            // 
            // txtLaserRun11
            // 
            txtLaserRun11.Location = new Point(607, 785);
            txtLaserRun11.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun11.Name = "txtLaserRun11";
            txtLaserRun11.Size = new Size(156, 39);
            txtLaserRun11.TabIndex = 55;
            // 
            // txtLaserRun12
            // 
            txtLaserRun12.Location = new Point(605, 838);
            txtLaserRun12.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun12.Name = "txtLaserRun12";
            txtLaserRun12.Size = new Size(156, 39);
            txtLaserRun12.TabIndex = 56;
            // 
            // txtLaserRun13
            // 
            txtLaserRun13.Location = new Point(605, 892);
            txtLaserRun13.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun13.Name = "txtLaserRun13";
            txtLaserRun13.Size = new Size(156, 39);
            txtLaserRun13.TabIndex = 57;
            // 
            // txtLaserRun14
            // 
            txtLaserRun14.Location = new Point(607, 945);
            txtLaserRun14.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun14.Name = "txtLaserRun14";
            txtLaserRun14.Size = new Size(156, 39);
            txtLaserRun14.TabIndex = 58;
            // 
            // txtLaserRun15
            // 
            txtLaserRun15.Location = new Point(605, 998);
            txtLaserRun15.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun15.Name = "txtLaserRun15";
            txtLaserRun15.Size = new Size(156, 39);
            txtLaserRun15.TabIndex = 59;
            // 
            // txtLaserRun16
            // 
            txtLaserRun16.Location = new Point(605, 1052);
            txtLaserRun16.Margin = new Padding(4, 2, 4, 2);
            txtLaserRun16.Name = "txtLaserRun16";
            txtLaserRun16.Size = new Size(156, 39);
            txtLaserRun16.TabIndex = 60;
            // 
            // textBox1
            // 
            textBox1.Location = new Point(1005, 693);
            textBox1.Margin = new Padding(4, 2, 4, 2);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(251, 39);
            textBox1.TabIndex = 61;
            // 
            // label10
            // 
            label10.AutoSize = true;
            label10.Font = new Font("Segoe UI", 12F);
            label10.ForeColor = Color.Red;
            label10.Location = new Point(851, 634);
            label10.Margin = new Padding(4, 0, 4, 0);
            label10.Name = "label10";
            label10.Size = new Size(205, 45);
            label10.TabIndex = 62;
            label10.Text = "Email Results";
            label10.Click += label10_Click;
            // 
            // label11
            // 
            label11.AutoSize = true;
            label11.Font = new Font("Segoe UI", 12F);
            label11.ForeColor = Color.Red;
            label11.Location = new Point(782, 687);
            label11.Margin = new Padding(4, 0, 4, 0);
            label11.Name = "label11";
            label11.Size = new Size(215, 45);
            label11.TabIndex = 64;
            label11.Text = "Email address";
            label11.Click += label11_Click;
            // 
            // frmLaserReadings1
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.Silver;
            ClientSize = new Size(1268, 1320);
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
            Margin = new Padding(4, 2, 4, 2);
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