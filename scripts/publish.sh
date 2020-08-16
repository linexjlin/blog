#!/bin/bash
./md2html.sh
./gen_index.sh
cd ../docs
python3 -m http.server
