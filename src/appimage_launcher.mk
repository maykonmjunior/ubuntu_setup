all:
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:appimagelauncher-team/stable
	sudo apt update -y
	sudo apt install -yf appimagelauncher

setup:
	sudo cp ../settings_files/appimagelauncher.cfg ~/.config/appimagelauncher.cfg

getup:
	sudo cp ~/.config/appimagelauncher.cfg ../settings_files/appimagelauncher.cfg

clean:
	sudo apt remove --purge -fy appimagelauncher
	sudo rm -rf ~/.config/appimagelauncher*
	sudo rm -rf /etc/apt/sources.list.d/appimagelauncher*
	sudo rm -rf /usr/bin/appimagelauncherd /usr/lib/x86_64-linux-gnu/appimagelauncher /usr/share/appimagelauncher
	sudo rm -rf /usr/share/*/appimagelauncher*
	sudo rm -rf /var/lib/dpkg/info/appimagelauncher*
