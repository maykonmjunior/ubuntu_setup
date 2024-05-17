all:
	sudo apt install -yf curl && sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update -y && sudo apt install brave-browser -fy
	make upd

getup:
	sudo cp ~/.config/BraveSoftware/Brave-Browser/Default/Preferences ../settings_files/brave_config

setup:
	sudo cp ../settings_files/brave_config ~/.config/BraveSoftware/Brave-Browser/Default/Preferences

clean:
	sudo apt remove --purge -fy brave-browser
	sudo rm -rf /etc/apt/sources.list.d/brave-browser*
	sudo rm -rf /usr/share/keyrings/brave-browser*
	make upd
