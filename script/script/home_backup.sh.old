#!/bin/env sh

# count the number of files in a directory
DIR='/data/home-backup'
FILECOUNT=$(find "$DIR" -name '*.tar.gz' | wc -l)
CFG='/home/josep/.config'

# Announcees a backup is being created
notify-send "Starting backup creation for: $(date +'%d-%m-%y').tar.gz"

# Backed up files:
  # i3 configs
  # Vscode settings.json
  # dunst config
  # neofetch config
  # kitty config
  # nvim config
  # picom config
  # polybar config
  # rofi config
  # spotify-tui configs
  # lf config

  # .config folder
  # scripts
  # .zshrc
  # .vim folder
  # .Xmodmap
  # wal cache folder
  # wal-theme folder
  # zsh-files folder
  # Documents folder
  # Pictures folder

# Creates backup
#tar -cvzf /data/home-backup/"$(date +'%d-%m-%y')".tar.gz \
  #"$CFG"/i3 "$CFG"/Code/User/settings.json "$CFG"/dunst \
  #"$CFG"/neofetch "$CFG"/kitty "$CFG"/nvim "$CFG"/picom \
  #"$CFG"/polybar "$CFG"/rofi "$HOME"/.p10k.zsh \
  #"$HOME"/script "$HOME"/.vim "$HOME"/.Xmodmap "$HOME"/.zshrc \
  #"$HOME"/.cache/wal "$CFG"/lf "$CFG"/spotify-tui "$HOME"/.zshenv \
  #"$HOME"/wal-theme "$HOME"/Documents > /data/home-backup/log/current_process.log

#tar -cvzf /data/home-backup/"$(date +'%d-%m-%y')".tar.gz \
    #$CFG "$HOME"/.zshrc \
    #"$HOME"/.cache/wal "$HOME"/zsh-files \
    #"$HOME"/script "$HOME"/.vim "$HOME"/.Xmodmap \
    #"$HOME"/Pictures \
    #"$HOME"/wal-theme "$HOME"/Documents > /data/home-backup/log/current_process.log

tar -cvzf /data/home-backup/"$(date +'%d-%m-%y')".tar.gz \
    "$HOME"/Pictures \
    "$HOME"/Documents > /data/home-backup/log/current_process.log

# Announces the backup process is finished
notify-send "Backup created."
echo "Backup created on $(date)" >> /data/home-backup/log/backup.log

# Deletes the oldest backup if more than 3 backup exists
if [[ $FILECOUNT -gt 3 ]]; then
    #tbd=$(find "$DIR" -name '*.tar.gz' | head -n1)
    tbd=$(ls /data/home-backup/ -h | head -n1)
    rm /data/home-backup/"$tbd"
    echo "$tbd" deleted on "$(date)" >> /data/home-backup/log/backup.log
fi
