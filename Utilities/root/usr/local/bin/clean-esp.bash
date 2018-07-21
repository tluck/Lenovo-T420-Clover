#!/bin/bash 

#hn=$( hostname )

if [[ "$1" == "" ]];
then
    bvs=$( system_profiler SPSoftwareDataType | grep Volume )
    disk="${bvs#*: }"
else
    disk="$1"
fi

printf "Disk Volume name is: $disk\n"
mntpt=$( espmount.bash "$disk" )
mounted0=$?
if [[ $mounted0 != 0 ]];
then
    printf "*** Error - Could not mount $disk\n"
    exit 1
fi

printf "ESP is mounted here: $mntpt\n"
if [[ ! -e $mntpt/EFI ]];
then
    printf "%s\n" "*** Error - Missing EFI on $mntpt"
    exit 1
fi
cd $mntpt
sudo xattr -cr EFI

test -f EFI/Clover_Install_Log.txt && mv EFI/Clover_Install_Log.txt EFI/Install_Log.txt
rm -rf EFI/BOOT/*32*
rm -rf EFI/CLOVER/ACPI/WINDOWS
rm -rf EFI/CLOVER/ACPI/origin
rm -rf EFI/CLOVER/*32*
rm -rf EFI/CLOVER/tools/*32*

model=`ioreg -l |grep RM,oem-table-id|grep -v device |awk '{print $6}'|sed -e's/"//g'`
if [[ $model == "T420" ]];
then
    test -f /etc/rc.boot.d/70.disable_sleep_proxy_client.local && sudo rm /etc/rc.boot.d/70.disable_sleep_proxy_client.local
    test -f /etc/rc.shutdown.d/80.save_nvram_plist.local       && sudo rm /etc/rc.shutdown.d/80.save_nvram_plist.local
    rm -rf EFI/CLOVER/tools/*64U*
else
    rm -rf EFI/CLOVER/tools/*64.efi*
fi

#rm -rf EFI/CLOVER/OEM
rm -rf EFI/CLOVER/ROM
rm -rf EFI/CLOVER/doc

# remove BOOT for the Hacks
if [[ -d EFI/CLOVER/OEM/H61N-USB3 ]]; 
then
    rm -rf EFI/BOOT
    rm -rf EFI/CLOVER/drivers64UEFI
fi

# clean up for when info is in OEM
if [[ -d EFI/CLOVER/OEM ]]; 
then
    test -f EFI/CLOVER/config.plist && rm EFI/CLOVER/config.plist
    rm -rf EFI/CLOVER/ACPI
    rm -rf EFI/CLOVER/kexts
    rm -rf EFI/CLOVER/OEM/SystemProductName
    rm -rf EFI/CLOVER/OEM/*/kexts/10.?
    rm -rf EFI/CLOVER/OEM/*/kexts/10.??
else
    rm -rf EFI/CLOVER/kexts/10.?
    rm -rf EFI/CLOVER/kexts/10.??
fi
# Use new fix
if [[ EFI/CLOVER/drivers64UEFI/AptioMemoryFix-64.efi ]];
then
test -e EFI/CLOVER/drivers64UEFI/OsxAptioFixDrv-64.efi  && mv EFI/CLOVER/drivers64UEFI/OsxAptioFixDrv-64.efi  EFI/CLOVER/drivers64UEFI/OsxAptioFixDrv-64.efi.NotUsed
test -e EFI/CLOVER/drivers64UEFI/OsxAptioFix2Drv-64.efi && mv EFI/CLOVER/drivers64UEFI/OsxAptioFix2Drv-64.efi EFI/CLOVER/drivers64UEFI/OsxAptioFix2Drv-64.efi.NotUsed
test -e EFI/CLOVER/drivers64UEFI/OsxAptioFix3Drv-64.efi && mv EFI/CLOVER/drivers64UEFI/OsxAptioFix3Drv-64.efi EFI/CLOVER/drivers64UEFI/OsxAptioFix3Drv-64.efi.NotUsed
fi

f=EFI/CLOVER/themes/ThinkPad 
test -e $f && mv $f EFI/CLOVER/
f=EFI/CLOVER/themes/BGM
test -e $f && mv $f EFI/CLOVER/

rm -rf EFI/CLOVER/themes/* 

#test -e EFI/CLOVER/themes || mkdir EFI/CLOVER/themes
f=EFI/CLOVER/ThinkPad 
test -e $f && mv $f EFI/CLOVER/themes
f=EFI/CLOVER/BGM
test -e $f && mv $f EFI/CLOVER/themes

#cp -a EFI/CLOVER/config.gold.plist EFI/CLOVER/config.plist

diff -rq $mntpt/EFI*|differ

# patch for nvram save
gNVRAMbuf=$(nvram -x -p)
gEmuVariableName=emuvariable
gEfiEmuVariableIsPresent="false"
gLegacyEmuVariableIsPresent="false"
if [[ `printf "${gNVRAMbuf}" |tr '[:upper:]' '[:lower:]'` == *"${gEmuVariableName}"* ]];
then
    gEfiEmuVariableIsPresent="true"
else
    gEFIFirmwareVendor=$(LC_ALL=C ioreg -l -pIODeviceTree | sed -nE 's@.*firmware-vendor.*<([0-9a-fA-F]*)>.*@\1@p' | xxd -r -p | tr '[:upper:]' '[:lower:]')
    case "${gEFIFirmwareVendor}" in
        *"clover"* | *"edk ii"* ) gLegacyEmuVariableIsPresent="true"
                                  ;;
        *                       )
                                  ;;
    esac
fi

if [[ "${gLegacyEmuVariableIsPresent}" == "true" || "${gEfiEmuVariableIsPresent}" == "true" ]];
then

printf "Looking for any patches to NVRAM save tools\n"
# 
patch=/etc/rc.shutdown.d/80.save_nvram_plist.fixed
if [[ -e "$patch" ]];
then
    sudo cp -a "$patch" "${patch/fixed/local}"
fi
#
patch=/etc/rc.boot.d/20.mount_ESP.fixed
if [[ -e "$patch" ]];
then
    sudo cp -a "$patch" "${fixed/fixed/local}"
fi
#
patch="/Library/Application Support/Clover/CloverDaemon_patch.txt"
if [[ -e "$patch" ]];
then
    cd /Library/Application\ Support/Clover/
    sudo patch -N CloverDaemon "${patch}"
    sudo test -e CloverDaemon.rej && sudo rm CloverDaemon.rej
    sudo defaults write com.apple.loginwindow LogoutHook "/Library/Application Support/Clover/CloverDaemon-stopservice"
fi

fi # end nvram patch

test $mounted0 -eq 0 && espmount.bash -u "$disk"
exit 0
