#!/bin/bash

userInput=$1

#read -p "Input File Path = " userInput

theDate=$(date +"%H%M%S")


cmd="ffmpeg \
-i $userInput \
-filter_complex "[0:1][0:2][0:3][0:4]join=inputs=4:channel_layout=quad[a]" \
-map 0:v \
-map "[a]" \
-c:v mpeg2video \
-r 25 \
-pix_fmt yuv422p \
-aspect 16:9 \
-minrate 30000k \
-maxrate 30000k \
-b:v 30000k \
-intra -flags +ildct+low_delay \
-intra_vlc 1 \
-non_linear_quant 1 \
-ps 1 \
-qmin 1 \
-qmax 3 \
-top 1 \
-dc 10 \
-bufsize 1200000 \
-rc_init_occupancy 1200000 \
-rc_max_vbv_use 1 \
-rc_min_vbv_use 1 \
-c:a pcm_s16le \
-ar 48000 \
-vf "scale=720:576:1,pad=720:608:0:32" \
-f mxf_d10 \
./o$theDate.MXF\
"



#echo $theDate



echo $cmd

$cmd
