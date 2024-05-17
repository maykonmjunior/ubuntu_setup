all:
    wget https://mega.nz/linux/repo/xUbuntu_22.10/amd64/megasync-xUbuntu_22.10_amd64.deb && sudo apt install "$PWD/megasync-xUbuntu_22.10_amd64.deb"
	make upd

clean:
    sudo apt remove --purge -fy megasync
    sudo rm -rf /etc/apt/sources.list.d/megasync*
    sudo rm -rf /usr/bin/megasync /usr/share/megasync
    sudo rm -rf /usr/share/*/megasync*
    sudo rm -rf /var/lib/dpkg/info/megasync*
    sudo rm -rf ~/.config/megasync*
	make upd
