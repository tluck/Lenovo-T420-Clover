// Thinkpad model with TrackPad
DefinitionBlock ("", "SSDT", 2, "T420", "PS2K", 0)
{
    // Select specific configuration in VoodooPS2Trackpad.kext
    Method(_SB.PCI0.LPC.PS2K._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "RM,oem-id", "LENOVO",
            "RM,oem-table-id", "T420",
        })
    }
    // Overrides for settings in the Info.plist files)
    Name(_SB.PCI0.LPC.PS2K.RMCF, Package()
    {
        "Keyboard", Package()
        {
            "ActionSwipeLeft",  "37 d, 21 d, 21 u, 37 u",
            "ActionSwipeRight", "37 d, 1e d, 1e u, 37 u",
            "SleepPressTime",   "1500",
            "Swap command and option", ">y",
            "Custom ADB Map", Package()
            {
                Package(){},
                "e01e=4da", //previous
                "e045=42",  //next
            },
            "Custom PS2 Map", Package()
            {
                Package(){},
                "e01e=e037", //Map tp disable to f8</string>
                "e037=e01e", //Prevent PrntScr from triggering tp disable</string>
            },
            "Function Keys Special", Package()
            {
                Package(){}, // The following 12 items map fkeys to Fn+fkeys</string>
                "3b=e012", // F1  - Brightness Down</string>
                "3c=e017", // F2  - Brightness Up</string>
                "3d=e00a", // F3  - Mission Control (app select)</string>
                "3e=e009", // F4  - Launchpad</string>
                "3f=0",    // F5  - nothing</string>
                "40=0",    // F6  - nothing</string>
                "41=e06e", // F7  - Video Mirror</string>
                "42=e037", // F8  - TP on/off</string>
                "43=0",    // F9  - nothing</string>
                "44=e020", // F10 - Volume Mute</string>
                "57=e02e", // F11 - Volume Up</string>
                "58=e030", // F12 - Volume Up</string>
                "46=e022", // ScrLck - iTunes - play/pause</string>
            },
            "Function Keys Standard", Package()
            {
                Package(){}, //The following 12 items map Fn+fkeys to Fn+fkeys</string>
                "e05f=e05f",
                "e012=e012",
                "e017=e017",
                "e06e=e06e",
                "e00a=e00a",
                "e009=e009",
                "e020=e020",
                "e02e=e02e",
                "e030=e030",
                "e010=e010",
                "e022=e022",
                "e019=e019",
                //The following 12 items map fkeys to fkeys</string>
                "3b=3b",
                "3c=3c",
                "3d=3d",
                "3e=3e",
                "3f=3f",
                "40=40",
                "41=41",
                "42=42",
                "43=43",
                "44=44",
                "57=57",
                "58=58",
            },
        },
        "Synaptics TouchPad", Package()
        {
            "BogusDeltaThreshX", 800,
            "BogusDeltaThreshY", 800,
            "Clicking", ">y",
            "DragLockTempMask", 0x40004,
            "DynamicEWMode", ">n",
            "FakeMiddleButton", ">n",
            "HWResetOnStart", ">y",
            "ForcePassThrough", ">y",
            "SkipPassThrough", ">y",
            "PalmNoAction When Typing", ">y",
            "ScrollResolution", 800,
            "SmoothInput", ">y",
            "UnsmoothInput", ">y",
            "Thinkpad", ">y",
            "DivisorX", 1,
            "DivisorY", 1,
            "FingerZ", 47,
            "MaxTapTime", 100000000,
            "MomentumScrollThreshY", 16,
            "MouseMultiplierX", 8,
            "MouseMultiplierY", 8,
            "MouseScrollMultiplierX", 2,
            "MouseScrollMultiplierY", 2,
            "MultiFingerHorizontalDivisor", 4,
            "MultiFingerVerticalDivisor", 4,
            "Resolution", 3200,
            "ScrollDeltaThreshX", 10,
            "ScrollDeltaThreshY", 10,
            "TrackpointScrollYMultiplier", 1, //Change this value to 0xFFFF in order to inverse the vertical scroll direction of the Trackpoint when holding the middle mouse button.
            "TrackpointScrollXMultiplier", 1, //Change this value to 0xFFFF in order to inverse the horizontal scroll direction of the Trackpoint when holding the middle mouse button.
        },
    })
}
//EOF
