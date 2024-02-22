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

        static void SetUp()
        {

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