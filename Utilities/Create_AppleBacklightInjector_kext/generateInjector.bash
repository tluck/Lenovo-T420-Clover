#!/bin/bash

model=$1
targetdir=$2

panels=Panel_Backlight.plist
uid=10

# set -x

# find LCD info
if [ -e /tmp/org.rehabman.display.plist ]; then rm /tmp/org.rehabman.display.plist ; fi
ioreg -n AppleBacklightDisplay -arxw0>/tmp/org.rehabman.display.plist
id=`/usr/libexec/PlistBuddy -c "Print :0:DisplayProductID" /tmp/org.rehabman.display.plist`
id=`printf "F%02dT%04x" $uid $id`
sed "s/${model}1234/$id/g" ${panels} >/tmp/org.rehabman.merge.plist

if [ ! -d ${targetdir} ]; then mkdir -p ${targetdir} ;fi
if [ -d ${targetdir}/AppleBacklightInjector.kext ]; then rm -R ${targetdir}/AppleBacklightInjector.kext; fi
printf "Target Location for Injector kext: $targetdir \n"

# Kext
#cp -R /System/Library/Extensions/AppleBacklight.kext ${targetdir}
#plist=${targetdir}/AppleBacklight.kext/Contents/Info.plist
#
#/usr/libexec/PlistBuddy -c "Copy ':IOKitPersonalities:AppleIntelPanelA:ApplePanels' ':ApplePanelsBackup'" $plist
#/usr/libexec/PlistBuddy -c "Delete ':IOKitPersonalities:AppleIntelPanelA:ApplePanels'" $plist
#/usr/libexec/PlistBuddy -c "Merge /tmp/org.rehabman.merge.plist ':IOKitPersonalities:AppleIntelPanelA'" $plist
#/usr/libexec/PlistBuddy -c "Copy ':ApplePanelsBackup:Default' ':IOKitPersonalities:AppleIntelPanelA:ApplePanels:Default'" $plist
#/usr/libexec/PlistBuddy -c "Delete ':ApplePanelsBackup'" $plist

# Injector

(cp -R /System/Library/Extensions/AppleBacklight.kext ${targetdir}/AppleBacklightInjector.kext 2>&1 ) > /dev/null

plist=${targetdir}/AppleBacklightInjector.kext/Contents/Info.plist
#/usr/libexec/PlistBuddy -c "Copy ':IOKitPersonalities:AppleIntelPanelA:ApplePanels' ':ApplePanelsBackup'" $plist
/usr/libexec/PlistBuddy -c "Delete ':IOKitPersonalities:AppleIntelPanelA:ApplePanels'" $plist
/usr/libexec/PlistBuddy -c "Merge /tmp/org.rehabman.merge.plist ':IOKitPersonalities:AppleIntelPanelA'" $plist
#/usr/libexec/PlistBuddy -c "Copy ':ApplePanelsBackup:Default' ':IOKitPersonalities:AppleIntelPanelA:ApplePanels:Default'" $plist
#/usr/libexec/PlistBuddy -c "Delete ':ApplePanelsBackup'" $plist
/usr/libexec/PlistBuddy -c "Delete ':BuildMachineOSBuild'" $plist
/usr/libexec/PlistBuddy -c "Delete ':DTCompiler'" $plist
/usr/libexec/PlistBuddy -c "Delete ':DTPlatformBuild'" $plist
/usr/libexec/PlistBuddy -c "Delete ':DTPlatformVersion'" $plist
/usr/libexec/PlistBuddy -c "Delete ':DTSDKBuild'" $plist
/usr/libexec/PlistBuddy -c "Delete ':DTSDKName'" $plist
/usr/libexec/PlistBuddy -c "Delete ':DTXcode'" $plist
/usr/libexec/PlistBuddy -c "Delete ':DTXcodeBuild'" $plist
/usr/libexec/PlistBuddy -c "Delete ':OSBundleLibraries'" $plist
/usr/libexec/PlistBuddy -c "Delete ':CFBundleExecutable'" $plist
/usr/libexec/PlistBuddy -c "Set ':CFBundleGetInfoString' '0.9.2, Copyright 2017 RehabMan Inc. All rights reserved.'" $plist
/usr/libexec/PlistBuddy -c "Set ':CFBundleIdentifier' 'org.rehabman.driver.AppleBacklightInjector'" $plist
/usr/libexec/PlistBuddy -c "Set ':CFBundleName' 'AppleBacklightInjector'" $plist
/usr/libexec/PlistBuddy -c "Set ':CFBundleShortVersionString' '0.9.2'" $plist
/usr/libexec/PlistBuddy -c "Set ':CFBundleVersion' '0.9.2'" $plist
/usr/libexec/PlistBuddy -c "Set ':IOKitPersonalities:AppleIntelPanelA:IOProbeScore' 2500" $plist

rm -R ${targetdir}/AppleBacklightInjector.kext/Contents/_CodeSignature
rm -R ${targetdir}/AppleBacklightInjector.kext/Contents/MacOS
rm ${targetdir}/AppleBacklightInjector.kext/Contents/version.plist

chmod -R go-w ${targetdir}/AppleBacklightInjector.kext
chown -R 0:0  ${targetdir}/AppleBacklightInjector.kext

printf "Created AppleBacklightInjector.kext for DisplayID: %s \n" $id

