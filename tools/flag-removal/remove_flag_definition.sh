#!/bin/bash
FLAG_NAME=$1

dir=$(cd `dirname $0`; pwd)
cd "$dir/"../../

os=$(uname -s)
git grep -lE "public\s+let\s+$FLAG_NAME\s+=\s+RoxFlag" | while read file 
do 
  echo $file
  if [ "$os" == "Darwin" ]
  then
    # on mac
    sed -i '' "/public[[:space:]][[:space:]]*let[[:space:]][[:space:]]*$FLAG_NAME[[:space:]]*=[[:space:]]*RoxFlag/d" "$file"
  else
    # on linux
    sed -i  "/public\s+let\s+$FLAG_NAME\s+=\s+RoxFlag/d" "$file"
  fi
done 
