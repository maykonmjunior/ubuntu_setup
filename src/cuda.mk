all:
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-ubuntu2404.pin
    sudo mv cuda-ubuntu2404.pin /etc/apt/preferences.d/cuda-repository-pin-600
    wget https://developer.download.nvidia.com/compute/cuda/12.6.3/local_installers/cuda-repo-ubuntu2404-12-6-local_12.6.3-560.35.05-1_amd64.deb
    sudo cp /var/cuda-repo-ubuntu2404-12-6-local/cuda-*-keyring.gpg /usr/share/keyrings/
    sudo dpkg -i cuda-repo-ubuntu2404-12-6-local_12.6.3-560.35.05-1_amd64.deb
    sudo apt-get update
    sudo apt-get -y install cuda-toolkit-12-6

clean:
    sudo apt-get -y remove cuda-toolkit-12-6
    sudo apt-get -y purge cuda-toolkit-12-6
    sudo apt-get -y autoremove
    sudo apt-get -y autoclean
    sudo rm -rf /var/cuda-repo-ubuntu2404-12-6-local
    sudo rm -f /etc/apt/preferences.d/cuda-repository-pin-600
    sudo rm -f /usr/share/keyrings/cuda-*-keyring.gpg
    sudo rm -f cuda-repo-ubuntu2404-12-6-local_12.6.3-560.35.05-1_amd64.deb
