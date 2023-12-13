all:
	sudo add-apt-repository ppa:git-core/ppa && sudo apt update -y && sudo apt install -fy git

clean:
	sudo apt remove --purge -fy git
	sudo rm -rf /etc/apt/sources.list.d/git-core-ubuntu-ppa-jammy*
	sudo rm -rf /etc/apt/sources.list.d/git-core-ubuntu-ppa-focal*
