#!/bin/bash
cd ../docs
blogTitle="Blog of Line"
Timefmt="%Y-%m-%d %H:%M:%S"
tree -H "." -C -a -t -r -P "*.html" --noreport  -T "$blogTitle" | sed 's/<p class="VERSION">/<p hidden>/g' >index.html
cd -
