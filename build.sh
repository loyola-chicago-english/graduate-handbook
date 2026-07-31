#!/bin/bash

# The script is intended to test local builds; it is equivalent to the build
# performed in the GitHub Action. Dependencies are those provided in the GitHub
# Action.
#
# Run the script from the root directory.

pushd appendices/

echo "Converting the CSV file to a Markdown table..."
sed 's/,/|/g ; 2i----|----------|--------' phd-timeline-table.csv > table.md

popd

echo "Creating the PDF..."
pandoc --columns=200 --lua-filter=include-files.lua --metadata-file=./config/default.yaml -V pdfstandard=ua-2 --number-sections --pdf-engine=lualatex handbook.md -o graduate-handbook.pdf

echo "Cleaning up..."
rm appendices/table.md
echo "Done"
