all:
	@chmod +x shs/proton_mail.sh
	@./shs/proton_mail.sh install

clean:
	@./shs/proton_mail.sh uninstall
