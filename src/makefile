all: main

upd:
	sudo apt update && sudo apt upgrade -y && sudo apt install -f && sudo apt --fix-broken install -y && sudo apt autoclean -y && sudo apt autopurge -y

main:
	make upd
	make -f vscode.mk
	make upd
	make -f brave.mk
	make upd
	make -f git.mk
	make upd
	make -f github_desktop.mk
	make upd
	make -f mega.mk
	make upd
	make -f appimage.mk
	make upd
	make -f balena_etcher.mk
	make upd
	make -f discord.mk
	make upd
	make -f audacious.mk
	make upd
	make -f waydroid.mk
	make upd
