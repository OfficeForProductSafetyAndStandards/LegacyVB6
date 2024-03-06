namespace LengthBench
{
    partial class frmStartScreen
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            comboBox1 = new ComboBox();
            button1 = new Button();
            button2 = new Button();
            SuspendLayout();
            // 
            // comboBox1
            // 
            comboBox1.FormattingEnabled = true;
            comboBox1.Items.AddRange(new object[] { "Ivor James", "Mike Hunt", "Guest" });
            comboBox1.Location = new Point(80, 77);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(256, 40);
            comboBox1.TabIndex = 0;
            comboBox1.Text = "Select Metrologist";
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            // 
            // button1
            // 
            button1.Location = new Point(96, 148);
            button1.Name = "button1";
            button1.Size = new Size(240, 78);
            button1.TabIndex = 1;
            button1.Text = "Start Test";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // button2
            // 
            button2.Location = new Point(96, 279);
            button2.Name = "button2";
            button2.Size = new Size(240, 78);
            button2.TabIndex = 2;
            button2.Text = "End Program";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click;
            // 
            // frmStartScreen
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(409, 450);
            Controls.Add(button2);
            Controls.Add(button1);
            Controls.Add(comboBox1);
            Name = "frmStartScreen";
            Text = "Flexi Laser Program";
            ResumeLayout(false);
        }

        #endregion

        private ComboBox comboBox1;
        private Button button1;
        private Button button2;
    }
}
