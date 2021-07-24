#!/usr/bin/env bash
set -x

HOSTNAME=$1

# For M1 Macs
sudo softwareupdate --agree-to-license --install-rosetta

# Set hostname
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo scutil --set ComputerName $HOSTNAME
dscacheutil -flushcache

# Set current time zone to <timezone>. Use "-listtimezones" to list time zones.
sudo systemsetup -settimezone 'Europe/Berlin'

# Set using network time to either <on> or <off>.
sudo systemsetup -setusingnetworktime on

# Set network time server to <timeserver>.
sudo systemsetup -setnetworktimeserver time.apple.com

# Set restart on freeze to either <on> or <off>.
sudo systemsetup -setrestartfreeze on

# Set remote login to either <on> or <off>. Use "systemsetup -f -setremotelogin off" to suppress prompting when turning remote login off.
sudo systemsetup -f -setremotelogin off

# Set remote apple events to either <on> or <off>.
sudo systemsetup -setremoteappleevents off

# Set computer name to <computername>.
sudo systemsetup -setcomputername MBA2021

# Set local subnet name to <name>.
sudo systemsetup -setlocalsubnetname local

# Set sleep options for battery
sudo pmset -b displaysleep 1 disksleep 1 sleep 5

# Set sleep options for charger (wall power)
sudo pmset -c displaysleep 5 disksleep 5 sleep 5

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName