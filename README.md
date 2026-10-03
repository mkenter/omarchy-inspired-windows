# Omarchy-Inspired Windows Desktop

An unofficial Windows 11 setup built with [Komorebi](https://github.com/LGUG2Z/komorebi), [YASB](https://github.com/amnweb/yasb), and [AutoHotkey](https://www.autohotkey.com/).

It borrows the parts of the [Omarchy](https://omarchy.org/) workflow that translate well to Windows: keyboard-driven window management, fast workspace switching, scrolling layouts, and a useful top bar. The YASB configuration is styled after Omarchy, with original Windows-specific configuration and styling built from scratch. It is inspired by Omarchy, but is not an Omarchy project or a Windows port of Omarchy.

## What you get

- Four Komorebi workspaces
- A scrolling layout with two visible columns
- Keyboard navigation and window movement
- Square window borders with a sky-blue active border
- A 26px YASB top bar styled after Omarchy: a Windows glyph opening Raycast, Komorebi workspaces, centered clock/calendar, expanding system tray, Bluetooth, Wi-Fi/Ethernet, and volume
- One original stylesheet for the bar, tooltips, calendar, and Bluetooth menu
- Config files that can be kept in Git

Komorebi manages windows and workspaces. AutoHotkey turns key presses into `komorebic` commands. YASB displays the bar and reads Komorebi's workspace state.

```text
AutoHotkey ──commands──> Komorebi ──state──> YASB
     │                     │                 │
  hotkeys               windows           top bar
```

## Keybindings

| Shortcut | Action |
| --- | --- |
| `Win + Arrow` | Focus a window in that direction |
| `Win + Shift + Arrow` | Move the focused window in that direction |
| `Win + 1-4` | Focus a workspace |
| `Win + Shift + 1-4` | Move the focused window to a workspace and follow it |
| `Win + Alt + 1-4` | Send the focused window to a workspace without following it |
| `Alt + Arrow` | Stack the focused window in that direction |
| `Alt + ;` | Remove the focused window from its stack |
| `Alt + [` / `Alt + ]` | Move through a stack |
| `Alt + =` / `Alt + -` | Resize horizontally |
| `Alt + Shift + =` / `Alt + Shift + -` | Resize vertically |
| `Alt + Q` | Close the focused window |
| `Alt + M` | Minimize the focused window |
| `Alt + T` | Toggle floating |
| `Alt + Shift + F` | Toggle monocle |
| `Alt + Shift + R` | Retile the current workspace |
| `Alt + P` | Pause or resume tiling |
| `Alt + O` | Reload the AutoHotkey config |
| `Alt + Shift + O` | Reload the Komorebi config |

The source of truth is [`komorebi/hotkeys.ahk`](komorebi/hotkeys.ahk).

## Repository layout

```text
.config/
├── komorebi/
│   ├── komorebi.json
│   └── hotkeys.ahk
├── yasb/
│   ├── config.yaml
│   ├── styles.css
│   └── DESIGN.md
├── README.md
└── LICENSE
```

`yasb/config.yaml` defines the widgets and actions. `yasb/styles.css` contains all active styling; it imports no other theme files. [Design notes](yasb/DESIGN.md) record the Omarchy visual reference and platform differences.

## Bar behavior

- Left: Windows glyph opens the installed Raycast app; empty workspaces have dim numbers, populated workspaces brighter numbers, and the active workspace a filled square.
- Center: full weekday and 24-hour time, such as `Saturday 20:48`. Left-click opens the local month calendar; right-click shows the full date. The calendar is a date reference, without appointment synchronization.
- Right: a chevron expands application tray icons inline, followed by Bluetooth, Wi-Fi/Ethernet status, and volume. Tray apps depend on what is running and their pin state. Alt-click a tray icon to pin or unpin it.
- Bluetooth opens a device menu; network opens Windows network settings; volume opens the audio menu.

The menu button expects Raycast's Windows package identifier `Raycast.Raycast_qypenmj9wpt2a!Raycast`. Install Raycast separately or change the launcher callback for another application.

## Already use Komorebi, YASB, and AutoHotkey?

This is the short path for updating an existing setup.

1. Back up your current config.
2. Copy this repository's `komorebi` and `yasb` folders to:

   ```text
   C:\Users\<user>\.config
   ```

3. Make sure `KOMOREBI_CONFIG_HOME` points to:

   ```text
   C:\Users\<user>\.config\komorebi
   ```

4. Make sure this file exists:

   ```text
   C:\Users\<user>\applications.json
   ```

   The supplied `komorebi.json` references that path. If the file is missing, run:

   ```powershell
   komorebic fetch-asc
   ```

5. Validate and reload:

   ```powershell
   komorebic check
   komorebic reload-configuration
   yasbc reload
   ```

6. Restart the AutoHotkey script, or press `Alt + O` if the previous version is already running.

If border or workspace-layout changes do not appear after a reload, restart Komorebi:

```powershell
komorebic stop
komorebic start
```

## First-time setup

These instructions use PowerShell on Windows 11.

### 1. Install the applications

Open PowerShell and run:

```powershell
winget install --id LGUG2Z.komorebi
winget install --exact --id AutoHotkey.AutoHotkey
winget install --id AmN.yasb
```

Open a new PowerShell window after installation so the new commands are available, then check them:

```powershell
komorebic --version
yasbc --version
```

### 2. Download Komorebi's application rules

Komorebi uses `applications.json` for application-specific behavior. This configuration expects that file in your Windows user folder.

```powershell
komorebic quickstart
```

The command also downloads example configs. This repository's configs will replace those examples; the file you need to keep is:

```text
C:\Users\<user>\applications.json
```

### 3. Put the repository files in place

Download or clone this repository. Copy its `komorebi` and `yasb` folders into:

```text
C:\Users\<user>\.config
```

The important files should now be:

```text
C:\Users\<user>\.config\komorebi\komorebi.json
C:\Users\<user>\.config\komorebi\hotkeys.ahk
C:\Users\<user>\.config\yasb\config.yaml
C:\Users\<user>\.config\yasb\styles.css
```

Only `config.yaml` and `styles.css` are needed to run this bar.

### 4. Set Komorebi's config directory

Run this in PowerShell:

```powershell
[Environment]::SetEnvironmentVariable(
    "KOMOREBI_CONFIG_HOME",
    "$env:USERPROFILE\.config\komorebi",
    "User"
)
```

That saves the value for future sessions. Set it in the current PowerShell window too:

```powershell
$env:KOMOREBI_CONFIG_HOME = "$env:USERPROFILE\.config\komorebi"
```

Confirm that Komorebi finds the config:

```powershell
komorebic check
```

The output should report that `KOMOREBI_CONFIG_HOME` was detected and that `komorebi.json` was found.

### 5. Start and test Komorebi

```powershell
komorebic start
```

Open two or three application windows. They should tile into a horizontal scrolling layout with two visible columns.

To inspect the current state:

```powershell
komorebic state
```

### 6. Start and test AutoHotkey

Run the hotkey file:

```powershell
& "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" `
  "$env:USERPROFILE\.config\komorebi\hotkeys.ahk"
```

Try `Win + Left` and `Win + Right`. Focus should move between windows instead of activating Windows Snap.

Try `Win + Shift + Left` and `Win + Shift + Right`. The focused window should move through the layout.

### 7. Start and test YASB

```powershell
yasbc start
```

The bar should appear at the top of the screen. Its workspace indicator should update when you press `Win + 1` through `Win + 4`.

The bar uses Consolas for text and Segoe Fluent Icons for Windows glyphs. Both are included with Windows 11. Some built-in YASB defaults may use Nerd Font icons; install a Nerd Font or override those glyphs if they display as empty squares.

## Start everything at login

Test all three applications manually before enabling autostart. That makes startup problems much easier to isolate.

### Komorebi

Open **Task Scheduler**, select **Create Task**, and use:

| Setting | Value |
| --- | --- |
| Name | `Komorebi` |
| Security option | Run only when user is logged on |
| Trigger | At log on |
| Program | `C:\Program Files\komorebi\bin\komorebic-no-console.exe` |
| Arguments | `start` |

No startup delay or elevated privileges should be necessary.

### AutoHotkey

Create a second task:

| Setting | Value |
| --- | --- |
| Name | `AHK` |
| Security option | Run only when user is logged on |
| Trigger | At log on |
| Program | `C:\Program Files\AutoHotkey\v2\AutoHotkey.exe` |
| Arguments | `"C:\Users\<user>\.config\komorebi\hotkeys.ahk"` |
| Start in | `C:\Users\<user>\.config\komorebi` |

Keep the executable and script in their separate fields. Do not paste the whole command into the **Program/script** box.

### YASB

Open PowerShell as Administrator and run:

```powershell
yasbc enable-autostart --task
```

## Making changes

### Komorebi

Edit `komorebi/komorebi.json`, then press `Alt + Shift + O` or run:

```powershell
komorebic reload-configuration
```

Restart Komorebi if a border or startup-layout change does not apply after reloading.

### AutoHotkey

Edit `komorebi/hotkeys.ahk`, then press `Alt + O`.

### YASB

Widget behavior lives in `yasb/config.yaml`. All styling lives in `yasb/styles.css`.

Automatic file watching is disabled. Reload after editing:

```powershell
yasbc reload
```

## Troubleshooting

### A command is not recognized

Open a new PowerShell window after installing or upgrading the applications. Then check:

```powershell
komorebic --version
yasbc --version
```

### Komorebi cannot find its config

```powershell
komorebic check
```

The detected config directory should be:

```text
C:\Users\<user>\.config\komorebi
```

If it is missing only from the current terminal:

```powershell
$env:KOMOREBI_CONFIG_HOME = "$env:USERPROFILE\.config\komorebi"
```

### Komorebi reports a problem with applications.json

This repository does not include `applications.json`, because Komorebi maintains the community application rules separately. Download the current rules:

```powershell
komorebic fetch-asc
```

This config expects the resulting file at:

```text
C:\Users\<user>\applications.json
```

### Komorebi is running but windows are not tiling

Inspect the current state:

```powershell
komorebic state
```

If the current workspace reports `"tile": false`, press `Alt + P` to resume tiling.

### The scrolling layout shows three columns

Each workspace in `komorebi.json` should contain:

```json
"layout_options": {
  "scrolling": {
    "columns": 2
  }
}
```

Test the setting on the current workspace:

```powershell
komorebic scrolling-layout-columns 2
```

If the live command works but a reload does not, restart Komorebi.

### Windows still snaps with Win + Left or Win + Right

Check that AutoHotkey is running:

```powershell
Get-Process AutoHotkey* -ErrorAction SilentlyContinue
```

If no process is returned, start `hotkeys.ahk` manually and test again.

### YASB does not load the theme

Confirm that `config.yaml` and `styles.css` are in:

```text
C:\Users\<user>\.config\yasb
```

Then reload and inspect the live log:

```powershell
yasbc reload
yasbc log
```

## Credits

The YASB config is styled after [Omarchy](https://github.com/omacom/omarchy), including its bar dimensions, monospace typography, workspace hierarchy, clock format, and popup appearance. The window-management workflow also takes inspiration from Omarchy's keyboard controls and scrolling layout.

The active YASB configuration and stylesheet were built from scratch. Omarchy's native source was used to understand visual measurements and behavior; no third-party YASB theme/config code is used.

## License

Original work in this repository is available under the [MIT License](LICENSE).
