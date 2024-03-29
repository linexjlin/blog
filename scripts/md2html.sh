#!/bin/bash
#$CSS="https://ipfs.ee/ipfs/QmNvPEGbSjXHRZdDuqCRj8SVid8xaDHLZoXzv4tYQNeBjT/github-pandoc.css"
CSS="https://ipfs.ee/ipfs/QmVxxHqKMu2HsTJYjxABoDfZjLtGzdAUsaroYvz3fQy29x/gh-pandoc.css"
#CSS="https://ipfs.ee/ipfs/Qmf9Lm1Ue1E2Q7stLpLE4tJrVzXaToBLuYGRAoKP7VqeA5/pandoc.css"
#CSS="github-pandoc.css"
#CSS="https://ipfs.ee/ipfs/QmbFohusbH3fWPKMUe7U8vLjeQckTtBPHrUcP3ioedeXj7/newsprint.css"
#CSS="https://ipfs.ee/ipfs/QmSrpFLKHZ7VWVZYn9T1QmpmgxmUJ31nx9GayLmZxBkM1n/whitey.css"
#CSS="https://ipfs.ee/ipfs/QmPGHDTLvRvUyJAZ2ASsbiRXZCb32nvHF3gdctd11V592g/typora-lark.css"
#CSS="https://raw.githubusercontent.com/ryangrose/easy-pandoc-templates/master/css/elegant_bootstrap.css"

find ../docs/ -name "*.md"  -printf "%p|%f\n" | while read f; 
do 
    MdPath=`echo $f | cut -d"|" -f 1`;
    HtmlPath=`echo $f | cut -d"|" -f 1 | sed "s/.md$/.html/g"`;
    Title=`echo $f | cut -d"|" -f 2| sed "s/.md//g" `;
    if [ "$MdPath" -nt "$HtmlPath" ]
    then
        echo convert "$MdPath" to "$HtmlPath";
        pandoc -s -f markdown -t html5 -o "$HtmlPath" -c "$CSS" --metadata title="$Title" "$MdPath";
    else 
        echo "$MdPath" unchange;
    fi
done
