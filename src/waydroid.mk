all:
	sudo apt install curl ca-certificates -fy && curl https://repo.waydro.id | sudo bash && sudo apt install waydroid -fy
	sudo systemctl enable --now waydroid-container

# If prompted, use the following links for System OTA and Vendor OTA:
# https://ota.waydro.id/system
# https://ota.waydro.id/vendor

