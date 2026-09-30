# Windows Desktop Config

My personal Windows desktop setup using [Komorebi](https://github.com/LGUG2Z/komorebi), [YASB](https://github.com/amnweb/yasb), and [AutoHotkey](https://www.autohotkey.com/).

I spend a lot of time in Linux and really like the keyboard-driven workflow in Omarchy. This is my attempt to bring some of that experience to Windows without trying to make Windows pretend to be Linux.

The main things I wanted were:

- Scrolling window layouts
- Simple keyboard navigation between windows
- Moving windows around the layout without reaching for the mouse
- Fast workspace switching
- A useful top bar
- Config files that can live in Git

This is my personal setup and it will probably keep changing.

## What I use

### Komorebi

Komorebi handles window management and workspaces.

My workspaces use the scrolling layout with two visible columns. Windows can continue horizontally beyond the visible area rather than constantly dividing the screen into smaller tiles.

### AutoHotkey

AutoHotkey handles the keyboard shortcuts.

I originally used `whkd`, but switched to AutoHotkey because I wanted to use the Windows key for window management without fighting Windows' built-in shortcuts.

Some of the main bindings are:

| Shortcut              | Action                                     |
| --------------------- | ------------------------------------------ |
| `Win + Arrow`         | Focus window in that direction             |
| `Win + Shift + Arrow` | Move the focused window in that direction  |
| `Win + 1-4`           | Focus workspace                            |
| `Win + Shift + 1-4`   | Move window to workspace and follow        |
| `Win + Alt + 1-4`     | Send window to workspace without following |
| `Alt + O`             | Reload AutoHotkey config                   |
| `Alt + Shift + O`     | Reload Komorebi config                     |

There are more bindings in `komorebi/hotkeys.ahk`.

### YASB

YASB provides the top bar, workspace indicators, taskbar, system information, media controls, clock, tray, and other widgets.

The config is set up to use Komorebi workspaces and display the active layout alongside the rest of the Windows status information.

## Repository layout

```text
.config/
├── komorebi/
│   ├── komorebi.json
│   └── hotkeys.ahk
└── yasb/
    ├── config.yaml
    ├── styles.css
    ├── base.css
    ├── system-widgets.css
    ├── taskbar.css
    ├── media.css
    ├── clock.css
    ├── audio.css
    └── komorebi.css
```

These are my live configuration files. `styles.css` is the stylesheet entrypoint
and imports the smaller component stylesheets alongside it.

On Windows they live under:

```text
C:\Users\<user>\.config
```

I generally work with them through WSL at:

```text
/mnt/c/Users/<user>/.config
```

## Komorebi config location

I use `KOMOREBI_CONFIG_HOME` so Komorebi can live under `.config` instead of putting its files directly in my Windows home directory.

It should point to:

```text
C:\Users\<user>\.config\komorebi
```

You can check that Komorebi sees the directory with:

```powershell
komorebic check
```

## Startup

Komorebi and AutoHotkey are started through Windows Task Scheduler at login.

Komorebi runs:

```text
C:\Program Files\komorebi\bin\komorebic-no-console.exe
```

with:

```text
start
```

AutoHotkey runs:

```text
C:\Program Files\AutoHotkey\v2\AutoHotkey.exe
```

with:

```text
C:\Users\<user>\.config\komorebi\hotkeys.ahk
```

YASB uses its own scheduled task autostart support.

## Requirements

At minimum:

- Windows 11
- Komorebi
- YASB
- AutoHotkey v2

The YASB config also expects:

- Segoe UI Variable
- Segoe Fluent Icons
- JetBrainsMono Nerd Font

## Using this

These are dotfiles, not an installer.

Paths, displays, applications, and workspace choices reflect my own machine. If you want to use them, I would recommend copying the parts you like and adjusting them for your setup rather than expecting everything to work unchanged.

## Credits

The window management workflow is heavily inspired by [Omarchy](https://omarchy.org/), particularly its keyboard-driven controls and scrolling layout.

My YASB configuration and styling started from [Win11 Fluent Onyx](https://github.com/Hoxiee/Yasb-Fluent-Onyx-Theme) by [Hoxiee](https://github.com/Hoxiee). The theme is also published in the [YASB themes repository](https://github.com/amnweb/yasb-themes/tree/main/themes/80198c48-f70a-44a1-8507-ce300ff8e360).

The original Win11 Fluent Onyx project is licensed under the MIT License. Its copyright and license notice are retained with the derived YASB configuration in this repository.
