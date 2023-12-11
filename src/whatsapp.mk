all:
	sudo apt install -fy

setup:
	sudo cp ../settings_files/whatsapp ~/.config/Altus/settings.json

getup:
	sudo cp ~/.config/Altus/settings.json ../settings_files/whatsapp
