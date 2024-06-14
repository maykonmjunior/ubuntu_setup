all:
	sudo dpkg --add-architecture i386
	sudo mkdir -pm755 /etc/apt/keyrings
	sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
	sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
	sudo apt update -y
	sudo apt install -yf winehq-stable wine-stable wine-stable-amd64 wine-stable-i386
	sudo apt update -y
	sudo apt install -yf winetricks
	

# Wine files are installed in /opt/wine-stable/
# to choose an specific wine version, add "=<version>" to winehq-stable, wine-stable, wine-stable-amd64 and wine-stable-i386

clean:
	sudo apt remove --purge -fy winehq-stable wine-stable wine-stable-amd64 wine-stable-i386 winetricks
	sudo rm -rf /etc/apt/sources.list.d/wine*
	sudo rm -rf /etc/apt/keyrings/wine*
	sudo rm -rf /opt/wine*
	sudo rm -rf /opt/wine-stable
	sudo rm -rf ~/*/wine*
	sudo rm -rf ~/.local/share/*/wine*
	sudo rm -rf /usr/bin/wine*
	sudo rm -rf /usr/lib/wine*
	sudo rm -rf /usr/share/wine*
	sudo rm -rf /usr/share/*/wine*
	sudo rm -rf /var/lib/*/wine*
	sudo rm -rf /var/lib/dpkg/info/wine*
	sudo rm -rf /var/lib/swcatalog/icons/*/wine*
