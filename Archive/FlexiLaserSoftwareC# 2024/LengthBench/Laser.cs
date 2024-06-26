﻿

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Threading;
using System.Reflection;
using static System.Net.Mime.MediaTypeNames;
using Windows.Graphics;
using System.Security.Cryptography.X509Certificates;

namespace LengthBench
{

    

    static class LaserConstants
    {
        private const byte EC_NOERROR = 0;
        private const byte EC_UNKNOWNERROR = 1;
        private const byte EC_ACCESSDENIED = 2;
        private const byte EC_BADPARAMETER = 3;
        private const byte EC_EMPTYBUFFER = 11;
        private const byte EC_BUFFERFULL = 12;
        private const byte EC_SAMPLELOST = 13;
        private const byte EC_TIMERSTILLON = 14;
        private const byte EC_TIMERISOFF = 15;
        private const byte EC_TIMEERROR = 16;
        private const byte EC_MEMORYFULL = 17;
        private const byte EC_NOSAMPLE = 18;
        private const byte EC_LASEROFF = 21;
        private const byte EC_NORETURN = 22;
        private const byte EC_REFSIGLOST = 23;
        private const byte EC_MEASIGLOST = 24;
        private const byte EC_BADREFSIG = 25;
        private const byte EC_BADMEASIG = 26;
        private const byte EC_IGNOREDTRIG = 27;
        private const byte EC_OUTOFRANGE = 28;
        private const byte TB_TIMER = 0x01;
        private const byte TB_SOFTWARE = 0x02;
        private const byte TB_REMOTE = 0x04;
        private const byte TB_AQB = 0x08;
        private const byte TB_EXTERNAL = 0x10;
        private const byte SC_DISABLEAQB = 0;
        private const byte SC_ENABLEAQB = 1;
        private const byte SC_DISABLEUPDN = 2;
        private const byte SC_ENABLEUPDN = 3;
        private const byte BC_NONE = 0;
        private const byte BC_RECORD = 1;
        private const byte BC_RESET = 2;
        private const byte BC_BOTH = 3;

    }

    

    struct LaserParameters
    {

        public const int OP_WAVELENGTH = 0;
        public const int OP_AIRTEMP = 1;
        public const int OP_AIRPRES = 2;
        public const int OP_RELHUMI = 3;
        public const int OP_AIRCOMP = 4;
        public const int OP_MATTEMP = 5;
        public const int OP_MATEXPN = 6;
        public const int OP_MATCOMP = 7;
        public const int OP_ALLCOMP = 8;
        public const int OP_LASERSENSE = 9;
        public const int OP_SCALEFACTOR = 10;
        public const int OP_EQUIVALENT = 11;
        public const int OP_UNITSCALE = 12;
        public const int OP_ARMLENGTH = 13;
        public const int OP_FOOTSPACE = 14;
        public const int OP_SPLITANGLE = 15;
        public const int OP_DEADPATH = 16;

        
    }

    
    struct TLaserSample
    {
        // double LaserPos;
        // ulong TimeStamp;
        // int LaserTrigger;
        //  int LaserError;
    }
    

    struct LaserErrorMessage{
        public const string NoDevicesConnected = "The E1735A is not registed as connected with the computer.  Connect the E1735A and restart the application.  Note the E1735A.dll and E1735ACore.dll and the .sys file need to be in the SysWOW64 folder of System32 directory depending on whether you have a 32-Bit or a 64-bit OS";
        public const string LostEstablishedConnection = "The E1735 has lost a previously established connection. Check the device is still attached, do you want to close the application and restart?";
        public const string BeamStrengthLow = "Beam Strength Low or Beam interupted, resolve this and press OK to continue";
        public const string NoError = "";
        
    }

    public class NoDevicesConnectedException : System.ApplicationException
    {
        public NoDevicesConnectedException() { }
        public NoDevicesConnectedException(string message) { }
        public NoDevicesConnectedException(string message, System.Exception inner) { } 
    }

    public class BeamStrengthLow : System.ApplicationException
    {
        public BeamStrengthLow() { }
        public BeamStrengthLow(string message) { }
        public BeamStrengthLow(string message, System.Exception inner) { }
    }

    

