#!/usr/bin/bash
#
notify-send "OfflineIMAP" "Checking..." -i mail
#run OfflineIMAP once, with quiet interface
offlineimap -o -q -u quiet

maildir="$HOME/.mail/"
#count new mail for every maildir
maildirnew="$maildir*/INBOX/new/"
new="$(find $maildirnew -type f | wc -l)"

#count old mail for every maildir
maildirold="$maildir*/*/cur/"
old="$(find $maildirold -type f | wc -l)"

if [ $new -gt 0 ]
then
    export DISPLAY=:0; export XAUTHORITY=~/.Xauthority;
    notify-send "OfflineIMAP" "New mail!\nNew: $new Old: $old" -i mail
fi
