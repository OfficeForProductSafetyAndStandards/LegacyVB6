# LegacyVB6 code; simple refactoring before re-implementing via modern code and cloud services.

This repository holds the source code for the NPL Flexi Laser, Rigid Laser and Mass measurement instruments.

Flexi is a 50m long bench used for measuring flexible metal tape, subsequently used to calibrate 50m reel tape measures.
Rigid is far smaller and measures rigid steel rules.
Mass measures data related to the size, weight and volume of objects.

50m Flexi Laser - measuring flexible metal tape for metric tape reels
![IMG_9696](https://github.com/OfficeForProductSafetyAndStandards/LegacyVB6/assets/38748914/a289f13d-d48b-424a-a633-4c0a55284d50)


Rigid Laser - measuring steel rules
![IMG_9699](https://github.com/OfficeForProductSafetyAndStandards/LegacyVB6/assets/38748914/fd95f945-9de5-410a-8841-c8b603ff1fc9)

Several versions of the code existed, and old versions have been moved to the Archive folder. The Flexi and Rigid folders at the root are the current code.
Our priority is to update the existing VB code to remove hard links to two OPSS internal servers (S: and M: known as Trent and Avon).
This will enable OPSS to decommission these servers before their support contract renewal is up.

The VB code for Flexi has been amended to save to C: instead of the server, and is working on Windows 11.
The code for Rigid needs to be updated in the same manner however, we also need to explore saving files on an online service (such as an Amazon instance) to be able to share files across systems.

The server also holds a small SQL database with measurements from three instruments: temperature, Humidity and Pressure.
These measurements are aggregated with the laser measurement to evidence the atmospheric environment in place when the laser measurement was taken.
This simple table will need to be migrated to an online service, such as Amazon RDS.

The Mass lab has several instruments saving to S: via a setting within their 3rd party software. Again these data will need to be redirected to an online service. Two VBA applications are used to collect measurement data, and then aggregate these data with the measurements held in the SQL database.
This code is under the Extract Environment folder, under MassLab

The Flexi lab VB code was roughly translated into C# and is held in the Archive folder however it is not fit for live use and will serve as Proof of Concept only.

Once all server dependencies have been eliminated, the code will be properly migrated to structured C# atop a modern cloud stack.

External dependencies:
  * Excel interop - 'C:\Program Files\Microsoft Office\root\Office16\excel.exe'
  * Outlook interop for email - 'C:\Program Files\Microsoft Office\root\Office16\outlook.exe'
  * MS serial com - 'C:\Windows\SysWOW64\mscomm32.ocx'
  * Edale (flexi) laser driver - 'C:\Windows\SysWOW64\e1735a.dll'
  * Edale (flexi) laser driver - 'C:\Windows\SysWOW64\E1735ACore.dll'
  * Rigid laser driver - 'C:\Windows\SysWOW64\ni4882.dll'

Excel spreadsheet dependencies:
  * Currently using 'C:\temp' for length.xlsx(template file) and Edale.xlsx(Correction file).
  * Laser output files are written to 'C:\metrology\@private\@mu\Length Results' in either the Flexi or Rigid directories as appropriate.
