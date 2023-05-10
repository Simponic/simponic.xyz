#!/usr/bin/env bash

emacs index.org --batch -f org-html-export-to-html --kill
tail -n +4 index.html | tee index.php
rm index.html
