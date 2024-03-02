using LengthBench;
using System.Collections.Generic;
using System.Diagnostics;
using System.Dynamic;
using System.IO;
using System.Security.Policy;

namespace LengthBench
{
    internal static class Program

    {
        private const string V = "Excel.Appication";
        public
        static string TypeOfThermometer = "";
        static int NoOfPoints;
        static int Rownumber;
        static int LaserTestSetNo;
        static int ProbeCounter;

        /*
        static Microsoft.Office.Interop.Excel._Workbook? xlbookResults;
        static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResults;
        static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResultsTemperature;
        static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResultsVOLandCustomerData;
        static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResultsMeasurement;
        static Microsoft.Office.Interop.Excel._Worksheet? xlsheetResultsTemperatureUncorrected;
        static Microsoft.Office.Interop.Excel._Worksheet? xlsheet;
        static Microsoft.Office.Interop.Excel.Application? xl;
        */

        static int? xlRow;
        static int[]? ProbeSelected;
        static int eventtime;

        static string? NewFileName;
        static string? NewFileName1;

        static void SetUp_Laser()
        { 

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
                        break;
                    }
                    else
                    {
                        Console.WriteLine("No laser E1735 module found, please check the connection and try again\n");
                        Console.WriteLine("Press any key to exit\n");
                        Console.ReadKey();
                        Environment.Exit(0);
                    }
                }

           }
        }
        static void setup
        {
            // smtp mail server
            /*
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential("milomia322@gmail.com", "29HennryLaver");
            smtp.EnableSsl = true;
            // send mail
            smtp.Send("millomia322@gmail.com", "m-hunt3@sky.com", "subject", "body");
            
            /*
            string edalePath = Environment.GetEnvironmentVariable("EdalePath");
            
            string filename = "\"" + edalePath + "EdaleCorrection.xlsx" + "\"";
            filename = "\"" + "c:\\temp\\EdaleCorrection.xlsx" + "\"";
            

            Microsoft.Office.Interop.Excel.Application excelAppEdale = new Microsoft.Office.Interop.Excel.Application();
            excelAppEdale.Visible = false;
            string filename = "c:\\temp\\Edale.xlsx";
            Microsoft.Office.Interop.Excel._Workbook workbook = excelAppEdale.Workbooks.Open(filename, false);
           
            Microsoft.Office.Interop.Excel.Application excelAppLength = new Microsoft.Office.Interop.Excel.Application();
            excelAppLength.Visible = false;
            filename = "c:\\temp\\Length.xlsx";
            xlbookResults = excelAppLength.Workbooks.Open(filename,false);
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
            /*
            xlsheetResultsMeasurement.get_Range("B3:C22") = "";
            xlsheetResultsTemperature.get_Range("B2:E13") = "";
            */
            // Clears Excel spreadsheet by placing 0's i n all boxes



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