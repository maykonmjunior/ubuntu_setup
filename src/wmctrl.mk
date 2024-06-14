all:
	sudo apt install -yf wmctrl

clean:
	sudo apt remove --purge -fy wmctrl
	sudo rm -rf /usr/bin/wmctrl /usr/share/man/man1/wmctrl.1.gz
	sudo rm -rf /usr/share/*/wmctrl*
	sudo rm -rf /var/lib/dpkg/info/wmctrl*
