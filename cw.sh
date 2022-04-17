#!/bin/bash/
clear

echo '
Script for making a .xml file for gnome wallpapers (42+)
'
name=$(zenity --entry --text "Please enter file name");

Light_wp=$(zenity --file-selection --filename ~/wallpapers/all\ walls/ --title="Pick Light Wallpaper")
Dark_wp=$(zenity --file-selection --filename ~/wallpapers/all\ walls/ --title="Pick Dark Wallpaper")

#Light_wp=$(zenity --file-selection --title="Pick Light Wallpaper")
#Dark_wp=$(zenity --file-selection --title="Pick Dark Wallpaper")

touch $name.xml

content0='<?xml version="1.0"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
 <wallpaper deleted="false">'
content1="  <name>${name}</name>
   <filename>${Light_wp}</filename>
   <filename-dark>${Dark_wp}</filename-dark>
   <options>zoom</options>
   <shade_type>solid</shade_type>
   <pcolor>#3465a4</pcolor>
   <scolor>#000000</scolor>
 </wallpaper>
</wallpapers>"
 
echo "" > $name.xml 
echo "$content0" > $name.xml
echo "$content1" >> $name.xml

sudo <<< "echo $(zenity --password)" mv $name.xml /usr/share/gnome-background-properties/ 