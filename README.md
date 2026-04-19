# Hex-X

Hex-X 1.0.0 is a tabbed desktop hex editor for opening, inspecting, editing, comparing, and saving binary files.

The app keeps the lightweight single-window workflow from its editor roots, but the document model now treats files as bytes. Each tab renders offsets in the gutter, a 16-byte hexadecimal grid, and an ASCII preview pane so binary files are readable and editable without converting them to text.

## Highlights

- Opens files as raw bytes and writes bytes back on save
- Hex view with offsets shown only in the gutter, 16 bytes per row, and ASCII preview
- Direct nibble editing in the hex grid
- Printable ASCII editing in the ASCII pane
- Right-click `Add NOP` action that overwrites selected bytes with `90`
- Paste support for copied hex dumps, byte strings, and plain text
- Go To Offset with decimal, `0x...`, and `...h` input
- Side-by-side compare for open tabs
- Remote open/save through `scp` for `user@host:/absolute/path` files
- Offset gutter, breadcrumbs, status bar, zoom, notes, command panel, themes, language selector, and hotkey settings
- No minimap; the editor keeps the byte grid focused and uses the gutter as the only offset ruler
- Read-only preview mode for files larger than the editable byte limit
- Atomic binary saves, recovery snapshots, and conflict checks before overwriting changed files

## Editing Model

Hex-X is overwrite-oriented, which is the safest default for binary files.

- Type a hex digit in the byte grid to replace the selected nibble.
- Type a printable character in the ASCII pane to replace that byte.
- Press `Delete` to set the current byte to `00`.
- Press `Backspace` to move to the previous byte.
- Select bytes, right-click, and choose `Add NOP` to overwrite that selection with `90` bytes.
- Paste accepts Hex-X dump rows, plain hexadecimal byte sequences, or normal clipboard text encoded as UTF-8.

## File Size Behavior

- Files up to the editable byte limit open as editable hex buffers.
- Larger files open as a read-only preview of the first loaded byte range so the UI stays responsive.
- Preview tabs cannot be saved back over the source file.

## Command Panel

Press `Ctrl+Shift+K` to open the command panel. Built-in commands begin with `:`.

Useful commands include:

- `:open [path]`
- `:remote user@host:/absolute/path`
- `:recent [list|N|clear]`
- `:new-tab`
- `:close-tab`
- `:save`
- `:save-all`
- `:save-as`
- `:save-copy`
- `:find`
- `:find-next`
- `:find-prev`
- `:goto-offset`
- `:compare`
- `:close-compare`
- `:theme [list|create|name]`
- `:offset-gutter on|off`
- `:language [list|code]`
- `:breadcrumbs on|off`
- `:autosave on|off`
- `:help`
- `:about`

## Main Shortcuts

- `Ctrl+W` Open
- `Ctrl+Alt+O` Open Remote
- `Ctrl+T` New Tab
- `Ctrl+Shift+T` Close Tab
- `Ctrl+S` Save
- `Ctrl+Shift+S` Save All
- `Ctrl+Shift+Q` Save As
- `Ctrl+Alt+S` Save Copy As
- `Ctrl+F` Find
- `F3` Find Next
- `Shift+F3` Find Previous
- `Ctrl+G` Go To Offset
- `Ctrl+Q` Compare Tabs
- `Ctrl+Shift+K` Command Panel
- `Ctrl+Plus` Zoom In
- `Ctrl+Minus` Zoom Out
- `F1` Help Contents
- `Shift+F1` About Hex-X

## Locales

The English locale (`cfg/language/en_us.yml`) is the source locale for the Hex-X UI. Other locale files keep compatible keys and can be translated from the updated English text.
