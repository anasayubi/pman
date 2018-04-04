#!/bin/bash

REPEAT=1

while [ $REPEAT ]
do
   read -p "Do you want to add pman to your path? (Yes | No) " RESP
   RESP=$(echo "$RESP" | tr '[:upper:]' '[:lower:]')
   if [ $RESP = yes ] || [ $RESP = y ]
   then
      SET_PATH=1
      unset REPEAT
   elif [ $RESP = no ] || [ $RESP = n ]
   then 
      unset SET_PATH
      unset REPEAT
   fi
done

#echo RESP: $RESP
#echo SET_PATH: $SET_PATH

INSTALL_LOC=$HOME/bin

if [ ! -d $INSTALL_LOC ]
then
   mkdir $INSTALL_LOC
fi
cp pman $INSTALL_LOC
mkdir $INSTALL_LOC/pman-work-dir
mkdir $INSTALL_LOC/pman-work-dir/mans
cp main template $INSTALL_LOC/pman-work-dir/mans
touch $INSTALL_LOC/pman-work-dir/user_details 

# if PATH does not contain then add to PATH
#echo PATH
#echo $PATH
#echo ''
if [ $SET_PATH ] && [ ! $( echo $PATH | grep "$INSTALL_LOC:" ) ] && [ ! $( echo $PATH | grep "$INSTALL_LOC:$" ) ] && [ ! $( echo $PATH | grep "$INSTALL_LOC$" ) ]
then
   #echo 'write to .bashrc'
   echo "export PATH=$INSTALL_LOC:$PATH" >> $HOME/.bashrc
fi

echo 'pman has been installed on this machine.'
