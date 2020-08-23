#!/usr/bin/bash
pandoc -t epub3 -o test.epub title.txt README.md --epub-cover-image=cover.png --epub-stylesheet=github.css --epub-metadata=metadata.xml
