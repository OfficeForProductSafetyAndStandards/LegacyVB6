/*************************************************************************
 *
 * CDEMO32 - GPIB-488 Library Demo Program
 *
 * Copyright Quality Instrumentation Solutions, Inc. and its licensors, (c) 2009
 * All Rights Reserved
 *
 * File:   CDEMO32.C
 *
 * This is an example Windows program that uses the GPIB library to talk
 * to a Fluke 45 voltmeter.
 *
 * The WM_CREATE event handler initializes the meter and sets it for
 * Volts AC measurements.
 *
 * A Windows timer is set up that fires once per second.  The event handler
 * for the timer reads the current value from the meter and then
 * forces a screen update.  The WM_PAINT handler displays the current
 * voltage in a Window.
 *
 * Functions:  WinMain
 *             MainMessageHandler
 *             CleanUp
 *
 **********************************************************************/

/* Include files */
#include <windows.h>                    /* Compiler's include files's */
#include <string.h>
#include <stdio.h>
#include "gpib488.h"

/* GPIB device at pad = 1, sad = 0 on board gpib0*/
#define BOARD_NUM 0
#define PAD       1
#define SAD       0

/* Fluke 45 command strings */
#define RESET_CMD    "*RST"      /* Reset the meter */
#define ID_CMD       "*IDN?"     /* Return the meter's ID string */
#define RANGE_CMD    "VAC"       /* Set meter range to Volts AC */
#define MEASURE_CMD  "*TRG; VAL?"      /* Take a measurement and return it */

/* Size of ibrd buffer */
#define BUF_SIZE 256

/* Misc */
#define FALSE  0
#define TRUE   1
#define TIMER_NUM   1

HMODULE Gpibdll;
HWND    hWndMain;                          /* handle for main window */

LRESULT CALLBACK MainMessageHandler(HWND, UINT, WPARAM, LPARAM);
int   InitMeter();
int   WriteCommand(int device, const char *command);
int   ReadValue(int device, char *buffer, size_t buflen);


/************************************************************************
 *
 * Name:      WinMain
 *
 * Arguments: hInstance - the instance handle for the program
 *            hPrevInstance - the class name of the application (not used)
 *            CmndLine - command line was called with (not used)
 *            CmndShow - indicates how to display window
 *
 * This is the entry point to the program. It gets called by Windows
 * to start the program up.  This routine creates the main window,
 * initializes a timer, and then falls into the main Windows Get
 * message/Dispatch message loop.
 *
 ************************************************************************/
int WINAPI
WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR CmdLine, int nCmdShow)
{
   MSG       msg;                      /* MSG structure to pas sto windows proc */
   WNDCLASS  wndclass;
   char      *AppName;                 /* Name for the window */

   CmdLine = NULL;                     /* Not used */
   AppName = "WINGPIB";                /* The name of this application */
   if(!hPrevInstance) {
      wndclass.style          = CS_HREDRAW | CS_VREDRAW;
      wndclass.lpfnWndProc    = MainMessageHandler;
      wndclass.cbClsExtra     = 0;
      wndclass.cbWndExtra     = 0;
      wndclass.hInstance      = hInstance;
      wndclass.hIcon          = NULL; //LoadIcon (hInstance, AppName);
      wndclass.hCursor        = LoadCursor (NULL, IDC_ARROW);
      wndclass.hbrBackground  = GetStockObject (WHITE_BRUSH);
      wndclass.lpszMenuName   = AppName;
      wndclass.lpszClassName  = AppName;
      RegisterClass (&wndclass);
   }

   /* create application's Main window                                    */
   hWndMain = CreateWindow (AppName,                  /* Window class name          */
      "GPIB Demo",
      WS_OVERLAPPEDWINDOW,
      200,                     /* Use default X, Y            */
      200,                     /* Use default X, Y            */
      GetSystemMetrics(SM_CXSIZE) * 20,  /* x - fit text      */
      GetSystemMetrics(SM_CYSIZE) * 12,  /* y - fit text      */
      NULL,                    /* Parent window's handle      */
      NULL,                    /* Default to Class Menu       */
      hInstance,               /* Instance of window          */
      NULL);                   /* Create struct for WM_CREATE */


   if (hWndMain == NULL) {
      MessageBox(NULL, "Could not create window in WinMain", NULL, MB_ICONEXCLAMATION);
      return (1);
   }

   ShowWindow(hWndMain, nCmdShow);     /* Display main window      */
   UpdateWindow(hWndMain);

   /* Start a 1000ms timer to update display */
   if(!SetTimer(hWndMain, TIMER_NUM, 1000, NULL)) {
      MessageBox(NULL, "Error starting Windows timer", NULL, MB_OK |
         MB_ICONEXCLAMATION);
      return (1);
   }

   while(GetMessage(&msg, NULL, 0, 0)) { /* Main message loop */
      TranslateMessage(&msg);
      DispatchMessage(&msg);
   }

   UnregisterClass (AppName, hInstance);
   return (msg.wParam);
}

