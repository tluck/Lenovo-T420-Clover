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
