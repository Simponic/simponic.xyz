#!/usr/bin/env bash

shopt -s nullglob

export_org_php_monstrosity() {
  name="${1%%.*}"
  echo $name
  emacs "$1" --batch -f org-html-export-to-html --kill
  tail -n +4 "$name.html" | tee "$name.php"
  rm "$name.html" "$name.html~"
}

if [ -z "$1" ]; then
  for i in *.org; do
    export_org_php_monstrosity $i
  done
  exit
fi

export_org_php_monstrosity $1
