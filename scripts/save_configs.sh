#!/bin/bash

var1='A'
DIR="/run/media/hecate/info-ssd"

echo -e " \n" 
echo -e "       +--------------+"
echo -e "       | saving files |"
echo -e "       +--------------+"

doThing(){
rm -rf  "$DEST_DIR/"
cp -r "$SOURCE_DIR" "$DEST_DIR"
echo -e "       $NAME  ...  🟢 ok "
}

if [ ! -d "$DIR/conf_filesL" ]; then
  mkdir "$DIR/conf_filesL"
  echo "Directory '$DIR/conf_filesL' created."
else
  echo "Directory seems right."
fi

NAME="scripts"
SOURCE_DIR="$HOME/scripts"
DEST_DIR="$DIR/conf_filesL/scripts"
doThing

NAME="bashrc"
SOURCE_DIR="$HOME/.bashrc"
DEST_DIR="$DIR/conf_filesL/.bashrc"
doThing
NAME="nvim"
SOURCE_DIR="$HOME/.config/nvim"
DEST_DIR="$DIR/conf_filesL/nvim/"
doThing

NAME="hyprland conf .conf/hypr "
SOURCE_DIR="$HOME/.config/hypr"
DEST_DIR="$DIR/conf_filesL/hypr"
doThing

NAME="matte black hypr"
SOURCE_DIR="$HOME/.local/share/omarchy/themes/matte-black"
DEST_DIR="$DIR/conf_filesL/matte-black"
doThing

NAME="aple"
SOURCE_DIR="$HOME/aple"
DEST_DIR="$DIR/aple"
doThing

NAME="waybar"
SOURCE_DIR="$HOME/.config/waybar"
DEST_DIR="$DIR/conf_filesL/waybar"
doThing


echo -e " \n" 
echo -e " \n" 
echo -e "       +-----------------+"
echo -e "       | sync ... github |"
echo -e "       +-----------------+"
echo -e "      \n       diff \n\n" 

read -n 1 -s -r -p "Press any key to continue..."

cd $DIR/conf_filesL
git diff
read -p "git push?  [Yy]yes /[n]no " -n 1 -r
echo    # (optional) move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then
    git add .
    git commit -m "auto save"
    git push
else
    echo -e "no changes!!"
fi


