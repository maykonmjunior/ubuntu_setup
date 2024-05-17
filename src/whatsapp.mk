all:
	@chmod +x shs/whatsapp.sh
	@./shs/whatsapp.sh install
	@make upd

clean:
	@./shs/whatsapp.sh uninstall
	@make upd

setup:
	sudo cp ../settings_files/whatsapp ~/.config/Altus/settings.json

getup:
	sudo cp ~/.config/Altus/settings.json ../settings_files/whatsapp
