all:
	sudo apt-get install wget gpg
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	sudo apt install -yf apt-transport-https
	sudo apt update -y
	sudo apt install -fy code

clean:
	sudo apt remove --purge -fy code
	sudo rm -rf /etc/apt/sources.list.d/vscode*
	sudo rm -rf /etc/apt/keyrings/packages.microsoft.gpg
	sudo rm -rf /usr/bin/code /usr/share/code
	sudo rm -rf /usr/share/*/code*
	sudo rm -rf /var/lib/*/code*
	sudo rm -rf ~/.config/code
	sudo rm -rf /usr/src/*/code
