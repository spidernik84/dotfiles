#!/bin/bash

# pick background as input parameter
BG=$1

SELECTION="$(printf "󰌾 Lock\n󰤄 Suspend\n󰤄 Hibernate\n󰍃 Log out\n Reboot\n Reboot to UEFI\n󰐥 Shutdown" | fuzzel --dmenu -l 7 -w 20 -p "Select an option: ")"

confirm_action() {
    local action="$1"
    CONFIRMATION="$(printf "No\nYes" | fuzzel --dmenu -l 2 -w 18 -p "$action?")"
    [[ "$CONFIRMATION" == *"Yes"* ]]
}

case $SELECTION in
    *"󰌾 Lock"*)
        swaylock -f -i $BG -c 000000  && sleep 1;;
    *"󰤄 Suspend"*)
        systemctl suspend;;
    *"󰤄 Hibernate"*)
        if confirm_action "Hibernate"; then
            systemctl hibernate
        fi;;
    *"󰍃 Log out"*)
        if confirm_action "Log out"; then
            swaymsg exit
        fi;;
    *" Reboot"*)
        if confirm_action "Reboot"; then
            systemctl reboot
        fi;;
    *" Reboot to UEFI"*)
        if confirm_action "Reboot to UEFI"; then
            systemctl reboot --firmware-setup
        fi;;
    *"󰐥 Shutdown"*)
        if confirm_action "Shutdown"; then
            systemctl poweroff
        fi;;
esac
