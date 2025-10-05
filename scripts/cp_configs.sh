#!/bin/bash

var1='A'
var2='B'

echo -e " \n" 
echo -e "       +--------------+"
echo -e "       | saving files |"
echo -e "       +--------------+"

  

doThing(){
rm -rf  "$DEST_DIR/"
cp -r "$SOURCE_DIR" "$DEST_DIR"

echo -e "       $NAME  ...  🟢 ok "
}


#SOURCE_DIR="/home/user/documents"
#DEST_DIR="/home/user/backups"

# Create destination directory if it doesn't exist
#mkdir -p "$DEST_DIR"

# Copy all .txt files from SOURCE_DIR to DEST_DIR
#cp "$SOURCE_DIR"/*.txt "$DEST_DIR"/

# Copy a specific file with a new name
#cp "$SOURCE_DIR"/report.pdf "$DEST_DIR"/weekly_report.pdf

# Copy an entire directory recursively and verbosely
#cp -rv "$SOURCE_DIR"/images/ "$DEST_DIR"/archive_images/
DIR="/run/media/hecate/info-ssd"

if [ ! -d "$DIR/conf_n" ]; then
  mkdir "$DIR/conf_n"
  echo "Directory '$DIR/conf_n' created."
else
  echo "Directory seems right."
fi

NAME="scripts"
SOURCE_DIR="$HOME/scripts"
DEST_DIR="$DIR/conf_n/scripts"
doThing

NAME="bashrc"
SOURCE_DIR="$HOME/.bashrc"
DEST_DIR="$DIR/conf_n/.bashrc"
doThing
NAME="nvim"
SOURCE_DIR="$HOME/.config/nvim"
DEST_DIR="$DIR/conf_n/nvim/"
doThing

NAME="hyprland conf .conf/hypr "
SOURCE_DIR="$HOME/.config/hypr"
DEST_DIR="$DIR/conf_n/hypr"
doThing

NAME="matte black hypr"
SOURCE_DIR="$HOME/.local/share/omarchy/themes/matte-black"
DEST_DIR="$DIR/conf_n/matte-black"
doThing

NAME="aple"
SOURCE_DIR="$HOME/aple"
DEST_DIR="$DIR/aple"
doThing

echo -e " \n" 
echo -e " \n" 
echo -e "       +-----------------+"
echo -e "       | sync ... github |"
echo -e "       +-----------------+"
echo -e "      \n       diff \n\n" 

cd $DIR/conf_n
git diff
read -p "Are you sure? [Yy]yes /[n]no " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git add .
    git commit -m "auto save"
    git push
else
    echo -e "no changes!!"
fi