/************************************************************************
 *
 * Name:      MainMessageHandler
 *
 * Arguments: hWnd - handle to the window
 *            Message - message that needs to be handled
 *            hParam - message parameter
 *            lParam - message parameter
 *
 * This is the message dispatcher that gets called whenever Windows
 * sends a message to this window.  WinMain started up a timer that
 * sends a message every 1/2 sec.  When the message (WM_TIMER)is received
 * by this routine, it reads the A/D and stores the values in ADValues[].
 * It also causes a screen update which eill automatically generate a
 * WM_PAINT message.  The WM_PAINT handler takes care of converting the
 * raw A/D values to voltages and printing them in the Window.
 *
 ************************************************************************/
LRESULT CALLBACK
MainMessageHandler(HWND hWnd, UINT Message, WPARAM wParam, LPARAM lParam) {
   HDC        hDC;                     /* handle for the display device  */
   PAINTSTRUCT ps;                     /* holds PAINT information        */
   TEXTMETRIC tm;                      /* holds TEXT information         */
   HFONT hfnt, hOldFont;
   static HRGN hRgn;                   /* Rectangle region Handles       */
   static int  CharWidth, CharHeight, device;
   int         x, y;
   static char IDString[BUF_SIZE+1], VoltsString[BUF_SIZE+1];
   char        OutString[BUF_SIZE+10], ErrString[80];
   /**/
   switch (Message) {                   /* Windows Message Loop           */
      case WM_CREATE:
         hDC = GetDC(hWndMain);      /* Get the device context for window */
         hfnt = GetStockObject(ANSI_FIXED_FONT);
         hOldFont = SelectObject(hDC, hfnt);
         GetTextMetrics(hDC, &tm);   /* From context, get size of font */
         CharWidth = tm.tmAveCharWidth;
         CharHeight = tm.tmHeight + tm.tmExternalLeading;
         ReleaseDC(hWndMain, hDC);
         hRgn = CreateRectRgn(0,0, CharWidth*30, CharHeight*12);

         device = InitMeter();          /* Init voltmeter */
         if (device >= 0) {
            if (!WriteCommand (device, ID_CMD))     /* get ID string */
               ReadValue (device, IDString, BUF_SIZE);
         }
         else {
            if (Iberr() == EDVR)
               sprintf (ErrString,"Could not find the device at PAD %s.\n ",PAD);
            else if (Iberr() == ENEB)
               sprintf (ErrString,"GPIB board is not responding.");
            else
               sprintf (ErrString,"Error #%d while opening device at PAD %s.\n", Iberr(), PAD);
            MessageBox(NULL, ErrString, NULL, MB_ICONEXCLAMATION);
            exit (1);
         }
         break;

      case WM_TIMER:                  /* All Timer Events Processed Here */
         if (!WriteCommand (device, MEASURE_CMD))
            ReadValue (device, VoltsString, BUF_SIZE);
         InvalidateRgn(hWndMain, hRgn, FALSE);  /* Force screen update  */
         break;

      case WM_PAINT:                  /* Repaint client area of window */
         hDC = BeginPaint(hWndMain, &ps);
         hfnt = GetStockObject(ANSI_FIXED_FONT);
         hOldFont = SelectObject(hDC, hfnt);

         x = CharWidth * 2;            /* Position cursor within window */
         y = CharHeight;               /* One line down and 2 chars in */
         sprintf (OutString,"ID = %s ", IDString);
         TextOut(hDC, x, y, OutString, strlen (OutString));

         y += CharHeight*2;            /* Print current count */
         sprintf (OutString,"Voltage= %s    ", VoltsString);
         TextOut(hDC, x, y, OutString, strlen (OutString));

         y += CharHeight*2;            /* Print status */
         sprintf (OutString,"ibsta= %4x (HEX)", Ibsta());
         TextOut(hDC, x, y, OutString, strlen (OutString));

         y += CharHeight;              /* Print error */
         sprintf (OutString,"iberr= %4d (DEC)", Iberr());
         TextOut(hDC, x, y, OutString, strlen (OutString));

         y += CharHeight;              /* Print count */
         sprintf (OutString,"ibcnt= %4d (DEC)", Ibcnt());
         TextOut(hDC, x, y, OutString, strlen (OutString));
         SetTextAlign(hDC, TA_LEFT | TA_TOP);
         if (hOldFont) {
            SelectObject(hDC, hOldFont);
            hOldFont = NULL;
         }
         EndPaint(hWndMain, &ps);
         break;

      case WM_CLOSE:                      /* Close the window */
         KillTimer (hWnd, TIMER_NUM);    /* Stop the timer */
         DestroyWindow(hWnd);
         if (hWnd == hWndMain)
            PostQuitMessage(0);         /* Send message to Quit application */
         break;

      default:
         return (DefWindowProc(hWnd, Message, wParam, lParam));
   }
   return (0l);
}

