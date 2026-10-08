#!/bin/bash
# Install the wallpaper-based theme recoloring service.
# Copies the palette generator + watcher into ~/.local/bin, installs the
# systemd user unit, and starts it. Requires: python3, python-pillow,
# inotify-tools.

set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

missing=()
command -v inotifywait >/dev/null || missing+=("inotify-tools")
command -v python3 >/dev/null || missing+=("python")
python3 -c "import PIL" 2>/dev/null || missing+=("python-pillow")
if ((${#missing[@]})); then
  echo "Missing dependencies: ${missing[*]}"
  echo "On Arch: sudo pacman -S ${missing[*]}"
  exit 1
fi

install -Dm755 "$SRC/wallpaper-colors-gen" "$HOME/.local/bin/wallpaper-colors-gen"
install -Dm755 "$SRC/wallpaper-colors-watch" "$HOME/.local/bin/wallpaper-colors-watch"
install -Dm644 "$SRC/wallpaper-colors.service" "$HOME/.config/systemd/user/wallpaper-colors.service"

systemctl --user daemon-reload
systemctl --user enable --now wallpaper-colors.service

echo "wallpaper-colors service installed and running."
echo "Themes with a .wallpaper-colors file will auto-recolor on wallpaper change."
