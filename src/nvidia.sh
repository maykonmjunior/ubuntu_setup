wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo rm cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt -fy install nvidia-driver-555
