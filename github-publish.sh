#!/bin/bash
GitMsg="$(date) auto publish"
echo "$GitMsg"
git add . && git commit -m "$GitMsg" && git push
