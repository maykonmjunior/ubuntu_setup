all:
	sudo add-apt-repository ppa:tomtomtom/yt-dlp
	sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
# if you don't have curl, use wget instead:
#	sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl 
	sudo chmod a+rx /usr/local/bin/yt-dlp
	sudo apt install -fy ffmpeg
	make upd

clean:
	sudo apt remove --purge -fy yt-dlp ffmpeg
	sudo rm -rf /usr/local/bin/yt-dlp
	sudo rm -rf /usr/bin/ffmpeg /usr/share/ffmpeg /usr/share/man/man1/ffmpeg.1.gz
	sudo rm -rf /etc/apt/sources.list.d/tomtomtom-ubuntu-yt-dlp*
	make upd

# Usage:

# download a video
# yt-dlp <video-url>

# download a playlist
# yt-dlp --yes-playlist <playlist-url>

# advanced usage:

# list available formats:
# yt-dlp --list-formats <video-url>

# download with the best audio-video quality available
# yt-dlp -f 'bv*+ba' <playlist-url> -o '%(id)s.%(ext)s'

# download a video as music
# yt-dlp --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" <video-url>

# download a music playlist from youtube
# yt-dlp --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist <playlist-url>

# More Info:
# https://github.com/yt-dlp/yt-dlp
