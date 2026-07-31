#!/bin/bash

# This script is the build. The GitHub Action installs the dependencies and
# then calls it, so a local run and a released PDF come from the same source.
#
# Run the script from the root directory.
#
# Dependencies:
#   - Pandoc
#   - LuaLaTeX from TeX Live 2025 or later, which the -V pdfstandard=ua-2
#     option requires for PDF/UA-2 tagging
#   - the include-files.lua filter, resolved either from Pandoc's user data
#     directory or from the working directory
#
# --columns=200 keeps Pandoc from assigning explicit widths to the Ph.D.
# timeline table, which would wrap each header cell in a minipage and emit
# empty paragraphs that fail a WCAG check.

set -euo pipefail

pushd appendices/

echo "Converting the CSV file to a Markdown table..."
sed 's/,/|/g ; 2i----|----------|--------' phd-timeline-table.csv > table.md

popd

echo "Creating the PDF..."
pandoc --columns=200 --lua-filter=include-files.lua --metadata-file=./config/default.yaml -V pdfstandard=ua-2 --number-sections --pdf-engine=lualatex handbook.md -o graduate-handbook.pdf

echo "Cleaning up..."
rm appendices/table.md
echo "Done"
