ffmpeg -hwaccel auto -f x11grab -video_size 1680x1050 -i :0.0 -f pulse -ac 2 -i default -vcodec libx264 -x264opts opencl -acodec pcm_s16le -b:a 384k out.mkv
