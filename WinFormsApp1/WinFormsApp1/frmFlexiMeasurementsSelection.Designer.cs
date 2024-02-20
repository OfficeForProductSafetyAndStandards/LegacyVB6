namespace frmStartScreen
{
    partial class frmFlexiMeasurementsSelection
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
            groupBox1 = new GroupBox();
            radioButton2 = new RadioButton();
            radioButton1 = new RadioButton();
            groupBox2 = new GroupBox();
            radioButton3 = new RadioButton();
            radioButton4 = new RadioButton();
            button2 = new Button();
            groupBox3 = new GroupBox();
            radioButton5 = new RadioButton();
            radioButton6 = new RadioButton();
            button3 = new Button();
            groupBox4 = new GroupBox();
            label1 = new Label();
            radioButton9 = new RadioButton();
            radioButton7 = new RadioButton();
            radioButton8 = new RadioButton();
            button4 = new Button();
            groupBox1.SuspendLayout();
            groupBox2.SuspendLayout();
            groupBox3.SuspendLayout();
            groupBox4.SuspendLayout();
            SuspendLayout();
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(radioButton2);
            groupBox1.Controls.Add(radioButton1);
            groupBox1.Location = new Point(64, 51);
            groupBox1.Name = "groupBox1";
            groupBox1.Size = new Size(400, 200);
            groupBox1.TabIndex = 0;
            groupBox1.TabStop = false;
            groupBox1.Text = "Imperial or Metric";
            // 
            // radioButton2
            // 
            radioButton2.AutoSize = true;
            radioButton2.Location = new Point(32, 116);
            radioButton2.Name = "radioButton2";
            radioButton2.Size = new Size(113, 36);
            radioButton2.TabIndex = 2;
            radioButton2.TabStop = true;
            radioButton2.Text = "Metric";
            radioButton2.UseVisualStyleBackColor = true;
            // 
            // radioButton1
            // 
            radioButton1.AutoSize = true;
            radioButton1.Location = new Point(32, 62);
            radioButton1.Name = "radioButton1";
            radioButton1.Size = new Size(131, 36);
            radioButton1.TabIndex = 1;
            radioButton1.TabStop = true;
            radioButton1.Text = "Imperial";
            radioButton1.UseVisualStyleBackColor = true;
            radioButton1.CheckedChanged += radioButton1_CheckedChanged;
            // 
            // groupBox2
            // 
            groupBox2.Controls.Add(radioButton3);
            groupBox2.Controls.Add(radioButton4);
            groupBox2.Location = new Point(129, 320);
            groupBox2.Name = "groupBox2";
            groupBox2.Size = new Size(236, 200);
            groupBox2.TabIndex = 1;
            groupBox2.TabStop = false;
            groupBox2.Text = "Select Laser";
            // 
            // radioButton3
            // 
            radioButton3.AutoSize = true;
            radioButton3.Location = new Point(32, 116);
            radioButton3.Name = "radioButton3";
            radioButton3.Size = new Size(117, 36);
            radioButton3.TabIndex = 2;
            radioButton3.TabStop = true;
            radioButton3.Text = "IB4073";
            radioButton3.UseVisualStyleBackColor = true;
            // 
            // radioButton4
            // 
            radioButton4.AutoSize = true;
            radioButton4.Location = new Point(32, 62);
            radioButton4.Name = "radioButton4";
            radioButton4.Size = new Size(117, 36);
            radioButton4.TabIndex = 1;
            radioButton4.TabStop = true;
            radioButton4.Text = "IB3812";
            radioButton4.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            button2.Location = new Point(138, 673);
            button2.Name = "button2";
            button2.Size = new Size(338, 123);
            button2.TabIndex = 1;
            button2.Text = "Take Vol";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click;
            // 
            // groupBox3
            // 
            groupBox3.Controls.Add(radioButton5);
            groupBox3.Controls.Add(radioButton6);
            groupBox3.Location = new Point(662, 328);
            groupBox3.Name = "groupBox3";
            groupBox3.Size = new Size(236, 200);
            groupBox3.TabIndex = 3;
            groupBox3.TabStop = false;
            groupBox3.Text = "Composite";
            // 
            // radioButton5
            // 
            radioButton5.AutoSize = true;
            radioButton5.Location = new Point(32, 116);
            radioButton5.Name = "radioButton5";
            radioButton5.Size = new Size(77, 36);
            radioButton5.TabIndex = 2;
            radioButton5.TabStop = true;
            radioButton5.Text = "No";
            radioButton5.UseVisualStyleBackColor = true;
            // 
            // radioButton6
            // 
            radioButton6.AutoSize = true;
            radioButton6.Location = new Point(32, 62);
            radioButton6.Name = "radioButton6";
            radioButton6.Size = new Size(79, 36);
            radioButton6.TabIndex = 1;
            radioButton6.TabStop = true;
            radioButton6.Text = "Yes";
            radioButton6.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            button3.Location = new Point(565, 673);
            button3.Name = "button3";
            button3.Size = new Size(257, 123);
            button3.TabIndex = 1;
            button3.Text = "No Vol";
            button3.UseVisualStyleBackColor = true;
            button3.Click += button3_Click;
            // 
            // groupBox4
            // 
            groupBox4.Controls.Add(label1);
            groupBox4.Controls.Add(radioButton9);
            groupBox4.Controls.Add(radioButton7);
            groupBox4.Controls.Add(radioButton8);
            groupBox4.Location = new Point(380, 328);
            groupBox4.Name = "groupBox4";
            groupBox4.Size = new Size(214, 218);
            groupBox4.TabIndex = 4;
            groupBox4.TabStop = false;
            groupBox4.Text = "Class of Tape";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(228, 203);
            label1.Name = "label1";
            label1.Size = new Size(78, 32);
            label1.TabIndex = 4;
            label1.Text = "label1";
            // 
            // radioButton9
            // 
            radioButton9.AutoSize = true;
            radioButton9.Location = new Point(32, 164);
            radioButton9.Name = "radioButton9";
            radioButton9.Size = new Size(123, 36);
            radioButton9.TabIndex = 3;
            radioButton9.TabStop = true;
            radioButton9.Text = "Class III";
            radioButton9.UseVisualStyleBackColor = true;
            // 
            // radioButton7
            // 
            radioButton7.AutoSize = true;
            radioButton7.Location = new Point(32, 116);
            radioButton7.Name = "radioButton7";
            radioButton7.Size = new Size(117, 36);
            radioButton7.TabIndex = 2;
            radioButton7.TabStop = true;
            radioButton7.Text = "Class II";
            radioButton7.UseVisualStyleBackColor = true;
            // 
            // radioButton8
            // 
            radioButton8.AutoSize = true;
            radioButton8.Location = new Point(32, 62);
            radioButton8.Name = "radioButton8";
            radioButton8.Size = new Size(111, 36);
            radioButton8.TabIndex = 1;
            radioButton8.TabStop = true;
            radioButton8.Text = "Class I";
            radioButton8.UseVisualStyleBackColor = true;
            // 
            // button4
            // 
            button4.Font = new Font("Segoe UI", 13.875F, FontStyle.Bold, GraphicsUnit.Point, 0);
            button4.Location = new Point(307, 89);
            button4.Name = "button4";
            button4.Size = new Size(571, 123);
            button4.TabIndex = 1;
            button4.Text = "Set Up Laser  for Metric or Imperial";
            button4.UseVisualStyleBackColor = true;
            // 
            // frmFlexiMeasurementsSelection
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(964, 841);
            Controls.Add(button3);
            Controls.Add(button2);
            Controls.Add(groupBox3);
            Controls.Add(button4);
            Controls.Add(groupBox4);
            Controls.Add(groupBox2);
            Controls.Add(groupBox1);
            Name = "frmFlexiMeasurementsSelection";
            Text = "Laser system setup";
            Load += frmFlexiMeasurementsSelection_Load;
            groupBox1.ResumeLayout(false);
            groupBox1.PerformLayout();
            groupBox2.ResumeLayout(false);
            groupBox2.PerformLayout();
            groupBox3.ResumeLayout(false);
            groupBox3.PerformLayout();
            groupBox4.ResumeLayout(false);
            groupBox4.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private GroupBox groupBox1;
        private RadioButton radioButton2;
        private RadioButton radioButton1;
        private GroupBox groupBox2;
        private GroupBox groupBox3;
        private Button button3;
        private RadioButton radioButton5;
        private RadioButton radioButton6;
        private Button button2;
        private RadioButton radioButton3;
        private RadioButton radioButton4;
        private GroupBox groupBox4;
        private Button button4;
        private RadioButton radioButton7;
        private RadioButton radioButton8;
        private RadioButton radioButton9;
        private Label label1;
    }
}