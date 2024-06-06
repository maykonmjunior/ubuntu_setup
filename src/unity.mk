all:
	wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
	echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" | sudo tee /etc/apt/sources.list.d/unityhub.list
	sudo apt update
	sudo apt-get install unityhub

clean:
	sudo apt purge -y unityhub
	sudo apt autopurge -y
	sudo rm /etc/apt/sources.list.d/unityhub.list

.PHONY: all clean