    public struct ProcName
    {
        public const short E1735A_READ_DEVICE_COUNT = 0;
        public const short E1735A_SELECT_DEVICE = 1;
        public const short E1735A_GET_ALL_REVISIONS = 2;
        public const short E1735A_BLINK_LED = 3;
        public const short E1735A_RESET_DEVICE = 4;
        public const short E1735A_READ_LAST_ERROR = 5;
        public const short E1735A_READ_SAMPLE_COUNT = 6;
        public const short E1735A_READ_SAMPLE = 7;
        public const short E1735A_READ_ALL_SAMPLES = 8;
        public const short E1735A_READ_LAST_TRIGGER = 9;
        public const short E1735A_READ_LAST_TIMESTAMP = 10;
        public const short E1735A_SET_SAMPLE_TRIGGERS = 11;
        public const short E1735A_GET_SAMPLE_TRIGGERS = 12;
        public const short E1735A_SET_UP_TIMER = 13;
        public const short E1735A_START_TIMER = 14;
        public const short E1735A_STOP_TIMER = 15;
        public const short E1735A_READ_TIMER_SAMPLES = 16;
        public const short E1735A_SET_UP_AQB = 17;
        public const short E1735A_READ_AQB = 18;
        public const short E1735A_READ_SAMPLE_AND_AQB = 19;
        public const short E1735A_START_EXTERNAL_SAMPLING = 20;
        public const short E1735A_STOP_EXTERNAL_SAMPLING = 21;
        public const short E1735A_READ_BUTTON_CLICKED = 22;
        public const short E1735A_READ_BEAM_STRENGTH = 23;
        public const short E1735A_SET_OPTICS = 24;
        public const short E1735A_GET_OPTICS = 25;
        public const short E1735A_SET_PARAMETER = 26;
        public const short E1735A_GET_PARAMETER = 27;
        public const short IDLE = 255;
    }

    public class Laser
    {
        
        //LaserUpdateGui invoke_gui;
        private volatile short next_exec = 0;
        private double laser_pos = 0.0;
        private bool dll_needs_loading;
        private int device_count = 0;
        private bool query = true;
        private bool error_state = true;
        private double bs = 0.0;
        private bool laser_operation_normal = false;

       // private int enviromental_to_get_or_set = 0;
        private double laser_wavelength = 0;
        private double laser_airtemp = 0;
        private double laser_airpres = 0;
        private double laser_relhumi = 0;
        private double laser_aircomp = 0;
        private double laser_mattemp = 0;
        private double laser_matexpn = 0;
        private double laser_matcomp = 0;
        private double laser_allcomp = 0;
        private double laser_lasersense = 0;
        private double laser_scalefactor = 0;
        private double laser_equivalent = 0;
        private double laser_unitscale = 0;
        private double laser_armlength = 0;
        private double laser_footspace = 0;
        private double laser_splitangle = 0;
        private double laser_deadpath = 0;




        public IntPtr Handle_E1735A_DLL;
        public IntPtr FuncAddr_E1735A_ReadDeviceCount;
        public IntPtr FuncAddr_E1735A_SelectDevice;
        public IntPtr FuncAddr_E1735A_GetAllRevisions;
        public IntPtr FuncAddr_E1735A_BlinkLED;
        public IntPtr FuncAddr_E1735A_ResetDevice;
        public IntPtr FuncAddr_E1735A_ReadLastError;
        public IntPtr FuncAddr_E1735A_ReadSampleCount;
        public IntPtr FuncAddr_E1735A_ReadSample;
        public IntPtr FuncAddr_E1735A_ReadLastTrigger;
        public IntPtr FuncAddr_E1735A_ReadLastTimeStamp;
        public IntPtr FuncAddr_E1735A_ReadAllSamples;
        public IntPtr FuncAddr_E1735A_SetSampleTriggers;
        public IntPtr FuncAddr_E1735A_GetSampleTriggers;
        public IntPtr FuncAddr_E1735A_SetupTimer;
        public IntPtr FuncAddr_E1735A_StartTimer;
        public IntPtr FuncAddr_E1735A_StopTimer;
        public IntPtr FuncAddr_E1735A_ReadTimerSamples;
        public IntPtr FuncAddr_E1735A_SetupAQB;
        public IntPtr FuncAddr_E1735A_ReadAQB;
        public IntPtr FuncAddr_E1735A_ReadSampleAndAQB;
        public IntPtr FuncAddr_E1735A_StartExternalSampling;
        public IntPtr FuncAddr_E1735A_StopExternalSampling;
        public IntPtr FuncAddr_E1735A_ReadButtonClicked;
        public IntPtr FuncAddr_E1735A_ReadBeamStrength;
        public IntPtr FuncAddr_E1735A_SetOptics;
        public IntPtr FuncAddr_E1735A_GetOptics;
        public IntPtr FuncAddr_E1735A_SetParameter;
        public IntPtr FuncAddr_E1735A_GetParameter;


        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_ReadDeviceCount(); //Get number of available E1735A devices
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_SelectDevice(int Index); //Select an active device for further accessing
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_GetAllRevisions(ref uint pHWRev, ref uint pFWRev, ref uint pDrvRev, ref uint PCoreDLLRev, ref uint PDLLRev); //Return revision information of active device
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_BlinkLED(); //Blink “R/W” LED   
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_ResetDevice(); //Reset laser position, clear buffers and error flags  
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_ReadLastError(); //Get the error code of last operation

