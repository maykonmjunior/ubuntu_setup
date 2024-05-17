all:
	sudo add-apt-repository ppa:mozillateam/ppa -y
	sudo apt update -y
	sudo apt install firefox-esr -y
	make upd

clean:
	sudo apt --purge remove firefox -y
	sudo rm -Rf /opt/firefox*
	sudo rm -Rf /usr/bin/firefox
	sudo rm -Rf /usr/share/applications/firefox.desktop
	sudo rm -Rf /usr/lib/firefox
	sudo rm -Rf /etc/firefox
	sudo rm -Rf /usr/local/bin/firefox
	make upd
