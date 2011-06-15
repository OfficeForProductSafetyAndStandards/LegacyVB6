'
' Gpib488Test.vb - GPIB-488 Demo Program for VB.NET Language Interface
'
' Copyright Quality Instrumentation Solutions, Inc. and its licensors (c) 2009
' All Rights Reserved.
'

Imports System
Imports System.Text
Imports System.Runtime.InteropServices

'
'  This sample application is comprised of three basic parts:
'
'  1. Initialization
'  2. Main Body
'  3. Cleanup
'
'  The Initialization portion consists of initializing the bus and the
'  GPIB interface board so that the GPIB board is Controller-In-Charge
'  (CIC). Next it finds all the listeners and then clears all the
'  devices on the bus.
'
'  In the Main Body, this application queries a device for its
'  identification code by issuing the '*IDN?' command. Many
'  instruments respond to this command with an identification string.
'  Note, 488.2 compliant devices are required to respond to this
'  command.
'
'  The last step takes the board offline.
'
Module _4882Query

    Private Const ARRAYSIZE As Integer = 100
    Private Num_Listeners As Integer
    Private loops As Integer
    Private board As Integer
    Private Instruments As Short()
    Private Results As Short()
    Private ReadBuffer As StringBuilder
    Private ErrorMnemonic As String() = { _
        "EDVR", "ECIC", "ENOL", "EADR", "EARG", _
        "ESAC", "EABO", "ENEB", "EDMA", "", _
        "EOIP", "ECAP", "EFSO", "", "EBUS", _
        "ESTB", "ESRQ", "", "", "", _
        "ETAB"}

    <DllImport("msvcrt.dll")> _
    Private Function _getch() As Char
    End Function

    Sub Main()

        Try
            '
            ' Allocate memory space for the classes and arrays
            '
            ReadBuffer = New StringBuilder(200)
            Instruments = New Short(32) {}
            Results = New Short(31) {}
            board = 0

            '
            ' Your board needs to be the Controller-In-Charge in order to find
            ' all listeners on the GPIB.  To accomplish this, the function
            ' SendIFC is called.  If the error bit ERR is set in ibsta, throw
            ' an error message.
            '
            QISI.Gpib488.SendIFC(board)
            If QISI.Gpib488.Ibsta() And QISI.Gpib488Consts.EERR Then
                Throw New System.Exception("Unable to open board")
            End If

            '
            ' Create an array containing all valid GPIB primary addresses,
            ' except for primary address 0.  Your GPIB interface board is at
            ' address 0 by default.  This array (Instuments) will be given to
            ' the function FindLstn to find all listeners.
            '
            For loops = 0 To 29
                Instruments(loops) = loops + 1
            Next

            Instruments(30) = QISI.Gpib488Consts.NOADDR

            '
            ' Print message to tell user that the program is searching for all
            ' active listeners.  Find all of the listeners on the bus.  Store
            ' the listen addresses in the array Result.  Note, the instruments
            ' must be powered on and connected with a GPIB cable in order for
            ' FindLstn to detect them.  If the error bit ERR is set in ibsta,
            ' throw an error message.
            '
            Console.WriteLine("Finding all listeners on the bus ...")
            QISI.Gpib488.FindLstn(board, Instruments, Results, 31)
            If QISI.Gpib488.Ibsta() And QISI.Gpib488Consts.EERR Then
                Throw New System.Exception("Unable to issue FindLstn call")
            End If

            '
            ' Ibcnt contains the actual number of addresses stored in the
            ' Result array. Assign the value of ibcntl to the variable
            ' Num_Listeners. Print the number of listeners found.
            '
            Num_Listeners = QISI.Gpib488.Ibcnt()
            Console.WriteLine("Number of Instruments found = " + Num_Listeners.ToString())

            '
            ' The Result array contains the addresses of all listening devices
            ' found by FindLstn. Use the constant NOADDR, as defined in
            ' GPIBConstants to terminate the array.
            '
            Results(Num_Listeners) = QISI.Gpib488Consts.NOADDR

            '
            ' DevClearList will send the GPIB Selected Device Clear (SDC)
            ' command message to all the devices on the bus.  If the error bit
            ' ERR is set in ibsta, throw an error message.
            '
            QISI.Gpib488.DevClearList(board, Results)
            If QISI.Gpib488.Ibsta() And QISI.Gpib488Consts.EERR Then
                Throw New System.Exception("Unable to clear devices")
            End If

            '
            ' Send the identification query to each listen address in the array
            ' (Result) using SendList.  The constant NLend, defined in GPIBConstants,
            ' instructs the function SendList to append a linefeed character
            ' with EOI asserted to the end of the message.  If the error bit ERR
            ' is set in ibsta, throw an error message.
            '
            QISI.Gpib488.SendList(board, Results, "*IDN?", 5, QISI.Gpib488Consts.NLend)
            If QISI.Gpib488.Ibsta() And QISI.Gpib488Consts.EERR Then
                Throw New System.Exception("Unable to write to devices")
            End If

            '
            ' Read each device's identification code, one at a time.
            '
            ' Establish a FOR loop to read each one of the device's
            ' identification code. The variable LOOP will serve as a counter
            ' for the FOR loop and as the index to the array Result.
            '
            Console.WriteLine("Returned string:")
            For loops = 0 To Num_Listeners - 1
                '
                ' Read the name identification response returned from each
                ' device. Store the response in the array ReadBuffer.  The
                ' constant STOPend, defined in GPIBConstants, instructs the
                ' function Receive to terminate the read when END is detected.
                ' If the error bit ERR is set in ibsta, throw an error message
                '
                QISI.Gpib488.Receive(board, Results(loops), ReadBuffer, ARRAYSIZE, QISI.Gpib488Consts.STOPend)
                Console.WriteLine("Address: " + Results(loops).ToString() + ", " + ReadBuffer.ToString())
            Next

            ' Take board offline
            Console.WriteLine("Taking board offline")
            QISI.Gpib488.ibonl(board, 0)

        Catch ex As Exception
            ' Print out error message
            Console.WriteLine( _
                System.Environment.NewLine + _
                "Error: " + ex.Message + System.Environment.NewLine)
        Finally
            ' Allow user to see output before exiting
            Console.WriteLine(System.Environment.NewLine + "Hit any key to exit")
            _getch()
        End Try

    End Sub

End Module
