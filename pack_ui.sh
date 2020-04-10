#!/bin/bash

set -e
set -u
set -o pipefail

# Confirm mad-lib-ui/ exists or quit.
mlui_path=""
if [ -d "mad-lib-ui" ]; then
    mlui_path="$(pwd)/mad-lib-ui"
elif [ -d "../mad-lib-ui" ]; then
    mlui_path="$(pwd)/../mad-lib-ui"
else
    printf "%s\n" "Could not locate directory 'mad-lib-ui/' in the current directory or one directory up." >&2;
    exit 1
fi

printf "Found mad-lib-ui/ at: $mlui_path/\n"

# Confirm mad-lib-ui/dist/mad-lib-ui exists or quit.
mlui_artifact_path="$mlui_path/dist/mad-lib-ui"
if [ ! -d "$mlui_artifact_path" ]; then
    printf "%s\n" "Could not location directory 'dist/mad-lib-ui/' in $mlui_path.  Did you do run 'ng build' first?" >&2;
    exit 1
fi

printf "Found dist/mad-lib-ui/ at: $mlui_artifact_path/\n"

# Confirm MadLibApi/static/ exists or quit.
static_path="./MadLibApi/static"
if [ ! -d "$static_path" ]; then
    printf "%s\n" "Could not locate directory 'MadLibApi/static/'.  Does this directory exist?" >&2;
    exit 1
fi

printf "Found static/ at: $static_path/\n"

rm -rf $static_path/*.{js,html,css,js.map}
printf "Removed any files in $static_path/\n"
printf "==============================================\n"

find $mlui_artifact_path -type f \( -iname "*.js" -or -iname "*.html" -or -iname "*.css" -or -iname "*.js.map" \) -exec cp {} $static_path \; -exec printf "\tCopied: {}\n" \;

printf "==============================================\n"
printf "Finished\n"
