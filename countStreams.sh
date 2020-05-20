#!/bin/bash

nbStreams=`ffprobe -i ./testClip.mxf -show_entries format=nb_streams -v quiet`


#echo "$nbStreams" | sed "s/\[FORMAT\]//"
echo $nbStreams

arrIN=(${nbStreams// /})
arrIN=(${arrIN// /})

echo ${arrIN[1]}
