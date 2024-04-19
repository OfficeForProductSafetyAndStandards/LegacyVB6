using System.Diagnostics.Metrics;
using System.Runtime.InteropServices;
using System.Text;
using Windows.UI.WebUI;

namespace LengthBench
{
    public static class Program
    {

    public enum CONSTANTS
    {
        EDALE=-1,
        INITIAL=0,
        INTERMEDIATE=1,
        FINAL=2
    }

    private const string V = "Excel.Appication";
        public static string TypeOfThermometer = "";
        public static string Thermometer = "";
        public static string Barometer = "";
        public static string Hygrometer = "";

        public static int NoOfPoints;
        public static int Rownumber;
        public static int LaserTestSetNo;
        public static int ProbeCounter;
        public static bool RigidLaserFound;
        public static bool FlexiLaserFound;
        public static bool LaserFound;

        public static Microsoft.Office.Interop.Excel._Workbook xlCorrectionBook;
        public static Microsoft.Office.Interop.Excel._Workbook xlbookResults;
        public static Microsoft.Office.Interop.Excel._Worksheet xlsheetResults;
        public static Microsoft.Office.Interop.Excel._Worksheet xlsheetResultsTemperature;
        public static Microsoft.Office.Interop.Excel._Worksheet xlsheetResultsVOLandCustomerData;
        public static Microsoft.Office.Interop.Excel._Worksheet xlsheetResultsMeasurement;
        public static Microsoft.Office.Interop.Excel._Worksheet xlsheetResultsTemperatureUncorrected;
        public static Microsoft.Office.Interop.Excel._Worksheet xlsheet;
        public static Microsoft.Office.Interop.Excel.Application xl;
        public static Microsoft.Office.Interop.Excel.Application excelAppEdale;
        public static Microsoft.Office.Interop.Excel.Application excelAppLength;

        public static int? xlRow;
        public static int[]? ProbeSelected;
        public static int eventtime;
        public static string? dept;
        public static string? daybook;
        public static string? Units = "metres";
        public static bool[] ProbesSelected = new bool[10];
        public static string? FlexiPath;

        public static string? NewFileName;
        public static string? NewFileName1;
        public static string? metrologist;
        public static string? email;

        public static Laser laser;

        public static double temperature;
        public static double humidity;
        public static double pressure;

        


            private const int ARRAYSIZE = 100;   // size of ReadBuffer
            private static int Num_Listeners,        // number of listeners on GPIB bus
                           loop,                 // loop counter
                           board;                // GPIB board number		
            private static short[] Instruments;      // array of primary addresses
            private static short[] Result;           // array of listen addresses
            private static StringBuilder ReadBuffer; // contains the string returned from instrument
            private static string[] ErrorMnemonic = {
                "EDVR", "ECIC", "ENOL", "EADR", "EARG", // Error codes
			    "ESAC", "EABO", "ENEB", "EDMA", "",
                "EOIP", "ECAP", "EFSO", "",     "EBUS",
                "ESTB", "ESRQ", "",     "",     "",
                "ETAB"
                };