        //• Reading Samples    
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_ReadSampleCount(); //Get number of available samples that can be read 
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate double E1735A_ReadSample(); //Read one laser position
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_ReadLastTrigger(); //Get the trigger of the sample that was just read  
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate long intE1735A_ReadLastTimeStamp(); //Get the time stamp of the sample that was just read  
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_ReadAllSamples(ref TLaserSample pBuf, int BufSize); //Copy all captured samples to user’s buffer   
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_SetSampleTriggers(int TriggerTypes); //Enable/disable sample collecting of referred triggers     
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_GetSampleTriggers(); //Read back the setting of E1735A_SetSampleTriggers

        //• Time Base Sampling       
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_SetupTimer(double Interval); //Set interval of timer   
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_StartTimer(int Count); //Run timer, samples are automatically trigged by timer 
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_StopTimer(); //Stop timer
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate double E1735A_ReadTimerSamples(ref int PAQBData); //Get timer-trigged samples directly


        //• AQB Sampling    
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_SetupAQB(int Modulo, int Hysterisis, int Settings); //Set AQB sampling, mode, modulo and hysteresis
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_ReadAQB(); //Get current value of AQB counter    
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate double E1735A_ReadSampleAndAQB(); //Get laser sample and AQB count simultaneously

        //• External Sampling
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool intE1735A_StartExternalSampling(); //Enable sampling of external trigger signal
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool intE1735A_StopExternalSampling();  //Disable sampling of external trigger signal

        //• Reading Status
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_ReadButtonClicked(); //Get if record and/or reset button on remote control is clicked
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate double E1735A_ReadBeamStrength(); //Get strength of returning beam

        //• Configuring Optical Parameters
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate bool E1735A_SetOptics(int Optics); //Set type of interferometer
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_GetOptics(); //Read back setting of E1735A_SetOptics
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate int E1735A_SetParameter(int Index, double Value); //Set parameters of environment and interferometer
        [UnmanagedFunctionPointer(CallingConvention.StdCall)]
        private delegate double E1735A_GetParameter(int Index); //Read back


        struct NativeMethods
        {
            [DllImport("kernel32.dll")]
            public static extern IntPtr LoadLibrary(string dllToLoad);

            [DllImport("kernel32.dll")]
            public static extern IntPtr GetProcAddress(IntPtr hModule, string procedureName);

            [DllImport("kernel32.dll")]
            public static extern bool FreeLibrary(IntPtr hModule);

            [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
            [return: MarshalAs(UnmanagedType.Bool)]
            public static extern bool SetDllDirectory(string lpPathName);

            [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
            [return: MarshalAs(UnmanagedType.Bool)]
            public static extern bool FreeLibraryAndExitThread(IntPtr hModule, uint dwExitCode);
        }

       
      
        public Laser()
        {

        }
        public bool ErrorState
        {
            get
            {
                return error_state;
            }
            set
            {
                error_state = value;
            }
        }
        public bool LoadDll
        {
            get
            {
                return dll_needs_loading;
            }
            set
            {
                dll_needs_loading = value;
            }
        }

        public int deviceCount
        {
            get
            {
                return device_count;
            }
            set
            {
                device_count = value;
            }
        }

        public int readDeviceCnt()
        {
            try
            {
                E1735A_ReadDeviceCount dev_cnt = (E1735A_ReadDeviceCount)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_ReadDeviceCount, typeof(E1735A_ReadDeviceCount));
                device_count = dev_cnt();
                return device_count;
            }
            catch(ArgumentNullException)
            {
                return 0;
            }
               

        }

