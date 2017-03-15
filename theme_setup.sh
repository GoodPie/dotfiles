# System settings
install_cmd="sudo apt install"
configs="$HOME/.config"

# Vars
installs="i3 compton rofi thunar"
wallpaper_dir="$HOME"
wallpaper=".wallpaper.png"
save_dir="current_rice"

function save() {

    mkdir $save_dir

    # Copy polybar
    cp -r $configs/polybar $save_dir
    
    # Copy i3
    cp -r $configs/i3 $save_dir

    # Copy wallpaper
    cp $wallpaper_dir/$wallpaper $save_dir

}

function load() {

    # Install dependencies
    while true; do
        read -p "Would you like to install i3, rofi, thunar and compton? " yn
        case $yn in
            [Yy]* ) $install_cmd $installs; break;;
            [Nn]* ) break;;
            * ) echo "Enter [Y/N]";;
        esac
    done

    # Load the i3 config
    while true; do
        read -p "Do you want to use the i3 config? " yn
        case $yn in
            [Yy]* ) cp -r $save_dir/i3 $configs/; break;;
            [Nn]* ) break;;
            * ) echo "Enter [Y/N]";;
        esac
    done

    # Load the polybar config
    while true; do
        read -p "Do you want to use the polybar config? " yn
        case $yn in
            [Yy]* ) cp -r $save_dir/polybar $configs/; break;;
            [Nn]* ) break;;
            * ) echo "Enter [Y/N]";;
        esac
    done

    # Load the wallpaper
    while true; do
        read -p "Do you want to use the wallpaper? " yn
        case $yn in
            [Yy]* ) cp -r $save_dir/$wallpaper $wallpaper_dir/$wallpaper; break;;
            [Nn]* ) break;;
            * ) echo "Enter [Y/N]";;
        esac
    done

    
}

# Ask the user to load or save
while true; do
    read -p "Do you want to save or load? " yn
    case $yn in
        [Ss]* ) save; break;;
        [Ll]* ) load; break;;
        * ) echo "Enter [L/S]";;
    esac
done
