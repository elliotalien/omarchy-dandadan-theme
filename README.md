# Omarchy DanDaDan Theme

A dark, red-toned [Omarchy](https://omarchy.org) theme inspired by DanDaDan —
deep maroon backgrounds, rose accents, and a wallpaper set featuring Momo and
Ken (Okarun).

## Palette

| Role        | Color     |
| ----------- | --------- |
| Background  | `#170c0e` |
| Accent      | `#e15163` |
| Foreground  | `#efebec` |
| Selection   | `#462024` |
| Muted       | `#79494f` |
| Red         | `#d6666e` |
| Yellow      | `#d8bb64` |
| Green       | `#6ecf86` |
| Cyan        | `#637dd9` |
| Blue        | `#7684c6` |
| Magenta     | `#c269d3` |

## Install

```bash
omarchy theme install https://github.com/elliotalien/omarchy-dandadan-theme
omarchy theme set dandadan
```

## Dynamic wallpaper colors (optional)

The theme ships with a `.wallpaper-colors` marker and a small service in
`extras/wallpaper-colors/` that regenerates `colors.toml` from whichever
wallpaper is active — switch wallpapers and the bar, terminals, and window
accents recolor to match the image automatically.

Requires `python3`, `python-pillow`, and `inotify-tools`.

### Enable it

```bash
~/.config/omarchy/themes/dandadan/extras/wallpaper-colors/install.sh
```

This installs the palette generator and watcher into `~/.local/bin/`, adds a
systemd user service, and starts it.

### Add your own wallpapers

Drop any `.jpg`/`.png`/`.webp` image into `backgrounds/` (or
`~/.config/omarchy/backgrounds/dandadan/`), then switch to it with
`omarchy theme bg next` or `omarchy theme bg-switcher`. A palette is generated
on first use and cached in `~/.cache/omarchy/wallpaper-colors/` for instant
switching afterward.

Without the optional service the theme still works — colors just stay fixed.

## Layout

```
colors.toml                    # theme palette
shell.bar.toml                 # bar styling
.wallpaper-colors              # opt-in flag for auto-recoloring
backgrounds/                   # DanDaDan wallpapers
extras/wallpaper-colors/       # generator, watcher, systemd unit, installer
```
