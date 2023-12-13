all:
	sudo add-apt-repository ppa:tomtomtom/yt-dlp
	sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
# if you don't have curl, use wget instead:
#	sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl 
	sudo chmod a+rx /usr/local/bin/yt-dlp
	sudo apt install -fy ffmpeg

clean:
	sudo apt remove --purge -fy yt-dlp ffmpeg
	sudo rm -rf /usr/local/bin/yt-dlp
	sudo rm -rf /usr/bin/ffmpeg /usr/share/ffmpeg /usr/share/man/man1/ffmpeg.1.gz
	sudo rm -rf /etc/apt/sources.list.d/tomtomtom-ubuntu-yt-dlp*
