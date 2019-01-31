#!/usr/bin/env bash

# sips -Z 640 *.png

for i in *.png
do 
    sips -s format jpeg --resampleWidth 600 "$i" --out "$i.jpg"
done