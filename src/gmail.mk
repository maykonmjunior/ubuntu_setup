all:
#	sudo apt-get install jq -fy
	chmod +x shs/gmail.sh
	./shs/gmail.sh install
#	make upd

clean:
	chmod +x shs/gmail.sh
	./shs/gmail.sh uninstall
