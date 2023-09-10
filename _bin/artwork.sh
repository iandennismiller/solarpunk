#!/bin/bash
# (cc) 2016 diamond-patterns

# favicon
cd _artwork && convert logo.png -resize 16x16 favicon.ico && cd ..
mv _artwork/favicon.ico .

# thumbs
cd _artwork && convert logo.png -flatten -resize 256x256 thumb-big.jpg && cd ..
mv _artwork/thumb-big.jpg media
