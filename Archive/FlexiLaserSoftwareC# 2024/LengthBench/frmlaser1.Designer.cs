namespace LengthBench
{
    partial class frmlaser1
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
            textPoint = new TextBox();
            bindingSource1 = new BindingSource(components);
            button1 = new Button();
            ((System.ComponentModel.ISupportInitialize)bindingSource1).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(84, 58);
            label1.Name = "label1";
            label1.Size = new Size(310, 32);
            label1.TabIndex = 0;
            label1.Text = "Length of interval in metres";
            // 
            // textPoint
            // 
            textPoint.Location = new Point(478, 58);
            textPoint.Name = "textPoint";
            textPoint.Size = new Size(150, 39);
            textPoint.TabIndex = 1;
            textPoint.TextChanged += textPoint_TextChanged;
            // 
            // button1
            // 
            button1.Location = new Point(900, 83);
            button1.Name = "button1";
            button1.Size = new Size(124, 56);
            button1.TabIndex = 2;
            button1.Text = "OK";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // frmlaser1
            // 
            AutoScaleDimensions = new SizeF(13F, 32F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1064, 333);
            Controls.Add(button1);
            Controls.Add(textPoint);
            Controls.Add(label1);
            Name = "frmlaser1";
            Text = "Laser";
            Load += frmlaser1_Load;
            ((System.ComponentModel.ISupportInitialize)bindingSource1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        public TextBox textPoint;
        private BindingSource bindingSource1;
        private Button button1;
    }
}