all:
	@echo "options:"
	@echo "--> make install                  = install all suported apps"
	@echo "--> make get_configs              = get settings from current sistem"
	@echo "--> make load_configs             = load settings into current sistem"
	@echo "--> make setup                    = settings setup for all apps"
	@echo "--> make -f <file_name>.mk        = install the associated app"
	@echo "--> make -f <file_name>.mk clean  = uninstall the associated app"
	@echo "--> make remove_snap              = remove snap packages"
	@echo "--> make upd                      = update the sistem"

upd:
	sudo apt update && sudo apt upgrade -y && sudo apt install -f && sudo apt --fix-broken install -y && sudo apt autoclean -y && sudo apt autopurge -y

install:
	make upd
	make -f appimage_launcher.mk
	make -f brave.mk
	make -f vscode.mk
	make -f git.mk
	make -f github_desktop.mk
	make -f firefox.mk
	make -f mega.mk
	make -f gmail.mk
	make -f discord.mk
	make -f audacious.mk
	make -f whatsapp.mk
	make -f wmctrl.mk
	make -f yt-dlp.mk
	make -f proton_mail.mk
# make -f balena_etcher.mk
# make -f waydroid.mk
# make -f OBS_studio.mk
# make -f teamviewer.mk
# make -f wine.mk
# não tem api github, então precisaria conseguir extrair o deb da página HTML
#	make -f binance.mk

get_configs:
	sudo cp ~/.bash_aliases ../settings_files/bash_aliases
# get gnome get_configs
	dconf dump / > ../settings_files/dconf-backup.txt
	sudo cp ~/.config/mimeapps.list ../settings_files/defaultapps.list
	make -f appimage_launcher.mk getup
	make -f audacious.mk getup
	make -f brave.mk getup
	make -f whatsapp.mk getup

# TODO
__load_configs:
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
