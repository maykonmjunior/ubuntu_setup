all:
	@chmod +x src/shs/gmail.sh
	@./src/shs/gmail.sh install

clean:
	@./shs/gmail.sh uninstall
