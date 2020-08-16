#!/bin/bash
cd ../articles
blogTitle="Blog of Line"
Timefmt="%Y-%m-%d %H:%M:%S"
tree -D -H "." -C -a -t -r -P "*.html" --noreport  -T "$blogTitle" --timefmt "$Timefmt" | sed 's/<p class="VERSION">/<p hidden>/g' >index.html
cd -
