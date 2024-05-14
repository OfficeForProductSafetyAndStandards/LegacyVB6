Attribute VB_Name = "Agilent_1735A"
' <copyright file="E1735A.bas" company="Agilent Technologies">
' Copyright (c) 2008 All Right Reserved
' </copyright>
' <summary>
'   Contains E1735A.DLL interface.
' </summary>
' <Version>
'   1.0.0.0
' </Version>

Option Explicit

'error codes
Public Enum T_LAST_ERROR
    EC_NoError = 0       'No error from board
    EC_UnknownError = 1   'unknown exception
    EC_AccessDenied = 2   'failed to access registers of E1735A
    EC_BadParameter = 3   'parameter out of range
    EC_EmptyBuffer = 11   'read empty buffer
    EC_BufferFull = 12    'hardware/software buffer full
    EC_SampleLost = 13    'samples are copied to NULL pointer
    EC_TimerStillOn = 14  'timer is still on
    EC_TimerIsOff = 15    'for TimerSamples
    EC_TimeError = 16    'for TimerSamples
    EC_MemoryFull = 17    'for TimerSamples
    EC_NoSample = 18     'for ReadSampleAndAQB
    EC_LaserOff = 21     'no ref. signal
    EC_NoReturn = 22     'no mea. signal
    EC_RefSigLost = 23    'reg. signal was lost
    EC_MeaSigLost = 24    'mea. signal was lost
    EC_BadRefSig = 25    'glitch error found in reg. signal
    EC_BadMeaSig = 26    'glitch error found in mea. signal
    EC_IgnoredTrig = 27   'lost of external trig or others under timer
    EC_OutOfRange = 28    'mea. position too large
End Enum

'Return values for E1735A_LastTrigger()
Public Enum T_LAST_TRIGGER
    TT_TIMER = 0      'Trigged by timer of E1735A
    TT_AQBNEG = 1     'Trigged by underflow of AQB Counter
    TT_REMOTE = 2     'Trigged by recore button of remote control
    TT_EXTERNAL = 3    'Trigged by external sampling signal
    TT_SOFTWARE = 4    'Trigged by Software
    TT_AQBPOS = 5     'Trigged by overflow of AQB Counter
    TT_NONE = 255      'Bad sample data or execption
End Enum

'bits useds as mask for to filter samples based on trigger types, only used
Public Const TB_TIMER As Long = 1       'timer of E1735A
Public Const TB_SOFTWARE As Long = 2    'software trigged
Public Const TB_REMOTE As Long = 4      'record button of remote controller
Public Const TB_AQB As Long = 8        'A quad B signal or Up/Down pulse
Public Const TB_EXTERNAL As Long = &H10    'external trig signal (Pin 8 of AQB connector)


'AQB setting constant, used with  E1735A_SetupAQB
Public Const SC_DISABLEAQB As Long = 0     'disable AQB sampling in AQB mode
Public Const SC_ENABLEAQB As Long = 1      'enable AQB sampling in AQB mode
Public Const SC_DISABLEUPDN As Long = 2    'disable AQB sampling in up/down pulse mode
Public Const SC_ENABLEUPDN As Long = 3     'enable AQB sampling in up/down pulse mode

'button clicked, used with E1735A_ReadButtonClicked()
Public Const BC_NONE As Long = 0           'no button is clicked
Public Const BC_RECORED As Long = 1        'record button is clicked
Public Const BC_RESET As Long = 2          'reset button is clicked
Public Const BC_BOTH As Long = 3           'both buttons are clicked

'Optic type parameter for E1735A_SetOptics() and E1735A_GetOptics() routines
Public Enum T_OPTIC_TYPE
    OT_LINEAR = 0          'Linear interferometer
    OT_PLANEMIRROR = 1      'Plane mirror interferometer
    OT_HIGHRESOLUTION = 2    'High resolution interferometer
    OT_ANGULAR = 3         'Angular interferometer
    OT_STRAIGHTNESS = 4     'Straightness interferometer
    OT_PARALLELISM = 5      'Parallelism interferometer
    OT_SQUARENESS = 6       'Squareness interferometer
    OT_WAYSTRAIGHTNESS = 7   'Way straightness interferometer
    OT_FLATNESS = 8        'Flatness interferometer
