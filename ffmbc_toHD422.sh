#!/bin/bash

userInput=$1

#read -p "Input File Path = " userInput

theDate=$(date +"%H%M%S")

cmd="ffmbc \
-i $1 \
-threads 4 \
-tff \
-target xdcamhd422 \
-f mxf \
-an \
/smb/lst-nle-dt23/ffmbcTests/o${theDate}.MXF \
-acodec pcm_s24le \
-ar 48000 \
-newaudio \
-acodec pcm_s24le \
-ar 48000 \
-newaudio \
-acodec pcm_s24le \
-ar 48000 \
-newaudio \
-acodec pcm_s24le \
-ar 48000 \
-newaudio \
-map_audio_channel 0:1:0:0:1:0 \
-map_audio_channel 0:2:0:0:2:0 \
-map_audio_channel 0:3:0:0:3:0 \
-map_audio_channel 0:4:0:0:4:0\
"

#cmd="ffmpeg \
#-i $1 \
#-pix_fmt yuv422p \
#-vcodec mpeg2video \
#-r 25 \
#-profile:v 0 \
#-level:v 2 \
#-non_linear_quant 1 \
#-flags ilme \
#-top 1 \
#-dc 10 \
#-intra_vlc 1 \
#-vtag xd5c \
#-rc_max_vbv_use 1 \
#-rc_min_vbv_use 1 \
#-qmax 5 \
#-b:v 50000k \
#-minrate 50000k \
#-maxrate 50000k \
#-bufsize 3835k \
#-bf 2 \
#-aspect 16:9 \
#-ac 2 \
#-ar 48000 \
#-acodec pcm_s24le \
#-vf scale=1920:1080 \
#-map 0:v \
#-map 0:a \
#./o$theDate.MXF\
#"
#-filter_complex "[0:1]channelsplit=channel_layout=stereo" \

# Currently working for quantel, doesn't like to play on XDCAM browser.
# Good for converting SD > HD ? or maybe just use for iPhone Videos?

echo $cmd

$cmd
