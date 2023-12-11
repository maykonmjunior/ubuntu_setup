all:
	curl -1sLf \   'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \   | sudo -E bash && sudo apt update -y && sudo apt install -yf balena-etcher-electron
