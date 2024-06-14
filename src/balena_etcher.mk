all:
	curl -1sLf \   'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \   | sudo -E bash && sudo apt update -y && sudo apt install -yf balena-etcher-electron

clean:
	sudo apt remove --purge -fy balena-etcher-electron
	sudo rm -rf /etc/apt/sources.list.d/balena-etcher*
	sudo rm -rf /usr/bin/balena-etcher-electron
	sudo rm -rf /usr/share/balena-etcher-electron*
	sudo rm -rf /usr/share/*/balena-etcher-electron*
	sudo rm -rf /var/lib/dpkg/info/balena-etcher-electron*
	sudo rm -rf /opt/balenaEtcher
	sudo rm -rf ~/.config/balena-etcher-electron