            [DllImport("msvcrt.dll")]
            public static extern char _getch();
        // try this block of code until an exception is thrown
        public static void Setup_Rigid_Laser(string units)
        { 
            Program.RigidLaserFound = false;
			try
			{
				/*
				 *  Allocate memory space for the classes and arrays
				 */
				ReadBuffer  = new StringBuilder(200);
				Instruments = new short[32]; // An array containing all instrument addresses (1-32)
				Result      = new short[31]; // An array that holds the addresses of instruments found on the bus
				board = 0;                   // specifies the GPIB board to use - GPIB0
		
				/*
				 *  Your board needs to be the Controller-In-Charge in order to find
				 *  all listeners on the GPIB.  To accomplish this, the function
				 *  SendIFC is called.  If the error bit ERR is set in ibsta, throw
				 *  an error message.
				 */
				Gpib488.SendIFC(board);
				if ((Gpib488.Ibsta() & Gpib488Consts.ERR) != 0)
					throw new System.Exception("Unable to open board"); // throw an error
				
				/*
				 *  Create an array containing all valid GPIB primary addresses,
				 *  except for primary address 0.  Your GPIB interface board is at
				 *  address 0 by default.  This array (Instuments) will be given to
				 *  the function FindLstn to find all listeners.
				 */
				for (loop = 0; loop < 30; loop++)
					Instruments[loop] = (short)(loop + 1);
				
				Instruments[30] = Gpib488Consts.NOADDR;

				/*
				 *  Print message to tell user that the program is searching for all
				 *  active listeners.  Find all of the listeners on the bus.  Store
				 *  the listen addresses in the array Result.  Note, the instruments
				 *  must be powered on and connected with a GPIB cable in order for
				 *  FindLstn to detect them.  If the error bit ERR is set in ibsta, throw
				 *  an error message.
				 */
				Console.WriteLine("Finding all listeners on the bus ...");
				Gpib488.FindLstn(board, Instruments, Result, 31);
				if ((Gpib488.Ibsta() & Gpib488Consts.ERR) != 0)
					throw new System.Exception("Unable to issue FindLstn call");  // throw an error
			
				/*
				 *  ibcntl contains the actual number of addresses stored in the
				 *  Result array. Assign the value of ibcntl to the variable
				 *  Num_Listeners. Print the number of listeners found.
				 */
				Num_Listeners = Gpib488.Ibcnt();
				Console.WriteLine("Number of Instruments found = " + Num_Listeners);
									
				/*
				 *  The Result array contains the addresses of all listening devices
				 *  found by FindLstn. Use the constant NOADDR, as defined in
				 *  GPIBConstants to terminate the array.
				 */
				Result[Num_Listeners] = Gpib488Consts.NOADDR;

				/*
				 *  DevClearList will send the GPIB Selected Device Clear (SDC)
				 *  command message to all the devices on the bus.  If the error bit
				 *  ERR is set in ibsta, throw an error message.
				 */
				Gpib488.DevClearList(board, Result);
				if ((Gpib488.Ibsta() & Gpib488Consts.ERR) != 0)
					throw new System.Exception("Unable to clear devices");   // throw an error			

				/*
				 *  Send the identification query to each listen address in the array
				 *  (Result) using SendList.  The constant NLend, defined in GPIBConstants,
				 *  instructs the function SendList to append a linefeed character
				 *  with EOI asserted to the end of the message.  If the error bit ERR
				 *  is set in ibsta, throw an error message.
				 */
				Gpib488.SendList(board, Result, "*idn?", 5, Gpib488Consts.NLend);
				if ((Gpib488.Ibsta() & Gpib488Consts.ERR) != 0)
					throw new System.Exception("Unable to write to devices");												

				/*
				 *  Read each device's identification code, one at a time.
				 *
				 *  Establish a FOR loop to read each one of the device's
				 *  identification code. The variable LOOP will serve as a counter
				 *  for the FOR loop and as the index to the array Result.
				 */
				Console.WriteLine("Returned string:");
                for (loop = 0; loop < Num_Listeners; loop++)
                {
                    /*
					 *  Read the name identification response returned from each
					 *  device. Store the response in the array ReadBuffer.  The
					 *  constant STOPend, defined in GPIBConstants, instructs the
					 *  function Receive to terminate the read when END is detected.
					 *  If the error bit ERR is set in ibsta, throw an error message
					 */
                    Gpib488.Receive(board, Result[loop], ReadBuffer, ARRAYSIZE, Gpib488Consts.STOPend);

                    // Print out the ReadBuffer 
                    Console.WriteLine("Address: " + Result[loop].ToString() + ", " + ReadBuffer);
                }
                Program.RigidLaserFound = true;
        
                // Define device desription
                int laser=0;
                laser = Gpib488.ibdev(0, 3, 0, 13, 1, 0);
                // Define device desription
                Gpib488.ibwrt(laser, "M1" + (char)10,3);
                // Puts laser into distance mode
                Gpib488.ibwrt(laser, "D2" + (char)10,3);
                //  Set laser to single pass (Flexi length) or double pass (Rigid length)
                Gpib488.ibwrt(laser, units + (char)10, 3);
                // Set units (UM for metric or UE for imperial, values passed from
                

                // Take the board offline.
                Console.WriteLine("Taking board offline");
				Gpib488.ibonl(board, 0);

			}
			// Execute this block when an exception is thrown
			catch (System.Exception caught)
			{
				// Print out error messages
				Console.WriteLine(
					System.Environment.NewLine +
					"Error: " + caught.Message + System.Environment.NewLine);
			}
			finally  
			{
				// Allow the user to see the output before exiting.
				Console.WriteLine(System.Environment.NewLine + "Hit Any Key to exit");
				_getch();
			}
       }    
       

        public static void SetUp_Flexi_Laser(string units)
        {

            // bool reading_2nd_laser = false;
            // SerialEDM serial = null;
            // bool manual_reading = false;
            // ManualInstrumentReading reader = null;
            
            // EthernetServer server1 = new EthernetServer();
            // WifiServer server2 = new WifiServer();
            // reading_2nd_laser = true;

            laser = new Laser();
            laser.Initialize_E1735A_DLL();
            Program.FlexiLaserFound = false;
            if (laser.readDeviceCnt() == 1)
            {
                Program.FlexiLaserFound = true;
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
                // string BenchUsed = "D1"; // 'sets bench for single pass
                // string Units;
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
                Program.FlexiLaserFound = false;
                Console.WriteLine("No laser E1735 module found, please check the connection and try again\n");
                Console.WriteLine("Press any key to exit\n");
                // Form frm = new Nolaserfound();
                // frm.Show();
                // Environment.Exit(0);
            }
        }

        static void SetUp()
        {

            Program.FlexiPath = Environment.GetEnvironmentVariable("FlexiPath");

            // TODO - do we have env vars for these locations ?
            string filename = "\"" + "c:\\temp\\EdaleCorrection.xlsx" + "\"";


            excelAppEdale = new Microsoft.Office.Interop.Excel.Application();
            excelAppEdale.Visible = false;
            filename = "c:\\temp\\Edale.xlsx";
            Microsoft.Office.Interop.Excel._Workbook workbook = excelAppEdale.Workbooks.Open(filename, false);
            Program.xlCorrectionBook = workbook;

            excelAppLength = new Microsoft.Office.Interop.Excel.Application();
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
