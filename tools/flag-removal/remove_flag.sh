
#!/bin/bash
dir=$(cd `dirname $0`; pwd)
cd "$dir/"../../
FLAG_NAME=$1
CONTAINER_AND_FLAG=container.$FLAG_NAME

if [ "$2" == "true" ] 
then
  VALUE="--enabled"
else 
  VALUE="--disabled"
fi

git grep -l $CONTAINER_AND_FLAG  | grep .swift | while read a ; do ./tools/flag-removal/flag-remover  -f $CONTAINER_AND_FLAG $VALUE  -i `pwd`/$a -o `pwd`/$a ; done
./tools/flag-removal/remove_flag_definition.sh $FLAG_NAME
