all:
	sudo wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
	sudo apt install -f ./discord.deb -y
	sudo rm -f discord.deb
