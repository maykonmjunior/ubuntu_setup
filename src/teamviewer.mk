all:
	sudo sh -c "echo 'deb http://linux.teamviewer.com/deb stable main' >> /etc/apt/sources.list.d/teamviewer.list"
	wget -q https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc -O- | sudo apt-key add -
	sudo apt update -y
	sudo apt install -yf teamviewer

clean:
	sudo apt remove --purge -fy teamviewer
	sudo rm -rf /etc/apt/sources.list.d/teamviewer*
	sudo rm -rf /usr/bin/teamviewer /usr/share/teamviewer
	sudo rm -rf /usr/share/*/teamviewer*
	sudo rm -rf /var/lib/dpkg/info/teamviewer*
	sudo rm -rf ~/.config/teamviewer*
