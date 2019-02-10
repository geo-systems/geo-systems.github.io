#!/usr/bin/env bash

# Based on https://gist.github.com/Vestride/278e13915894821e1d6f
ffmpeg -an -i fcf-overview-low.mp4 -vcodec libx264 -pix_fmt yuv420p -profile:v baseline -level 3 fcf-overview-web.mp4
# ffmpeg -i fcf-overview-low.mp4 -vcodec h264 -acodec aac -strict -2 fcf-overview-web.mp4
# ffmpeg -i fcf-overview-low.mp4 -vcodec libvpx-vp9 -b:v 1M -acodec libvorbis fcf-overview-web.webm

ffmpeg -i fcf-overview-low.mp4 -c:v libvpx-vp9 -pass 1 -b:v 1000K -threads 1 -speed 4 \
  -tile-columns 0 -frame-parallel 0 -auto-alt-ref 1 -lag-in-frames 25 \
  -g 9999 -aq-mode 0 -an -f webm /dev/null


ffmpeg -i fcf-overview-low.mp4 -c:v libvpx-vp9 -pass 2 -b:v 1000K -threads 1 -speed 0 \
  -tile-columns 0 -frame-parallel 0 -auto-alt-ref 1 -lag-in-frames 25 \
  -g 9999 -aq-mode 0 -c:a libopus -b:a 64k -f webm fcf-overview-web.webm