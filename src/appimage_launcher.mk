all:
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:appimagelauncher-team/stable
	sudo apt update -y
	sudo apt install -yf appimagelauncher