        public bool setDevice()
        {

            E1735A_SelectDevice dev_set = (E1735A_SelectDevice)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_SelectDevice, typeof(E1735A_SelectDevice));
            bool result = true;
            result = dev_set(device_count);
            return result;

        }

        public bool blink()
        {

            E1735A_BlinkLED blink = (E1735A_BlinkLED)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_BlinkLED, typeof(E1735A_BlinkLED));
            return blink();
        }

        public bool getALLRevs()
        {
            uint hardwareRev = 0;
            uint softwareRev = 0;
            uint windrvr_rev = 0;
            uint coredll_rev = 0;
            uint dll_rev = 0;

            E1735A_GetAllRevisions revs = (E1735A_GetAllRevisions)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_GetAllRevisions, typeof(E1735A_GetAllRevisions));
            bool result = revs(ref hardwareRev, ref softwareRev, ref windrvr_rev, ref coredll_rev, ref dll_rev);

            return result;

        }

        public double ReadFlexiBeamStrength()
        {
            E1735A_ReadBeamStrength b_strength = (E1735A_ReadBeamStrength)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_ReadBeamStrength, typeof(E1735A_ReadBeamStrength));

            return b_strength();
        }

        public double ReadRigidBeamStrength()
        {
            E1735A_ReadBeamStrength b_strength = (E1735A_ReadBeamStrength)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_ReadBeamStrength, typeof(E1735A_ReadBeamStrength));

            return b_strength();
        }

        public double getParameter(int index)
        {
            E1735A_GetParameter par = (E1735A_GetParameter)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_GetParameter, typeof(E1735A_GetParameter));
            return par(index);
        }

        public double setParameter(int index,double value)
        {
            E1735A_SetParameter par = (E1735A_SetParameter)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_SetParameter, typeof(E1735A_SetParameter));
            return par(index,value);
        }

        public double ReadFlexiSample()
        {
            E1735A_ReadSample r_sample = (E1735A_ReadSample)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_ReadSample, typeof(E1735A_ReadSample));

            return -1*r_sample()/1000;
        }

        public void Reset()
        {
            E1735A_ResetDevice r_device = (E1735A_ResetDevice)Marshal.GetDelegateForFunctionPointer(FuncAddr_E1735A_ResetDevice, typeof(E1735A_ResetDevice));

            r_device();
        }
        public double R_Sample
        {
            
            get
            {
                
                  return laser_pos;
                
            }
            set
            {
               
                  laser_pos = value;
              
            }
        
        }

        public double B_Strength
        {
            get
            {
                  return bs;
                
            }
            set
            {
                
                  bs = value;
                
            }
        }

        public bool LaserOperationState
        {
            get
            {
                return laser_operation_normal;
            }
        }

        /// <summary>
        /// The next procedure to execute.
        /// </summary>
        /// <param name="disposing">The next fuction to execute</param>
        public short procToDo
        {

            get
            {

                return next_exec;
            }
            set
            {

                next_exec = value;

            }


        }

        public bool QueryState
        {
            get
            {
                return query;
            }
            set
            {
                query = value;
            }

        
        }
        public double Wavelength
        {
            get
            {
                return laser_wavelength;
            }
            set{
                laser_wavelength = value;
            }
        }

        public double AirTemp
        {
            get
            {
                return laser_airtemp;
            }
            set
            {
                laser_airtemp = value;
            }
        }

        public double AirPres
        {
            get
            {
                return laser_airpres;
            }
            set
            {
                laser_airpres = value;
            }
        }

        public double RelativeHumidity
        {
            get
            {
                return laser_relhumi;
            }
            set
            {
                laser_relhumi = value;
            }
        }

        public double AirCompensation
        {
            get
            {
                return laser_aircomp;
            }
            set
            {
                laser_aircomp = value;
            }
        }

        public double MaterialTemperature
        {
            get
            {
                return laser_mattemp;
            }
            set
            {
                laser_mattemp = value;
            }
        }

        public double MaterialExpansion
        {
            get
            {
                return laser_matexpn;
            }
            set
            {
                laser_matexpn = value;
            }
        }

        public double MaterialCompensation
        {
            get
            {
                return laser_matcomp;
            }
            set
            {
                laser_matcomp = value;
            }
        }

        public double TotalCompensation
        {
            get
            {
                return laser_allcomp;
            }
            set
            {
                laser_allcomp = value;
            }
        }

        public double LaserDirectionSense
        {
            get
            {
                return laser_lasersense;
            }
            set
            {
                laser_lasersense= value;
            }
        }

        public double LaserScaleFactor
        {
            get
            {
                return laser_scalefactor;
            }
            set
            {
                laser_scalefactor = value;
            }
        }

        public double LaserEquivalent
        {
            get
            {
                return laser_equivalent;
            }
            set
            {
                laser_equivalent = value;
            }
        }

        public double LaserUnitScale
        {
            get
            {
                return laser_unitscale;
            }
            set
            {
                laser_unitscale = value;
            }
        }

        public double LaserArmLength
        {
            get
            {
                return laser_armlength;
            }
            set
            {
                laser_armlength = value;
            }
        }

        public double LaserFootSpace
        {
            get
            {
                return laser_footspace;
            }
            set
            {
                laser_footspace = value;
            }
        }

        public double LaserSplitAngle
        {
            get
            {
                return laser_splitangle;
            }
            set
            {
                laser_splitangle = value;
            }
        }

        public double LaserDeadPath
        {
            get
            {
                return laser_deadpath;
            }
            set
            {
                laser_deadpath = value;
            }
        } 
        


        public void InitDLL()
        {
            Initialize_E1735A_DLL();
        }

        public IntPtr Handle
        {

            get
            {
                return Handle_E1735A_DLL;
            }
            set
            {
                Handle_E1735A_DLL = value;
            }

        }

        public int Initialize_E1735A_DLL()
        {


            if (Handle_E1735A_DLL == IntPtr.Zero)
            {

                Handle_E1735A_DLL = NativeMethods.LoadLibrary(@"C:\Windows\SysWOW64\E1735A.dll");

                if (Handle_E1735A_DLL != IntPtr.Zero)
                {

                    FuncAddr_E1735A_ReadDeviceCount = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadDeviceCount");
                    FuncAddr_E1735A_SelectDevice = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_SelectDevice");
                    FuncAddr_E1735A_GetAllRevisions = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_GetAllRevisions");
                    FuncAddr_E1735A_BlinkLED = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_BlinkLED");
                    FuncAddr_E1735A_ResetDevice = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ResetDevice");
                    FuncAddr_E1735A_ReadLastError = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadLastError");
                    FuncAddr_E1735A_ReadSampleCount = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadSampleCount");
                    FuncAddr_E1735A_ReadSample = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadSample");
                    FuncAddr_E1735A_ReadAllSamples = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadAllSamples");
                    FuncAddr_E1735A_ReadLastTrigger = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadLastTrigger");
                    FuncAddr_E1735A_ReadLastTimeStamp = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadLastTimeStamp");
                    FuncAddr_E1735A_SetSampleTriggers = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_SetSampleTriggers");
                    FuncAddr_E1735A_GetSampleTriggers = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_GetSampleTriggers");
                    FuncAddr_E1735A_SetupTimer = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_SetupTimer");
                    FuncAddr_E1735A_StartTimer = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_StartTimer");
                    FuncAddr_E1735A_StopTimer = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_StopTimer");
                    FuncAddr_E1735A_ReadTimerSamples = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadTimerSamples");
                    FuncAddr_E1735A_SetupAQB = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_SetupAQB");
                    FuncAddr_E1735A_ReadAQB = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadAQB");
                    FuncAddr_E1735A_ReadSampleAndAQB = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadSampleAndAQB");
                    FuncAddr_E1735A_StartExternalSampling = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_StartExternalSampling");
                    FuncAddr_E1735A_StopExternalSampling = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_StopExternalSampling");
                    FuncAddr_E1735A_ReadButtonClicked = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadButtonClicked");
                    FuncAddr_E1735A_ReadBeamStrength = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_ReadBeamStrength");
                    FuncAddr_E1735A_SetOptics = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_SetOptics");
                    FuncAddr_E1735A_GetOptics = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_GetOptics");
                    FuncAddr_E1735A_SetParameter = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_SetParameter");
                    FuncAddr_E1735A_GetParameter = NativeMethods.GetProcAddress(Handle_E1735A_DLL, "E1735A_GetParameter");

                    return 0;
                }
                else return -1;

            }
            else return 1;

        }
        
  }
    
}
