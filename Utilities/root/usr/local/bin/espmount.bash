#!/bin/bash
if [[ "$1" == "" ]]; 
then
    echo enter disk number
    read n 
else
    n=$1
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

# find esp of boot volume
bvs=$( system_profiler SPSoftwareDataType | grep Volume )
bv=${bvs#*: }
lds=$( diskutil info $bv  |  grep "Part of"          | sed -e's/^.* disk/disk/' )
pds=$( diskutil list $lds | egrep " Volume on| Store | Container $lds " | sed -e's/^.* disk/disk/' )
if [[ $pds == '' ]]; 
then
    pd=${lds}
else
    pd=${pds%s*}
fi
besp=${pd#*disk}

# find esp of requested volume
lds=$( diskutil info disk$n |  grep "Part of"          | sed -e's/^.* disk/disk/' )
pds=$( diskutil list $lds   | egrep " Volume on| Store | Container $lds " | sed -e's/^.* disk/disk/' )
if [[ $pds == '' ]]; 
then
    pd=${lds}
else
    pd=${pds%s*}
fi
nesp=${pd#*disk}

# if n is a LV vs PV use pd
if [[ $n == ${lds/disk/} ]];
then
    n=$nesp
fi

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

