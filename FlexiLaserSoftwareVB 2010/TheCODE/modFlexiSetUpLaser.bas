Attribute VB_Name = "modSetUpLaser"
Option Explicit
'====================================================
'   Agilent update - Routine removed By SBB 8/3/2010
'====================================================
'Sub setuplaser(BenchUsed, Units)
'Dim ErrMsg As String * 100
'Dim laser As Integer
'Call ibdev(0, 3, 0, 13, 1, 0, laser)
'' Define device desription
'Call ibwrt(laser, "M1" + Chr$(10))
''Puts laser into distance mode
'Call ibwrt(laser, BenchUsed + Chr$(10))
''Set laser to single pass (Flexi length) or double pass (Rigid length)
'Call ibwrt(laser, Units + Chr$(10))
''Set units (UM for metric or UE for imperial, values passed from
''frmMeasurementselection form.
'Call ibonl(laser, 0)
''Places Laser interface offline
'    If (ibsta And EERR) Then
'    ' Error trap for device problems
'        ErrMsg = "Unable to open device" & Chr(13) & "ibsta = &H" & _
'        Hex(ibsta) & Chr(13) & "iberr = " & iberr
'        MsgBox ErrMsg, vbCritical, "Error"
'        End
'    End If
'End Sub
'=================================
'   End of Removal
'=================================
Public Sub SetLaserParameter(id As Long, dbValue As Double)
'=====================================================
'   Routine Added for Agilent SBB 8/3/2010
'=====================================================
'   Set up the parameters for the laser
'    OP_WAVELENGTH = 0    'Vacuum wavelength of laser head
'    OP_AIRTEMP = 1      'Air temperature
'    OP_AIRPRES = 2      'Air pressure
'    OP_RELHUMI = 3      'Relative humidity
'    OP_AIRCOMP = 4      'Wavelength compensation number
'    OP_MATTEMP = 5      'Material temperature
'    OP_MATEXPN = 6      'Material expansion coefficient
'    OP_MATCOMP = 7      'Material compensation number
'    OP_ALLCOMP = 8      'Total compensation number
'    OP_LASERSENSE = 9    'Laser direction sense
'    OP_SCALEFACTOR = 10  'Linear scaling factor
'    OP_EQUIVALENT = 11   'Equivalent number for calculation
'    OP_UNITSCALE = 12    'Scale factor of unit
'    OP_ARMLENGTH = 13    'Arm length (angular)
'    OP_FOOTSPACE = 14    'Foot space (flatness)
'    OP_SPLITANGLE = 15   'Split angle (straightness)
'    OP_DEADPATH = 16    'Dead path (linear, plane mirror)
Debug.Print "id: ", id
Call E1735A_SetParameter(id, dbValue)

End Sub

