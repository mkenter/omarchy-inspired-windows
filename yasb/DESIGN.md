# YASB design reference

The bar is styled after Omarchy, with original YASB configuration and Qt styling.
Visual reference: omacom/omarchy commit 8e02fc84f5bdc511ed102e2a14f8935bba4f92bd.

Source measurements: `shell/Commons/Style.qml`, `shell/Ui/BarIconButton.qml`,
`shell/Ui/PanelToolTip.qml`, `shell/Ui/PopupCard.qml`, and the native workspace,
tray, and clock/calendar widgets. These files informed measurements and behavior;
their implementation was not copied into this repository.

- Bar: 26px high, 12px monospace text; status glyphs 13px in 27px slots.
- Workspaces: 20px slots, dim empty numbers, bright populated numbers, active square.
- Clock: full weekday and 24-hour time.
- Tooltips: 11px text, 6px vertical / 10px horizontal padding, 97% opacity.
- Calendar: adapted to YASB's built-in date-column/month-grid layout.
- Bluetooth: square opaque menu, spaced device rows, 2px frame around the list
  and scrollbar. Its styles account for YASB 2.0.7's viewport behavior.

The current charcoal palette is a local choice; Omarchy colors vary by theme.
Raycast supplies the application launcher. Network uses YASB's combined
Wi-Fi/Ethernet status widget. No Omarchy shell code or legacy YASB theme is loaded.

YASB was tested with 2.0.7 and Komorebi with 0.1.41. If an agent-launched restart
leaves Komorebi offline, use the existing desktop startup tasks for both apps.
