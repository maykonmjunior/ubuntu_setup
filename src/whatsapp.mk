all:
	@chmod +x src/shs/whatsapp.sh
	@./src/shs/whatsapp.sh install

clean:
	@./shs/whatsapp.sh uninstall

setup:
	sudo cp ../settings_files/whatsapp ~/.config/Altus/settings.json

getup:
	sudo cp ~/.config/Altus/settings.json ../settings_files/whatsapp
