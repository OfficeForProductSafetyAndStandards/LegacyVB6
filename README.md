# LegacyVB6

This is a dump of the existing source code for the flexi laser 30m system.
The codin use is the old flexi laser software 2004 - it doesnt seem to be complete in that the new code has .bas files etc. The new software hasnt been deployed yet. There are some subtle changes. One thing preventing it from running is thelocations of files are hardcoded into the program. This will need to change to bmake it confugurable probably with the use of environment variables. VB6 is no longer supported so code will need to be rewritten in another language possibly in C#, ruby or python. Its going to inteface to dynamics which is microsoft so probably in c# initially. This file will be updated to include more detail as we pprogress
