all:
	@chmod +x shs/gmail.sh
	@./shs/gmail.sh install

clean:
	@./shs/gmail.sh uninstall
