all:
	sudo add-apt-repository ppa:ubuntuhandbook1/app
	sudo apt update -y && sudo apt install -fy audacious

setup:
	sudo cp ../settings_files/audacious_config ~/.config/audacious/config

getup:
	sudo cp ~/.config/audacious/config ../settings_files/audacious_config

clean:
	sudo apt remove --purge -fy audacious
	sudo rm -rf ~/.config/audacious*
	sudo rm -rf /usr/bin/audacious /usr/lib/x86_64-linux-gnu/audacious /usr/share/audacious /usr/share/man/man1/audacious.1.gz
	sudo rm -rf /usr/share/*/audacious*
	sudo rm -rf /usr/share/locale/*/LC_MESSAGES/audacious*
	sudo rm -rf /var/lib/dpkg/info/audacious*
