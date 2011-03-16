National Instruments NI-488.2 Routines and NI-488 Functions for Windows
Microsoft C Language Interface. 
Version 3.1.
Copyright 1994 National Instruments Corporation.
All Rights Reserved.


What Your Directory Should Contain
----------------------------------

    README.MC    -  This information file

    GPIB.LIB     -  C language interface library

    WINDECL.H    -  C include file containing NI-488 function
                    and NI-488.2 routine prototypes and various
                    pre-defined constants

    SAMP4882.C    - C NI-488.2 sample program
  
    DEVSAMP.C     - C device-level sample program

    \DIRECT       - Subdirectory containing NI-488.2 and device-level
                    C sample programs using direct entry points


Creating Your C Application Program
------------------------------------
Use the following guidelines to create your C application program:

1.  Include the following line at the beginning of your application
    program:

               #include "windecl.h"

2.  Link the C langage interface library, GPIB.LIB, to your application
    program.

    a:  Microsoft C

        The following line compiles and links your application program:

               cl /Mq yourprogramname.c gpib.lib 

    b:  Borland C++

        List the C language interface library, GPIB.LIB, in your application
        project file.


Compiler Warning
----------------

You might receive compile warnings of the type "long/short mismatch,
conversion supplied."  This is not a problem.  However, if you want to
get rid of these warnings, simply declare the count parameters that you
pass into ibrd, ibwrt, and so on to be of type LONG.


Direct-Entry Point Application Programs
---------------------------------------

The DIRECT subdirectory contains the following files:

    DLL4882.C    - C NI-488.2 sample program using direct-entry points

    DLL4882.DEF  - C NI-488.2 sample module-definition file
  
    DLLDEV.C     - C device-level sample program using direct-entry points

    DLLDEV.DEF   - C device-level sample module-definition file

Use the following guidelines to create your C direct entry application 
program:

1.  Include the following lines at the beginning of your C application
    program:

              #define GPIB_DIRECT_ACCESS
              #include "windecl.h"
              int   ibsta, iberr;      /* NI-488.2 global status variables */
              long  ibcntl;

    GPIB_DIRECT_ACCESS prevents the inclusion of the function-prototype
    declarations and the external declarations of the global status variables
    in WINDECL.H.  You must declare the global status variables in your 
    application program.  Also, you must include the prototype for each 
    direct entry function used in your application program.  Refer to the
    "NI-488.2 Function Reference Manual for DOS/Windows" for the format for
    the NI-488.2 and NI-488 direct entry prototypes.

2.  Link the module-definition file to your application program.  You must
    create the module-definition file.  This file contains an IMPORT section
    listing the direct entry points used by your application program.

    a.  Microsoft C

        The following line compiles and links your application program:

             cl /Mq yourprogramname.c yourprogramname.def 

    b:  Borland C++

        List the module-definition file in your application project file.
