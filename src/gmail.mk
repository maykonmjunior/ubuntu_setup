all:
	@chmod +x shs/gmail.sh
	@./shs/gmail.sh install
	@make upd

clean:
	@./shs/gmail.sh uninstall
	@make upd
