#!/bin/bash


HDMI="HDMI-A-1"
DP="DP-1"

if hyprctl monitors | grep -q "$DP (enabled)"; then
    # DP is active -> disable HDMI
    hyprctl dispatch dpms off "$HDMI"
else
    # DP not active -> enable HDMI
    hyprctl dispatch dpms on "$HDMI"
fi

