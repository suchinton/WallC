#!/bin/bash/
clear

echo '
Script for making a .xml file for gnome wallpapers (42+)
'
name=""
echo 'Enter name of file: '
read name

Light_wp=$(zenity --file-selection)
Dark_wp=$(zenity --file-selection)

touch $name.xml

content0='<?xml version="1.0"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
 <wallpaper deleted="false">
'
content1="  <name>${name}</name>
   <filename>${Light_wp}</filename>
   <filename-dark>${Dark_wp}</filename-dark>
   <options>zoom</options>
   <shade_type>solid</shade_type>
   <pcolor>#3465a4</pcolor>
   <scolor>#000000</scolor>
 </wallpaper>
</wallpapers>
"
echo " " > $name.xml
echo "$content0" > $name.xml
echo "$content1" >> $name.xml
sudo mv $name.xml /usr/share/gnome-background-properties/