all:
	sudo wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
	sudo apt install -fy ./discord.deb
	sudo rm -f discord.deb

clean:
	sudo apt remove --purge -fy discord
	sudo rm -rf /usr/bin/discord /usr/share/discord
	sudo rm -rf ~/.config/discord*
	sudo rm -rf /usr/share/*/discord*
	sudo rm -rf /var/lib/dpkg/info/discord*
