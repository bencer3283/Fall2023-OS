#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <destination_folder>"
    exit 1
fi

destination_folder="$1"

mkdir -p $destination_folder

for i in {1..20}; do
    year=$((1990 + (i % 5)))
    touch "$destination_folder/file_$year-$i.mp4"
done

genres=("Rock" "Pop" "Jazz" "Metal")

for genre in "${genres[@]}"; do
    for i in {1..5}; do
        touch "$destination_folder/${genre}_song_$i.mp3"
    done
done

categories=("Category1" "Category2" "Category3" "Category4" "Category5")

for category in "${categories[@]}"; do
    for i in {1..5}; do
        filename=$(openssl rand -hex 6).txt
        touch "$destination_folder/$filename"
        echo "$category" >> "$destination_folder/$filename"
    done
done

for i in {1..5}; do
    touch "$destination_folder/random_$i.pdf"
done

echo "Files created in the '$destination_folder' folder."
