#!/bin/bash

dir=${0%/*}
if [[ "$dir" == "" ]]; then dir="."; fi
cd "$dir"

tool_dir=/usr/local/bin

if [[ ! -e ${tool_dir} ]];
then
    printf "%s\n" "Need to make directory ${tool_dir}"
    sudo mkdir -p ${tool_dir}/
fi

printf "%s\n" "Installing tools in $tool_dir"

rsync -av root${tool_dir}/ ${tool_dir}

exit

