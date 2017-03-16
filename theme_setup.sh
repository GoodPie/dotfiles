#!/bin/bash

# Requirements for the current config
INSTALL_CMD="sudo apt install"
REQUIRED="i3 compton rofi thunar scrot feh"

# Directory setups
CONFIG_DIR="$HOME/.config"
WALLPAPER_DIR="$HOME"
SAVE_DIR="dots"

WM_DIR="$CONFIG_DIR/i3"
POLYBAR_DIR="$CONFIG_DIR/polybar"
TERMINATOR_DIR="$CONFIG_DIR/terminator"

# File names
WALLPAPER=".wallpaper.png"

function save() {

    mkdir $SAVE_DIR

    # Copy polybar
    cp -r $POLYBAR_DIR $SAVE_DIR
    echo "Copied polybar config from $POLYBAR_DIR to $SAVE_DIR "
    
    # Copy i3
    cp -r $WM_DIR $SAVE_DIR
    echo "Copied i3 config from $WM_DIR to $SAVE_DIR "

    # Copy Terminator
    cp -r $TERMINATOR_DIR $SAVE_DIR
    echo "Copied terminator config $TERMINATOR_DIR to $SAVE_DIR "

    # Copy wallpaper
    cp $WALLPAPER_DIR/$WALLPAPER $SAVE_DIR
    echo "Copied wallpaper from $WALLPAPER_DIR/$WALLPAPER to $SAVE_DIR"

}

function load() {

    # Install dependencies
    while true; do
        read -p "Would you like to install i3, rofi, scrot, feh, thunar and compton? [Y/N] " yn
        case $yn in
            [Yy]* ) $INSTALL_CMD $REQUIRED; echo "Done "; break;;
            [Nn]* ) break;;
            * ) echo "Enter [Y/N]";;
        esac
    done

    # Load the i3 config
    while true; do
        read -p "Do you want to use the i3 config? [Y/N]" yn
        case $yn in
            [Yy]* ) cp -r $WM_DIR $CONFIG_DIR/; echo "Done "; break;;
            [Nn]* ) break;;
            * ) echo "Enter [Y/N]";;
        esac
    done

    # Load the polybar config
    while true; do
        read -p "Do you want to use the polybar config? [Y/N] " yn
        case $yn in
            [Yy]* ) cp -r $POLYBAR_DIR $CONFIG_DIR/; echo "Done "; break;;
            [Nn]* ) break;;
            * ) echo "Enter [Y/N]";;
        esac
    done

    # Load the wallpaper
    while true; do
        read -p "Do you want to use the wallpaper? [Y/N] " yn
        case $yn in
            [Yy]* ) cp -r $SAVE_DIR/$WALLPAPER $WALLPAPER_DIR/$WALLPAPER; echo "Done "; break;;
            [Nn]* ) break;;
            * ) echo "Enter [Y/N]";;
        esac
    done

    
}

# Ask the user to load or save
while true; do
    read -p "Do you want to save or load? [L/S]" yn
    case $yn in
        [Ss]* ) save; break;;
        [Ll]* ) load; break;;
        * ) echo "Enter [L/S]";;
    esac
done
