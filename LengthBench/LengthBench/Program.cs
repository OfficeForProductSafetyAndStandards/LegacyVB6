namespace LengthBench
{
    public static class Program

    {
        private const string V = "Excel.Appication";
        public static string TypeOfThermometer = "";
        public static int NoOfPoints;
        public static int Rownumber;
        public static int LaserTestSetNo;
        public static int ProbeCounter;


        public static Microsoft.Office.Interop.Excel._Workbook? xlbookResults;
        public static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResults;
        public static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResultsTemperature;
        public static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResultsVOLandCustomerData;
        public static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResultsMeasurement;
        public static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResultsTemperatureUncorrected;
        public static Microsoft.Office.Interop.Excel._Worksheet? xlsheet;
        public static Microsoft.Office.Interop.Excel.Application? xl;


        public static int? xlRow;
        public static int[]? ProbeSelected;
        public static int eventtime;

        public static string? NewFileName;
        public static string? NewFileName1;
        public static string? metrologist;

        public static Laser laser = null;

        public static double temperature;
        public static double humidity;
        public static double pressure;


        public static void SetUp_Laser()
        {

            bool reading_2nd_laser = false;
            // SerialEDM serial = null;
            bool manual_reading = false;
            // ManualInstrumentReading reader = null;
            
            // EthernetServer server1 = new EthernetServer();
            // WifiServer server2 = new WifiServer();
            reading_2nd_laser = true;

            laser = new Laser();
            laser.Initialize_E1735A_DLL();

            if (laser.readDeviceCnt() == 1)
            {
                laser.setDevice();
                Console.WriteLine("Found 1 laser E5135 module, blinking LED ....\r\n");
                laser.blink();
                double b_strength = laser.ReadBeamStrength();
                Console.WriteLine("The beam strength is: " + b_strength.ToString() + "\r\n");
                laser.setParameter(LaserParameters.OP_WAVELENGTH, 632.991370);
                laser.setParameter(LaserParameters.OP_MATCOMP, 1);
                laser.setParameter(LaserParameters.OP_AIRCOMP, 1);
                laser.Reset();
                Console.WriteLine("The laser has been reset\n");
                Console.WriteLine("The wavelength has been set to: " + laser.getParameter(LaserParameters.OP_WAVELENGTH) + "\n");
                Console.WriteLine("The refractive index correction has been set to: " + laser.getParameter(LaserParameters.OP_AIRCOMP) + "\n");
                Console.WriteLine("The material compensation has been set to: " + laser.getParameter(LaserParameters.OP_MATCOMP) + "\n");
                String.Concat("The laser beam strength is ", b_strength.ToString(), "%\r\n");
                Console.WriteLine("The Current laser position is: " + laser.ReadSample().ToString() + "\n");

                // Dim dbScaleFactor As Double 'Agilent change from mm to inch  SBB 8/3/2010
                string BenchUsed = "D1"; // 'sets bench for single pass
                string Units;
                double dbScaleFactor;
                bool optImperial = frmMeasurementSelection.metric; 
                if (optImperial == true)
                {
                    // check if imperial or metric option button selected
                    Units = "UE"; // set units to inches on display panel
                    xlsheetResultsMeasurement.Cells[25, 5] = "Imperial";
                    dbScaleFactor = 1 / 25.4; // Single pass laser SBB 8/3/2010
                }
                else
                {
                    Units = "UM"; // set units to mm on display panel
                    xlsheetResultsMeasurement.Cells[25, 5] = "Metric";
                    dbScaleFactor = 1;   // Single pass laser SBB 8/3/2010
                }
                xlbookResults.Save();
                laser.setParameter(10, dbScaleFactor);   // Scale factor for laser
                laser.setParameter(9, 1);   // Change laser sign


            }
            else
            {
                Console.WriteLine("No laser E1735 module found, please check the connection and try again\n");
                Console.WriteLine("Press any key to exit\n");
                Form frm = new Nolaserfound();
                frm.Show();
                // Environment.Exit(0);
            }
        }

        static void SetUp()
        {
            // smtp mail server
            /*
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential("milomia322@gmail.com", "");
            smtp.EnableSsl = true;
            // send mail
            smtp.Send("millomia322@gmail.com", "m-hunt3@sky.com", "subject", "body");
            */

            string edalePath = Environment.GetEnvironmentVariable("EdalePath");

            string filename = "\"" + edalePath + "EdaleCorrection.xlsx" + "\"";
            filename = "\"" + "c:\\temp\\EdaleCorrection.xlsx" + "\"";


            Microsoft.Office.Interop.Excel.Application excelAppEdale = new Microsoft.Office.Interop.Excel.Application();
            excelAppEdale.Visible = false;
            filename = "c:\\temp\\Edale.xlsx";
            Microsoft.Office.Interop.Excel._Workbook workbook = excelAppEdale.Workbooks.Open(filename, false);

            Microsoft.Office.Interop.Excel.Application excelAppLength = new Microsoft.Office.Interop.Excel.Application();
            excelAppLength.Visible = false;
            filename = "c:\\temp\\Length.xlsx";
            xlbookResults = excelAppLength.Workbooks.Open(filename, false);
            xlsheetResultsTemperature = xlbookResults.Sheets["Temperature Results"];
            xlsheetResultsMeasurement = xlbookResults.Sheets["Measurement Results"];
            xlsheetResultsVOLandCustomerData = xlbookResults.Sheets["VOL and Customer Data"];
            xlsheetResultsTemperatureUncorrected = xlbookResults.Sheets["Temperature Results Uncorrected"];
            // Set all objects to their respective parts of the workbook
            // Open Excel workbook and select Temperature Results sheet
            Rownumber = 2;
            // Start program with selecting the first row for data
            LaserTestSetNo = 2;
            // Start program also with selecting the first set of laser data
            // Range rng = xlsheetResultsMeasurement.get_Range["B2", "C22"];
            // rng.Value = '';

            // xlsheetResultsMeasurement.Cells["B3:C22"] = "";
            // xlsheetResultsTemperature.Cells["B2:E13"] = "";
            
            // Clears Excel spreadsheet by placing 0's i n all boxes
            // xlbookResults.Save();



        }

        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            SetUp();
            ApplicationConfiguration.Initialize();

            Application.Run(new frmStartScreen());
        }
    }
}