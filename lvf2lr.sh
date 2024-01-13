# lvf2lr.sh
# This scripts splits a Leia Video Format (LVF) MP4 file into a left video, a right video, and an audio file
# It relies on language tags (abl = Albedo Left, abr = Albedo Right) 
# and won't work without them

ffmpeg -y -i "$1" -map 0:v:m:language:abl -c copy left.mp4
ffmpeg -y -i "$1" -map 0:v:m:language:abr -c copy right.mp4
ffmpeg -y -i "$1" -c copy audio.aac