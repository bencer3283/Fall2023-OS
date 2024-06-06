#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_folder_to_clean> <destination_folder>"
    exit 1
fi

source_folder="$1"
destination_folder="$2"

mkdir -p "$destination_folder"

########## Your Code Here ##########
# loop through the files in the input folder
for file in $source_folder/*; do
  echo "$file"
  # get the file name and extension
  filename=$(basename -- "$file")
  extension="${filename##*.}" # double hash means string removal

  # check the file extension and copy it to the appropriate subfolder
  case $extension in
    pdf)
      # create a documents subfolder if it does not exist
      mkdir -p $destination_folder/documents
      # copy the pdf file to the documents subfolder
      cp $file $destination_folder/documents/$filename
      ;;
    mp3)
      # get the genre from the file name
      genre=$(echo $filename | cut -d'_' -f1)
      # create a musics subfolder if it does not exist
      mkdir -p $destination_folder/musics
      # create a genre subfolder if it does not exist
      mkdir -p $destination_folder/musics/$genre
      # copy the mp3 file to the genre subfolder
      cp $file $destination_folder/musics/$genre/$filename
      ;;
    mp4)
      # get the year from the file name
      year=$(echo $filename | cut -d'_' -f2 | cut -d'-' -f1)
      # create a movies subfolder if it does not exist
      mkdir -p $destination_folder/movies
      # create a year subfolder if it does not exist
      mkdir -p $destination_folder/movies/$year
      # copy the mp4 file to the year subfolder
      cp $file $destination_folder/movies/$year/$filename
      ;;
    txt)
      # get the category from the file content
      category=$(grep -o 'Category[0-9]*' $file | head -n 1)
      # create a texts subfolder if it does not exist
      mkdir -p $destination_folder/texts
      # create a category subfolder if it does not exist
      mkdir -p $destination_folder/texts/$category
      # copy the txt file to the category subfolder
      cp $file $destination_folder/texts/$category/$filename
      ;;
    *)
      # ignore other file extensions
      ;;
  esac

done

####################################
echo "Files have been organized from '$source_folder' to '$destination_folder'."
