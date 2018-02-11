#!/bin/bash

function is_int() { return $(test "$@" -eq "$@" > /dev/null 2>&1); } 

if [[ "$1" == "" ]]; 
then
    echo Enter the disk number or the volume name
    read n 
else
    n="$1"
fi;

while [[ $# > 1 ]]
do
key="$1"
case $key in
    -u|--umount)
    um=Yes
    n=$2
    shift 
    ;;
    *)
    n=$key
    ;;
esac
shift # past argument or value
done

if $(is_int "$n");
then
vol=disk$n
else
vol=$n
fi

# find esp of boot volume
bvs=$( system_profiler SPSoftwareDataType | grep Volume )
bv=${bvs#*: }
lds=$( diskutil info $bv  |  grep "Part of"          | sed -e's/^.* disk/disk/' )
pds1=$( diskutil list $lds | egrep " Volume on| Store " | sed -e's/^.* disk/disk/' )
#pds2=$( diskutil list      | egrep " Container $lds" | sed -e's/^.* disk/disk/' )
pds=${pds1}${pds2}
if [[ $pds == '' ]]; 
then
    pd=${lds}
else
    pd=${pds%s*}
fi
besp=${pd#*disk}

# find esp of requested volume
lds=$( diskutil info $vol |  grep "Part of"          | sed -e's/^.* disk/disk/' )
if [[ $lds == "" ]];
then
	printf "*** Error - $vol not found\n"
	exit 1
fi
pds1=$( diskutil list $lds | egrep " Volume on| Store " | sed -e's/^.* disk/disk/' )
#pds2=$( diskutil list      | egrep " Container $lds" | sed -e's/^.* disk/disk/' )
pds=${pds1}${pds2}
if [[ $pds == '' ]]; 
then
    pd=${lds}
else
    pd=${pds%s*}
fi
nesp=${pd#*disk}

# if n is a LV  use the pd number
#if [[ $n == ${lds/disk/} ]];
#then
    n=$nesp
#fi

# if nesp is the boot volume use ESP as the name 
if [[ $n == $besp ]]; then
	p=/Volumes/ESP
else
	p=/Volumes/ESP-$n
fi


d=/dev/disk${n}s1
if [[ $um == Yes ]]; 
then
	sudo umount -f $d >& /dev/null
	sleep 2
	test -e $p && sudo rmdir $p
	sleep 1
else
	mount|grep $d|grep "umes/E" >& /dev/null
	if [[ $? != 0 ]]; 
        then
	    test -e $p || sudo mkdir $p
	    sudo mount -t msdos -o noowners,noasync,sync $d $p
	    if [[ $? != 0 ]]
	    then
	        sudo rmdir $p
	        exit 1
	    else
	        echo $p
	    fi
	    exit 0
	else
	    printf "$p\n"
	    exit 0
	fi
fi

