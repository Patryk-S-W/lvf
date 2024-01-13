# lvf2sbs.sh
# This script converts a Leia Video Format (LVF) MP4 file into an SBS (2x1) file
# It relies on language tags (abl = Albedo Left, abr = Albedo Right) to identify the video stream
# The script won't work without them

ffmpeg -i "$1" -filter_complex "[0:v:m:language:abl]fps=30[l];[0:v:m:language:abr]fps=30[r];[l][r]hstack" -c:a copy "${1%.*}_2x1.mp4"