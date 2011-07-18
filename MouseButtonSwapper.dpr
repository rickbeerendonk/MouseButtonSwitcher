{ *********************************************************************** }
{                                                                         }
{ Copyright (c) 2003 Borland Software Corporation                         }
{                                                                         }
{ Written by: Rick Beerendonk (rick@beerendonk.com)                       }
{             Microloon BV                                                }
{             The Netherlands                                             }
{                                                                         }
{ ----------------------------------------------------------------------- }
{ THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY  }
{ KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE     }
{ IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A              }
{ PARTICULAR PURPOSE.                                                     }
{                                                                         }
{ *********************************************************************** }

program MouseButtonSwapper;

{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Data.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Drawing.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.Windows.Forms.dll'}
{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.XML.dll'}
{$R 'Borland.Examples.Delphi.MouseButtonSwapper.Main.TMainForm.resources' 'Borland.Examples.Delphi.MouseButtonSwapper.Main.resx'}
{$R 'Borland.Examples.Delphi.MouseButtonSwapper.Info.TInfoBox.resources' 'Borland.Examples.Delphi.MouseButtonSwapper.Info.resx'}
{$R 'MouseButtonSwapper.res' 'MouseButtonSwapper.rc'}

uses
  System.Reflection,
  System.Runtime.CompilerServices,
  System.Windows.Forms,
  Borland.Examples.Delphi.MouseButtonSwapper.Main in 'Borland.Examples.Delphi.MouseButtonSwapper.Main.pas' {Borland.Examples.Delphi.MouseButtonSwapper.Main.TMainForm: System.Windows.Forms.Form},
  Borland.Examples.Delphi.MouseButtonSwapper.Info in 'Borland.Examples.Delphi.MouseButtonSwapper.Info.pas' {Borland.Examples.Delphi.MouseButtonSwapper.Info.TInfoBox: System.Windows.Forms.Form};

{$REGION 'Program/Assembly Information'}
//
// General Information about an assembly is controlled through the following
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
//
[assembly: AssemblyTitle('Mouse Button Swapper')]
[assembly: AssemblyDescription('Example for Borland® Delphi written by Rick Beerendonk')]
[assembly: AssemblyConfiguration('')]
[assembly: AssemblyCompany('Borland® Software Corporation')]
[assembly: AssemblyProduct('Mouse Button Swapper')]
[assembly: AssemblyCopyright('Copyright © 2003 Borland® Software Corporation.')]
[assembly: AssemblyTrademark('')]
[assembly: AssemblyCulture('')]

//
// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers 
// by using the '*' as shown below:

[assembly: AssemblyVersion('1.0.*')]

//
// In order to sign your assembly you must specify a key to use. Refer to the 
// Microsoft .NET Framework documentation for more information on assembly signing.
//
// Use the attributes below to control which key is used for signing. 
//
// Notes: 
//   (*) If no key is specified, the assembly is not signed.
//   (*) KeyName refers to a key that has been installed in the Crypto Service
//       Provider (CSP) on your machine. KeyFile refers to a file which contains
//       a key.
//   (*) If the KeyFile and the KeyName values are both specified, the 
//       following processing occurs:
//       (1) If the KeyName can be found in the CSP, that key is used.
//       (2) If the KeyName does not exist and the KeyFile does exist, the key 
//           in the KeyFile is installed into the CSP and used.
//   (*) In order to create a KeyFile, you can use the sn.exe (Strong Name) utility.
//       When specifying the KeyFile, the location of the KeyFile should be
//       relative to the project output directory. For example, if your KeyFile is
//       located in the project directory, you would specify the AssemblyKeyFile 
//       attribute as [assembly: AssemblyKeyFile('mykey.snk')], provided your output
//       directory is the project directory (the default).
//   (*) Delay Signing is an advanced option - see the Microsoft .NET Framework
//       documentation for more information on this.
//
[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile('')]
[assembly: AssemblyKeyName('')]
{$ENDREGION}

[STAThread]
begin
  Application.Run(TMainForm.Create);
end.
