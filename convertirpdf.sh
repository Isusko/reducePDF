#!/bin/bash

# Get a list of all .pdf files in the current directory
files=$(ls *.pdf)

# Loop over the list of files
for file in $files
do
  echo "Processing file: $file"

  # Run the GS script for each file
   #gswin64c.exe -sDEVICE=pdfwrite -dCompatibilityLevel=1.6 -r100 -dPrinted=false -dNOPAUSE -dQUIET -dBATCH -sOutputFile=./output/"$file" "$file" &
   gswin64c.exe -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=//ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=./output/"$file" "$file" & #show PDF on windows

  # Wait for the previous command to finish before starting the next one
  wait $!

  echo "Finished processing file: $file"
done

echo "All .pdf files have been processed"