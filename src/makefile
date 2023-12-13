all:
	python3 info.py

upd:
	sudo apt update && sudo apt upgrade -y && sudo apt install -f && sudo apt --fix-broken install -y && sudo apt autoclean -y && sudo apt autopurge -y

install:
	make upd
	make -f brave.mk
	make upd
	make -f vscode.mk
	make upd
	make -f git.mk
	make upd
	make -f github_desktop.mk
	make upd
	make -f appimage_launcher.mk
	make upd
	make -f mega.mk
	make upd
	make -f balena_etcher.mk
	make upd
# os 3 abaixo precisam de wget ou curl
	make -f whatsapp.mk
	make upd
	make -f proton_mail.mk
	make upd
	make -f binance.mk
	make upd
# volta a funcionar
	make -f discord.mk
	make upd
	make -f audacious.mk
	make upd
	make -f waydroid.mk
	make upd
	make -f wmctrl.mk
	make upd
	make -f yt-dlp.mk
	make upd

get_configs:
	sudo cp ~/.bash_aliases ../settings_files/bash_aliases
# get gnome get_configs
	dconf dump / > ../settings_files/dconf-backup.txt
	sudo cp ~/.config/mimeapps.list ../settings_files/defaultapps.list
	make -f appimage_launcher.mk getup
	make -f audacious.mk getup
	make -f brave.mk getup
	make -f whatsapp.mk getup

load_configs:
#	setup bash aliases
	sudo cp ../settings_files/bash_aliases ~/.bash_aliases
#	setup gnome configs
	dconf load / < ../settings_files/dconf-backup.txt
	make remove_snap
	make upd

setup:
	make -f audacious.mk setup
	make -f whatsapp.mk setup
	make upd

remove_snap:
	snap list
	sudo snap remove --purge firefox
	sudo snap remove --purge core*
	sudo snap remove --purge gnome*
	sudo snap remove --purge gtk*
	sudo snap remove --purge snap-store
	sudo snap remove --purge snapd
	sudo rm -rf /var/cache/snapd/
	sudo systemctl stop snapd
	sudo unmount /snap/core/*
	sudo apt purge snapd* gnome-software-plugin-snap --auto-remove
	sudo rm -rf ~/snap /var/cache/snapd/ /var/snap /var/lib/snapd
	sudo apt-mark hold snapd
