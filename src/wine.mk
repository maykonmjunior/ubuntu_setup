all:
	sudo dpkg --add-architecture i386 && sudo mkdir -pm755 /etc/apt/keyrings && sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources && sudo apt update -y && sudo apt install winehq-stable wine-stable wine-stable-amd64 wine-stable-i386 && sudo apt update -y

# Wine files are installed in /opt/wine-stable/
# to choose an specific wine version, add "=<version>" to winehq-stable, wine-stable, wine-stable-amd64 and wine-stable-i386
