# First kill polybar
killall -q polybar

# Run the wal script using a random wallpaper
ls $HOME/Wallpapers/ | sort -R | tail -$N | while read wallpaper; do
	wal -i $HOME/Wallpapers/$wallpaper -t
	break;
done

# Rerun polybar
($HOME/.config/polybar/launch.sh &) &> .err.log


