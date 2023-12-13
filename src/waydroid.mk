all:
	sudo apt install curl ca-certificates -fy && curl https://repo.waydro.id | sudo bash && sudo apt install waydroid -fy
	sudo systemctl enable --now waydroid-container

# If prompted, use the following links for System OTA and Vendor OTA:
# https://ota.waydro.id/system
# https://ota.waydro.id/vendor

clean:
	sudo systemctl disable --now waydroid-container
	sudo apt remove --purge -fy waydroid
	sudo rm -rf /etc/apt/sources.list.d/waydroid*
	sudo rm -rf /usr/bin/waydroid /usr/lib/waydroid
	sudo rm -rf /usr/share/waydroid*
	sudo rm -rf /usr/share/*/waydroid*
	sudo rm -rf /var/lib/waydroid*
	sudo rm -rf /var/lib/*/waydroid*
	sudo rm -rf /usr/lib/*/waydroid*
	sudo rm -rf ~/.config/waydroid*
	sudo rm -rf ~/.local/*/waydroid*	