End Enum

'parameters, used with  E1735A_SetParameter and  E1735A_GetParameter
Public Enum T_PARAMETER_INDEX
    OP_WAVELENGTH = 0    'acuum wavelength of laser head
    OP_AIRTEMP = 1      'Air temperature
    OP_AIRPRES = 2      'Air pressure
    OP_RELHUMI = 3      'Relative humidity
    OP_AIRCOMP = 4      'Wavelength compensation number
    OP_MATTEMP = 5      'Material temperature
    OP_MATEXPN = 6      'Material expansion coefficient
    OP_MATCOMP = 7      'Material compensation number
    OP_ALLCOMP = 8      'Total compensation number
    OP_LASERSENSE = 9    'Laser direction sense
    OP_SCALEFACTOR = 10  'Linear scaling factor
    OP_EQUIVALENT = 11   'Equivalent number for calculation
    OP_UNITSCALE = 12    'Scale factor of unit
    OP_ARMLENGTH = 13    'Arm length (angular)
    OP_FOOTSPACE = 14    'Foot space (flatness)
    OP_SPLITANGLE = 15   'Split angle (straightness)
    OP_DEADPATH = 16    'Dead path (linear, plane mirror)
End Enum

'Default Values of parameters
Public Const OP_WAVELENGTH_DEFAULT As Double = 632.991354
Public Const OP_AIRTEMP_DEFAULT As Double = 20
Public Const OP_AIRPRES_DEFAULT As Double = 101.325
Public Const OP_RELHUMI_DEFAULT As Double = 50
Public Const OP_MATTEMP_DEFAULT As Double = 20
Public Const OP_MATEXPN_DEFAULT As Double = 11.7
Public Const OP_LASERSENSE_DEFAULT As Double = 1
Public Const OP_SCALEFACTOR_DEFAULT As Double = 1
Public Const OP_UNITSCALE_DEFAULT As Double = 0.001
Public Const OP_ARMLENGTH_DEFAULT As Double = 32.16
Public Const OP_FOOTSPACE_DEFAULT As Double = 100
Public Const OP_SPLITANGLE_DEFAULT As Double = 1.5916
Public Const OP_DEADPATH_DEFAULT As Double = 0


'minimum values of parameters
Public Const OP_WAVELENGTH_MIN As Double = 632.99
Public Const OP_AIRTEMP_MIN As Double = 0
Public Const OP_AIRPRES_MIN As Double = 70
Public Const OP_RELHUMI_MIN As Double = 0
Public Const OP_AIRCOMP_MIN As Double = 0.99
Public Const OP_MATTEMP_MIN As Double = 0
Public Const OP_MATEXPN_MIN As Double = 0
Public Const OP_MATCOMP_MIN As Double = 0.99
Public Const OP_ALLCOMP_MIN As Double = 0.99
Public Const OP_LASERSENSE_MIN As Double = -1
Public Const OP_SCALEFACTOR_MIN As Double = 0.01
Public Const OP_EQUIVALENT_MIN As Double = 1E-20
Public Const OP_UNITSCALE_MIN As Double = 1E-20
Public Const OP_ARMLENGTH_MIN As Double = 10
Public Const OP_FOOTSPACE_MIN As Double = 10
Public Const OP_SPLITANGLE_MIN As Double = 0.001
Public Const OP_DEADPATH_MIN As Double = 0


'maximum values of parameters
Public Const OP_WAVELENGTH_MAX As Double = 632.992
Public Const OP_AIRTEMP_MAX As Double = 40
Public Const OP_AIRPRES_MAX As Double = 110
Public Const OP_RELHUMI_MAX As Double = 100
Public Const OP_AIRCOMP_MAX As Double = 1
Public Const OP_MATTEMP_MAX As Double = 40
Public Const OP_MATEXPN_MAX As Double = 1000
Public Const OP_MATCOMP_MAX As Double = 1
Public Const OP_ALLCOMP_MAX As Double = 1
Public Const OP_LASERSENSE_MAX As Double = 1
Public Const OP_SCALEFACTOR_MAX As Double = 397
Public Const OP_EQUIVALENT_MAX As Double = 1E+20
Public Const OP_UNITSCALE_MAX As Double = 1E+20
Public Const OP_ARMLENGTHE_MAX As Double = 10000
Public Const OP_FOOTSPACEE_MAX As Double = 1000
Public Const OP_SPLITANGLEE_MAX As Double = 10
Public Const OP_DEADPATHE_MAX As Double = 10000

