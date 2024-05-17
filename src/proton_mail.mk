all:
	@chmod +x shs/proton_mail.sh
	@./shs/proton_mail.sh install
	@make upd	

clean:
	@./shs/proton_mail.sh uninstall
	@make upd
