#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# window manager
sxhkd &
exec bspwm
