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

unit Borland.Examples.Delphi.MouseButtonSwapper.Main;

interface

uses
  System.Drawing, System.Collections, System.ComponentModel,
  System.Windows.Forms, System.Data, System.Resources, Microsoft.Win32;

type
  TMainForm = class(System.Windows.Forms.Form)
  {$REGION 'Designer Managed Code'}
  strict private
    /// <summary>
    /// Required designer variable.
    /// </summary>
    components: System.ComponentModel.IContainer;
    NotifyIcon: System.Windows.Forms.NotifyIcon;
    NotifyIconContextMenu: System.Windows.Forms.ContextMenu;
    SwapMouseButtonsItem: System.Windows.Forms.MenuItem;
    N2: System.Windows.Forms.MenuItem;
    ExitItem: System.Windows.Forms.MenuItem;
    NotifyImages: System.Windows.Forms.ImageList;
    AboutItem: System.Windows.Forms.MenuItem;
    N1: System.Windows.Forms.MenuItem;
    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    procedure InitializeComponent;
    procedure ExitItem_Click(sender: System.Object; e: System.EventArgs);
    procedure SwapMouseButtonsItem_Click(sender: System.Object; e: System.EventArgs);
    procedure NotifyIcon_DoubleClick(sender: System.Object; e: System.EventArgs);
    procedure AboutItem_Click(sender: System.Object; e: System.EventArgs);
  {$ENDREGION}
  strict private
    procedure UserPreferenceChanged(sender: TObject;
      e: UserPreferenceChangedEventArgs);
  strict protected
    /// <summary>
    /// Clean up any resources being used.
    /// </summary>
    procedure Dispose(Disposing: Boolean); override;
    procedure ResetNotification;
    procedure SwapMouseButtons;
  public
    constructor Create;
  end;

  [assembly: RuntimeRequiredAttribute(TypeOf(TMainForm))]

implementation

uses
  Borland.Vcl.Windows, Borland.Examples.Delphi.MouseButtonSwapper.Info;

{$REGION 'Windows Form Designer generated code'}
/// <summary>
/// Required method for Designer support - do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TMainForm.InitializeComponent;
type
  TSystem_Windows_Forms_MenuItemArray = array of System.Windows.Forms.MenuItem;
var
  resources: System.Resources.ResourceManager;
begin
  Self.components := System.ComponentModel.Container.Create;
  resources := System.Resources.ResourceManager.Create(TypeOf(TMainForm));
  Self.NotifyIconContextMenu := System.Windows.Forms.ContextMenu.Create;
  Self.SwapMouseButtonsItem := System.Windows.Forms.MenuItem.Create;
  Self.N1 := System.Windows.Forms.MenuItem.Create;
  Self.AboutItem := System.Windows.Forms.MenuItem.Create;
  Self.N2 := System.Windows.Forms.MenuItem.Create;
  Self.ExitItem := System.Windows.Forms.MenuItem.Create;
  Self.NotifyImages := System.Windows.Forms.ImageList.Create(Self.components);
  Self.NotifyIcon := System.Windows.Forms.NotifyIcon.Create(Self.components);
  // 
  // NotifyIconContextMenu
  // 
  Self.NotifyIconContextMenu.MenuItems.AddRange(TSystem_Windows_Forms_MenuItemArray.Create(Self.SwapMouseButtonsItem, Self.N1, Self.AboutItem, Self.N2, Self.ExitItem));
  // 
  // SwapMouseButtonsItem
  // 
  Self.SwapMouseButtonsItem.DefaultItem := True;
  Self.SwapMouseButtonsItem.Index := 0;
  Self.SwapMouseButtonsItem.Text := '&Swap Mouse Buttons';
  Include(Self.SwapMouseButtonsItem.Click, Self.SwapMouseButtonsItem_Click);
  // 
  // N1
  // 
  Self.N1.Index := 1;
  Self.N1.Text := '-';
  // 
  // AboutItem
  // 
  Self.AboutItem.Index := 2;
  Self.AboutItem.Text := '&About';
  Include(Self.AboutItem.Click, Self.AboutItem_Click);
  // 
  // N2
  // 
  Self.N2.Index := 3;
  Self.N2.Text := '-';
  // 
  // ExitItem
  // 
  Self.ExitItem.Index := 4;
  Self.ExitItem.Text := '&Exit';
  Include(Self.ExitItem.Click, Self.ExitItem_Click);
  // 
  // NotifyImages
  // 
  Self.NotifyImages.ImageSize := System.Drawing.Size.Create(16, 16);
  Self.NotifyImages.ImageStream := (System.Windows.Forms.ImageListStreamer(resources.GetObject('NotifyImages.ImageStream')));
  Self.NotifyImages.TransparentColor := System.Drawing.Color.Fuchsia;
  // 
  // NotifyIcon
  // 
  Self.NotifyIcon.ContextMenu := Self.NotifyIconContextMenu;
  Self.NotifyIcon.Text := 'Mouse Button Swapper';
  Self.NotifyIcon.Visible := True;
  Include(Self.NotifyIcon.DoubleClick, Self.NotifyIcon_DoubleClick);
  // 
  // TMainForm
  // 
  Self.AutoScaleBaseSize := System.Drawing.Size.Create(5, 13);
  Self.ClientSize := System.Drawing.Size.Create(292, 266);
  Self.Name := 'TMainForm';
  Self.ShowInTaskbar := False;
  Self.Text := 'MainForm';
  Self.WindowState := System.Windows.Forms.FormWindowState.Minimized;
