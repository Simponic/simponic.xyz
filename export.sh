#!/usr/bin/env bash

shopt -s nullglob
for i in *.org; do
    name="${i%%.*}"
    echo $name
    emacs "$i" --batch -f org-html-export-to-html --kill
    tail -n +4 "$name.html" | tee "$name.php"
    rm "$name.html" "$name.html~"
done
