#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <destination_folder>"
    exit 1
fi

destination_folder="$1"

mkdir -p $destination_folder

touch $destination_folder/a.pdf
touch $destination_folder/b.pdf
echo "Category1" > $destination_folder/a.txt
touch $destination_folder/Classical_song_1.mp3

echo "File structure created in the '$destination_folder' folder."