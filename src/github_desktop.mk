all:
	wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
	sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
	sudo apt update -y && sudo apt install -yf github-desktop

clean:
	sudo apt remove --purge -fy github-desktop
	sudo rm -rf /usr/bin/github-desktop /usr/lib/github-desktop
	sudo rm -rf /usr/share/github-desktop*
	sudo rm -rf /usr/share/*/github-desktop*
	sudo rm -rf /var/lib/dpkg/info/github-desktop*
	sudo rm -rf /usr/lib/github-desktop*
