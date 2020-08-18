#!/bin/bash
blogTitle="Blog of Line"
Timefmt="%Y-%m-%d %H:%M:%S"
cd ../docs
find ../docs/ -type d | while read d; do 
cd "$d"
tree -H "." -C -a -t -r -P "*.html" --noreport  -T "$blogTitle" | sed 's/<p class="VERSION">/<p hidden>/g' >index.html
cd -
done
