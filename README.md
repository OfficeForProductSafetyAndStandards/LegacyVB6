# LegacyVB6 into C# 12 .NET 8

This is a dump of the existing source code for the flexi laser 50m system.
The code in use is the old flexi laser software 2004 - it doesnt seem to be complete in that the new code has .bas files etc. The new software vb source code hasnt been deployed yet. The existing code has been "ported" into  C# 12 and .NET 8 contained in the LengthBench directory there are a number of dependencies used by the code detailed at the bottom of the README.
The style is very similar to the vb code with extensive use of global variables setup in program.cs - this was in order to make comparison between the C# and vb6 as easy as possible. The user interface is in winforms not wpf as its substantially simpler to implement. The code has been ported from the NEW vb6 code not the old and has more stages than the previous program this was based from feedback from Oliver James who paired with me on this code as 
the SME. It probably needs to be refactored into a more OO style to aid maintainance. It is a working prototype not a production ready system.

External dependencies
Excel interop - C:\Program Files\Microsoft Office\root\Office16\excel.exe
Outlook interop for email - C:\Program Files\Microsoft Office\root\Office16\outlook.exe
MS serial com - C:\Windows\SysWOW64\mscomm32.ocx
Edale (flexi) laser driver - C:\Windows\SysWOW64\e1735a.dll
Edale (flexi) laser driver - C:\Windows\SysWOW64\E1735ACore.dll
Rigid laser driver - C:\Windows\SysWOW64\ni4882.dll
