# Overview

This repository holds the source files and build scripts for the handbook for graduate students in the [Department of English at Loyola University Chicago](https://www.luc.edu/english/).
Build and deployment is done with GitHub Actions.
The shell script `build.sh` provides an equivalent build for local testing.
For dependencies see the GitHub Action.

The principal source file is `handbook.md`.
The released PDF is built with [Pandoc](https://pandoc.org/), the behavior of which is controlled by `config/default.yaml`.
Appendices are maintained as separate files in the directory `appendices/` and included with the Lua filter `include-files.lua`.
The CSV file in `appendices/` is converted to a Markdown table prior to other build operations.
The directory `images/` stores an image file.