Type TLaserSample
  LaserPos As Double    'sample value, refer to E1735A_ReadSample
  TimeStamp As Currency  'time stamp, refer to E1735A_ReadLastTimeStamp
  LaserTrigger As Long    'trigger, refer to E1735A_ReadLastTrigger
  LaserError As Long    'error code, refer to E1735A_ReadLastError
End Type

Public Declare Function E1735A_GetAllRevisions Lib "E1735A.dll" (ByRef HWRevPtr As Long, ByRef FWRevPtr As Long, ByRef DrvRevPtr As Long, ByRef CoreDLLRevPtr As Long, ByRef DLLRevPtr As Long) As Boolean

Public Declare Function E1735A_ReadDeviceCount Lib "E1735A.dll" () As Long

Public Declare Function E1735A_SelectDevice Lib "E1735A.dll" (ByVal DevNum As Long) As Boolean

Public Declare Function E1735A_SetSampleTriggers Lib "E1735A.dll" (ByVal TriggerType As Long) As Boolean

Public Declare Function E1735A_GetSampleTriggers Lib "E1735A.dll" () As Long

Public Declare Function E1735A_BlinkLED Lib "E1735A.dll" () As Boolean

Public Declare Function E1735A_ResetDevice Lib "E1735A.dll" () As Boolean

Public Declare Function E1735A_SetupAQB Lib "E1735A.dll" (ByVal Modulo As Long, ByVal Hysteresis As Long, ByVal Settings As Long) As Boolean

Public Declare Function E1735A_SetupTimer Lib "E1735A.dll" (ByVal Interval As Double) As Boolean

Public Declare Function E1735A_StartTimer Lib "E1735A.dll" () As Boolean

Public Declare Function E1735A_StopTimer Lib "E1735A.dll" () As Boolean

Public Declare Function E1735A_ReadSampleCount Lib "E1735A.dll" () As Long

Public Declare Function E1735A_ReadSample Lib "E1735A.dll" () As Double

Public Declare Function E1735A_ReadAllSamples Lib "E1735A.dll" (ByRef BufferPtr As TLaserSample, ByVal BufferSize As Long) As Long


Public Declare Function E1735A_ReadTimerSamples Lib "E1735A.dll" (ByVal Count As Long) As Long

Public Declare Function E1735A_ReadSampleAndAQB Lib "E1735A.dll" (ByRef AQB As Long) As Double

Public Declare Function E1735A_ReadLastTimeStamp Lib "E1735A.dll" () As Currency

Public Declare Function E1735A_ReadLastTrigger Lib "E1735A.dll" () As Long

Public Declare Function E1735A_ReadButtonClicked Lib "E1735A.dll" () As Long

Public Declare Function E1735A_ReadBeamStrength Lib "E1735A.dll" () As Double

Public Declare Function E1735A_ReadAQB Lib "E1735A.dll" () As Long

Public Declare Function E1735A_ReadLastError Lib "E1735A.dll" () As Long

Public Declare Function E1735A_SetOptics Lib "E1735A.dll" (ByVal NewOptics As Long) As Boolean

Public Declare Function E1735A_GetOptics Lib "E1735A.dll" () As Long

Public Declare Function E1735A_SetParameter Lib "E1735A.dll" (ByVal Index As Long, ByVal Value As Double) As Boolean

Public Declare Function E1735A_GetParameter Lib "E1735A.dll" (ByVal Index As Long) As Double

Public Declare Function E1735A_StartExternalSampling Lib "E1735A.dll" () As Boolean

Public Declare Function E1735A_StopExternalSampling Lib "E1735A.dll" () As Boolean




