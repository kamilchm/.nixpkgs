#!/usr/bin/env bash
set -e

if command -v gsettings >/dev/null 2>&1; then
  gsettings set org.gnome.desktop.interface gtk-theme 'Materia-dark'
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi
