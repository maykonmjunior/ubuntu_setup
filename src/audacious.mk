all:
	sudo add-apt-repository ppa:ubuntuhandbook1/app
	sudo apt update -y && sudo apt install -fy audacious

setup:
	sudo cp ../settings_files/audacious_config ~/.config/audacious/config

getup:
	sudo cp ~/.config/audacious/config ../settings_files/audacious_config