/***************************************************************************
 *
 * Name:      InitMeter
 * Arguments: None
 * Returns:   handle to opened device
 *
 * Open the device.  If there is an error opening prints a message
 * and exit.  Otherwise set the timeout to 3 seconds. Send a reset
 * command to the meter and set the range to Volts AC.
 *
 ***************************************************************************/
int InitMeter() {
   int  device;
   char spr;
   /**/
   device = ibdev(BOARD_NUM, PAD, SAD, 12, 1, 0);
   if (device >= 0) {
      ibclr (device);
      ibrsp (device,&spr);
      ibtmo (device,T3s);                    /* Set timeout to 3 seconds */
      WriteCommand(device, RESET_CMD);      /* Reset the meter */
      WriteCommand(device, RANGE_CMD);      /* Set to Volts AC range */
   }
   return (device);
}

/***************************************************************************
 *
 * Name:      WriteCommand
 * Arguments: device - handle to the opened device
 *            cmd - command string to be written
 * Returns:   FALSE if succesful, else TRUE
 *
 * Send a command to a GPIB device and checks for error.
 *
 ***************************************************************************/
int WriteCommand (int device, const char *cmd) {
   size_t cmdlength;
   int    ReturnVal;
   /**/
   cmdlength = strlen (cmd);
   ibwrt  (device, cmd, cmdlength);
   if (Ibcnt()!=cmdlength || Ibsta()&ERR)
      ReturnVal = TRUE;
   else
      ReturnVal = FALSE;
   return (ReturnVal);
}

/***************************************************************************
 *
 * Name:      ReadValue
 * Arguments: device - handle to the opened device
 *            buffer - buffer to read into
 *            bufsize - size of buffer (in bytes)
 * Returns:   FALSE if succesful, TRUE if error
 *
 * Reads a string from a GPIB device and checks for errors.  If no
 * errors it terminates the string.
 *
 ***************************************************************************/
int ReadValue(int device, char *buffer, size_t bufsize) {
   int rtrnval;
   /**/
   ibrd (device,buffer,bufsize);
   if (Ibcnt()==bufsize || Ibcnt()==0 || Ibsta()&ERR)
      rtrnval = TRUE;
   else
   {
      buffer[Ibcnt()-1] = '\0';    /* Terminate string */
      rtrnval = FALSE;
   }
   return (rtrnval);
}
