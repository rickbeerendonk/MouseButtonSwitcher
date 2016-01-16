MOUSE BUTTON SWAPPER

A Borland Delphi Demo for Microsoft .NET Framework

Written by Rick Beerendonk (rick@beerendonk.com)
           The Netherlands

--------------------------------------------------

SUMMARY

This demo is a tray-icon application. By 
double-clicking the tray-icon the main mouse 
buttons swap. Easy if left-handed and right-handed 
need to work on the same machine. The icon also 
has a popup-menu where swapping is option.


USED "TRICKS"

To hide the mainform set the WindowState to 
Minimized and the ShowInTaskbar property to False.

To know when mouse buttons are being swapped use 
the Microsoft.Win32.SystemEvents

The code to create icons from bitmaps (in the demo 
stored in an ImageList) is actually a workaround 
because there is a .NET bug when saving a bitmap 
to an ImageFormat.Icon
(see http://support.microsoft.com/default.aspx?scid=kb;en-us;q316563)
