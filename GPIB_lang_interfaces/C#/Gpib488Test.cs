//
// Gpib488Test.cs - GPIB-488 Demo Program for C# Language Interface
//
// Copyright Quality Instrumentation Solutions, Inc. and its licensors, (c) 2007
// All Rights Reserved.
//

using System;
using System.Text;
using System.Runtime.InteropServices; // Used for _getch() to monitor user inputs
using QISI;

namespace QISI
{
	/// <summary>
	/*
	 *
	 *  This sample application is comprised of three basic parts:
	 *
	 *  1. Initialization
	 *  2. Main Body
	 *  3. Cleanup
	 *
	 *  The Initialization portion consists of initializing the bus and the
	 *  GPIB interface board so that the GPIB board is Controller-In-Charge
	 *  (CIC). Next it finds all the listeners and then clears all the
	 *  devices on the bus.
	 *
	 *  In the Main Body, this application queries a device for its
	 *  identification code by issuing the '*IDN?' command. Many
	 *  instruments respond to this command with an identification string.
	 *  Note, 488.2 compliant devices are required to respond to this
	 *  command.
	 *
	 *  The last step takes the board offline.
	 *
	 */
	/// </summary>
	class _4882Query
	{
		private const int ARRAYSIZE = 100;       // size of ReadBuffer
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
		public static extern char _getch();   // Silently inputs a user keystroke

		[STAThread]
		static void Main(string[] args)
		{
			// try this block of code until an exception is thrown
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
	}
}
