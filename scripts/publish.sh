#!/bin/bash
./md2html.sh
./gen_index.sh
cd ../articles 
python3 -m http.server