end;
{$ENDREGION}

procedure TMainForm.Dispose(Disposing: Boolean);
begin
  Microsoft.Win32.SystemEvents.remove_UserPreferenceChanged(UserPreferenceChanged);
  if Disposing then
  begin
    if Components <> nil then
      Components.Dispose();
  end;
  inherited Dispose(Disposing);
end;

constructor TMainForm.Create;
begin
  inherited Create;
  //
  // Required for Windows Form Designer support
  //
  InitializeComponent;
  //
  // TODO: Add any constructor code after InitializeComponent call
  //
  Microsoft.Win32.SystemEvents.add_UserPreferenceChanged(UserPreferenceChanged);
  ResetNotification;
end;

procedure TMainForm.AboutItem_Click(sender: System.Object; e: System.EventArgs);
begin
  TInfoBox.Create.ShowDialog;
end;

procedure TMainForm.NotifyIcon_DoubleClick(sender: System.Object; e: System.EventArgs);
begin
  SwapMouseButtons;
end;

procedure TMainForm.SwapMouseButtonsItem_Click(sender: System.Object; e: System.EventArgs);
begin
  SwapMouseButtons;
end;

procedure TMainForm.ExitItem_Click(sender: System.Object; e: System.EventArgs);
begin
  Close;
end;

procedure TMainForm.UserPreferenceChanged(sender: TObject;
  e: UserPreferenceChangedEventArgs);
begin
  if e.Category = Microsoft.Win32.UserPreferenceCategory.Mouse then
    ResetNotification;
end;

procedure TMainForm.ResetNotification;
begin
  if System.Windows.Forms.SystemInformation.MouseButtonsSwapped then
  begin
    NotifyIcon.Text := 'Mouse - Lefthanded';
    // Ugly, see http://support.microsoft.com/default.aspx?scid=kb;en-us;q316563
    NotifyIcon.Icon := NotifyIcon.Icon.FromHandle(
      System.Drawing.Bitmap(NotifyImages.Images.Item[1]).GetHIcon);
  end
  else
  begin
    NotifyIcon.Text := 'Mouse - Righthanded';
    NotifyIcon.Icon := NotifyIcon.Icon.FromHandle(
      System.Drawing.Bitmap(NotifyImages.Images.Item[0]).GetHIcon);
  end;
end;

procedure TMainForm.SwapMouseButtons;
begin
  // Not standard in .NET Framework so we need to use P/Invoke.
  // Unfortunately this makes it a Windows only .NET application.
  SystemParametersInfo(SPI_SETMOUSEBUTTONSWAP,
                       Cardinal(not Boolean(GetSystemMetrics(SM_SWAPBUTTON))),
                       nil,
                       SPIF_UPDATEINIFILE or SPIF_SENDCHANGE);
end;

end.
