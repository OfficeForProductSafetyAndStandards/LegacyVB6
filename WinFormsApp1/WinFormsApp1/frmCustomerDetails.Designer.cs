namespace frmStartScreen
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
            label1 = new Label();
            label3 = new Label();
            label4 = new Label();
            label5 = new Label();
            label6 = new Label();
            label7 = new Label();
            label9 = new Label();
            dateTimePicker1 = new DateTimePicker();
            textBox1 = new TextBox();
            textBox6 = new TextBox();
            textBox7 = new TextBox();
            textBox8 = new TextBox();
            textBox9 = new TextBox();
            button1 = new Button();
            label2 = new Label();
            textBox2 = new TextBox();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(42, 33);
            label1.Name = "label1";
            label1.Size = new Size(188, 32);
            label1.TabIndex = 0;
            label1.Text = "Customer Name";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(51, 314);
            label3.Name = "label3";
            label3.Size = new Size(179, 32);
            label3.TabIndex = 2;
            label3.Text = "Tension Weight";
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(42, 250);
            label4.Name = "label4";
            label4.Size = new Size(262, 32);
            label4.TabIndex = 3;
            label4.Text = "Reference Temperature";
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(42, 202);
            label5.Name = "label5";
            label5.Size = new Size(397, 32);
            label5.TabIndex = 4;
            label5.Text = "Tape Marial Coeffient of Exapansion";
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Location = new Point(42, 138);
            label6.Name = "label6";
            label6.Size = new Size(202, 32);
            label6.TabIndex = 5;
            label6.Text = "Number of Points";
            // 
            // label7
            // 
            label7.AutoSize = true;
            label7.Location = new Point(42, 84);
            label7.Name = "label7";
            label7.Size = new Size(237, 32);
            label7.TabIndex = 6;
            label7.Text = "Department Number";
            // 
            // label9
            // 
            label9.AutoSize = true;
            label9.Location = new Point(319, 217);
            label9.Name = "label9";
            label9.Size = new Size(0, 32);
            label9.TabIndex = 8;
            label9.Click += label9_Click;
            // 
            // dateTimePicker1
            // 
            dateTimePicker1.Location = new Point(518, 371);
            dateTimePicker1.Name = "dateTimePicker1";
            dateTimePicker1.Size = new Size(115, 39);
            dateTimePicker1.TabIndex = 9;
            dateTimePicker1.ValueChanged += dateTimePicker1_ValueChanged;
            // 
            // textBox1
            // 
            textBox1.Location = new Point(518, 84);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(133, 39);
            textBox1.TabIndex = 10;
            // 
            // textBox6
            // 
            textBox6.Location = new Point(518, 261);
            textBox6.Name = "textBox6";
            textBox6.Size = new Size(133, 39);
            textBox6.TabIndex = 15;
            // 
            // textBox7
            // 
            textBox7.Location = new Point(518, 199);
            textBox7.Name = "textBox7";
            textBox7.Size = new Size(133, 39);
            textBox7.TabIndex = 16;
            // 
            // textBox8
            // 
            textBox8.Location = new Point(518, 138);
            textBox8.Name = "textBox8";
            textBox8.Size = new Size(133, 39);
            textBox8.TabIndex = 17;
            // 
            // textBox9
            // 
            textBox9.Location = new Point(518, 33);
            textBox9.Name = "textBox9";
            textBox9.Size = new Size(133, 39);
            textBox9.TabIndex = 18;
            // 
            // button1
            // 
            button1.Location = new Point(693, 418);
            button1.Name = "button1";
            button1.Size = new Size(126, 72);
            button1.TabIndex = 19;
            button1.Text = "OK?";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(51, 378);
            label2.Name = "label2";
            label2.Size = new Size(142, 32);
            label2.TabIndex = 20;
            label2.Text = "Date of Test";
            // 
            // textBox2
            // 
            textBox2.Location = new Point(518, 307);
            textBox2.Name = "textBox2";
            textBox2.Size = new Size(133, 39);
            textBox2.TabIndex = 21;
            // 
            // frmCustomerDetails
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(831, 514);
            Controls.Add(textBox2);
            Controls.Add(label2);
            Controls.Add(button1);
            Controls.Add(textBox9);
            Controls.Add(textBox8);
            Controls.Add(textBox7);
            Controls.Add(textBox6);
            Controls.Add(textBox1);
            Controls.Add(dateTimePicker1);
            Controls.Add(label9);
            Controls.Add(label7);
            Controls.Add(label6);
            Controls.Add(label5);
            Controls.Add(label4);
            Controls.Add(label3);
            Controls.Add(label1);
            Name = "frmCustomerDetails";
            Text = "frmCustomerDetails";
            Load += frmCustomerDetails_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label label7;
        private Label label9;
        private DateTimePicker dateTimePicker1;
        private TextBox textBox1;
        private TextBox textBox6;
        private TextBox textBox7;
        private TextBox textBox8;
        private TextBox textBox9;
        private Button button1;
        private Label label2;
        private TextBox textBox2;
    }
}