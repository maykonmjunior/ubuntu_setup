all:
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:appimagelauncher-team/stable
	sudo apt update -y
	sudo apt install -yf appimagelauncher

setup:
	sudo cp ../settings_files/appimagelauncher.cfg ~/.config/appimagelauncher.cfg

getup:
	sudo cp ~/.config/appimagelauncher.cfg ../settings_files/appimagelauncher.cfg
