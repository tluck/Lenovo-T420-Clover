#!/bin/bash

dir=${0%/*}
if [[ "$dir" == "" ]]; then dir="."; fi
cd "$dir"

model=T420
panels=Panel_Backlight.plist

#if [[ "$@" == "" ]]; 
#then
#printf "Enter Model: T420 or T460?\n"
#read model
#fi

targetdir=../../EFI/CLOVER/kexts/Other

grep $model ${panels} > /dev/null
if [ $? != 0 ] ;
then 
    printf "Model $model not found in ${panels} - abort. \n"
    exit 1
fi

sudo ./generateInjector.bash ${model} ${targetdir}

