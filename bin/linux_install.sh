#!/bin/sh
# Copyright (C) 2008 - Alexandre da Silva <simpsomboy@gmail.com>
# TextMate Url Handler for Gedit - Installation Script
echo "-------------------------------------------------------------------------"
echo "-               Linux Footnotes url handler registration                -"
echo "-------------------------------------------------------------------------"
echo "DO NOT EXECUTE THIS COMMAND AS ROOT, EXECUTE AS A NORMAL USER, THAN SUDO"
echo "PASSWORD WILL BE ASKED AS NEEDED. PRESS:"
echo " 2 - continue"
echo " 1 - abort"

install_handler() {
  echo "Install url handler..."
  sudo cp ./txmt_handler /usr/bin/txmt_handler
  sudo chmod +x /usr/bin/txmt_handler
}

configure_gnome() {
  echo "Configuring gnome..."
  /usr/bin/gconftool-2 -s -t string /desktop/gnome/url-handlers/txmt/command '/usr/bin/txmt_handler "%s"'
  /usr/bin/gconftool-2 -s -t bool /desktop/gnome/url-handlers/txmt/enabled true
}

choice=0
while [ $choice -eq 0 ]; do
  read choice
  if [ $choice -eq 2 ] ; then
    echo "start install..."
    install_handler
    configure_gnome
  else
    if [ $choice -eq 1 ] ; then
      echo "exiting..."
      exit 0
    else
      $choice=0
    fi
  fi
done
