
#!/bin/bash
dir=$(cd `dirname $0`; pwd)
cd "$dir/"../../
FLAG_NAME=container.$1

if [ "$2" == "true" ] 
then
  VALUE="--enabled"
else 
  VALUE="--disabled"
fi

git grep -l $FLAG_NAME  | grep .swift | while read a ; do ./tools/flag-removal/flag-remover  -f $FLAG_NAME $VALUE  -i `pwd`/$a -o `pwd`/$a ; done
