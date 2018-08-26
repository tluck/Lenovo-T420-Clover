/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20150515-64
 * Copyright (c) 2000 - 2015 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of DSDT.aml, Tue Dec 15 17:52:00 2015
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000AADF (43743)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xA6
 *     OEM ID           "Apple "
 *     OEM Table ID     "TP-8C   "
 *     OEM Revision     0x00001380 (4992)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20100331 (537920305)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "Apple ", "TP-8C   ", 0x00001380)
{

    External (_SB_.PCI0.SAT1.PRIM.GTME, UnknownObj)
    External (_SB_.PCI0.SAT1.PRT1, UnknownObj)
    External (_SB_.PCI0.SAT1.SCND.GTME, UnknownObj)
    External (_SB_.PCI0.SAT1.SCND.MSTR, UnknownObj)
    External (PDC0, UnknownObj)
    External (PDC1, UnknownObj)
    External (PDC2, UnknownObj)
    External (PDC3, UnknownObj)
    External (PDC4, UnknownObj)
    External (PDC5, UnknownObj)
    External (PDC6, UnknownObj)
    External (PDC7, UnknownObj)

    Name (WXP1, "Windows 2001")
    Method (GET9, 2, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TCH9)
        Return (TCH9) /* \GET9.TCH9 */
    }

    Method (STR9, 2, NotSerialized)
    {
        Name (STR8, Buffer (0x50) {})
        Name (STR9, Buffer (0x50) {})
        Store (Arg0, STR8) /* \STR9.STR8 */
        Store (Arg1, STR9) /* \STR9.STR9 */
        Store (Zero, Local0)
        Store (One, Local1)
        While (Local1)
        {
            Store (GET9 (STR8, Local0), Local1)
            Store (GET9 (STR9, Local0), Local2)
            If (LNotEqual (Local1, Local2))
            {
                Return (Zero)
            }

            Increment (Local0)
        }

        Return (One)
    }

    Method (OOSI, 1, NotSerialized)
    {
        If (STR9 (WXP1, Arg0))
        {
            Return (One)
        }

        Return (Zero)
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
        Processor (CPU2, 0x03, 0x00000410, 0x06) {}
        Processor (CPU3, 0x04, 0x00000410, 0x06) {}
        Processor (CPU4, 0x05, 0x00000410, 0x06) {}
        Processor (CPU5, 0x06, 0x00000410, 0x06) {}
        Processor (CPU6, 0x07, 0x00000410, 0x06) {}
        Processor (CPU7, 0x08, 0x00000410, 0x06) {}
    }

    Scope (\)
    {
        Method (PNTF, 1, NotSerialized)
        {
            If (And (PPMF, 0x0400))
            {
                If (LOr (LAnd (And (PDC0, 0x08), LOr (LEqual (Arg0, 0x80), LEqual (
                    Arg0, 0x82))), LAnd (And (PDC0, 0x10), LEqual (Arg0, 0x81))))
                {
                    Notify (\_PR.CPU0, Arg0)
                }

                If (LOr (LAnd (And (PDC1, 0x08), LOr (LEqual (Arg0, 0x80), LEqual (
                    Arg0, 0x82))), LAnd (And (PDC1, 0x10), LEqual (Arg0, 0x81))))
                {
                    Notify (\_PR.CPU1, Arg0)
                }

                If (LOr (LAnd (And (PDC2, 0x08), LOr (LEqual (Arg0, 0x80), LEqual (
                    Arg0, 0x82))), LAnd (And (PDC2, 0x10), LEqual (Arg0, 0x81))))
                {
                    Notify (\_PR.CPU2, Arg0)
                }

                If (LOr (LAnd (And (PDC3, 0x08), LOr (LEqual (Arg0, 0x80), LEqual (
                    Arg0, 0x82))), LAnd (And (PDC3, 0x10), LEqual (Arg0, 0x81))))
                {
                    Notify (\_PR.CPU3, Arg0)
                }

                If (LOr (LAnd (And (PDC4, 0x08), LOr (LEqual (Arg0, 0x80), LEqual (
                    Arg0, 0x82))), LAnd (And (PDC4, 0x10), LEqual (Arg0, 0x81))))
                {
                    Notify (\_PR.CPU4, Arg0)
                }

                If (LOr (LAnd (And (PDC5, 0x08), LOr (LEqual (Arg0, 0x80), LEqual (
                    Arg0, 0x82))), LAnd (And (PDC5, 0x10), LEqual (Arg0, 0x81))))
                {
                    Notify (\_PR.CPU5, Arg0)
                }

                If (LOr (LAnd (And (PDC6, 0x08), LOr (LEqual (Arg0, 0x80), LEqual (
                    Arg0, 0x82))), LAnd (And (PDC6, 0x10), LEqual (Arg0, 0x81))))
                {
                    Notify (\_PR.CPU6, Arg0)
                }

                If (LOr (LAnd (And (PDC7, 0x08), LOr (LEqual (Arg0, 0x80), LEqual (
                    Arg0, 0x82))), LAnd (And (PDC7, 0x10), LEqual (Arg0, 0x81))))
                {
                    Notify (\_PR.CPU7, Arg0)
                }
            }
            Else
            {
                If (LOr (LEqual (Arg0, 0x80), LOr (LEqual (Arg0, 0x81), LEqual (Arg0, 0x82))))
                {
                    Notify (\_PR.CPU0, Arg0)
                }
            }
        }
    }

    OperationRegion (MNVS, SystemMemory, 0xDAF9D018, 0x1000)
    Field (MNVS, DWordAcc, NoLock, Preserve)
    {
        Offset (0xD00), 
        GAPA,   32, 
        GAPL,   32, 
        DCKI,   32, 
        DCKS,   32, 
        VCDL,   1, 
        VCDC,   1, 
        VCDT,   1, 
        VCDD,   1, 
            ,   1, 
        VCSS,   1, 
        VCDB,   1, 
        VCIN,   1, 
        VVPO,   8, 
        BRTN,   8, 
        BRLV,   8, 
        CDFL,   8, 
        CDAH,   8, 
        PMOD,   2, 
        PDIR,   1, 
        PDMA,   1, 
        Offset (0xD17), 
        LFDC,   1, 
        Offset (0xD18), 
        C2NA,   1, 
        C3NA,   1, 
        C4NA,   1, 
        C6NA,   1, 
        C7NA,   1, 
        Offset (0xD19), 
        Offset (0xD1A), 
            ,   2, 
            ,   1, 
        NHPS,   1, 
        NPME,   1, 
        Offset (0xD1B), 
        UOPT,   8, 
        BTID,   32, 
        DPP0,   1, 
        DPP1,   1, 
        DPP2,   1, 
        DPP3,   1, 
        DPP4,   1, 
        DPP5,   1, 
        Offset (0xD21), 
        Offset (0xD22), 
        TCRT,   16, 
        TPSV,   16, 
        TTC1,   16, 
        TTC2,   16, 
        TTSP,   16, 
        SRAH,   8, 
        SRHE,   8, 
        SRE1,   8, 
        SRE2,   8, 
        SRE3,   8, 
        SRE4,   8, 
        SRE5,   8, 
        SRE6,   8, 
        SRU1,   8, 
        SRU2,   8, 
        SRU3,   8, 
        SRU7,   8, 
        SRU4,   8, 
        SRU5,   8, 
        SRU8,   8, 
        SRPB,   8, 
        SRLP,   8, 
        SRSA,   8, 
        SRSM,   8, 
        CWAC,   1, 
        CWAS,   1, 
        CWUE,   1, 
        CWUS,   1, 
        Offset (0xD40), 
        CWAP,   16, 
        CWAT,   16, 
        DBGC,   1, 
        Offset (0xD45), 
        FS1L,   16, 
        FS1M,   16, 
        FS1H,   16, 
        FS2L,   16, 
        FS2M,   16, 
        FS2H,   16, 
        FS3L,   16, 
        FS3M,   16, 
        FS3H,   16, 
        TATC,   1, 
            ,   6, 
        TATL,   1, 
        TATW,   8, 
        TNFT,   4, 
        TNTT,   4, 
        TDFA,   4, 
        TDTA,   4, 
        TDFD,   4, 
        TDTD,   4, 
        TCFA,   4, 
        TCTA,   4, 
        TCFD,   4, 
        TCTD,   4, 
        TSFT,   4, 
        TSTT,   4, 
        TIT0,   8, 
        TCR0,   16, 
        TPS0,   16, 
        TIT1,   8, 
        TCR1,   16, 
        TPS1,   16, 
        TIT2,   8, 
        TCR2,   16, 
        TPS2,   16, 
        TIF0,   8, 
        TIF1,   8, 
        TIF2,   8, 
        Offset (0xD78), 
        BTHI,   1, 
        Offset (0xD79), 
        HDIR,   1, 
        HDEH,   1, 
        HDSP,   1, 
        HDPP,   1, 
        HDUB,   1, 
        HDMC,   1, 
        Offset (0xD7A), 
        TPME,   8, 
        BIDE,   4, 
        IDET,   4, 
            ,   1, 
        DTSE,   1, 
        Offset (0xD7D), 
        DTS0,   8, 
        DTS1,   8, 
        DT00,   1, 
        DT01,   1, 
        DT02,   1, 
        DT03,   1, 
        Offset (0xD80), 
        LIDB,   1, 
        C4WR,   1, 
        C4AC,   1, 
        ODDX,   1, 
        CMPR,   1, 
        ILNF,   1, 
        PLUX,   1, 
        Offset (0xD81), 
        Offset (0xD8C), 
            ,   4, 
            ,   1, 
        IDMM,   1, 
        Offset (0xD8D), 
            ,   3, 
            ,   1, 
            ,   1, 
        LIDS,   1, 
        Offset (0xD8E), 
        Offset (0xD8F), 
            ,   4, 
        Offset (0xD90), 
        TCG0,   1, 
        TCG1,   1, 
        Offset (0xD91), 
        SWGP,   8, 
        IPMS,   8, 
        IPMB,   120, 
        IPMR,   24, 
        IPMO,   24, 
        IPMA,   8, 
        VIGD,   1, 
        VDSC,   1, 
            ,   2, 
        VDSP,   1, 
        Offset (0xDAA), 
        Offset (0xDAD), 
        ASFT,   8, 
        PL1L,   8, 
        PL1M,   8, 
        CHKC,   32, 
        CHKE,   32, 
        ATRB,   32, 
        Offset (0xDBD), 
        PPCR,   8, 
        TPCR,   5, 
        Offset (0xDBF), 
        ATMB,   128, 
        PPCA,   8, 
        TPCA,   5, 
        Offset (0xDD1), 
        BFWB,   296, 
        OSPX,   1, 
        OSC4,   1, 
        PCWF,   1, 
        Offset (0xDF7), 
        SPEN,   1, 
        SCRM,   1, 
        GFPL,   1, 
        ETAU,   1, 
            ,   3, 
        FLPS,   1, 
        FTPS,   8, 
        HIST,   8, 
        LPST,   8, 
        LWST,   8, 
        Offset (0xDFF), 
        MTAU,   8, 
        Offset (0xE20), 
        HPET,   32, 
        PKLI,   16, 
        VLCX,   16, 
        VNIT,   8, 
        VBD0,   8, 
        VBDT,   128, 
        VBPL,   16, 
        VBPH,   16, 
        VBML,   8, 
        VBMH,   8, 
        VEDI,   1024, 
        PDCI,   16
    }

    Field (MNVS, ByteAcc, NoLock, Preserve)
    {
        Offset (0xB00), 
        WITM,   8, 
        WSEL,   8, 
        WLS0,   8, 
        WLS1,   8, 
        WLS2,   8, 
        WLS3,   8, 
        WLS4,   8, 
        WLS5,   8, 
        WLS6,   8, 
        WLS7,   8, 
        WLS8,   8, 
        WLS9,   8, 
        WLSA,   8, 
        WLSB,   8, 
        WLSC,   8, 
        WLSD,   8, 
        WENC,   8, 
        WKBD,   8, 
        WPTY,   8, 
        WPAS,   1032, 
        WPNW,   1032, 
        WSPM,   8, 
        WSPS,   8, 
        WSMN,   8, 
        WSMX,   8, 
        WSEN,   8, 
        WSKB,   8
    }

    Field (MNVS, ByteAcc, NoLock, Preserve)
    {
        Offset (0xA00), 
        DBGS,   1024
    }

    OperationRegion (GNVS, SystemMemory, 0xDAF3FE18, 0x01A6)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        Offset (0x10), 
        PWRS,   8, 
        Offset (0x1E), 
        Offset (0x25), 
        REVN,   8, 
        Offset (0x28), 
        APIC,   8, 
        TCNT,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        C67L,   8, 
        Offset (0x3C), 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        KSV0,   32, 
        KSV1,   8, 
        Offset (0x67), 
        BLCS,   8, 
        BRTL,   8, 
        Offset (0x78), 
        TPMP,   8, 
        Offset (0x7A), 
        MORD,   8, 
        TCGP,   8, 
        PPRP,   32, 
        PPRQ,   8, 
        LPPR,   8, 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
        Offset (0xAA), 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IPCF,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        PAVP,   8, 
        Offset (0xE1), 
        OSCC,   8, 
        NEXP,   8, 
        SDGV,   8, 
        SDDV,   8, 
        Offset (0xEB), 
        DSEN,   8, 
        ECON,   8, 
        Offset (0xEE), 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8, 
        Offset (0x100), 
        NVGA,   32, 
        NVHA,   32, 
        AMDA,   32, 
        DID6,   32, 
        DID7,   32, 
        DID8,   32, 
        EBAS,   32, 
        CPSP,   32, 
        EECP,   32, 
        EVCP,   32, 
        XBAS,   32, 
        OBS1,   32, 
        OBS2,   32, 
        OBS3,   32, 
        OBS4,   32, 
        OBS5,   32, 
        OBS6,   32, 
        OBS7,   32, 
        OBS8,   32, 
        Offset (0x157), 
        ATMC,   8, 
        PTMC,   8, 
        ATRA,   8, 
        PTRA,   8, 
        PNHM,   32, 
        TBAB,   32, 
        TBAH,   32, 
        RTIP,   8, 
        TSOD,   8, 
        ATPC,   8, 
        PTPC,   8, 
        PFLV,   8, 
        BREV,   8, 
        HGMD,   8, 
        PWOK,   8, 
        HLRS,   8, 
        DSEL,   8, 
        ESEL,   8, 
        PSEL,   8, 
        PWEN,   8, 
        PRST,   8, 
        DPBM,   8, 
        DPCM,   8, 
        DPDM,   8, 
        ALFP,   8, 
        IMON,   8, 
        PDTS,   8, 
        PKGA,   8, 
        PAMT,   8, 
        AC0F,   8, 
        AC1F,   8
    }

    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (CondRefOf (\OOSI, Local0))
            {
                If (OOSI ("Windows 2001"))
                {
                    Store (One, WNTF) /* \WNTF */
                    Store (One, WXPF) /* \WXPF */
                    Store (0x02, WSPV) /* \WSPV */
                    Store (One, WVIS) /* \WVIS */
                }

                If (OOSI ("Windows 2001 SP1"))
                {
                    Store (One, WSPV) /* \WSPV */
                }

                If (OOSI ("Windows 2001 SP2"))
                {
                    Store (0x02, WSPV) /* \WSPV */
                }

                If (OOSI ("Windows 2006"))
                {
                    Store (One, WVIS) /* \WVIS */
                }

                If (OOSI ("Windows 2009"))
                {
                    Store (One, WIN7) /* \WIN7 */
                }

                If (OOSI ("Windows 2012"))
                {
                    Store (One, WIN8) /* \WIN8 */
                }

                If (OOSI ("Linux"))
                {
                    Store (One, LNUX) /* \LNUX */
                }

                If (OOSI ("FreeBSD"))
                {
                    Store (One, LNUX) /* \LNUX */
                }
            }
            Else
            {
                If (LEqual (SCMP (_OS, "Microsoft Windows NT"), Zero))
                {
                    Store (One, WNTF) /* \WNTF */
                }
            }

            If (LGreaterEqual (_REV, 0x02))
            {
                Store (One, H8DR) /* \H8DR */
            }

            Store (One, H8DR) /* \H8DR */
            Store (One, OSIF) /* \OSIF */
            Store (^PCI0.LPC.EC.ADP1._PSR (), PWRS) /* \PWRS */
            ^PCI0.LPC.MOU.MHID ()
            If (LNUX)
            {
                ^PCI0.LPC.EC.SAUM (0x02)
                UCMS (0x1C)
            }

            Store (SRAH, ^PCI0.RID) /* \_SB_.PCI0.RID_ */
            If (VIGD)
            {
                Store (SRHE, ^PCI0.IGPU.RID) /* \_SB_.PCI0.IGPU.RID_ */
            }
            Else
            {
                Store (SRHE, ^PCI0.PEG.RID) /* \_SB_.PCI0.PEG_.RID_ */
            }

            Store (SRE1, ^PCI0.EXP1.RID) /* \_SB_.PCI0.EXP1.RID_ */
            Store (SRE2, ^PCI0.EXP2.RID) /* \_SB_.PCI0.EXP2.RID_ */
            Store (SRE4, ^PCI0.EXP4.RID) /* \_SB_.PCI0.EXP4.RID_ */
            Store (SRE4, ^PCI0.EXP5.RID) /* \_SB_.PCI0.EXP5.RID_ */
            Store (SRU7, ^PCI0.EH01.RID) /* \_SB_.PCI0.EH01.RID_ */
            Store (SRU8, ^PCI0.EH02.RID) /* \_SB_.PCI0.EH02.RID_ */
            Store (SRLP, ^PCI0.LPC.RID) /* \_SB_.PCI0.LPC_.RID_ */
            Store (SRSA, ^PCI0.SAT1.RID) /* \_SB_.PCI0.SAT1.RID_ */
            Store (SRSM, ^PCI0.SMBU.RID) /* \_SB_.PCI0.SMBU.RID_ */
            If (VDSP)
            {
                Store (VHYB (0x05, Zero), Local1)
                If (And (Local1, 0x80))
                {
                    If (WIN7)
                    {
                        If (LNotEqual (And (Local1, 0x03), 0x03))
                        {
                            VHYB (0x06, 0x03)
                        }
                    }
                    Else
                    {
                        If (LEqual (And (Local1, 0x03), 0x03))
                        {
                            VHYB (0x06, 0x02)
                        }
                    }
                }
            }

            UCMS (0x1D)
        }

        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VPIR (^^PCI0.LPC.PIRA)))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (^^PCI0.LPC.PIRA, 0x80, ^^PCI0.LPC.PIRA) /* \_SB_.PCI0.LPC_.PIRA */
            }

            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFA, One, IRA1)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.LPC.PIRA, 0x8F, Local0)
                If (VPIR (Local0))
                {
                    ShiftLeft (One, Local0, IRA1) /* \_SB_.LNKA.IRA1 */
                }
                Else
                {
                    Store (Zero, IRA1) /* \_SB_.LNKA.IRA1 */
                }

                Return (BUFA) /* \_SB_.LNKA.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA2)
                FindSetRightBit (IRA2, Local0)
                And (^^PCI0.LPC.PIRA, 0x70, Local1)
                Or (Local1, Decrement (Local0), Local1)
                Store (Local1, ^^PCI0.LPC.PIRA) /* \_SB_.PCI0.LPC_.PIRA */
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VPIR (^^PCI0.LPC.PIRB)))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (^^PCI0.LPC.PIRB, 0x80, ^^PCI0.LPC.PIRB) /* \_SB_.PCI0.LPC_.PIRB */
            }

            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFB, One, IRB1)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.LPC.PIRB, 0x8F, Local0)
                If (VPIR (Local0))
                {
                    ShiftLeft (One, Local0, IRB1) /* \_SB_.LNKB.IRB1 */
                }
                Else
                {
                    Store (Zero, IRB1) /* \_SB_.LNKB.IRB1 */
                }

                Return (BUFB) /* \_SB_.LNKB.BUFB */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRB2)
                FindSetRightBit (IRB2, Local0)
                And (^^PCI0.LPC.PIRB, 0x70, Local1)
                Or (Local1, Decrement (Local0), Local1)
                Store (Local1, ^^PCI0.LPC.PIRB) /* \_SB_.PCI0.LPC_.PIRB */
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VPIR (^^PCI0.LPC.PIRC)))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (^^PCI0.LPC.PIRC, 0x80, ^^PCI0.LPC.PIRC) /* \_SB_.PCI0.LPC_.PIRC */
            }

            Name (BUFC, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFC, One, IRC1)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.LPC.PIRC, 0x8F, Local0)
                If (VPIR (Local0))
                {
                    ShiftLeft (One, Local0, IRC1) /* \_SB_.LNKC.IRC1 */
                }
                Else
                {
                    Store (Zero, IRC1) /* \_SB_.LNKC.IRC1 */
                }

                Return (BUFC) /* \_SB_.LNKC.BUFC */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRC2)
                FindSetRightBit (IRC2, Local0)
                And (^^PCI0.LPC.PIRC, 0x70, Local1)
                Or (Local1, Decrement (Local0), Local1)
                Store (Local1, ^^PCI0.LPC.PIRC) /* \_SB_.PCI0.LPC_.PIRC */
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VPIR (^^PCI0.LPC.PIRD)))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (^^PCI0.LPC.PIRD, 0x80, ^^PCI0.LPC.PIRD) /* \_SB_.PCI0.LPC_.PIRD */
            }

            Name (BUFD, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFD, One, IRD1)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.LPC.PIRD, 0x8F, Local0)
                If (VPIR (Local0))
                {
                    ShiftLeft (One, Local0, IRD1) /* \_SB_.LNKD.IRD1 */
                }
                Else
                {
                    Store (Zero, IRD1) /* \_SB_.LNKD.IRD1 */
                }

                Return (BUFD) /* \_SB_.LNKD.BUFD */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRD2)
                FindSetRightBit (IRD2, Local0)
                And (^^PCI0.LPC.PIRD, 0x70, Local1)
                Or (Local1, Decrement (Local0), Local1)
                Store (Local1, ^^PCI0.LPC.PIRD) /* \_SB_.PCI0.LPC_.PIRD */
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VPIR (^^PCI0.LPC.PIRE)))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (^^PCI0.LPC.PIRE, 0x80, ^^PCI0.LPC.PIRE) /* \_SB_.PCI0.LPC_.PIRE */
            }

            Name (BUFE, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFE, One, IRE1)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.LPC.PIRE, 0x8F, Local0)
                If (VPIR (Local0))
                {
                    ShiftLeft (One, Local0, IRE1) /* \_SB_.LNKE.IRE1 */
                }
                Else
                {
                    Store (Zero, IRE1) /* \_SB_.LNKE.IRE1 */
                }

                Return (BUFE) /* \_SB_.LNKE.BUFE */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRE2)
                FindSetRightBit (IRE2, Local0)
                And (^^PCI0.LPC.PIRE, 0x70, Local1)
                Or (Local1, Decrement (Local0), Local1)
                Store (Local1, ^^PCI0.LPC.PIRE) /* \_SB_.PCI0.LPC_.PIRE */
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VPIR (^^PCI0.LPC.PIRF)))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (^^PCI0.LPC.PIRF, 0x80, ^^PCI0.LPC.PIRF) /* \_SB_.PCI0.LPC_.PIRF */
            }

            Name (BUFF, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFF, One, IRF1)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.LPC.PIRF, 0x8F, Local0)
                If (VPIR (Local0))
                {
                    ShiftLeft (One, Local0, IRF1) /* \_SB_.LNKF.IRF1 */
                }
                Else
                {
                    Store (Zero, IRF1) /* \_SB_.LNKF.IRF1 */
                }

                Return (BUFF) /* \_SB_.LNKF.BUFF */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRF2)
                FindSetRightBit (IRF2, Local0)
                And (^^PCI0.LPC.PIRF, 0x70, Local1)
                Or (Local1, Decrement (Local0), Local1)
                Store (Local1, ^^PCI0.LPC.PIRF) /* \_SB_.PCI0.LPC_.PIRF */
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VPIR (^^PCI0.LPC.PIRG)))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (^^PCI0.LPC.PIRG, 0x80, ^^PCI0.LPC.PIRG) /* \_SB_.PCI0.LPC_.PIRG */
            }

            Name (BUFG, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFG, One, IRG1)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.LPC.PIRG, 0x8F, Local0)
                If (VPIR (Local0))
                {
                    ShiftLeft (One, Local0, IRG1) /* \_SB_.LNKG.IRG1 */
                }
                Else
                {
                    Store (Zero, IRG1) /* \_SB_.LNKG.IRG1 */
                }

                Return (BUFG) /* \_SB_.LNKG.BUFG */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRG2)
                FindSetRightBit (IRG2, Local0)
                And (^^PCI0.LPC.PIRG, 0x70, Local1)
                Or (Local1, Decrement (Local0), Local1)
                Store (Local1, ^^PCI0.LPC.PIRG) /* \_SB_.PCI0.LPC_.PIRG */
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LNot (VPIR (^^PCI0.LPC.PIRH)))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11}
            })
            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Or (^^PCI0.LPC.PIRH, 0x80, ^^PCI0.LPC.PIRH) /* \_SB_.PCI0.LPC_.PIRH */
            }

            Name (BUFH, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFH, One, IRH1)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.LPC.PIRH, 0x8F, Local0)
                If (VPIR (Local0))
                {
                    ShiftLeft (One, Local0, IRH1) /* \_SB_.LNKH.IRH1 */
                }
                Else
                {
                    Store (Zero, IRH1) /* \_SB_.LNKH.IRH1 */
                }

                Return (BUFH) /* \_SB_.LNKH.BUFH */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRH2)
                FindSetRightBit (IRH2, Local0)
                And (^^PCI0.LPC.PIRH, 0x70, Local1)
                Or (Local1, Decrement (Local0), Local1)
                Store (Local1, ^^PCI0.LPC.PIRH) /* \_SB_.PCI0.LPC_.PIRH */
            }
        }

        Method (VPIR, 1, NotSerialized)
        {
            Store (One, Local0)
            If (And (Arg0, 0x80))
            {
                Store (Zero, Local0)
            }
            Else
            {
                And (Arg0, 0x0F, Local1)
                If (LLess (Local1, 0x03))
                {
                    Store (Zero, Local0)
                }
                Else
                {
                    If (LOr (LEqual (Local1, 0x08), LEqual (Local1, 0x0D)))
                    {
                        Store (Zero, Local0)
                    }
                }
            }

            Return (Local0)
        }

        Device (MEM)
        {
            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
            Name (MEMS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x000A0000,         // Address Length
                    )
                Memory32Fixed (ReadOnly,
                    0x000C0000,         // Address Base
                    0x00000000,         // Address Length
                    _Y00)
                Memory32Fixed (ReadOnly,
                    0x000C4000,         // Address Base
                    0x00000000,         // Address Length
                    _Y01)
                Memory32Fixed (ReadOnly,
                    0x000C8000,         // Address Base
                    0x00000000,         // Address Length
                    _Y02)
                Memory32Fixed (ReadOnly,
                    0x000CC000,         // Address Base
                    0x00000000,         // Address Length
                    _Y03)
                Memory32Fixed (ReadOnly,
                    0x000D0000,         // Address Base
                    0x00000000,         // Address Length
                    _Y04)
                Memory32Fixed (ReadOnly,
                    0x000D4000,         // Address Base
                    0x00000000,         // Address Length
                    _Y05)
                Memory32Fixed (ReadOnly,
                    0x000D8000,         // Address Base
                    0x00000000,         // Address Length
                    _Y06)
                Memory32Fixed (ReadOnly,
                    0x000DC000,         // Address Base
                    0x00000000,         // Address Length
                    _Y07)
                Memory32Fixed (ReadOnly,
                    0x000E0000,         // Address Base
                    0x00000000,         // Address Length
                    _Y08)
                Memory32Fixed (ReadOnly,
                    0x000E4000,         // Address Base
                    0x00000000,         // Address Length
                    _Y09)
                Memory32Fixed (ReadOnly,
                    0x000E8000,         // Address Base
                    0x00000000,         // Address Length
                    _Y0A)
                Memory32Fixed (ReadOnly,
                    0x000EC000,         // Address Base
                    0x00000000,         // Address Length
                    _Y0B)
                Memory32Fixed (ReadOnly,
                    0x000F0000,         // Address Base
                    0x00010000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0x00100000,         // Address Base
                    0x01EE0000,         // Address Length
                    _Y0C)
                Memory32Fixed (ReadOnly,
                    0xFEC00000,         // Address Base
                    0x00140000,         // Address Length
                    _Y0D)
                Memory32Fixed (ReadOnly,
                    0xFED4C000,         // Address Base
                    0x012B4000,         // Address Length
                    _Y0E)
            })
            CreateDWordField (MEMS, \_SB.MEM._Y00._LEN, MC0L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y01._LEN, MC4L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y02._LEN, MC8L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y03._LEN, MCCL)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y04._LEN, MD0L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y05._LEN, MD4L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y06._LEN, MD8L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y07._LEN, MDCL)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y08._LEN, ME0L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y09._LEN, ME4L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0A._LEN, ME8L)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0B._LEN, MECL)  // _LEN: Length
            CreateBitField (MEMS, \_SB.MEM._Y00._RW, MC0W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y01._RW, MC4W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y02._RW, MC8W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y03._RW, MCCW)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y04._RW, MD0W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y05._RW, MD4W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y06._RW, MD8W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y07._RW, MDCW)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y08._RW, ME0W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y09._RW, ME4W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y0A._RW, ME8W)  // _RW_: Read-Write Status
            CreateBitField (MEMS, \_SB.MEM._Y0B._RW, MECW)  // _RW_: Read-Write Status
            CreateDWordField (MEMS, \_SB.MEM._Y0C._BAS, MEB1)  // _BAS: Base Address
            CreateDWordField (MEMS, \_SB.MEM._Y0C._LEN, MEL1)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0D._LEN, MEL2)  // _LEN: Length
            CreateDWordField (MEMS, \_SB.MEM._Y0E._LEN, MEL3)  // _LEN: Length
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                And (^^PCI0.PAM1, 0x03, Local0)
                If (Local0)
                {
                    Store (0x4000, MC0L) /* \_SB_.MEM_.MC0L */
                    If (And (Local0, 0x02))
                    {
                        Store (One, MC0W) /* \_SB_.MEM_.MC0W */
                    }
                }

                And (^^PCI0.PAM1, 0x30, Local0)
                If (Local0)
                {
                    Store (0x4000, MC4L) /* \_SB_.MEM_.MC4L */
                    If (And (Local0, 0x20))
                    {
                        Store (One, MC4W) /* \_SB_.MEM_.MC4W */
                    }
                }

                And (^^PCI0.PAM2, 0x03, Local0)
                If (Local0)
                {
                    Store (0x4000, MC8L) /* \_SB_.MEM_.MC8L */
                    If (And (Local0, 0x02))
                    {
                        Store (One, MC8W) /* \_SB_.MEM_.MC8W */
                    }
                }

                And (^^PCI0.PAM2, 0x30, Local0)
                If (Local0)
                {
                    Store (0x4000, MCCL) /* \_SB_.MEM_.MCCL */
                    If (And (Local0, 0x20))
                    {
                        Store (One, MCCW) /* \_SB_.MEM_.MCCW */
                    }
                }

                And (^^PCI0.PAM3, 0x03, Local0)
                If (Local0)
                {
                    Store (0x4000, MD0L) /* \_SB_.MEM_.MD0L */
                    If (And (Local0, 0x02))
                    {
                        Store (One, MD0W) /* \_SB_.MEM_.MD0W */
                    }
                }

                And (^^PCI0.PAM3, 0x30, Local0)
                If (Local0)
                {
                    Store (0x4000, MD4L) /* \_SB_.MEM_.MD4L */
                    If (And (Local0, 0x20))
                    {
                        Store (One, MD4W) /* \_SB_.MEM_.MD4W */
                    }
                }

                And (^^PCI0.PAM4, 0x03, Local0)
                If (Local0)
                {
                    Store (0x4000, MD8L) /* \_SB_.MEM_.MD8L */
                    If (And (Local0, 0x02))
                    {
                        Store (One, MD8W) /* \_SB_.MEM_.MD8W */
                    }
                }

                And (^^PCI0.PAM4, 0x30, Local0)
                If (Local0)
                {
                    Store (0x4000, MDCL) /* \_SB_.MEM_.MDCL */
                    If (And (Local0, 0x20))
                    {
                        Store (One, MDCW) /* \_SB_.MEM_.MDCW */
                    }
                }

                And (^^PCI0.PAM5, 0x03, Local0)
                If (Local0)
                {
                    Store (0x4000, ME0L) /* \_SB_.MEM_.ME0L */
                    If (And (Local0, 0x02))
                    {
                        Store (One, ME0W) /* \_SB_.MEM_.ME0W */
                    }
                }

                And (^^PCI0.PAM5, 0x30, Local0)
                If (Local0)
                {
                    Store (0x4000, ME4L) /* \_SB_.MEM_.ME4L */
                    If (And (Local0, 0x20))
                    {
                        Store (One, ME4W) /* \_SB_.MEM_.ME4W */
                    }
                }

                And (^^PCI0.PAM6, 0x03, Local0)
                If (Local0)
                {
                    Store (0x4000, ME8L) /* \_SB_.MEM_.ME8L */
                    If (And (Local0, 0x02))
                    {
                        Store (One, ME8W) /* \_SB_.MEM_.ME8W */
                    }
                }

                And (^^PCI0.PAM6, 0x30, Local0)
                If (Local0)
                {
                    Store (0x4000, MECL) /* \_SB_.MEM_.MECL */
                    If (And (Local0, 0x20))
                    {
                        Store (One, MECW) /* \_SB_.MEM_.MECW */
                    }
                }

                Subtract (MEMX, MEB1, MEL1) /* \_SB_.MEM_.MEL1 */
                If (LNotEqual (^^PCI0.LPC.TPM._STA (), 0x0F))
                {
                    Store (0x01400000, MEL2) /* \_SB_.MEM_.MEL2 */
                    Store (Zero, MEL3) /* \_SB_.MEM_.MEL3 */
                }

                Return (MEMS) /* \_SB_.MEM_.MEMS */
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                If (LAnd (LEqual (ILNF, Zero), LEqual (PLUX, Zero)))
                {
                    If (H8DR)
                    {
                        Return (^^PCI0.LPC.EC.HPLD) /* \_SB_.PCI0.LPC_.EC__.HPLD */
                    }
                    Else
                    {
                        If (And (RBEC (0x46), 0x04))
                        {
                            Return (One)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
                Else
                {
                    Return (One)
                }
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x1D, 
                    0x03
                })
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                If (H8DR)
                {
                    If (Arg0)
                    {
                        Store (One, ^^PCI0.LPC.EC.HWLO) /* \_SB_.PCI0.LPC_.EC__.HWLO */
                    }
                    Else
                    {
                        Store (Zero, ^^PCI0.LPC.EC.HWLO) /* \_SB_.PCI0.LPC_.EC__.HWLO */
                    }
                }
                Else
                {
                    If (Arg0)
                    {
                        MBEC (0x32, 0xFF, 0x04)
                    }
                    Else
                    {
                        MBEC (0x32, 0xFB, Zero)
                    }
                }
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x1D, 
                    0x03
                })
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                If (H8DR)
                {
                    If (Arg0)
                    {
                        Store (One, ^^PCI0.LPC.EC.HWFN) /* \_SB_.PCI0.LPC_.EC__.HWFN */
                    }
                    Else
                    {
                        Store (Zero, ^^PCI0.LPC.EC.HWFN) /* \_SB_.PCI0.LPC_.EC__.HWFN */
                    }
                }
                Else
                {
                    If (Arg0)
                    {
                        MBEC (0x32, 0xFF, 0x10)
                    }
                    Else
                    {
                        MBEC (0x32, 0xEF, Zero)
                    }
                }
            }
        }

        Device (PCI0)
        {
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_ADR, Zero)  // _ADR: Address
            Name (RID, Zero)
            Name (_S3D, 0x03)  // _S3D: S3 Device State
            Name (LRRT, Package (0x15)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x03, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    Zero, 
                    LNKE, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    Zero, 
                    LNKG, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    Zero, 
                    LNKH, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    Zero, 
                    LNKF, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x03, 
                    LNKA, 
                    Zero
                }
            })
            Name (ARRT, Package (0x15)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x03, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    Zero, 
                    Zero, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    Zero, 
                    Zero, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    Zero, 
                    Zero, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    Zero, 
                    Zero, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x03, 
                    Zero, 
                    0x10
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (GPIC)
                {
                    Return (ARRT) /* \_SB_.PCI0.ARRT */
                }
                Else
                {
                    Return (LRRT) /* \_SB_.PCI0.LRRT */
                }
            }

            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            OperationRegion (MHCS, PCI_Config, 0x40, 0xC0)
            Field (MHCS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x40), 
                PAM0,   8, 
                PAM1,   8, 
                PAM2,   8, 
                PAM3,   8, 
                PAM4,   8, 
                PAM5,   8, 
                PAM6,   8, 
                Offset (0x7C), 
                    ,   20, 
                TLUD,   12
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FE,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x00FF,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y10, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y12, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y13, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y16, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y18, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y19, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y1A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00100000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFEB00000,         // Length
                    ,, _Y1B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED40000,         // Range Minimum
                    0xFED4BFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000C000,         // Length
                    ,, _Y1C, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (_CRS, \_SB.PCI0._Y0F._LEN, C0LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y10._LEN, C4LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y11._LEN, C8LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y12._LEN, CCLN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y13._LEN, D0LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y14._LEN, D4LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y15._LEN, D8LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y16._LEN, DCLN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y17._LEN, E0LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y18._LEN, E4LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y19._LEN, E8LN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1A._LEN, ECLN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1B._MIN, XXMN)  // _MIN: Minimum Base Address
            CreateDWordField (_CRS, \_SB.PCI0._Y1B._MAX, XXMX)  // _MAX: Maximum Base Address
            CreateDWordField (_CRS, \_SB.PCI0._Y1B._LEN, XXLN)  // _LEN: Length
            CreateDWordField (_CRS, \_SB.PCI0._Y1C._MIN, F4MN)  // _MIN: Minimum Base Address
            CreateDWordField (_CRS, \_SB.PCI0._Y1C._MAX, F4MX)  // _MAX: Maximum Base Address
            CreateDWordField (_CRS, \_SB.PCI0._Y1C._LEN, F4LN)  // _LEN: Length
            Method (_INI, 0, Serialized)  // _INI: Initialize
            {
                If (LNot (OSIF))
                {
                    ^^_INI ()
                }

                ShiftLeft (TLUD, 0x14, Local0)
                Store (Local0, MEMX) /* \MEMX */
                Store (Local0, XXMN) /* \_SB_.PCI0.XXMN */
                Add (Subtract (XXMX, XXMN), One, XXLN) /* \_SB_.PCI0.XXLN */
                If (LEqual (TPMP, Zero))
                {
                    Store (Zero, F4LN) /* \_SB_.PCI0.F4LN */
                }

                If (And (PAM1, 0x03))
                {
                    Store (Zero, C0LN) /* \_SB_.PCI0.C0LN */
                }

                If (And (PAM1, 0x30))
                {
                    Store (Zero, C4LN) /* \_SB_.PCI0.C4LN */
                }

                If (And (PAM2, 0x03))
                {
                    Store (Zero, C8LN) /* \_SB_.PCI0.C8LN */
                }

                If (And (PAM2, 0x30))
                {
                    Store (Zero, CCLN) /* \_SB_.PCI0.CCLN */
                }

                If (And (PAM3, 0x03))
                {
                    Store (Zero, D0LN) /* \_SB_.PCI0.D0LN */
                }

                If (And (PAM3, 0x30))
                {
                    Store (Zero, D4LN) /* \_SB_.PCI0.D4LN */
                }

                If (And (PAM4, 0x03))
                {
                    Store (Zero, D8LN) /* \_SB_.PCI0.D8LN */
                }

                If (And (PAM4, 0x30))
                {
                    Store (Zero, DCLN) /* \_SB_.PCI0.DCLN */
                }

                If (And (PAM5, 0x03))
                {
                    Store (Zero, E0LN) /* \_SB_.PCI0.E0LN */
                }

                If (And (PAM5, 0x30))
                {
                    Store (Zero, E4LN) /* \_SB_.PCI0.E4LN */
                }

                If (And (PAM6, 0x03))
                {
                    Store (Zero, E8LN) /* \_SB_.PCI0.E8LN */
                }

                If (And (PAM6, 0x30))
                {
                    Store (Zero, ECLN) /* \_SB_.PCI0.ECLN */
                }
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                CreateDWordField (Arg0, Zero, IID0)
                CreateDWordField (Arg0, 0x04, IID1)
                CreateDWordField (Arg0, 0x08, IID2)
                CreateDWordField (Arg0, 0x0C, IID3)
                Name (UID0, ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */)
                CreateDWordField (UID0, Zero, EID0)
                CreateDWordField (UID0, 0x04, EID1)
                CreateDWordField (UID0, 0x08, EID2)
                CreateDWordField (UID0, 0x0C, EID3)
                If (LAnd (LAnd (LEqual (IID0, EID0), LEqual (IID1, EID1)), LAnd (LEqual (IID2, 
                    EID2), LEqual (IID3, EID3))))
                {
                    Store (CDW2, SUPP) /* \_SB_.PCI0.SUPP */
                    Store (CDW3, CTRL) /* \_SB_.PCI0.CTRL */
                    And (CTRL, 0x0D, CTRL) /* \_SB_.PCI0.CTRL */
                    If (LNot (And (CDW1, One)))
                    {
                        If (And (CTRL, One))
                        {
                            If (LNot (VIGD))
                            {
                                Store (Zero, ^PEG.HPGP) /* \_SB_.PCI0.PEG_.HPGP */
                                Store (Zero, ^PEG.GMGP) /* \_SB_.PCI0.PEG_.GMGP */
                            }

                            Store (Zero, ^EXP4.HPCE) /* \_SB_.PCI0.EXP4.HPCE */
                            Store (One, ^EXP4.HPCS) /* \_SB_.PCI0.EXP4.HPCS */
                            Store (One, ^EXP4.PDC) /* \_SB_.PCI0.EXP4.PDC_ */
                            Store (One, NHPS) /* \NHPS */
                        }

                        If (And (CTRL, 0x04))
                        {
                            If (LNot (VIGD))
                            {
                                Store (Zero, ^PEG.PMGP) /* \_SB_.PCI0.PEG_.PMGP */
                                Store (Zero, ^PEG.GMGP) /* \_SB_.PCI0.PEG_.GMGP */
                            }

                            If (^EXP1.PMCE)
                            {
                                Store (Zero, ^EXP1.PMCE) /* \_SB_.PCI0.EXP1.PMCE */
                                Store (One, ^EXP1.PMCS) /* \_SB_.PCI0.EXP1.PMCS */
                            }

                            If (^EXP2.PMCE)
                            {
                                Store (Zero, ^EXP2.PMCE) /* \_SB_.PCI0.EXP2.PMCE */
                                Store (One, ^EXP2.PMCS) /* \_SB_.PCI0.EXP2.PMCS */
                            }

                            If (^EXP4.PMCE)
                            {
                                Store (Zero, ^EXP4.PMCE) /* \_SB_.PCI0.EXP4.PMCE */
                                Store (One, ^EXP4.PMCS) /* \_SB_.PCI0.EXP4.PMCS */
                            }

                            If (^EXP5.PMCE)
                            {
                                Store (Zero, ^EXP5.PMCE) /* \_SB_.PCI0.EXP5.PMCE */
                                Store (One, ^EXP5.PMCS) /* \_SB_.PCI0.EXP5.PMCS */
                            }

                            Store (Zero, ^LPC.EXPE) /* \_SB_.PCI0.LPC_.EXPE */
                            Store (One, NPME) /* \NPME */
                        }
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x0A, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    Store (CTRL, CDW3) /* \_SB_.PCI0._OSC.CDW3 */
                }
                Else
                {
                    Or (CDW1, 0x06, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                }

                Return (Arg3)
            }

            Mutex (MDGS, 0x00)
            Name (VDEE, One)
            Name (VDDA, Buffer (0x02) {})
            CreateBitField (VDDA, Zero, VUPC)
            CreateBitField (VDDA, One, VQDL)
            CreateBitField (VDDA, 0x02, VQDC)
            CreateBitField (VDDA, 0x03, VQD0)
            CreateBitField (VDDA, 0x04, VQD1)
            CreateBitField (VDDA, 0x05, VQD2)
            CreateBitField (VDDA, 0x06, VSDL)
            CreateBitField (VDDA, 0x07, VSDC)
            CreateBitField (VDDA, 0x08, VSD0)
            CreateBitField (VDDA, 0x09, VSD1)
            CreateBitField (VDDA, 0x0A, VSD2)
            CreateBitField (VDDA, 0x0B, VSD3)
            CreateBitField (VDDA, 0x0C, VSD4)
            CreateBitField (VDDA, 0x0D, VSD5)
            CreateBitField (VDDA, 0x0E, MSWT)
            Device (IMEI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x3A, 0x1C, 0x00, 0x00                           /* :... */
                        }
                    })
                }
            }

            Device (HDMI)
            {
                Name (_ADR, One)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Store (Package (0x02)
                        {
                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-1"
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Name (RID, Zero)
                OperationRegion (VPCG, PCI_Config, Zero, 0x0100)
                Field (VPCG, DWordAcc, NoLock, Preserve)
                {
                    Offset (0xD4), 
                    VPWR,   8
                }

                Name (MIDL, 0x0400)
                Name (MIDC, 0x0100)
                Name (MID0, 0x0300)
                Name (MID1, 0x0301)
                Name (MID2, 0x0302)
                Name (MID3, 0x0303)
                Name (MID4, 0x0304)
                Name (MID5, 0x0305)
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Noop
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    Noop
                }

                Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
                {
                    Noop
                }

                Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
                {
                    Noop
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    Noop
                }

                Method (VSWT, 0, NotSerialized)
                {
                    GHDS (Zero)
                }

                Method (VLOC, 1, NotSerialized)
                {
                    If (LEqual (Arg0, ^^^LID._LID ()))
                    {
                        VSLD (Arg0)
                        If (LEqual (VPWR, Zero))
                        {
                            Store (Arg0, CLID) /* \_SB_.PCI0.IGPU.CLID */
                            GNOT (0x02, Zero)
                        }
                    }
                }

                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    And (Arg0, 0x03, Arg0)
                    If (LEqual (Arg0, 0x02))
                    {
                        Store (0x14, Local0)
                        While (Local0)
                        {
                            Decrement (Local0)
                            Acquire (MDGS, 0xFFFF)
                            If (LEqual (Zero, MSWT))
                            {
                                Store (One, MSWT) /* \_SB_.PCI0.MSWT */
                                Store (Zero, Local0)
                                Store (Arg0, VDEE) /* \_SB_.PCI0.VDEE */
                            }

                            Release (MDGS)
                            Sleep (0xC8)
                        }
                    }
                    Else
                    {
                        Acquire (MDGS, 0xFFFF)
                        If (LEqual (VDEE, 0x02))
                        {
                            Store (Zero, MSWT) /* \_SB_.PCI0.MSWT */
                        }

                        If (LGreater (Arg0, 0x02))
                        {
                            Store (One, VDEE) /* \_SB_.PCI0.VDEE */
                        }
                        Else
                        {
                            Store (Arg0, VDEE) /* \_SB_.PCI0.VDEE */
                        }

                        Release (MDGS)
                    }
                }

                Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                {
                    Store (Zero, NDID) /* \NDID */
                    If (LNotEqual (DIDL, Zero))
                    {
                        Increment (NDID)
                    }

                    If (LNotEqual (DDL2, Zero))
                    {
                        Increment (NDID)
                    }

                    If (LNotEqual (DDL3, Zero))
                    {
                        Increment (NDID)
                    }

                    If (LNotEqual (DDL4, Zero))
                    {
                        Increment (NDID)
                    }

                    If (LNotEqual (DDL5, Zero))
                    {
                        Increment (NDID)
                    }

                    If (LNotEqual (DDL6, Zero))
                    {
                        Increment (NDID)
                    }

                    If (LNotEqual (DDL7, Zero))
                    {
                        Increment (NDID)
                    }

                    If (LNotEqual (DDL8, Zero))
                    {
                        Increment (NDID)
                    }

                    If (LEqual (NDID, One))
                    {
                        Name (TMP1, Package (0x01)
                        {
                            Ones
                        })
                        Store (Or (0x80010000, And (0x0F0F, DIDL)), Index (TMP1, Zero))
                        Return (TMP1) /* \_SB_.PCI0.IGPU._DOD.TMP1 */
                    }

                    If (LEqual (NDID, 0x02))
                    {
                        Name (TMP2, Package (0x02)
                        {
                            Ones, 
                            Ones
                        })
                        Store (Or (0x80010000, And (0x0F0F, DIDL)), Index (TMP2, Zero))
                        Store (Or (0x80010000, And (0x0F0F, DDL2)), Index (TMP2, One))
                        Return (TMP2) /* \_SB_.PCI0.IGPU._DOD.TMP2 */
                    }

                    If (LEqual (NDID, 0x03))
                    {
                        Name (TMP3, Package (0x03)
                        {
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x80010000, And (0x0F0F, DIDL)), Index (TMP3, Zero))
                        Store (Or (0x80010000, And (0x0F0F, DDL2)), Index (TMP3, One))
                        Store (Or (0x80010000, And (0x0F0F, DDL3)), Index (TMP3, 0x02))
                        Return (TMP3) /* \_SB_.PCI0.IGPU._DOD.TMP3 */
                    }

                    If (LEqual (NDID, 0x04))
                    {
                        Name (TMP4, Package (0x04)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x80010000, And (0x0F0F, DIDL)), Index (TMP4, Zero))
                        Store (Or (0x80010000, And (0x0F0F, DDL2)), Index (TMP4, One))
                        Store (Or (0x80010000, And (0x0F0F, DDL3)), Index (TMP4, 0x02))
                        Store (Or (0x80010000, And (0x0F0F, DDL4)), Index (TMP4, 0x03))
                        Return (TMP4) /* \_SB_.PCI0.IGPU._DOD.TMP4 */
                    }

                    If (LEqual (NDID, 0x05))
                    {
                        Name (TMP5, Package (0x05)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x80010000, And (0x0F0F, DIDL)), Index (TMP5, Zero))
                        Store (Or (0x80010000, And (0x0F0F, DDL2)), Index (TMP5, One))
                        Store (Or (0x80010000, And (0x0F0F, DDL3)), Index (TMP5, 0x02))
                        Store (Or (0x80010000, And (0x0F0F, DDL4)), Index (TMP5, 0x03))
                        Store (Or (0x80010000, And (0x0F0F, DDL5)), Index (TMP5, 0x04))
                        Return (TMP5) /* \_SB_.PCI0.IGPU._DOD.TMP5 */
                    }

                    If (LEqual (NDID, 0x06))
                    {
                        Name (TMP6, Package (0x06)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x80010000, And (0x0F0F, DIDL)), Index (TMP6, Zero))
                        Store (Or (0x80010000, And (0x0F0F, DDL2)), Index (TMP6, One))
                        Store (Or (0x80010000, And (0x0F0F, DDL3)), Index (TMP6, 0x02))
                        Store (Or (0x80010000, And (0x0F0F, DDL4)), Index (TMP6, 0x03))
                        Store (Or (0x80010000, And (0x0F0F, DDL5)), Index (TMP6, 0x04))
                        Store (Or (0x80010000, And (0x0F0F, DDL6)), Index (TMP6, 0x05))
                        Return (TMP6) /* \_SB_.PCI0.IGPU._DOD.TMP6 */
                    }

                    If (LEqual (NDID, 0x07))
                    {
                        Name (TMP7, Package (0x07)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x80010000, And (0x0F0F, DIDL)), Index (TMP7, Zero))
                        Store (Or (0x80010000, And (0x0F0F, DDL2)), Index (TMP7, One))
                        Store (Or (0x80010000, And (0x0F0F, DDL3)), Index (TMP7, 0x02))
                        Store (Or (0x80010000, And (0x0F0F, DDL4)), Index (TMP7, 0x03))
                        Store (Or (0x80010000, And (0x0F0F, DDL5)), Index (TMP7, 0x04))
                        Store (Or (0x80010000, And (0x0F0F, DDL6)), Index (TMP7, 0x05))
                        Store (Or (0x80010000, And (0x0F0F, DDL7)), Index (TMP7, 0x06))
                        Return (TMP7) /* \_SB_.PCI0.IGPU._DOD.TMP7 */
                    }

                    If (LGreater (NDID, 0x07))
                    {
                        Name (TMP8, Package (0x08)
                        {
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones, 
                            Ones
                        })
                        Store (Or (0x80010000, And (0x0F0F, DIDL)), Index (TMP8, Zero))
                        Store (Or (0x80010000, And (0x0F0F, DDL2)), Index (TMP8, One))
                        Store (Or (0x80010000, And (0x0F0F, DDL3)), Index (TMP8, 0x02))
                        Store (Or (0x80010000, And (0x0F0F, DDL4)), Index (TMP8, 0x03))
                        Store (Or (0x80010000, And (0x0F0F, DDL5)), Index (TMP8, 0x04))
                        Store (Or (0x80010000, And (0x0F0F, DDL6)), Index (TMP8, 0x05))
                        Store (Or (0x80010000, And (0x0F0F, DDL7)), Index (TMP8, 0x06))
                        Store (Or (0x80010000, And (0x0F0F, DDL8)), Index (TMP8, 0x07))
                        Return (TMP8) /* \_SB_.PCI0.IGPU._DOD.TMP8 */
                    }

                    Return (Package (0x01)
                    {
                        0x0400
                    })
                }

                Method (VDSW, 1, NotSerialized)
                {
                    If (LEqual (VPWR, Zero))
                    {
                        GDCK (Arg0)
                    }
                }

                Method (VCAD, 1, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (LEqual (And (DIDL, 0x0F0F), Arg0))
                    {
                        Store (0x0D, Local0)
                    }
                    Else
                    {
                        If (LEqual (And (DDL2, 0x0F0F), Arg0))
                        {
                            Store (0x0D, Local0)
                        }
                        Else
                        {
                            If (LEqual (And (DDL3, 0x0F0F), Arg0))
                            {
                                Store (0x0D, Local0)
                            }
                            Else
                            {
                                If (LEqual (And (DDL4, 0x0F0F), Arg0))
                                {
                                    Store (0x0D, Local0)
                                }
                                Else
                                {
                                    If (LEqual (And (DDL5, 0x0F0F), Arg0))
                                    {
                                        Store (0x0D, Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (And (DDL6, 0x0F0F), Arg0))
                                        {
                                            Store (0x0D, Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (And (DDL7, 0x0F0F), Arg0))
                                            {
                                                Store (0x0D, Local0)
                                            }
                                            Else
                                            {
                                                If (LEqual (And (DDL8, 0x0F0F), Arg0))
                                                {
                                                    Store (0x0D, Local0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (And (CPDL, 0x0F0F), Arg0))
                    {
                        Or (0x10, Local0, Local0)
                    }
                    Else
                    {
                        If (LEqual (And (CPL2, 0x0F0F), Arg0))
                        {
                            Or (0x10, Local0, Local0)
                        }
                        Else
                        {
                            If (LEqual (And (CPL3, 0x0F0F), Arg0))
                            {
                                Or (0x10, Local0, Local0)
                            }
                            Else
                            {
                                If (LEqual (And (CPL4, 0x0F0F), Arg0))
                                {
                                    Or (0x10, Local0, Local0)
                                }
                                Else
                                {
                                    If (LEqual (And (CPL5, 0x0F0F), Arg0))
                                    {
                                        Or (0x10, Local0, Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (And (CPL6, 0x0F0F), Arg0))
                                        {
                                            Or (0x10, Local0, Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (And (CPL7, 0x0F0F), Arg0))
                                            {
                                                Or (0x10, Local0, Local0)
                                            }
                                            Else
                                            {
                                                If (LEqual (And (CPL8, 0x0F0F), Arg0))
                                                {
                                                    Or (0x10, Local0, Local0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (And (CADL, 0x0F0F), Arg0))
                    {
                        Or (0x02, Local0, Local0)
                    }
                    Else
                    {
                        If (LEqual (And (CAL2, 0x0F0F), Arg0))
                        {
                            Or (0x02, Local0, Local0)
                        }
                        Else
                        {
                            If (LEqual (And (CAL3, 0x0F0F), Arg0))
                            {
                                Or (0x02, Local0, Local0)
                            }
                            Else
                            {
                                If (LEqual (And (CAL4, 0x0F0F), Arg0))
                                {
                                    Or (0x02, Local0, Local0)
                                }
                                Else
                                {
                                    If (LEqual (And (CAL5, 0x0F0F), Arg0))
                                    {
                                        Or (0x02, Local0, Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (And (CAL6, 0x0F0F), Arg0))
                                        {
                                            Or (0x02, Local0, Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (And (CAL7, 0x0F0F), Arg0))
                                            {
                                                Or (0x02, Local0, Local0)
                                            }
                                            Else
                                            {
                                                If (LEqual (And (CAL8, 0x0F0F), Arg0))
                                                {
                                                    Or (0x02, Local0, Local0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Return (Local0)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    If (LEqual (And (NADL, 0x0F0F), Arg0))
                    {
                        Return (One)
                    }
                    Else
                    {
                        If (LEqual (And (NDL2, 0x0F0F), Arg0))
                        {
                            Return (One)
                        }
                        Else
                        {
                            If (LEqual (And (NDL3, 0x0F0F), Arg0))
                            {
                                Return (One)
                            }
                            Else
                            {
                                If (LEqual (And (NDL4, 0x0F0F), Arg0))
                                {
                                    Return (One)
                                }
                                Else
                                {
                                    If (LEqual (And (NDL5, 0x0F0F), Arg0))
                                    {
                                        Return (One)
                                    }
                                    Else
                                    {
                                        If (LEqual (And (NDL6, 0x0F0F), Arg0))
                                        {
                                            Return (One)
                                        }
                                        Else
                                        {
                                            If (LEqual (And (NDL7, 0x0F0F), Arg0))
                                            {
                                                Return (One)
                                            }
                                            Else
                                            {
                                                If (LEqual (And (NDL8, 0x0F0F), Arg0))
                                                {
                                                    Return (One)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Return (Zero)
                }

                Device (LCD0)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0400)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MIDL))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MIDL))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        And (Arg0, One, VSDL) /* \_SB_.PCI0.VSDL */
                    }

                    Method (_DDC, 1, NotSerialized)  // _DDC: Display Data Current
                    {
                        If (LEqual (Arg0, One))
                        {
                            Return (VEDI) /* \VEDI */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Return (VEDI) /* \VEDI */
                            }
                        }

                        Return (Zero)
                    }
                }

                Device (CRT0)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0100)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MIDC))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MIDC))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        And (Arg0, One, VSDC) /* \_SB_.PCI0.VSDC */
                    }
                }

                Device (DVI0)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0300)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID0))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID0))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        And (Arg0, One, VSD0) /* \_SB_.PCI0.VSD0 */
                    }
                }

                Device (DVI1)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0301)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID1))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID1))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        And (Arg0, One, VSD1) /* \_SB_.PCI0.VSD1 */
                    }
                }

                Device (DVI2)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0302)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID2))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID2))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        And (Arg0, One, VSD2) /* \_SB_.PCI0.VSD2 */
                    }
                }

                Device (DVI3)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0303)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID3))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID3))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        And (Arg0, One, VSD3) /* \_SB_.PCI0.VSD3 */
                    }
                }

                Device (DVI4)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0304)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID4))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID4))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        And (Arg0, One, VSD4) /* \_SB_.PCI0.VSD4 */
                    }
                }

                Device (DVI5)
                {
                    Method (_ADR, 0, NotSerialized)  // _ADR: Address
                    {
                        Return (0x0305)
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (VCAD (MID5))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Return (NDDS (MID5))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        And (Arg0, One, VSD5) /* \_SB_.PCI0.VSD5 */
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                    Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                    Offset (0x18), 
                    Offset (0xA4), 
                    ASLE,   8, 
                    Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                    Offset (0xB0), 
                        ,   12, 
                    CDVL,   1, 
                    Offset (0xB2), 
                    Offset (0xB5), 
                    LBPC,   8, 
                    Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGD2, PCI_Config, 0x10, 0x04)
                Field (IGD2, AnyAcc, NoLock, Preserve)
                {
                    BAR1,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    DMOD,   32, 
                    Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                    Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                    Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                    Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                    Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    CBLV,   32, 
                    BCLM,   320, 
                    CPFM,   32, 
                    EPFM,   32, 
                    PLUT,   592, 
                    PFMB,   32, 
                    CCDV,   32, 
                    PCFT,   32, 
                    Offset (0x400), 
                    GVD1,   49152, 
                    PHED,   32, 
                    BDDC,   2048
                }

                Name (DBTB, Package (0x15)
                {
                    Zero, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x05)
                {
                    Package (0x02)
                    {
                        0xE4, 
                        0x0140
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }
                })
                Name (SUCC, One)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC) /* \_SB_.PCI0.IGPU.GXFC */
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC) /* \_SB_.PCI0.IGPU.GXFC */
                    }

                    Store (Zero, GEFC) /* \_SB_.PCI0.IGPU.GEFC */
                    Store (One, ^^LPC.SCIS) /* \_SB_.PCI0.LPC_.SCIS */
                    Store (Zero, GSSE) /* \_SB_.PCI0.IGPU.GSSE */
                    Store (Zero, SCIE) /* \_SB_.PCI0.IGPU.SCIE */
                    Return (Zero)
                }

                Method (GBDA, 0, Serialized)
                {
                    If (LEqual (GESF, Zero))
                    {
                        Store (0x0241, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, One))
                    {
                        Store (0x0202, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x04))
                    {
                        And (PARM, 0xEFFF0000, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        And (PARM, ShiftLeft (DerefOf (Index (DBTB, IBTT)), 0x10), PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Or (IBTT, PARM, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x05))
                    {
                        If (^^^LID._LID ())
                        {
                            Store (One, LIDS) /* \LIDS */
                        }
                        Else
                        {
                            Store (Zero, LIDS) /* \LIDS */
                        }

                        Store (IPSC, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Add (PARM, One, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Add (PARM, 0x0300, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Add (PARM, 0x00010000, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Or (PARM, ShiftLeft (LIDS, 0x10), PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Or (PARM, ShiftLeft (IBIA, 0x14), PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x06))
                    {
                        Store (ITVF, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Or (PARM, ShiftLeft (ITVM, 0x04), PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x07))
                    {
                        Store (GIVD, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        XOr (PARM, One, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Or (PARM, ShiftLeft (GMFN, One), PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Or (PARM, 0x1800, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Or (PARM, 0x00060000, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), CDVL)), 0x15
                            ), PARM, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Store (One, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x0A))
                    {
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        If (ISSC)
                        {
                            Or (PARM, 0x03, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        }

                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                    Return (CRIT) /* \_SB_.PCI0.IGPU.CRIT */
                }

                Method (SBCB, 0, Serialized)
                {
                    If (LEqual (GESF, Zero))
                    {
                        Store (0x0101, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, One))
                    {
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x03))
                    {
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x04))
                    {
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x05))
                    {
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x06))
                    {
                        Store (And (PARM, 0x0F), ITVF) /* \ITVF */
                        Store (ShiftRight (And (PARM, 0xF0), 0x04), ITVM) /* \ITVM */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x07))
                    {
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x08))
                    {
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x09))
                    {
                        And (PARM, 0xFF, IBTT) /* \IBTT */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x0A))
                    {
                        And (PARM, 0xFF, IPSC) /* \IPSC */
                        If (And (ShiftRight (PARM, 0x08), 0xFF))
                        {
                            And (ShiftRight (PARM, 0x08), 0xFF, IPAT) /* \IPAT */
                            Decrement (IPAT)
                        }

                        And (ShiftRight (PARM, 0x14), 0x07, IBIA) /* \IBIA */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x0B))
                    {
                        And (ShiftRight (PARM, One), One, IF1E) /* \IF1E */
                        If (And (PARM, 0x0001E000))
                        {
                            And (ShiftRight (PARM, 0x0D), 0x0F, IDMS) /* \IDMS */
                        }
                        Else
                        {
                            And (ShiftRight (PARM, 0x11), 0x0F, IDMS) /* \IDMS */
                        }

                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x10))
                    {
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x11))
                    {
                        Store (ShiftLeft (LIDS, 0x08), PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Add (PARM, 0x0100, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x12))
                    {
                        If (And (PARM, One))
                        {
                            If (LEqual (ShiftRight (PARM, One), One))
                            {
                                Store (One, ISSC) /* \ISSC */
                            }
                            Else
                            {
                                Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                                Return (CRIT) /* \_SB_.PCI0.IGPU.CRIT */
                            }
                        }
                        Else
                        {
                            Store (Zero, ISSC) /* \ISSC */
                        }

                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x13))
                    {
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    If (LEqual (GESF, 0x14))
                    {
                        And (PARM, 0x0F, PAVP) /* \PAVP */
                        Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                        Store (Zero, PARM) /* \_SB_.PCI0.IGPU.PARM */
                        Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                    }

                    Store (Zero, GESF) /* \_SB_.PCI0.IGPU.GESF */
                    Return (SUCC) /* \_SB_.PCI0.IGPU.SUCC */
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (One)
                    }

                    Store (Arg0, CEVT) /* \_SB_.PCI0.IGPU.CEVT */
                    Store (0x03, CSTS) /* \_SB_.PCI0.IGPU.CSTS */
                    If (LAnd (LEqual (CHPD, Zero), LEqual (Arg1, Zero)))
                    {
                        If (LNotEqual (Arg0, One))
                        {
                            If (LAnd (WXPF, LNot (WVIS)))
                            {
                                Notify (PCI0, Arg1)
                            }
                            Else
                            {
                                Notify (IGPU, Arg1)
                            }
                        }
                    }

                    Notify (IGPU, 0x80) // Status Change
                    Return (Zero)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX) /* \_SB_.PCI0.IGPU.TIDX */
                    Return (GNOT (One, Zero))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (Arg0, CLID) /* \_SB_.PCI0.IGPU.CLID */
                    Return (GNOT (0x02, Zero))
                }

                Method (GLIS, 1, NotSerialized)
                {
                    Store (Arg0, CLID) /* \_SB_.PCI0.IGPU.CLID */
                    Return (Zero)
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK) /* \_SB_.PCI0.IGPU.CDCK */
                    Return (GNOT (0x04, 0x80))
                }

                Method (GDCS, 1, NotSerialized)
                {
                    Store (Arg0, CDCK) /* \_SB_.PCI0.IGPU.CDCK */
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (One, Arg0))))
                    {
                        Return (One)
                    }

                    If (PARD ())
                    {
                        Return (One)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        XOr (PFIT, 0x07, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                        Or (PFIT, 0x80000000, PFIT) /* \_SB_.PCI0.IGPU.PFIT */
                        Store (0x04, ASLC) /* \_SB_.PCI0.IGPU.ASLC */
                    }
                    Else
                    {
                        If (LEqual (Arg0, One))
                        {
                            Store (Arg1, BCLP) /* \_SB_.PCI0.IGPU.BCLP */
                            Or (BCLP, 0x80000000, BCLP) /* \_SB_.PCI0.IGPU.BCLP */
                            Store (0x0A, ASLC) /* \_SB_.PCI0.IGPU.ASLC */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x03))
                            {
                                Store (Arg1, PFMB) /* \_SB_.PCI0.IGPU.PFMB */
                                Or (PFMB, 0x80000100, PFMB) /* \_SB_.PCI0.IGPU.PFMB */
                            }
                            Else
                            {
                                If (LEqual (Arg0, Zero))
                                {
                                    Store (Arg1, ALSI) /* \_SB_.PCI0.IGPU.ALSI */
                                    Store (One, ASLC) /* \_SB_.PCI0.IGPU.ASLC */
                                }
                                Else
                                {
                                    Return (One)
                                }
                            }
                        }
                    }

                    Store (One, ASLE) /* \_SB_.PCI0.IGPU.ASLE */
                    Return (Zero)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Store (Package (0x06)
                        {
                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-1"
                            }, 

                            "model", 
                            Buffer (0x17)
                            {
                                "Intel HD Graphics 3000"
                            }, 

                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
                
                Device (PNLF)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                    Name (_CID, "backlight")  // _CID: Compatible ID
                    Name (_UID, 0x0A)  // _UID: Unique ID
                    Name (_STA, 0x0B)  // _STA: Status

                    Name (XOPT, 0x06)
                }

            }

            Device (LPC)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (SCRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x15E0,             // Range Minimum
                            0x15E0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x1600,             // Range Minimum
                            0x1600,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xF8000000,         // Address Base
                            0x04000000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00001000,         // Address Length
                            _Y1D)
                        Memory32Fixed (ReadWrite,
                            0xFED1C000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED10000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED18000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED19000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED45000,         // Address Base
                            0x00007000,         // Address Length
                            )
                    })
                    CreateDWordField (SCRS, \_SB.PCI0.LPC.SIO._Y1D._BAS, TRMB)  // _BAS: Base Address
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (TBAB, TRMB) /* \_SB_.PCI0.LPC_.SIO_.TRMB */
                        If (LEqual (^^TPM._STA (), 0x0F))
                        {
                            Return (SCRS) /* \_SB_.PCI0.LPC_.SIO_.SCRS */
                        }
                        Else
                        {
                            Subtract (SizeOf (SCRS), 0x02, Local0)
                            Name (BUF0, Buffer (Local0) {})
                            Add (Local0, SizeOf (^^TPM.BUF1), Local0)
                            Name (BUF1, Buffer (Local0) {})
                            Store (SCRS, BUF0) /* \_SB_.PCI0.LPC_.SIO_._CRS.BUF0 */
                            Concatenate (BUF0, ^^TPM.BUF1, BUF1) /* \_SB_.PCI0.LPC_.SIO_._CRS.BUF1 */
                            Return (BUF1) /* \_SB_.PCI0.LPC_.SIO_._CRS.BUF1 */
                        }
                    }
                }

                OperationRegion (LPCS, PCI_Config, Zero, 0x0100)
                Field (LPCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    SERQ,   8, 
                    Offset (0x68), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8, 
                    Offset (0x80), 
                    XU1A,   3, 
                        ,   1, 
                    XU2A,   3, 
                    Offset (0x81), 
                    XPA,    2, 
                        ,   2, 
                    XFA,    1, 
                    Offset (0x82), 
                    XU1E,   1, 
                    XU2E,   1, 
                    XPE,    1, 
                    XFE,    1, 
                    Offset (0x84), 
                    XG1E,   1, 
                        ,   1, 
                    XG1A,   14, 
                    Offset (0x88), 
                    XG2E,   1, 
                        ,   1, 
                    XG2A,   14, 
                    Offset (0xA0), 
                        ,   2, 
                    CLKR,   1, 
                        ,   7, 
                    EXPE,   1, 
                    Offset (0xA2)
                }

                OperationRegion (LPIO, SystemIO, 0x0500, 0x80)
                Field (LPIO, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x0C), 
                        ,   3, 
                    DOI0,   1, 
                    DOI1,   1, 
                    DOI2,   1, 
                    Offset (0x0D), 
                    Offset (0x0E), 
                        ,   6, 
                    GLIS,   1, 
                    Offset (0x0F), 
                    Offset (0x10), 
                    Offset (0x2C), 
                        ,   6, 
                    XHPD,   1, 
                    Offset (0x30), 
                        ,   15, 
                    PCRQ,   1, 
                    Offset (0x34), 
                        ,   15, 
                    PCRS,   1
                }

                OperationRegion (PMIO, SystemIO, 0x0400, 0x80)
                Field (PMIO, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x42), 
                        ,   1, 
                    SWGE,   1, 
                    Offset (0x64), 
                        ,   9, 
                    SCIS,   1, 
                    Offset (0x66)
                }

                OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
                Field (IO_T, ByteAcc, NoLock, Preserve)
                {
                    TRPI,   16, 
                    Offset (0x04), 
                    Offset (0x06), 
                    Offset (0x08), 
                    TRP0,   8, 
                    Offset (0x0A), 
                    Offset (0x0B), 
                    Offset (0x0C), 
                    Offset (0x0D), 
                    Offset (0x0E), 
                    Offset (0x0F), 
                    Offset (0x10)
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0C01") /* System Board */)  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {8,11,14,15}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y1E)
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (BUF0, \_SB.PCI0.LPC.HPET._Y1E._BAS, HPT0)  // _BAS: Base Address
                        Store (\HPET, HPT0) /* \_SB_.PCI0.LPC_.HPET._CRS.HPT0 */
                        Return (BUF0) /* \_SB_.PCI0.LPC_.HPET.BUF0 */
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, BusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (FPU)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
// tjl-begin - add this Method - now in SSDT
                    Method (XDSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        Store (Package (0x06)
                            {
                                "RM,oem-id", 
                                "LENOVO", 
                                "RM,oem-table-id", 
                                "T420", 
                                "AAPL,has-embedded-fn-keys", 
                                Unicode ("\x01")
                            }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
// tjl-end
                }

                Device (MOU)
                {
                    Name (_HID, EisaId ("IBM3780"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _CID: Compatible ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Method (MHID, 0, NotSerialized)
                    {
                        If (PADD)
                        {
                            Store (0x80374D24, _HID) /* \_SB_.PCI0.LPC_.MOU_._HID */
                        }
                        Else
                        {
                            Store (0x1500AE30, _HID) /* \_SB_.PCI0.LPC_.MOU_._HID */
                        }
                    }
                }

                OperationRegion (IMGA, SystemIO, 0x15E0, 0x10)
                Field (IMGA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x01), 
                    Offset (0x02), 
                    Offset (0x03), 
                    WAKR,   16, 
                    Offset (0x0C), 
                    GAIX,   8, 
                    Offset (0x0E), 
                    GADT,   8, 
                    Offset (0x10)
                }

                IndexField (GAIX, GADT, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x50), 
                        ,   3, 
                    IVPW,   1, 
                    DVPW,   1, 
                    BLPL,   1, 
                    Offset (0x51), 
                    TP4R,   1, 
                    PADR,   1, 
                    BPAD,   1, 
                        ,   1, 
                        ,   1, 
                    PADD,   1, 
                    Offset (0x60), 
                    EPWG,   1, 
                        ,   1, 
                    CSON,   1, 
                    DSCI,   1, 
                    DSCS,   1, 
                    DLAN,   1, 
                    Offset (0xC2), 
                    GAID,   8
                }

                Scope (\_SB)
                {
                    Name (TCGP, Buffer (0x08)
                    {
                         0x1F, 0xE0, 0x1F, 0x01, 0x02, 0x04, 0x08, 0xF0   /* ........ */
                    })
                    CreateByteField (TCGP, Zero, PPRQ)
                    CreateByteField (TCGP, One, PPL1)
                    CreateByteField (TCGP, 0x02, PPRP)
                    CreateByteField (TCGP, 0x03, TPRS)
                    CreateByteField (TCGP, 0x04, PPOR)
                    CreateByteField (TCGP, 0x05, TPMV)
                    CreateByteField (TCGP, 0x06, MOR)
                    CreateByteField (TCGP, 0x07, TVEN)
                    OperationRegion (TCGC, SystemIO, 0x72, 0x02)
                    Field (TCGC, ByteAcc, Lock, Preserve)
                    {
                        TIDX,   8, 
                        TPDA,   8
                    }

                    IndexField (TIDX, TPDA, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x40), 
                        TPP1,   8, 
                        PPLO,   8, 
                        TPP3,   8
                    }

                    OperationRegion (SMIP, SystemIO, 0xB2, 0x02)
                    Field (SMIP, WordAcc, NoLock, Preserve)
                    {
                        SMIT,   8, 
                        SMID,   8
                    }
                }

                Device (TPM)
                {
                    Name (TMPV, Zero)
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        If (LEqual (TVID, 0x15D1))
                        {
                            Return (0x0201D824)
                        }

                        If (LOr (LEqual (TVID, 0x1050), LEqual (TVID, 0x100B)))
                        {
                            Return (0x0010A35C)
                        }

                        If (LEqual (TVID, 0x19FA))
                        {
                            Return (0x0435CF4D)
                        }

                        If (LEqual (TDID, 0x1002))
                        {
                            Return (0x02016D08)
                        }

                        If (LEqual (TDID, 0x1001))
                        {
                            Return (0x01016D08)
                        }

                        If (LEqual (TVID, 0x1114))
                        {
                            Return (0x00128D06)
                        }

                        If (LEqual (TVID, 0x104A))
                        {
                            Return (0x0012AF4D)
                        }

                        Return (0x310CD041)
                    }

                    Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
                    Name (_UID, One)  // _UID: Unique ID
                    OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x1000)
                    Field (TMMB, ByteAcc, Lock, Preserve)
                    {
                        ACCS,   8, 
                        Offset (0x18), 
                        TSTA,   8, 
                        TBCA,   8, 
                        Offset (0xF00), 
                        TVID,   16, 
                        TDID,   16
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (ACCS, 0xFF))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (TPME, Zero))
                            {
                                Return (Zero)
                            }
                        }

                        Return (0x0F)
                    }

                    Name (BUF1, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED40000,         // Address Base
                            0x00005000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Return (BUF1) /* \_SB_.PCI0.LPC_.TPM_.BUF1 */
                    }

                    Method (UCMP, 2, NotSerialized)
                    {
                        If (LNotEqual (0x10, SizeOf (Arg0)))
                        {
                            Return (Zero)
                        }

                        If (LNotEqual (0x10, SizeOf (Arg1)))
                        {
                            Return (Zero)
                        }

                        Store (Zero, Local0)
                        While (LLess (Local0, 0x10))
                        {
                            If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (Arg1, Local0
                                ))))
                            {
                                Return (Zero)
                            }

                            Increment (Local0)
                        }

                        Return (One)
                    }

                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        Name (TTMP, Buffer (One)
                        {
                             0x00                                             /* . */
                        })
                        CreateByteField (TTMP, Zero, TMPV)
                        If (LEqual (UCMP (Arg0, ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */), One))
                        {
                            If (LEqual (Arg2, Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x7F                                             /* . */
                                })
                            }

                            If (LEqual (Arg2, One))
                            {
                                Return (Buffer (0x04)
                                {
                                    "1.0"
                                })
                            }

                            If (LEqual (Arg2, 0x02))
                            {
                                If (TPRS)
                                {
                                    If (LOr (LLessEqual (DerefOf (Index (Arg3, Zero)), 0x0B), LEqual (DerefOf (
                                        Index (Arg3, Zero)), 0x0E)))
                                    {
                                        Store (DerefOf (Index (Arg3, Zero)), SMID) /* \_SB_.SMID */
                                        Store (0xC1, SMIT) /* \_SB_.SMIT */
                                        Store (DerefOf (Index (Arg3, Zero)), TPP1) /* \_SB_.TPP1 */
                                        Return (Zero)
                                    }

                                    Return (One)
                                }

                                Return (One)
                            }

                            If (LEqual (Arg2, 0x03))
                            {
                                Name (TMP1, Package (0x02)
                                {
                                    Zero, 
                                    Ones
                                })
                                Store (TPP1, TMPV) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMPV */
                                Store (And (TMPV, PPRQ, TMPV) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMPV */, Index (TMP1, One))
                                Return (TMP1) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP1 */
                            }

                            If (LEqual (Arg2, 0x04))
                            {
                                Return (One)
                            }

                            If (LEqual (Arg2, 0x05))
                            {
                                Name (TMP2, Package (0x03)
                                {
                                    Zero, 
                                    Ones, 
                                    Ones
                                })
                                Store (PPLO, Index (TMP2, One))
                                If (LOr (LOr (LGreater (PPLO, 0x0E), LEqual (PPLO, 0x0C)), LEqual (PPLO, 0x0D)))
                                {
                                    Store (0xFFFFFFF1, Index (TMP2, 0x02))
                                    Return (TMP2) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP2 */
                                }

                                If (LEqual (PPRQ, 0xFF))
                                {
                                    Store (0xFFFFFFF1, Index (TMP2, 0x02))
                                    Return (TMP2) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP2 */
                                }

                                If (And (TPP3, 0x02))
                                {
                                    Store (0xFFFFFFF0, Index (TMP2, 0x02))
                                    Return (TMP2) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP2 */
                                }

                                Store (Zero, Index (TMP2, 0x02))
                                Return (TMP2) /* \_SB_.PCI0.LPC_.TPM_._DSM.TMP2 */
                            }

                            If (LEqual (Arg2, 0x06))
                            {
                                CreateByteField (Arg3, 0x04, LAN0)
                                CreateByteField (Arg3, 0x05, LAN1)
                                If (LOr (LEqual (LAN0, 0x65), LEqual (LAN0, 0x45)))
                                {
                                    If (LOr (LEqual (LAN1, 0x6E), LEqual (LAN1, 0x4E)))
                                    {
                                        Return (Zero)
                                    }
                                }

                                Return (One)
                            }

                            Return (One)
                        }

                        If (LEqual (UCMP (Arg0, ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d")), One))
                        {
                            If (LEqual (Arg2, Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x01                                             /* . */
                                })
                            }

                            If (LEqual (Arg2, One))
                            {
                                If (LEqual (DerefOf (Index (Arg3, Zero)), Zero))
                                {
                                    Store (Zero, MORD) /* \MORD */
                                    Store (0x80, SMID) /* \_SB_.SMID */
                                    Store (0xC1, SMIT) /* \_SB_.SMIT */
                                    Return (Zero)
                                }

                                If (LEqual (DerefOf (Index (Arg3, Zero)), One))
                                {
                                    Store (One, MORD) /* \MORD */
                                    Store (0x81, SMID) /* \_SB_.SMID */
                                    Store (0xC1, SMIT) /* \_SB_.SMIT */
                                    Return (Zero)
                                }
                            }

                            Return (One)
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             /* . */
                        })
                    }

                    Method (CMOR, 0, NotSerialized)
                    {
                        Store (Zero, MORD) /* \MORD */
                        Store (0x80, SMID) /* \_SB_.SMID */
                        Store (0xC1, SMIT) /* \_SB_.SMIT */
                    }
                }

                Device (SMCD)
                {
                    Name (_HID, "MON0000")  // _HID: Hardware ID
                    Method (FAN0, 0, NotSerialized)
                    {
                        Store (B1B2 (^^EC.HFN1, ^^EC.HFN2), Local0)
                        Return (Local0)
                    }

                    Method (TCPU, 0, NotSerialized)
                    {
                        Store (^^EC.TMP0, Local0)
                        Return (Local0)
                    }
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (_GPE, 0x11)  // _GPE: General Purpose Events
                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, H8DR) /* \H8DR */
                        }
                    }

                    OperationRegion (ECOR, EmbeddedControl, Zero, 0x0100)
                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        HDBM,   1, 
                            ,   1, 
                            ,   1, 
                        HFNE,   1, 
                            ,   1, 
                            ,   1, 
                        HLDM,   1, 
                        Offset (0x01), 
                        BBLS,   1, 
                        BTCM,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        HBPR,   1, 
                        BTPC,   1, 
                        Offset (0x02), 
                        HDUE,   1, 
                            ,   4, 
                        SNLK,   1, 
                        Offset (0x03), 
                            ,   5, 
                        HAUM,   2, 
                        Offset (0x05), 
                        HSPA,   1, 
                        Offset (0x06), 
                        HSUN,   8, 
                        HSRP,   8, 
                        Offset (0x0C), 
                        HLCL,   8, 
                            ,   4, 
                        CALM,   1, 
                        Offset (0x0E), 
                        HFNS,   2, 
                        Offset (0x0F), 
                            ,   6, 
                        NULS,   1, 
                        Offset (0x10), 
                        HAM0,   8, 
                        HAM1,   8, 
                        HAM2,   8, 
                        HAM3,   8, 
                        HAM4,   8, 
                        HAM5,   8, 
                        HAM6,   8, 
                        HAM7,   8, 
                        HAM8,   8, 
                        HAM9,   8, 
                        HAMA,   8, 
                        HAMB,   8, 
                        HAMC,   8, 
                        HAMD,   8, 
                        HAME,   8, 
                        HAMF,   8, 
                        Offset (0x23), 
                        HANT,   8, 
                        Offset (0x26), 
                            ,   2, 
                        HANA,   2, 
                        Offset (0x27), 
                        Offset (0x2A), 
                        HATR,   8, 
                        HT0H,   8, 
                        HT0L,   8, 
                        HT1H,   8, 
                        HT1L,   8, 
                        HFSP,   8, 
                            ,   6, 
                        HMUT,   1, 
                        Offset (0x31), 
                            ,   2, 
                        HUWB,   1, 
                        Offset (0x32), 
                        HWPM,   1, 
                        HWLB,   1, 
                        HWLO,   1, 
                        HWDK,   1, 
                        HWFN,   1, 
                        HWBT,   1, 
                        HWRI,   1, 
                        HWBU,   1, 
                        HWLU,   1, 
                        Offset (0x34), 
                            ,   3, 
                        PIBS,   1, 
                            ,   3, 
                        HPLO,   1, 
                        Offset (0x36), 
                        Offset (0x38), 
                        HB0S,   7, 
                        HB0A,   1, 
                        HB1S,   7, 
                        HB1A,   1, 
                        HCMU,   1, 
                            ,   2, 
                        OVRQ,   1, 
                        DCBD,   1, 
                        DCWL,   1, 
                        DCWW,   1, 
                        HB1I,   1, 
                            ,   1, 
                        KBLT,   1, 
                        BTPW,   1, 
                        BTDT,   1, 
                        HUBS,   1, 
                        BDPW,   1, 
                        BDDT,   1, 
                        HUBB,   1, 
                        Offset (0x46), 
                            ,   1, 
                        BTWK,   1, 
                        HPLD,   1, 
                            ,   1, 
                        HPAC,   1, 
                        BTST,   1, 
                        Offset (0x47), 
                        HPBU,   1, 
                            ,   1, 
                        HBID,   1, 
                            ,   3, 
                        HBCS,   1, 
                        HPNF,   1, 
                            ,   1, 
                        GSTS,   1, 
                            ,   2, 
                        HLBU,   1, 
                        DOCD,   1, 
                        HCBL,   1, 
                        Offset (0x4C), 
                        HTMH,   8, 
                        HTML,   8, 
                        WAK0,   8, 
                        WAK1,   8, 
                        HMPR,   8, 
                            ,   7, 
                        HMDN,   1, 
                        Offset (0x78), 
                        TMP0,   8, 
                        Offset (0x80), 
                        Offset (0x81), 
                        HIID,   8, 
                        Offset (0x83), 
                        HFNI,   8, 
                        SPD0,   8, 
                        SPD1,   8, 
                        Offset (0x88), 
                        TSL0,   7, 
                        TSR0,   1, 
                        TSL1,   7, 
                        TSR1,   1, 
                        TSL2,   7, 
                        TSR2,   1, 
                        TSL3,   7, 
                        TSR3,   1, 
                        Offset (0x8D), 
                        HDAA,   3, 
                        HDAB,   3, 
                        HDAC,   2, 
                        Offset (0xB0), 
                        HDEN,   32, 
                        HDEP,   32, 
                        HDEM,   8, 
                        HDES,   8, 
                        Offset (0xBB), 
                        PLSL,   8, 
                        PLMS,   8, 
                        PLLS,   8, 
                        PLTU,   8, 
                        Offset (0xC8), 
                        ATMX,   8, 
                        HWAT,   8, 
                        Offset (0xCC), 
                        PWMH,   8, 
                        PWML,   8, 
                        Offset (0xED), 
                            ,   4, 
                        HDDD,   1
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x84), 
                        HFN1,   8, 
                        HFN2,   8
                    }

                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        If (H8DR)
                        {
                            Store (Zero, HSPA) /* \_SB_.PCI0.LPC_.EC__.HSPA */
                        }
                        Else
                        {
                            MBEC (0x05, 0xFE, Zero)
                        }

                        BINI ()
                        ^HKEY.WGIN ()
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Method (LED, 2, NotSerialized)
                    {
                        Or (Arg0, Arg1, Local0)
                        If (H8DR)
                        {
                            Store (Local0, HLCL) /* \_SB_.PCI0.LPC_.EC__.HLCL */
                        }
                        Else
                        {
                            WBEC (0x0C, Local0)
                        }
                    }

                    Name (BAON, Zero)
                    Name (WBON, Zero)
                    Method (BEEP, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x05))
                        {
                            Store (Zero, WBON) /* \_SB_.PCI0.LPC_.EC__.WBON */
                        }

                        Store (WBON, Local2)
                        If (BAON)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Zero, BAON) /* \_SB_.PCI0.LPC_.EC__.BAON */
                                If (WBON)
                                {
                                    Store (0x03, Local0)
                                    Store (0x08, Local1)
                                }
                                Else
                                {
                                    Store (Zero, Local0)
                                    Store (Zero, Local1)
                                }
                            }
                            Else
                            {
                                Store (0xFF, Local0)
                                Store (0xFF, Local1)
                                If (LEqual (Arg0, 0x11))
                                {
                                    Store (Zero, WBON) /* \_SB_.PCI0.LPC_.EC__.WBON */
                                }

                                If (LEqual (Arg0, 0x10))
                                {
                                    Store (One, WBON) /* \_SB_.PCI0.LPC_.EC__.WBON */
                                }
                            }
                        }
                        Else
                        {
                            Store (Arg0, Local0)
                            Store (0xFF, Local1)
                            If (LEqual (Arg0, 0x0F))
                            {
                                Store (Arg0, Local0)
                                Store (0x08, Local1)
                                Store (One, BAON) /* \_SB_.PCI0.LPC_.EC__.BAON */
                            }

                            If (LEqual (Arg0, 0x11))
                            {
                                Store (Zero, Local0)
                                Store (Zero, Local1)
                                Store (Zero, WBON) /* \_SB_.PCI0.LPC_.EC__.WBON */
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (0x03, Local0)
                                Store (0x08, Local1)
                                Store (One, WBON) /* \_SB_.PCI0.LPC_.EC__.WBON */
                            }
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Zero, WBON) /* \_SB_.PCI0.LPC_.EC__.WBON */
                            If (Local2)
                            {
                                Store (0x07, Local0)
                                If (LOr (LEqual (SPS, 0x03), LEqual (SPS, 0x04)))
                                {
                                    Store (Zero, Local2)
                                    Store (0xFF, Local0)
                                    Store (0xFF, Local1)
                                }
                            }
                        }

                        If (LEqual (Arg0, 0x07))
                        {
                            If (Local2)
                            {
                                Store (Zero, Local2)
                                Store (0xFF, Local0)
                                Store (0xFF, Local1)
                            }
                        }

                        If (H8DR)
                        {
                            If (LAnd (Local2, LNot (WBON)))
                            {
                                Store (Zero, HSRP) /* \_SB_.PCI0.LPC_.EC__.HSRP */
                                Store (Zero, HSUN) /* \_SB_.PCI0.LPC_.EC__.HSUN */
                                Sleep (0x64)
                            }

                            If (LNotEqual (Local1, 0xFF))
                            {
                                Store (Local1, HSRP) /* \_SB_.PCI0.LPC_.EC__.HSRP */
                            }

                            If (LNotEqual (Local0, 0xFF))
                            {
                                Store (Local0, HSUN) /* \_SB_.PCI0.LPC_.EC__.HSUN */
                            }
                        }
                        Else
                        {
                            If (LAnd (Local2, LNot (WBON)))
                            {
                                WBEC (0x07, Zero)
                                WBEC (0x06, Zero)
                                Sleep (0x64)
                            }

                            If (LNotEqual (Local1, 0xFF))
                            {
                                WBEC (0x07, Local1)
                            }

                            If (LNotEqual (Local0, 0xFF))
                            {
                                WBEC (0x06, Local0)
                            }
                        }

                        If (LEqual (Arg0, 0x03)) {}
                        If (LEqual (Arg0, 0x07))
                        {
                            Sleep (0x01F4)
                        }
                    }

                    Method (EVNT, 1, NotSerialized)
                    {
                        If (H8DR)
                        {
                            If (Arg0)
                            {
                                Or (HAM7, One, HAM7) /* \_SB_.PCI0.LPC_.EC__.HAM7 */
                                Or (HAM5, 0x04, HAM5) /* \_SB_.PCI0.LPC_.EC__.HAM5 */
                            }
                            Else
                            {
                                And (HAM7, 0xFE, HAM7) /* \_SB_.PCI0.LPC_.EC__.HAM7 */
                                And (HAM5, 0xFB, HAM5) /* \_SB_.PCI0.LPC_.EC__.HAM5 */
                            }
                        }
                        Else
                        {
                            If (Arg0)
                            {
                                MBEC (0x17, 0xFF, One)
                                MBEC (0x15, 0xFF, 0x04)
                            }
                            Else
                            {
                                MBEC (0x17, 0xFE, Zero)
                                MBEC (0x15, 0xFB, Zero)
                            }
                        }
                    }

                    PowerResource (PUBS, 0x03, 0x0000)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (H8DR)
                            {
                                Store (HUBS, Local0)
                            }
                            Else
                            {
                                And (RBEC (0x3B), 0x10, Local0)
                            }

                            If (Local0)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_ON, 0, NotSerialized)  // _ON_: Power On
                        {
                            If (H8DR)
                            {
                                Store (One, HUBS) /* \_SB_.PCI0.LPC_.EC__.HUBS */
                            }
                            Else
                            {
                                MBEC (0x3B, 0xFF, 0x10)
                            }
                        }

                        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                        {
                            If (H8DR)
                            {
                                Store (Zero, HUBS) /* \_SB_.PCI0.LPC_.EC__.HUBS */
                            }
                            Else
                            {
                                MBEC (0x3B, 0xEF, Zero)
                            }
                        }
                    }

                    Method (CHKS, 0, NotSerialized)
                    {
                        Store (0x03E8, Local0)
                        While (HMPR)
                        {
                            Sleep (One)
                            Decrement (Local0)
                            If (LNot (Local0))
                            {
                                Return (0x8080)
                            }
                        }

                        If (HMDN)
                        {
                            Return (Zero)
                        }

                        Return (0x8081)
                    }

                    Method (LPMD, 0, NotSerialized)
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                        Store (Zero, Local2)
                        If (H8DR)
                        {
                            If (HPAC)
                            {
                                If (LAnd (HPLO, PCWF))
                                {
                                    Store (LPST, Local0)
                                }
                                Else
                                {
                                    If (LLess (HWAT, 0x5A))
                                    {
                                        If (HB0A)
                                        {
                                            If (LOr (And (HB0S, 0x10), LLess (And (HB0S, 0x0F), 0x02)))
                                            {
                                                Store (One, Local1)
                                            }
                                        }
                                        Else
                                        {
                                            Store (One, Local1)
                                        }

                                        If (HB1A)
                                        {
                                            If (LOr (And (HB1S, 0x10), LLess (And (HB1S, 0x0F), 0x02)))
                                            {
                                                Store (One, Local2)
                                            }
                                        }
                                        Else
                                        {
                                            Store (One, Local2)
                                        }

                                        If (LAnd (Local1, Local2))
                                        {
                                            Store (LPST, Local0)
                                        }
                                    }
                                }
                            }
                        }
                        Else
                        {
                            If (And (RBEC (0x46), 0x10))
                            {
                                If (And (RBEC (0x34), 0x80))
                                {
                                    Store (LPST, Local0)
                                }
                                Else
                                {
                                    If (LLess (RBEC (0xC9), 0x5A))
                                    {
                                        Store (RBEC (0x38), Local3)
                                        If (And (Local3, 0x80))
                                        {
                                            If (LOr (And (Local3, 0x10), LLess (And (Local3, 0x0F), 0x02)))
                                            {
                                                Store (One, Local1)
                                            }
                                        }
                                        Else
                                        {
                                            Store (One, Local2)
                                        }

                                        Store (RBEC (0x39), Local3)
                                        If (And (Local3, 0x80))
                                        {
                                            If (LOr (And (Local3, 0x10), LLess (And (Local3, 0x0F), 0x02)))
                                            {
                                                Store (One, Local1)
                                            }
                                        }
                                        Else
                                        {
                                            Store (One, Local2)
                                        }

                                        If (LAnd (Local1, Local2))
                                        {
                                            Store (LPST, Local0)
                                        }
                                    }
                                }
                            }
                        }

                        Return (Local0)
                    }

                    Method (CLPM, 0, NotSerialized)
                    {
                        If (And (PPMF, One))
                        {
                            If (OSPX)
                            {
                                PNTF (0x80)
                            }
                            Else
                            {
                                Store (LPMD (), Local0)
                                If (Local0)
                                {
                                    STEP (0x04)
                                }
                                Else
                                {
                                    STEP (0x05)
                                }
                            }
                        }
                    }

                    Mutex (MCPU, 0x00)
                    Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (One))
                        {
                            ^HKEY.MHKQ (0x1001)
                        }
                    }

                    Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x02))
                        {
                            ^HKEY.MHKQ (0x1002)
                        }
                        Else
                        {
                            Noop
                        }
                    }

                    Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        ^HKEY.MHKQ (0x1003)
                    }

                    Method (_Q13, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.DHKC)
                        {
                            ^HKEY.MHKQ (0x1004)
                        }
                        Else
                        {
                            Notify (SLPB, 0x80) // Status Change
                        }
                    }

                    Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x10))
                        {
                            ^HKEY.MHKQ (0x1005)
                        }
                    }

                    Method (_Q65, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x20))
                        {
                            ^HKEY.MHKQ (0x1006)
                        }
                    }

                    Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x40))
                        {
                            ^HKEY.MHKQ (0x1007)
                        }
                        Else
                        {
                            If (LEqual (VHYB (0x03, Zero), 0x03))
                            {
                                Notify (IGPU, 0x80) // Status Change
                            }

                            If (VIGD)
                            {
                                ^^^IGPU.VSWT ()
                            }
                            Else
                            {
                                ^^^PEG.VID.VSWT ()
                            }
                        }
                    }

                    Method (_Q17, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x80))
                        {
                            ^HKEY.MHKQ (0x1008)
                        }
                        Else
                        {
                            If (LNot (WNTF))
                            {
                                VEXP ()
                            }
                        }
                    }

                    Method (_Q18, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x0100))
                        {
                            ^HKEY.MHKQ (0x1009)
                        }

                        Noop
                    }

                    Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x0200))
                        {
                            ^HKEY.MHKQ (0x100A)
                        }
                    }

                    Method (_Q1A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x0400))
                        {
                            ^HKEY.MHKQ (0x100B)
                        }
                    }

                    Method (_Q1B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        ^HKEY.MHKQ (0x100C)
                    }

                    Method (_Q62, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x1000))
                        {
                            ^HKEY.MHKQ (0x100D)
                        }
                    }

                    Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x2000))
                        {
                            ^HKEY.MHKQ (0x100E)
                        }
                    }

                    Method (_Q61, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x4000))
                        {
                            ^HKEY.MHKQ (0x100F)
                        }
                    }

                    Method (_Q1F, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x00020000))
                        {
                            ^HKEY.MHKQ (0x1012)
                        }

                        UCMS (0x0E)
                    }

                    Method (_Q67, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x00040000))
                        {
                            ^HKEY.MHKQ (0x1013)
                        }
                    }

                    Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x01000000))
                        {
                            ^HKEY.MHKQ (0x1019)
                        }
                    }

                    Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (^HKEY.MHKK (0x02000000))
                        {
                            ^HKEY.MHKQ (0x101A)
                        }
                    }

                    Method (_Q26, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (VIGD)
                        {
                            If (WVIS)
                            {
                                VBTD ()
                            }

                            BRNS ()
                        }
                        Else
                        {
                            UCMS (0x12)
                        }

                        If (^^^PEG.VID.ISOP ())
                        {
                            Notify (^^^PEG.VID, 0xDF) // Hardware-Specific
                        }

                        Sleep (0x01F4)
                        Notify (ADP1, 0x80) // Status Change
                        Notify (\_TZ.THM0, 0x80) // Thermal Status Change
                        If (WXPF)
                        {
                            Acquire (MCPU, 0xFFFF)
                        }

                        Store (One, PWRS) /* \PWRS */
                        If (And (PPMF, One))
                        {
                            If (OSPX)
                            {
                                PNTF (0x80)
                            }
                        }

                        If (WXPF)
                        {
                            Sleep (0x64)
                        }

                        If (OSC4)
                        {
                            PNTF (0x81)
                        }

                        If (WXPF)
                        {
                            Release (MCPU)
                        }

                        ^HKEY.MHKQ (0x6040)
                        ATMC ()
                    }

                    Method (_Q27, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (VIGD)
                        {
                            If (WVIS)
                            {
                                VBTD ()
                            }

                            BRNS ()
                        }
                        Else
                        {
                            UCMS (0x12)
                        }

                        If (^^^PEG.VID.ISOP ())
                        {
                            Notify (^^^PEG.VID, 0xDF) // Hardware-Specific
                        }

                        Sleep (0x01F4)
                        Notify (ADP1, 0x80) // Status Change
                        Notify (\_TZ.THM0, 0x80) // Thermal Status Change
                        If (WXPF)
                        {
                            Acquire (MCPU, 0xFFFF)
                        }

                        Store (Zero, PWRS) /* \PWRS */
                        If (And (PPMF, One))
                        {
                            If (OSPX)
                            {
                                PNTF (0x80)
                            }
                        }

                        If (WXPF)
                        {
                            Sleep (0x64)
                        }

                        If (OSC4)
                        {
                            PNTF (0x81)
                        }

                        If (WXPF)
                        {
                            Release (MCPU)
                        }

                        ^HKEY.MHKQ (0x6040)
                        ATMC ()
                    }

                    Method (_Q2A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        VCMS (One, ^^^^LID._LID ())
                        If (LEqual (ILNF, Zero))
                        {
                            ^HKEY.MHKQ (0x5002)
                            If (LEqual (PLUX, Zero))
                            {
                                If (VIGD)
                                {
                                    ^^^IGPU.GLIS (One)
                                    ^^^IGPU.VLOC (One)
                                }
                                Else
                                {
                                    ^^^PEG.VID.VLOC (One)
                                }

                                Notify (LID, 0x80) // Status Change
                            }
                        }
                    }

                    Method (_Q2B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        UCMS (0x0D)
                        VCMS (One, ^^^^LID._LID ())
                        If (LEqual (ILNF, Zero))
                        {
                            ^HKEY.MHKQ (0x5001)
                            If (LEqual (PLUX, Zero))
                            {
                                If (VIGD)
                                {
                                    ^^^IGPU.GLIS (Zero)
                                }
                                Else
                                {
                                    ^^^PEG.VID.VLOC (Zero)
                                }

                                Notify (LID, 0x80) // Status Change
                            }
                        }
                    }

                    Method (_Q3D, 0, NotSerialized)  // _Qxx: EC Query
                    {
                    }

                    Method (_Q48, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (One, PCWF) /* \PCWF */
                        If (And (PPMF, One))
                        {
                            If (OSPX)
                            {
                                PNTF (0x80)
                            }
                            Else
                            {
                                STEP (0x04)
                            }

                            Store (One, CALM) /* \_SB_.PCI0.LPC_.EC__.CALM */
                        }
                    }

                    Method (_Q49, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (And (PPMF, One))
                        {
                            If (OSPX)
                            {
                                PNTF (0x80)
                            }
                            Else
                            {
                                STEP (0x05)
                            }
                        }
                    }

                    Method (_Q7F, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Fatal (0x01, 0x80010000, 0x029E)
                    }

                    Method (_Q4E, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        ^HKEY.MHKQ (0x6011)
                    }

                    Method (_Q4F, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        ^HKEY.MHKQ (0x6012)
                    }

                    Method (_Q46, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        ^HKEY.MHKQ (0x6012)
                    }

                    Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        CLPM ()
                        If (HB0A)
                        {
                            Notify (BAT0, 0x80) // Status Change
                        }

                        If (HB1A)
                        {
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q4A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        CLPM ()
                        Notify (BAT0, 0x81) // Information Change
                    }

                    Method (_Q4B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Notify (BAT0, 0x80) // Status Change
                    }

                    Method (_Q4C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        CLPM ()
                        If (WNTF)
                        {
                            If (HB1A)
                            {
                                Store (One, ^BAT1.XB1S) /* \_SB_.PCI0.LPC_.EC__.BAT1.XB1S */
                                Notify (BAT1, One) // Device Check
                            }
                            Else
                            {
                                Notify (BAT1, 0x03) // Eject Request
                            }
                        }
                        Else
                        {
                            Notify (BAT1, 0x81) // Information Change
                        }
                    }

                    Method (_Q4D, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (And (^BAT1.B1ST, ^BAT1.XB1S))
                        {
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q24, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        CLPM ()
                        Notify (BAT0, 0x80) // Status Change
                    }

                    Method (_Q25, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        If (And (^BAT1.B1ST, ^BAT1.XB1S))
                        {
                            CLPM ()
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (BATW, 1, NotSerialized)
                    {
                        Store (^BAT1.XB1S, Local0)
                        If (H8DR)
                        {
                            Store (HB1A, Local1)
                        }
                        Else
                        {
                            If (And (RBEC (0x39), 0x80))
                            {
                                Store (One, Local1)
                            }
                            Else
                            {
                                Store (Zero, Local1)
                            }
                        }

                        If (XOr (Local0, Local1))
                        {
                            Store (Local1, ^BAT1.XB1S) /* \_SB_.PCI0.LPC_.EC__.BAT1.XB1S */
                            Notify (BAT1, One) // Device Check
                        }
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        BRC0,   8, 
                        BRC1,   8, 
                        BFC0,   8, 
                        BFC1,   8, 
                        SBAE,   16, 
                        SBRS,   16, 
                        BAC0,   8, 
                        BAC1,   8, 
                        BVO0,   8, 
                        BVO1,   8, 
                        SBAF,   16, 
                        SBBS,   16
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        BBM0,   8, 
                        BBM1,   8, 
                        SBMD,   16, 
                        SBCC,   16
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        BDC0,   8, 
                        BDC1,   8, 
                        BDV0,   8, 
                        BDV1,   8, 
                        SBOM,   16, 
                        SBSI,   16, 
                        SBDT,   16, 
                        BSN0,   8, 
                        BSN1,   8
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        SBC1,   8, 
                        SBC2,   8, 
                        SBC3,   8, 
                        SBC4,   8
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        BMNX,   128
                    }

                    Field (ECOR, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xA0), 
                        BDNX,   128
                    }

                    Mutex (BATM, 0x00)
                    Method (GBIF, 3, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (Arg2)
                        {
                            Or (Arg0, One, HIID) /* \_SB_.PCI0.LPC_.EC__.HIID */
                            Store (B1B2 (BBM0, BBM1), Local7)
                            ShiftRight (Local7, 0x0F, Local7)
                            XOr (Local7, One, Index (Arg1, Zero))
                            Store (Arg0, HIID) /* \_SB_.PCI0.LPC_.EC__.HIID */
                            If (Local7)
                            {
                                Multiply (B1B2 (BFC0, BFC1), 0x0A, Local1)
                            }
                            Else
                            {
                                Store (B1B2 (BFC0, BFC1), Local1)
                            }

                            Store (Local1, Index (Arg1, 0x02))
                            Or (Arg0, 0x02, HIID) /* \_SB_.PCI0.LPC_.EC__.HIID */
                            If (Local7)
                            {
                                Multiply (B1B2 (BDC0, BDC1), 0x0A, Local0)
                            }
                            Else
                            {
                                Store (B1B2 (BDC0, BDC1), Local0)
                            }

                            Store (Local0, Index (Arg1, One))
                            Divide (Local1, 0x14, Local2, Index (Arg1, 0x05))
                            If (Local7)
                            {
                                Store (0xC8, Index (Arg1, 0x06))
                            }
                            Else
                            {
                                If (B1B2 (BDV0, BDV1))
                                {
                                    Divide (0x00030D40, B1B2 (BDV0, BDV1), Local2, Index (Arg1, 0x06))
                                }
                                Else
                                {
                                    Store (Zero, Index (Arg1, 0x06))
                                }
                            }

                            Store (B1B2 (BDV0, BDV1), Index (Arg1, 0x04))
                            Store (B1B2 (BSN0, BSN1), Local0)
                            Name (SERN, Buffer (0x06)
                            {
                                "     "
                            })
                            Store (0x04, Local2)
                            Store ("xxxxx", Index (Arg1, 0x0A))
                            Or (Arg0, 0x06, HIID) /* \_SB_.PCI0.LPC_.EC__.HIID */
                            Store ("Battery", Index (Arg1, 0x09))
                            Or (Arg0, 0x04, HIID) /* \_SB_.PCI0.LPC_.EC__.HIID */
                            Name (BTYP, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00                     /* ..... */
                            })
                            Store (B1B4 (SBC1, SBC2, SBC3, SBC4), BTYP) /* \_SB_.PCI0.LPC_.EC__.GBIF.BTYP */
                            Store (BTYP, Index (Arg1, 0x0B))
                            Or (Arg0, 0x05, HIID) /* \_SB_.PCI0.LPC_.EC__.HIID */
                            Store ("LENOVO", Index (Arg1, 0x0C))
                        }
                        Else
                        {
                            Store (Ones, Index (Arg1, One))
                            Store (Zero, Index (Arg1, 0x05))
                            Store (Zero, Index (Arg1, 0x06))
                            Store (Ones, Index (Arg1, 0x02))
                        }

                        Release (BATM)
                        Return (Arg1)
                    }

                    Method (GBST, 4, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (And (Arg1, 0x20))
                        {
                            Store (0x02, Local0)
                        }
                        Else
                        {
                            If (And (Arg1, 0x40))
                            {
                                Store (One, Local0)
                            }
                            Else
                            {
                                Store (Zero, Local0)
                            }
                        }

                        If (And (Arg1, 0x0F)) {}
                        Else
                        {
                            Or (Local0, 0x04, Local0)
                        }

                        If (LEqual (And (Arg1, 0x0F), 0x0F))
                        {
                            Store (0x04, Local0)
                            Store (Zero, Local1)
                            Store (Zero, Local2)
                            Store (Zero, Local3)
                        }
                        Else
                        {
                            Store (Arg0, HIID) /* \_SB_.PCI0.LPC_.EC__.HIID */
                            Store (B1B2 (BVO0, BVO1), Local3)
                            If (Arg2)
                            {
                                Multiply (B1B2 (BRC0, BRC1), 0x0A, Local2)
                            }
                            Else
                            {
                                Store (B1B2 (BRC0, BRC1), Local2)
                            }

                            Store (B1B2 (BAC0, BAC1), Local1)
                            If (LGreaterEqual (Local1, 0x8000))
                            {
                                If (And (Local0, One))
                                {
                                    Subtract (0x00010000, Local1, Local1)
                                }
                                Else
                                {
                                    Store (Zero, Local1)
                                }
                            }
                            Else
                            {
                                If (LNot (And (Local0, 0x02)))
                                {
                                    Store (Zero, Local1)
                                }
                            }

                            If (Arg2)
                            {
                                Multiply (Local3, Local1, Local1)
                                Divide (Local1, 0x03E8, Local7, Local1)
                            }
                        }

                        Store (Local0, Index (Arg3, Zero))
                        Store (Local1, Index (Arg3, One))
                        Store (Local2, Index (Arg3, 0x02))
                        Store (Local3, Index (Arg3, 0x03))
                        Release (BATM)
                        Return (Arg3)
                    }

                    Device (BAT0)
                    {
                        Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
                        Name (_UID, Zero)  // _UID: Unique ID
                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            _SB
                        })
                        Name (B0ST, Zero)
                        Name (BT0I, Package (0x0D)
                        {
                            Zero, 
                            Ones, 
                            Ones, 
                            One, 
                            0x2A30, 
                            Zero, 
                            Zero, 
                            One, 
                            One, 
                            "", 
                            "", 
                            "", 
                            ""
                        })
                        Name (BT0P, Package (0x04) {})
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (H8DR)
                            {
                                Store (HB0A, B0ST) /* \_SB_.PCI0.LPC_.EC__.BAT0.B0ST */
                            }
                            Else
                            {
                                If (And (RBEC (0x38), 0x80))
                                {
                                    Store (One, B0ST) /* \_SB_.PCI0.LPC_.EC__.BAT0.B0ST */
                                }
                                Else
                                {
                                    Store (Zero, B0ST) /* \_SB_.PCI0.LPC_.EC__.BAT0.B0ST */
                                }
                            }

                            If (B0ST)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
                        {
                            Store (Zero, Local7)
                            Store (0x0A, Local6)
                            While (LAnd (LNot (Local7), Local6))
                            {
                                If (HB0A)
                                {
                                    If (LEqual (And (HB0S, 0x0F), 0x0F))
                                    {
                                        Sleep (0x03E8)
                                        Decrement (Local6)
                                    }
                                    Else
                                    {
                                        Store (One, Local7)
                                    }
                                }
                                Else
                                {
                                    Store (Zero, Local6)
                                }
                            }

                            Return (GBIF (Zero, BT0I, Local7))
                        }

                        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                        {
                            XOr (DerefOf (Index (BT0I, Zero)), One, Local0)
                            Return (GBST (Zero, HB0S, Local0, BT0P))
                        }

                        Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
                        {
                            And (HAM4, 0xEF, HAM4) /* \_SB_.PCI0.LPC_.EC__.HAM4 */
                            If (Arg0)
                            {
                                Store (Arg0, Local1)
                                If (LNot (DerefOf (Index (BT0I, Zero))))
                                {
                                    Divide (Local1, 0x0A, Local0, Local1)
                                }

                                And (Local1, 0xFF, HT0L) /* \_SB_.PCI0.LPC_.EC__.HT0L */
                                And (ShiftRight (Local1, 0x08), 0xFF, HT0H) /* \_SB_.PCI0.LPC_.EC__.HT0H */
                                Or (HAM4, 0x10, HAM4) /* \_SB_.PCI0.LPC_.EC__.HAM4 */
                            }
                        }
                    }

                    Device (BAT1)
                    {
                        Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
                        Name (_UID, One)  // _UID: Unique ID
                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            _SB
                        })
                        Name (B1ST, Zero)
                        Name (XB1S, One)
                        Name (BT1I, Package (0x0D)
                        {
                            Zero, 
                            Ones, 
                            Ones, 
                            One, 
                            0x2A30, 
                            Zero, 
                            Zero, 
                            One, 
                            One, 
                            "", 
                            "", 
                            "", 
                            ""
                        })
                        Name (BT1P, Package (0x04) {})
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (Zero)
                        }

                        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
                        {
                            Store (Zero, Local7)
                            Store (0x0A, Local6)
                            While (LAnd (LNot (Local7), Local6))
                            {
                                If (HB1A)
                                {
                                    If (LEqual (And (HB1S, 0x0F), 0x0F))
                                    {
                                        Sleep (0x03E8)
                                        Decrement (Local6)
                                    }
                                    Else
                                    {
                                        Store (One, Local7)
                                    }
                                }
                                Else
                                {
                                    Store (Zero, Local6)
                                }
                            }

                            Return (GBIF (0x10, BT1I, Local7))
                        }

                        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                        {
                            XOr (DerefOf (Index (BT1I, Zero)), One, Local0)
                            Return (GBST (0x10, HB1S, Local0, BT1P))
                        }

                        Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
                        {
                            And (HAM4, 0xDF, HAM4) /* \_SB_.PCI0.LPC_.EC__.HAM4 */
                            If (Arg0)
                            {
                                Store (Arg0, Local1)
                                If (LNot (DerefOf (Index (BT1I, Zero))))
                                {
                                    Divide (Local1, 0x0A, Local0, Local1)
                                }

                                And (Local1, 0xFF, HT1L) /* \_SB_.PCI0.LPC_.EC__.HT1L */
                                And (ShiftRight (Local1, 0x08), 0xFF, HT1H) /* \_SB_.PCI0.LPC_.EC__.HT1H */
                                Or (HAM4, 0x20, HAM4) /* \_SB_.PCI0.LPC_.EC__.HAM4 */
                            }
                        }

                        Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                        {
                            If (Arg0)
                            {
                                Store (Zero, B1ST) /* \_SB_.PCI0.LPC_.EC__.BAT1.B1ST */
                                Store (Zero, XB1S) /* \_SB_.PCI0.LPC_.EC__.BAT1.XB1S */
                            }
                        }
                    }

                    Device (ADP1)
                    {
                        Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
                        Name (_UID, Zero)  // _UID: Unique ID
                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            _SB
                        })
                        Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
                        {
                            If (H8DR)
                            {
                                If (HPAC)
                                {
                                    If (DOCD)
                                    {
                                        If (EPWG)
                                        {
                                            Return (One)
                                        }
                                        Else
                                        {
                                            Return (Zero)
                                        }
                                    }
                                    Else
                                    {
                                        Return (One)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                            Else
                            {
                                If (And (RBEC (0x46), 0x10))
                                {
                                    Return (One)
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                        {
                            0x18, 
                            0x03
                        })
                    }

                    Device (HKEY)
                    {
                        Name (_HID, EisaId ("LEN0068"))  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (MHKV, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }

                        Name (DHKC, Zero)
                        Name (DHKB, One)
                        Mutex (XDHK, 0x00)
                        Name (DHKH, Zero)
                        Name (DHKW, Zero)
                        Name (DHKS, Zero)
                        Name (DHKD, Zero)
                        Name (DHKN, 0x080C)
                        Name (DHKT, Zero)
                        Name (DHWW, Zero)
                        Method (MHKA, 0, NotSerialized)
                        {
                            Return (0x07FFFFFF)
                        }

                        Method (MHKN, 0, NotSerialized)
                        {
                            Return (DHKN) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKN */
                        }

                        Method (MHKK, 1, NotSerialized)
                        {
                            If (DHKC)
                            {
                                Return (And (DHKN, Arg0))
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (MHKM, 2, NotSerialized)
                        {
                            Acquire (XDHK, 0xFFFF)
                            If (LGreater (Arg0, 0x20))
                            {
                                Noop
                            }
                            Else
                            {
                                ShiftLeft (One, Decrement (Arg0), Local0)
                                If (And (Local0, 0x07FFFFFF))
                                {
                                    If (Arg1)
                                    {
                                        Or (Local0, DHKN, DHKN) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKN */
                                    }
                                    Else
                                    {
                                        And (DHKN, XOr (Local0, Ones), DHKN) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKN */
                                    }
                                }
                                Else
                                {
                                    Noop
                                }
                            }

                            Release (XDHK)
                        }

                        Method (MHKS, 0, NotSerialized)
                        {
                            Notify (SLPB, 0x80) // Status Change
                        }

                        Method (MHKC, 1, NotSerialized)
                        {
                            Store (Arg0, DHKC) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKC */
                        }

                        Method (MHKP, 0, NotSerialized)
                        {
                            Acquire (XDHK, 0xFFFF)
                            If (DHWW)
                            {
                                Store (DHWW, Local1)
                                Store (Zero, DHWW) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHWW */
                            }
                            Else
                            {
                                If (DHKW)
                                {
                                    Store (DHKW, Local1)
                                    Store (Zero, DHKW) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKW */
                                }
                                Else
                                {
                                    If (DHKD)
                                    {
                                        Store (DHKD, Local1)
                                        Store (Zero, DHKD) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKD */
                                    }
                                    Else
                                    {
                                        If (DHKS)
                                        {
                                            Store (DHKS, Local1)
                                            Store (Zero, DHKS) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKS */
                                        }
                                        Else
                                        {
                                            If (DHKT)
                                            {
                                                Store (DHKT, Local1)
                                                Store (Zero, DHKT) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKT */
                                            }
                                            Else
                                            {
                                                Store (DHKH, Local1)
                                                Store (Zero, DHKH) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKH */
                                            }
                                        }
                                    }
                                }
                            }

                            Release (XDHK)
                            Return (Local1)
                        }

                        Method (MHKE, 1, NotSerialized)
                        {
                            Store (Arg0, DHKB) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKB */
                            Acquire (XDHK, 0xFFFF)
                            Store (Zero, DHKH) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKH */
                            Store (Zero, DHKW) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKW */
                            Store (Zero, DHKS) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKS */
                            Store (Zero, DHKD) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKD */
                            Store (Zero, DHKT) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKT */
                            Store (Zero, DHWW) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHWW */
                            Release (XDHK)
                        }

                        Method (MHKQ, 1, NotSerialized)
                        {
                            If (DHKB)
                            {
                                If (DHKC)
                                {
                                    Acquire (XDHK, 0xFFFF)
                                    If (LLess (Arg0, 0x1000)) {}
                                    Else
                                    {
                                        If (LLess (Arg0, 0x2000))
                                        {
                                            Store (Arg0, DHKH) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKH */
                                        }
                                        Else
                                        {
                                            If (LLess (Arg0, 0x3000))
                                            {
                                                Store (Arg0, DHKW) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKW */
                                            }
                                            Else
                                            {
                                                If (LLess (Arg0, 0x4000))
                                                {
                                                    Store (Arg0, DHKS) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKS */
                                                }
                                                Else
                                                {
                                                    If (LLess (Arg0, 0x5000))
                                                    {
                                                        Store (Arg0, DHKD) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKD */
                                                    }
                                                    Else
                                                    {
                                                        If (LLess (Arg0, 0x6000))
                                                        {
                                                            Store (Arg0, DHKH) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKH */
                                                        }
                                                        Else
                                                        {
                                                            If (LLess (Arg0, 0x7000))
                                                            {
                                                                Store (Arg0, DHKT) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHKT */
                                                            }
                                                            Else
                                                            {
                                                                If (LLess (Arg0, 0x8000))
                                                                {
                                                                    Store (Arg0, DHWW) /* \_SB_.PCI0.LPC_.EC__.HKEY.DHWW */
                                                                }
                                                                Else
                                                                {
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    Release (XDHK)
                                    Notify (HKEY, 0x80) // Status Change
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x1004))
                                    {
                                        Notify (SLPB, 0x80) // Status Change
                                    }
                                }
                            }
                        }

                        Method (MHKB, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                BEEP (0x11)
                                Store (Zero, LIDB) /* \LIDB */
                            }
                            Else
                            {
                                If (LEqual (Arg0, One))
                                {
                                    BEEP (0x10)
                                    Store (One, LIDB) /* \LIDB */
                                }
                                Else
                                {
                                }
                            }
                        }

                        Method (MHKD, 0, NotSerialized)
                        {
                            If (LEqual (PLUX, Zero))
                            {
                                If (VIGD)
                                {
                                    ^^^^IGPU.VLOC (Zero)
                                }
                                Else
                                {
                                    ^^^^PEG.VID.VLOC (Zero)
                                }
                            }
                        }

                        Method (MHQC, 1, NotSerialized)
                        {
                            If (WNTF)
                            {
                                If (LEqual (Arg0, Zero))
                                {
                                    Return (CWAC) /* \CWAC */
                                }
                                Else
                                {
                                    If (LEqual (Arg0, One))
                                    {
                                        Return (CWAP) /* \CWAP */
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x02))
                                        {
                                            Return (CWAT) /* \CWAT */
                                        }
                                        Else
                                        {
                                            Noop
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Noop
                            }

                            Return (Zero)
                        }

                        Method (MHGC, 0, NotSerialized)
                        {
                            If (WNTF)
                            {
                                Acquire (XDHK, 0xFFFF)
                                If (CKC4 (Zero))
                                {
                                    Store (0x03, Local0)
                                }
                                Else
                                {
                                    Store (0x04, Local0)
                                }

                                Release (XDHK)
                                Return (Local0)
                            }
                            Else
                            {
                                Noop
                            }

                            Return (Zero)
                        }

                        Method (MHSC, 1, NotSerialized)
                        {
                            If (LAnd (CWAC, WNTF))
                            {
                                Acquire (XDHK, 0xFFFF)
                                If (OSC4)
                                {
                                    If (LEqual (Arg0, 0x03))
                                    {
                                        If (LNot (CWAS))
                                        {
                                            PNTF (0x81)
                                            Store (One, CWAS) /* \CWAS */
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x04))
                                        {
                                            If (CWAS)
                                            {
                                                PNTF (0x81)
                                                Store (Zero, CWAS) /* \CWAS */
                                            }
                                        }
                                        Else
                                        {
                                            Noop
                                        }
                                    }
                                }

                                Release (XDHK)
                            }
                            Else
                            {
                                Noop
                            }
                        }

                        Method (CKC4, 1, NotSerialized)
                        {
                            Store (Zero, Local0)
                            If (C4WR)
                            {
                                If (LNot (C4AC))
                                {
                                    Or (Local0, One, Local0)
                                }
                            }

                            If (C4NA)
                            {
                                Or (Local0, 0x02, Local0)
                            }

                            If (LAnd (CWAC, CWAS))
                            {
                                Or (Local0, 0x04, Local0)
                            }

                            If (LAnd (CWUE, CWUS))
                            {
                                Or (Local0, 0x08, Local0)
                            }

                            And (Local0, Not (Arg0), Local0)
                            Return (Local0)
                        }

                        Method (MHQE, 0, NotSerialized)
                        {
                            Return (C4WR) /* \C4WR */
                        }

                        Method (MHGE, 0, NotSerialized)
                        {
                            If (LAnd (C4WR, C4AC))
                            {
                                Return (0x04)
                            }

                            Return (0x03)
                        }

                        Method (MHSE, 1, NotSerialized)
                        {
                            If (C4WR)
                            {
                                Store (C4AC, Local0)
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (Zero, C4AC) /* \C4AC */
                                    If (XOr (Local0, C4AC))
                                    {
                                        If (OSC4)
                                        {
                                            PNTF (0x81)
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x04))
                                    {
                                        Store (One, C4AC) /* \C4AC */
                                        If (XOr (Local0, C4AC))
                                        {
                                            If (OSC4)
                                            {
                                                PNTF (0x81)
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Method (UAWO, 1, NotSerialized)
                        {
                            Return (UAWS (Arg0))
                        }

                        Method (KLCG, 1, NotSerialized)
                        {
                            Store (PKLI, Local0)
                            ShiftLeft (Local0, 0x08, Local0)
                            Store (KBLT, Local1)
                            Or (Local0, Local1, Local0)
                            Return (Local0)
                        }

                        Method (KLCS, 1, NotSerialized)
                        {
                            If (MHKK (0x00020000))
                            {
                                MHKQ (0x1012)
                            }

                            And (Arg0, 0xFF, Local0)
                            If (LEqual (Local0, Zero))
                            {
                                UCMS (0x0D)
                            }
                            Else
                            {
                                UCMS (0x0C)
                            }

                            Return (Zero)
                        }

                        Method (DSSG, 1, NotSerialized)
                        {
                            Or (0x0400, PDCI, Local0)
                            Return (Local0)
                        }

                        Method (DSSS, 1, NotSerialized)
                        {
                            Or (PDCI, Arg0, PDCI) /* \PDCI */
                        }

                        Method (SBSG, 1, NotSerialized)
                        {
                            Return (SYBC (Zero, Zero))
                        }

                        Method (SBSS, 1, NotSerialized)
                        {
                            Return (SYBC (One, Arg0))
                        }

                        Method (PBLG, 1, NotSerialized)
                        {
                            Store (BRLV, Local0)
                            Or (Local0, 0x0F00, Local1)
                            Return (Local1)
                        }

                        Method (PBLS, 1, NotSerialized)
                        {
                            Store (Arg0, BRLV) /* \BRLV */
                            If (VIGD)
                            {
                                BRNS ()
                            }
                            Else
                            {
                                VBRC (BRLV)
                            }

                            If (LNot (NBCF))
                            {
                                MHKQ (0x6050)
                            }

                            Return (Zero)
                        }

                        Method (PMSG, 1, NotSerialized)
                        {
                            Return (PRSM (Zero, Zero))
                        }

                        Method (PMSS, 1, NotSerialized)
                        {
                            PRSM (One, Arg0)
                            Return (Zero)
                        }
                    }

                    Scope (HKEY)
                    {
                        Name (INDV, Zero)
                        Method (MHQI, 0, NotSerialized)
                        {
                            If (And (IPMS, One))
                            {
                                Or (INDV, One, INDV) /* \_SB_.PCI0.LPC_.EC__.HKEY.INDV */
                            }

                            If (And (IPMS, 0x02))
                            {
                                Or (INDV, 0x02, INDV) /* \_SB_.PCI0.LPC_.EC__.HKEY.INDV */
                            }

                            If (And (IPMS, 0x04))
                            {
                                Or (INDV, 0x0100, INDV) /* \_SB_.PCI0.LPC_.EC__.HKEY.INDV */
                            }

                            If (And (IPMS, 0x08))
                            {
                                Or (INDV, 0x0200, INDV) /* \_SB_.PCI0.LPC_.EC__.HKEY.INDV */
                            }

                            If (And (IPMS, 0x10))
                            {
                                Or (INDV, 0x04, INDV) /* \_SB_.PCI0.LPC_.EC__.HKEY.INDV */
                            }

                            Return (INDV) /* \_SB_.PCI0.LPC_.EC__.HKEY.INDV */
                        }

                        Method (MHGI, 1, NotSerialized)
                        {
                            Name (RETB, Buffer (0x10) {})
                            CreateByteField (RETB, Zero, MHGS)
                            ShiftLeft (One, Arg0, Local0)
                            If (And (INDV, Local0))
                            {
                                If (LEqual (Arg0, Zero))
                                {
                                    CreateField (RETB, 0x08, 0x78, BRBU)
                                    Store (IPMB, BRBU) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.BRBU */
                                    Store (0x10, MHGS) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGS */
                                }
                                Else
                                {
                                    If (LEqual (Arg0, One))
                                    {
                                        CreateField (RETB, 0x08, 0x18, RRBU)
                                        Store (IPMR, RRBU) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.RRBU */
                                        Store (0x04, MHGS) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGS */
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x08))
                                        {
                                            CreateField (RETB, 0x10, 0x18, ODBU)
                                            CreateByteField (RETB, One, MHGZ)
                                            Store (IPMO, ODBU) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.ODBU */
                                            If (LEqual (BDEV, 0x03))
                                            {
                                                If (H8DR)
                                                {
                                                    Store (HPBU, Local1)
                                                }
                                                Else
                                                {
                                                    And (RBEC (0x47), One, Local1)
                                                }

                                                If (LNot (Local1))
                                                {
                                                    Or (0x04, MHGZ, MHGZ) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGZ */
                                                }

                                                If (LEqual (BSTS, Zero))
                                                {
                                                    Or (One, MHGZ, MHGZ) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGZ */
                                                    Or (0x02, MHGZ, MHGZ) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGZ */
                                                }
                                            }

                                            Store (0x05, MHGS) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGS */
                                        }
                                        Else
                                        {
                                            If (LEqual (Arg0, 0x09))
                                            {
                                                CreateField (RETB, 0x10, 0x08, AUBU)
                                                Store (IPMA, AUBU) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.AUBU */
                                                Store (One, Index (RETB, One))
                                                Store (0x03, MHGS) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGS */
                                            }
                                            Else
                                            {
                                                If (LEqual (Arg0, 0x02))
                                                {
                                                    Store (VDYN (Zero, Zero), Local1)
                                                    And (Local1, 0x0F, Index (RETB, 0x02))
                                                    ShiftRight (Local1, 0x04, Local1)
                                                    And (Local1, 0x0F, Index (RETB, One))
                                                    Store (0x03, MHGS) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.MHGS */
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Return (RETB) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHGI.RETB */
                        }

                        Method (MHSI, 2, NotSerialized)
                        {
                            ShiftLeft (One, Arg0, Local0)
                            If (And (INDV, Local0))
                            {
                                If (LEqual (Arg0, 0x08))
                                {
                                    If (Arg1)
                                    {
                                        If (H8DR)
                                        {
                                            Store (HPBU, Local1)
                                        }
                                        Else
                                        {
                                            And (RBEC (0x47), One, Local1)
                                        }

                                        If (LNot (Local1))
                                        {
                                            Store (BGID (Zero), BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                                            NBIN (Local1)
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x02))
                                    {
                                        VDYN (One, Arg1)
                                    }
                                }
                            }
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC)
                    {
                        Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            If (HDMC)
                            {
                                Noop
                            }
                            Else
                            {
                                If (^HKEY.MHKK (0x04000000))
                                {
                                    ^HKEY.MHKQ (0x101B)
                                }
                            }
                        }
                    }

                    Scope (HKEY)
                    {
                        Method (MMTG, 0, NotSerialized)
                        {
                            Store (0x0101, Local0)
                            If (HDMC)
                            {
                                Or (Local0, 0x00010000, Local0)
                            }

                            Return (Local0)
                        }

                        Method (MMTS, 1, NotSerialized)
                        {
                            If (HDMC)
                            {
                                Noop
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x02))
                                {
                                    LED (0x0E, 0x80)
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x03))
                                    {
                                        LED (0x0E, 0xC0)
                                    }
                                    Else
                                    {
                                        LED (0x0E, Zero)
                                    }
                                }
                            }
                        }
                    }

                    Scope (HKEY)
                    {
                        Method (PWMC, 0, NotSerialized)
                        {
                            Return (One)
                        }

                        Method (PWMG, 0, NotSerialized)
                        {
                            Store (PWMH, Local0)
                            ShiftLeft (Local0, 0x08, Local0)
                            Or (Local0, PWML, Local0)
                            Return (Local0)
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC)
                    {
                        Method (_Q45, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            If (DOCD)
                            {
                                Sleep (0x64)
                                If (EPWG)
                                {
                                    Noop
                                }
                                Else
                                {
                                    If (HPAC)
                                    {
                                        _Q27 ()
                                    }
                                }

                                ^HKEY.MHKQ (0x4010)
                            }
                            Else
                            {
                                Sleep (0x64)
                                If (HPAC)
                                {
                                    _Q26 ()
                                }

                                ^HKEY.MHKQ (0x4011)
                            }
                        }

                        Method (DKID, 0, NotSerialized)
                        {
                            Store (DOI0, Local0)
                            Store (DOI1, Local1)
                            Store (DOI2, Local2)
                            Or (Local0, ShiftLeft (Local1, One), Local0)
                            Or (Local0, ShiftLeft (Local2, 0x02), Local0)
                            Return (Local0)
                        }
                    }

                    Scope (HKEY)
                    {
                        Method (GDKS, 0, NotSerialized)
                        {
                            Store (Zero, Local0)
                            If (LEqual (DOCD, One))
                            {
                                Or (Local0, One, Local0)
                                Store (DKID (), Local1)
                                ShiftLeft (Local1, 0x08, Local1)
                                Or (Local0, Local1, Local0)
                            }

                            Return (Local0)
                        }
                    }

                    Scope (\_SB.PCI0.LPC.EC)
                    {
                        Method (_Q3F, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            ^HKEY.MHKQ (0x6000)
                        }
                    }

                    Scope (HKEY)
                    {
                        Method (NUMG, 0, NotSerialized)
                        {
                            Store (One, Local0)
                            If (SNLK)
                            {
                                And (Local0, 0xFFFFFFFD, Local0)
                            }
                            Else
                            {
                                Or (Local0, 0x02, Local0)
                            }

                            If (NULS)
                            {
                                Or (Local0, 0x0100, Local0)
                            }
                            Else
                            {
                                And (Local0, 0xFFFFFEFF, Local0)
                            }

                            Return (Local0)
                        }
                    }

                    Method (RE1B, 1, NotSerialized)
                    {
                        OperationRegion (ERAM, EmbeddedControl, Arg0, One)
                        Field (ERAM, ByteAcc, NoLock, Preserve)
                        {
                            BYTE,   8
                        }

                        Return (BYTE) /* \_SB_.PCI0.LPC_.EC__.RE1B.BYTE */
                    }

                    Method (RECB, 2, Serialized)
                    {
                        ShiftRight (Arg1, 0x03, Arg1)
                        Name (TEMP, Buffer (Arg1) {})
                        Add (Arg0, Arg1, Arg1)
                        Store (Zero, Local0)
                        While (LLess (Arg0, Arg1))
                        {
                            Store (RE1B (Arg0), Index (TEMP, Local0))
                            Increment (Arg0)
                            Increment (Local0)
                        }

                        Return (TEMP) /* \_SB_.PCI0.LPC_.EC__.RECB.TEMP */
                    }

                    Method (RBMN, 0, Serialized)
                    {
                        Return (RECB (0xA0, 0x80))
                    }

                    Method (RBDN, 0, Serialized)
                    {
                        Return (RECB (0xA0, 0x80))
                    }
                }
            }

            Device (PEG)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
                Name (LART, Package (0x02)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AART, Package (0x02)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (AART) /* \_SB_.PCI0.PEG_.AART */
                    }
                    Else
                    {
                        Return (LART) /* \_SB_.PCI0.PEG_.LART */
                    }
                }

                Mutex (MDGS, 0x00)
                Name (VDEE, One)
                Name (VDDA, Buffer (0x04) {})
                CreateBitField (VDDA, Zero, VUPC)
                CreateBitField (VDDA, One, VQDL)
                CreateBitField (VDDA, 0x02, VQDC)
                CreateBitField (VDDA, 0x03, VQD0)
                CreateBitField (VDDA, 0x04, VQD1)
                CreateBitField (VDDA, 0x05, VQD2)
                CreateBitField (VDDA, 0x06, VQD3)
                CreateBitField (VDDA, 0x07, VQD4)
                CreateBitField (VDDA, 0x08, VQD5)
                CreateBitField (VDDA, 0x09, VSDL)
                CreateBitField (VDDA, 0x0A, VSDC)
                CreateBitField (VDDA, 0x0B, VSD0)
                CreateBitField (VDDA, 0x0C, VSD1)
                CreateBitField (VDDA, 0x0D, VSD2)
                CreateBitField (VDDA, 0x0E, VSD3)
                CreateBitField (VDDA, 0x0F, VSD4)
                CreateBitField (VDDA, 0x10, VSD5)
                CreateBitField (VDDA, 0x11, MSWT)
                CreateBitField (VDDA, 0x12, VWST)
                Device (VID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (VPCG, PCI_Config, Zero, 0x0100)
                    Field (VPCG, DWordAcc, NoLock, Preserve)
                    {
                        Offset (0x2C), 
                        VSID,   32, 
                        Offset (0x70), 
                        VPWR,   8
                    }

                    Name (_S3D, 0x03)  // _S3D: S3 Device State
                    Name (DGOS, Zero)
                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        VUPS (0x02)
                        Store (VCDL, VQDL) /* \_SB_.PCI0.PEG_.VQDL */
                        Store (VCDC, VQDC) /* \_SB_.PCI0.PEG_.VQDC */
                        Store (VCDT, VQD0) /* \_SB_.PCI0.PEG_.VQD0 */
                        Store (VCDD, VQD1) /* \_SB_.PCI0.PEG_.VQD1 */
                        If (ISOP ())
                        {
                            VHYB (0x04, One)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        If (ISOP ())
                        {
                            If (DGOS)
                            {
                                VHYB (0x02, Zero)
                                Sleep (0x64)
                                VHYB (Zero, One)
                                Sleep (0x0A)
                                Store (One, ^^^LPC.PCRS) /* \_SB_.PCI0.LPC_.PCRS */
                                Store (One, ^^^LPC.PCRQ) /* \_SB_.PCI0.LPC_.PCRQ */
                                Sleep (0x64)
                                VHYB (0x02, One)
                                Sleep (One)
                                VHYB (0x08, One)
                                Store (0x0A, Local0)
                                Store (0x32, Local1)
                                While (Local1)
                                {
                                    Sleep (Local0)
                                    If (LCHK (One))
                                    {
                                        Break
                                    }

                                    Decrement (Local1)
                                }

                                Store (Zero, ^^^LPC.PCRQ) /* \_SB_.PCI0.LPC_.PCRQ */
                                VHYB (0x04, Zero)
                                SWTT (One)
                                Store (Zero, DGOS) /* \_SB_.PCI0.PEG_.VID_.DGOS */
                            }
                            Else
                            {
                                If (LNotEqual (VSID, 0x21D317AA))
                                {
                                    VHYB (0x04, Zero)
                                }
                            }

                            VHYB (0x09, HDAS)
                        }
                    }

                    Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
                    {
                        Noop
                    }

                    Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
                    {
                        Noop
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        If (ISOP ())
                        {
                            If (LEqual (OMPR, 0x03))
                            {
                                SWTT (Zero)
                                VHYB (0x08, Zero)
                                Store (0x0A, Local0)
                                Store (0x32, Local1)
                                While (Local1)
                                {
                                    Sleep (Local0)
                                    If (LCHK (Zero))
                                    {
                                        Break
                                    }

                                    Decrement (Local1)
                                }

                                VHYB (0x02, Zero)
                                Sleep (0x64)
                                VHYB (Zero, Zero)
                                Store (One, DGOS) /* \_SB_.PCI0.PEG_.VID_.DGOS */
                                Store (0x02, OMPR) /* \_SB_.PCI0.PEG_.VID_.OMPR */
                            }
                        }
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If (CMPB (Arg0, ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0")))
                        {
                            Return (NVOP (Arg0, Arg1, Arg2, Arg3))
                        }

                        Return (Package (0x02)
                        {
                            Zero, 
                            Zero
                        })
                    }

                    Name (IRC, Zero)
                    OperationRegion (ATRP, SystemMemory, ATRB, 0x00010000)
                    Field (ATRP, AnyAcc, Lock, Preserve)
                    {
                        IDX0,   262144, 
                        IDX1,   262144
                    }

                    Method (_ROM, 2, Serialized)  // _ROM: Read-Only Memory
                    {
                        If (LGreaterEqual (Arg0, 0x8000))
                        {
                            Return (GETB (Subtract (Arg0, 0x8000), Arg1, IDX1))
                        }

                        If (LGreater (Add (Arg0, Arg1), 0x8000))
                        {
                            Subtract (0x8000, Arg0, Local0)
                            Subtract (Arg1, Local0, Local1)
                            Store (GETB (Arg0, Local0, IDX0), Local3)
                            Store (GETB (Zero, Local1, IDX1), Local4)
                            Concatenate (Local3, Local4, Local5)
                            Return (Local5)
                        }

                        Return (GETB (Arg0, Arg1, IDX0))
                    }

                    Method (GETB, 3, Serialized)
                    {
                        Multiply (Arg0, 0x08, Local0)
                        Multiply (Arg1, 0x08, Local1)
                        CreateField (Arg2, Local0, Local1, TBF3)
                        Return (TBF3) /* \_SB_.PCI0.PEG_.VID_.GETB.TBF3 */
                    }

                    Method (VSWT, 0, NotSerialized)
                    {
                        If (WVIS)
                        {
                            Store (VEVT (0x07), Local0)
                        }
                        Else
                        {
                            Store (VEVT (0x05), Local0)
                        }

                        And (0xFF, Local0, Local1)
                        If (Local1)
                        {
                            ASWT (Local1, One)
                        }
                    }

                    Method (VLOC, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, ^^^^LID._LID ()))
                        {
                            VSLD (Arg0)
                            If (LEqual (And (VPWR, 0x03), Zero))
                            {
                                If (Arg0)
                                {
                                    Store (VEVT (One), Local0)
                                }
                                Else
                                {
                                    Store (VEVT (0x02), Local0)
                                }

                                And (0x0F, Local0, Local1)
                                If (Local1)
                                {
                                    ASWT (Local1, Zero)
                                }
                            }
                        }
                    }

                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            Store (0x14, Local0)
                            While (Local0)
                            {
                                Decrement (Local0)
                                Acquire (MDGS, 0xFFFF)
                                If (LEqual (Zero, MSWT))
                                {
                                    Store (One, MSWT) /* \_SB_.PCI0.PEG_.MSWT */
                                    Store (Zero, Local0)
                                    Store (Arg0, VDEE) /* \_SB_.PCI0.PEG_.VDEE */
                                }

                                Release (MDGS)
                                Sleep (0xC8)
                            }
                        }
                        Else
                        {
                            Acquire (MDGS, 0xFFFF)
                            If (LEqual (VDEE, 0x02))
                            {
                                Store (Zero, MSWT) /* \_SB_.PCI0.PEG_.MSWT */
                            }

                            If (LGreater (Arg0, 0x02))
                            {
                                Store (One, VDEE) /* \_SB_.PCI0.PEG_.VDEE */
                            }
                            Else
                            {
                                Store (Arg0, VDEE) /* \_SB_.PCI0.PEG_.VDEE */
                            }

                            Release (MDGS)
                        }
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (Package (0x08)
                        {
                            0x0100, 
                            0x0114, 
                            0x0111, 
                            0x0115, 
                            0x0112, 
                            0x0116, 
                            0x0113, 
                            0x0110
                        })
                    }

                    Method (ASWT, 2, NotSerialized)
                    {
                        If (LEqual (One, VDEE))
                        {
                            And (One, Arg1, Local1)
                            VSDS (Arg0, Local1)
                        }
                        Else
                        {
                            Store (0x14, Local0)
                            While (Local0)
                            {
                                Decrement (Local0)
                                Acquire (MDGS, 0xFFFF)
                                If (LEqual (Zero, MSWT))
                                {
                                    Store (Zero, Local0)
                                    If (And (One, Arg1))
                                    {
                                        Store (One, VUPC) /* \_SB_.PCI0.PEG_.VUPC */
                                    }
                                    Else
                                    {
                                        Store (Zero, VUPC) /* \_SB_.PCI0.PEG_.VUPC */
                                    }

                                    If (And (One, Arg0))
                                    {
                                        Store (One, VQDL) /* \_SB_.PCI0.PEG_.VQDL */
                                    }
                                    Else
                                    {
                                        Store (Zero, VQDL) /* \_SB_.PCI0.PEG_.VQDL */
                                    }

                                    If (And (0x02, Arg0))
                                    {
                                        Store (One, VQDC) /* \_SB_.PCI0.PEG_.VQDC */
                                    }
                                    Else
                                    {
                                        Store (Zero, VQDC) /* \_SB_.PCI0.PEG_.VQDC */
                                    }

                                    If (And (0x04, Arg0))
                                    {
                                        Store (One, VQD0) /* \_SB_.PCI0.PEG_.VQD0 */
                                    }
                                    Else
                                    {
                                        Store (Zero, VQD0) /* \_SB_.PCI0.PEG_.VQD0 */
                                    }

                                    If (And (0x08, Arg0))
                                    {
                                        Store (One, VQD1) /* \_SB_.PCI0.PEG_.VQD1 */
                                    }
                                    Else
                                    {
                                        Store (Zero, VQD1) /* \_SB_.PCI0.PEG_.VQD1 */
                                    }

                                    If (And (0x10, Arg0))
                                    {
                                        Store (One, VQD2) /* \_SB_.PCI0.PEG_.VQD2 */
                                    }
                                    Else
                                    {
                                        Store (Zero, VQD2) /* \_SB_.PCI0.PEG_.VQD2 */
                                    }

                                    If (And (0x20, Arg0))
                                    {
                                        Store (One, VQD3) /* \_SB_.PCI0.PEG_.VQD3 */
                                    }
                                    Else
                                    {
                                        Store (Zero, VQD3) /* \_SB_.PCI0.PEG_.VQD3 */
                                    }

                                    If (And (0x40, Arg0))
                                    {
                                        Store (One, VQD4) /* \_SB_.PCI0.PEG_.VQD4 */
                                    }
                                    Else
                                    {
                                        Store (Zero, VQD4) /* \_SB_.PCI0.PEG_.VQD4 */
                                    }

                                    If (And (0x80, Arg0))
                                    {
                                        Store (One, VQD5) /* \_SB_.PCI0.PEG_.VQD5 */
                                    }
                                    Else
                                    {
                                        Store (Zero, VQD5) /* \_SB_.PCI0.PEG_.VQD5 */
                                    }
                                }

                                Release (MDGS)
                                Sleep (0xC8)
                            }

                            If (And (0x02, Arg1))
                            {
                                Notify (VID, 0x81) // Information Change
                            }
                            Else
                            {
                                Notify (VID, 0x80) // Status Change
                            }
                        }
                    }

                    Method (VDSW, 1, NotSerialized)
                    {
                        If (LEqual (VPWR, Zero))
                        {
                            If (Arg0)
                            {
                                Store (VEVT (0x03), Local0)
                            }
                            Else
                            {
                                Store (VEVT (0x04), Local0)
                            }

                            And (0x0F, Local0, Local1)
                            If (Local1)
                            {
                                ASWT (Local1, Zero)
                            }
                        }
                    }

                    Device (LCD0)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            VUPS (Zero)
                            If (VCDL)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQDL) /* \_SB_.PCI0.PEG_.VQDL */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            And (Arg0, One, VSDL) /* \_SB_.PCI0.PEG_.VSDL */
                            If (And (Arg0, 0x80000000))
                            {
                                If (And (Arg0, 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (One)
                                }
                            }
                        }

                        Method (_DDC, 1, NotSerialized)  // _DDC: Display Data Current
                        {
                            If (ISOP ())
                            {
                                Return (Zero)
                            }

                            If (LEqual (Arg0, One))
                            {
                                Return (VEDI) /* \VEDI */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x02))
                                {
                                    Return (VEDI) /* \VEDI */
                                }
                            }

                            Return (Zero)
                        }
                    }

                    Device (CRT0)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            VUPS (One)
                            If (VCSS)
                            {
                                If (VCDC)
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (VCDC)
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQDC) /* \_SB_.PCI0.PEG_.VQDC */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            And (Arg0, One, VSDC) /* \_SB_.PCI0.PEG_.VSDC */
                            If (And (Arg0, 0x80000000))
                            {
                                If (And (Arg0, 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (One)
                                }
                            }
                        }
                    }

                    Device (DVI0)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0111)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            VUPS (Zero)
                            If (VCDD)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD1) /* \_SB_.PCI0.PEG_.VQD1 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            And (Arg0, One, VSD1) /* \_SB_.PCI0.PEG_.VSD1 */
                            If (And (Arg0, 0x80000000))
                            {
                                If (And (Arg0, 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (One)
                                }
                            }
                        }
                    }

                    Device (DP0)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0114)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            VUPS (Zero)
                            If (VCDT)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD0) /* \_SB_.PCI0.PEG_.VQD0 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            And (Arg0, One, VSD0) /* \_SB_.PCI0.PEG_.VSD0 */
                            If (And (Arg0, 0x80000000))
                            {
                                If (And (Arg0, 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (One)
                                }
                            }
                        }
                    }

                    Device (DVI1)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0112)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            VUPS (Zero)
                            If (VCDD)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD3) /* \_SB_.PCI0.PEG_.VQD3 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            And (Arg0, One, VSD3) /* \_SB_.PCI0.PEG_.VSD3 */
                            If (And (Arg0, 0x80000000))
                            {
                                If (And (Arg0, 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (One)
                                }
                            }
                        }
                    }

                    Device (DP1)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0115)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            VUPS (Zero)
                            If (VCDT)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD2) /* \_SB_.PCI0.PEG_.VQD2 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            And (Arg0, One, VSD2) /* \_SB_.PCI0.PEG_.VSD2 */
                            If (And (Arg0, 0x80000000))
                            {
                                If (And (Arg0, 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (One)
                                }
                            }
                        }
                    }

                    Device (DVI2)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0113)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            VUPS (Zero)
                            If (VCDD)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD5) /* \_SB_.PCI0.PEG_.VQD5 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            And (Arg0, One, VSD5) /* \_SB_.PCI0.PEG_.VSD5 */
                            If (And (Arg0, 0x80000000))
                            {
                                If (And (Arg0, 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (One)
                                }
                            }
                        }
                    }

                    Device (DP2)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            Return (0x0116)
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            VUPS (Zero)
                            If (VCDT)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (VQD4) /* \_SB_.PCI0.PEG_.VQD4 */
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            And (Arg0, One, VSD4) /* \_SB_.PCI0.PEG_.VSD4 */
                            If (And (Arg0, 0x80000000))
                            {
                                If (And (Arg0, 0x40000000))
                                {
                                    DSWT (0x02)
                                }
                                Else
                                {
                                    DSWT (One)
                                }
                            }
                        }
                    }

                    Method (DSWT, 1, NotSerialized)
                    {
                        If (VSDL)
                        {
                            Store (One, Local0)
                        }
                        Else
                        {
                            Store (Zero, Local0)
                        }

                        If (VSDC)
                        {
                            Or (0x02, Local0, Local0)
                        }

                        If (VSD0)
                        {
                            Or (0x08, Local0, Local0)
                        }

                        If (Local0)
                        {
                            If (VUPC)
                            {
                                VSDS (Local0, Arg0)
                            }
                        }
                        Else
                        {
                            Noop
                        }
                    }
                }

                OperationRegion (PEGC, PCI_Config, Zero, 0x0100)
                Field (PEGC, DWordAcc, NoLock, Preserve)
                {
                    Offset (0xEC), 
                    GMGP,   1, 
                    HPGP,   1, 
                    PMGP,   1
                }
            }

            Device (IGBE)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
/* tjl
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x04
                })
   tjl */
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Store (Package (0x06)
                        {
                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "model", 
                            Buffer (0x0D)
                            {
                                "Intel E1000e"
                            }, 

                            "device_type", 
                            Buffer (0x09)
                            {
                                "Ethernet"
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

                Name (_SUN, 0x02)  // _SUN: Slot User Number
            }

            Device (EXP1)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Name (RID, Zero)
                OperationRegion (PECS, PCI_Config, Zero, 0x0100)
                Field (PECS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x62), 
                    PS,     1, 
                    PP,     1, 
                    Offset (0xDB), 
                        ,   7, 
                    PMCE,   1, 
                    Offset (0xDF), 
                        ,   7, 
                    PMCS,   1
                }

                Name (LPRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (APRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (APRT) /* \_SB_.PCI0.EXP1.APRT */
                    }
                    Else
                    {
                        Return (LPRT) /* \_SB_.PCI0.EXP1.LPRT */
                    }
                }
            }

            Device (EXP2)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Name (RID, Zero)
                OperationRegion (PECS, PCI_Config, Zero, 0x0100)
                Field (PECS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x62), 
                    PS,     1, 
                    PP,     1, 
                    Offset (0xDB), 
                        ,   7, 
                    PMCE,   1, 
                    Offset (0xDF), 
                        ,   7, 
                    PMCS,   1
                }

                Name (LPRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (APRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (APRT) /* \_SB_.PCI0.EXP2.APRT */
                    }
                    Else
                    {
                        Return (LPRT) /* \_SB_.PCI0.EXP2.LPRT */
                    }
                }
            }

            Device (EXP4)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Name (RID, Zero)
                OperationRegion (PECS, PCI_Config, Zero, 0x0100)
                Field (PECS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x5A), 
                        ,   3, 
                    PDC,    1, 
                        ,   2, 
                    PDS,    1, 
                    Offset (0x5B), 
                    Offset (0x62), 
                    PS,     1, 
                    PP,     1, 
                    Offset (0xDB), 
                        ,   6, 
                    HPCE,   1, 
                    PMCE,   1, 
                    Offset (0xDF), 
                        ,   6, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (PDS, PDSF) /* \_SB_.PCI0.EXP4.PDSF */
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Name (LPRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (APRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (APRT) /* \_SB_.PCI0.EXP4.APRT */
                    }
                    Else
                    {
                        Return (LPRT) /* \_SB_.PCI0.EXP4.LPRT */
                    }
                }

                Name (PDSF, Zero)
                Device (XHC1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (One)
                    }
                }
            }

            Device (EXP5)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Name (RID, Zero)
                OperationRegion (PECS, PCI_Config, Zero, 0x0100)
                Field (PECS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x62), 
                    PS,     1, 
                    PP,     1, 
                    Offset (0xDB), 
                        ,   7, 
                    PMCE,   1, 
                    Offset (0xDF), 
                        ,   7, 
                    PMCS,   1
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Name (LPRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (APRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (APRT) /* \_SB_.PCI0.EXP5.APRT */
                    }
                    Else
                    {
                        Return (LPRT) /* \_SB_.PCI0.EXP5.LPRT */
                    }
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Store (Package (0x13)
                        {
                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x94, 0x01, 0x00, 0x00                           /* .... */
                            }, 

                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "device_type", 
                            Buffer (0x05)
                            {
                                "XHCI"
                            }, 

                            "AAPL,clock-id", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "AAPL,current-available", 
                            0x0834, 
                            "AAPL,current-extra", 
                            0x0A8C, 
                            "AAPL,current-in-sleep", 
                            0x0A8C, 
                            "AAPL,max-port-current-in-sleep", 
                            0x0834, 
                            "AAPL,device-internal", 
                            Zero, 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
            }

            Device (SAT2)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
            }

            Device (SMBU)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
                Device (BUS0)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (MKY0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (_CID, "mikey")  // _CID: Compatible ID
                    }
                }
            }

            Device (EH01)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
                OperationRegion (EHCS, PCI_Config, Zero, 0x0100)
                Field (EHCS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x62), 
                    PWKI,   1, 
                    PWUC,   8, 
                    Offset (0x64)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    ^LPC.EC.PUBS
                })
                Name (_PR1, Package (0x01)  // _PR1: Power Resources for D1
                {
                    ^LPC.EC.PUBS
                })
                Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
                {
                    ^LPC.EC.PUBS
                })
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (One, PWKI) /* \_SB_.PCI0.EH01.PWKI */
                    Store (0x23, PWUC) /* \_SB_.PCI0.EH01.PWUC */
                }

                Name (_PRW, Package (0x03)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03, 
                    ^LPC.EC.PUBS
                })
                Device (URTH)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (URMH)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            ToPLD (
                                PLD_Revision       = 0x1,
                                PLD_IgnoreColor    = 0x1,
                                PLD_Red            = 0x0,
                                PLD_Green          = 0x0,
                                PLD_Blue           = 0x0,
                                PLD_Width          = 0x0,
                                PLD_Height         = 0x0,
                                PLD_UserVisible    = 0x0,
                                PLD_Dock           = 0x0,
                                PLD_Lid            = 0x0,
                                PLD_Panel          = "UNKNOWN",
                                PLD_VerticalPosition = "UPPER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape          = "UNKNOWN",
                                PLD_GroupOrientation = 0x0,
                                PLD_GroupToken     = 0x0,
                                PLD_GroupPosition  = 0x0,
                                PLD_Bay            = 0x0,
                                PLD_Ejectable      = 0x0,
                                PLD_EjectRequired  = 0x0,
                                PLD_CabinetNumber  = 0x0,
                                PLD_CardCageNumber = 0x0,
                                PLD_Reference      = 0x0,
                                PLD_Rotation       = 0x0,
                                PLD_Order          = 0x0,
                                PLD_VerticalOffset = 0x0,
                                PLD_HorizontalOffset = 0x0)

                        })
                        Device (PRT0)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "RIGHT",
                                    PLD_VerticalPosition = "CENTER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "VERTICALRECTANGLE",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x1,
                                    PLD_EjectRequired  = 0x1,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRT1)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "LEFT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "HORIZONTALRECTANGLE",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x1,
                                    PLD_EjectRequired  = 0x1,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0x02, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "RIGHT",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "HORIZONTALRECTANGLE",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x1,
                                    PLD_EjectRequired  = 0x1,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x07)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRT7)
                        {
                            Name (_ADR, 0x08)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }
                    }
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Store (Package (0x0D)
                        {
                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "device_type", 
                            Buffer (0x05)
                            {
                                "EHCI"
                            }, 

                            "AAPL,clock-id", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "AAPL,current-available", 
                            0x05DC, 
                            "AAPL,current-extra", 
                            0x03E8, 
                            "AAPL,current-in-sleep", 
                            0x05DC, 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (EH02)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
                OperationRegion (EHCS, PCI_Config, Zero, 0x0100)
                Field (EHCS, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x62), 
                    PWKI,   1, 
                    PWUC,   6, 
                    Offset (0x64)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    ^LPC.EC.PUBS
                })
                Name (_PR1, Package (0x01)  // _PR1: Power Resources for D1
                {
                    ^LPC.EC.PUBS
                })
                Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
                {
                    ^LPC.EC.PUBS
                })
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (One, PWKI) /* \_SB_.PCI0.EH02.PWKI */
                    Store (0x13, PWUC) /* \_SB_.PCI0.EH02.PWUC */
                }

                Name (_PRW, Package (0x03)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x03, 
                    ^LPC.EC.PUBS
                })
                Device (URTH)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (URMH)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            ToPLD (
                                PLD_Revision       = 0x1,
                                PLD_IgnoreColor    = 0x1,
                                PLD_Red            = 0x0,
                                PLD_Green          = 0x0,
                                PLD_Blue           = 0x0,
                                PLD_Width          = 0x0,
                                PLD_Height         = 0x0,
                                PLD_UserVisible    = 0x0,
                                PLD_Dock           = 0x0,
                                PLD_Lid            = 0x0,
                                PLD_Panel          = "UNKNOWN",
                                PLD_VerticalPosition = "UPPER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape          = "UNKNOWN",
                                PLD_GroupOrientation = 0x0,
                                PLD_GroupToken     = 0x0,
                                PLD_GroupPosition  = 0x0,
                                PLD_Bay            = 0x0,
                                PLD_Ejectable      = 0x0,
                                PLD_EjectRequired  = 0x0,
                                PLD_CabinetNumber  = 0x0,
                                PLD_CardCageNumber = 0x0,
                                PLD_Reference      = 0x0,
                                PLD_Rotation       = 0x0,
                                PLD_Order          = 0x0,
                                PLD_VerticalOffset = 0x0,
                                PLD_HorizontalOffset = 0x0)

                        })
                        Device (PRT8)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "CENTER",
                                    PLD_Shape          = "HORIZONTALRECTANGLE",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRT9)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "LEFT",
                                    PLD_VerticalPosition = "LOWER",
                                    PLD_HorizontalPosition = "RIGHT",
                                    PLD_Shape          = "HORIZONTALRECTANGLE",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x1,
                                    PLD_EjectRequired  = 0x1,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRTA)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRTB)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRTC)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x1,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "BACK",
                                    PLD_VerticalPosition = "CENTER",
                                    PLD_HorizontalPosition = "CENTER",
                                    PLD_Shape          = "HORIZONTALRECTANGLE",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x1,
                                    PLD_EjectRequired  = 0x1,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }

                        Device (PRTD)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                ToPLD (
                                    PLD_Revision       = 0x1,
                                    PLD_IgnoreColor    = 0x1,
                                    PLD_Red            = 0x0,
                                    PLD_Green          = 0x0,
                                    PLD_Blue           = 0x0,
                                    PLD_Width          = 0x0,
                                    PLD_Height         = 0x0,
                                    PLD_UserVisible    = 0x0,
                                    PLD_Dock           = 0x0,
                                    PLD_Lid            = 0x0,
                                    PLD_Panel          = "UNKNOWN",
                                    PLD_VerticalPosition = "UPPER",
                                    PLD_HorizontalPosition = "LEFT",
                                    PLD_Shape          = "UNKNOWN",
                                    PLD_GroupOrientation = 0x0,
                                    PLD_GroupToken     = 0x0,
                                    PLD_GroupPosition  = 0x0,
                                    PLD_Bay            = 0x0,
                                    PLD_Ejectable      = 0x0,
                                    PLD_EjectRequired  = 0x0,
                                    PLD_CabinetNumber  = 0x0,
                                    PLD_CardCageNumber = 0x0,
                                    PLD_Reference      = 0x0,
                                    PLD_Rotation       = 0x0,
                                    PLD_Order          = 0x0,
                                    PLD_VerticalOffset = 0x0,
                                    PLD_HorizontalOffset = 0x0)

                            })
                        }
                    }
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Store (Package (0x0D)
                        {
                            "built-in", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "device_type", 
                            Buffer (0x05)
                            {
                                "EHCI"
                            }, 

                            "AAPL,clock-id", 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }, 

                            "AAPL,current-available", 
                            0x05DC, 
                            "AAPL,current-extra", 
                            0x03E8, 
                            "AAPL,current-in-sleep", 
                            0x05DC, 
                            Buffer (One)
                            {
                                 0x00                                             /* . */
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
                Name (RID, Zero)
/* tjl
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x04
                })
   tjl */
                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    Noop
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Store (Package (0x0C)
                        {
                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-1"
                            }, 
/* tjl - set in config.plist
                            "layout-id", 
                            Unicode ("\x0C"), 
*/
                            "codec-id", 
                            Buffer (0x04)
                            {
                                 0x6E, 0x50, 0xF1, 0x14                           /* nP.. */
                            }, 

                            "device-type", 
                            Buffer (0x11)
                            {
                                "Conexant CX20672"
                            }, 

                            "MaximumBootBeepVolume", 
                            Buffer (One)
                            {
                                 0x01                                             /* . */
                            }, 

                            "PinConfigurations", 
                            Buffer (Zero) {}
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }
        }

        Scope (PCI0.LPC.EC)
        {
            Name (BDEV, 0xFF)
            Name (BSTS, Zero)
            Name (BHKE, Zero)
            Method (_Q2C, 0, NotSerialized)  // _Qxx: EC Query
            {
                If (LEqual (BSTS, Zero))
                {
                    Store (BGID (Zero), BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                    NBRE (BDEV)
                }
            }

            Method (_Q2D, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (BGID (Zero), BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                NBIN (BDEV)
            }

            Method (_Q38, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (BGID (Zero), Local0)
                If (LEqual (Local0, 0x0F))
                {
                    BDIS ()
                    BHDP (One, Zero)
                    NBEJ (BDEV)
                    Store (Local0, BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                    If (LEqual (BIDE, 0x03))
                    {
                        Store (Zero, ^^^SAT1.PRIM.GTME) /* External reference */
                        Store (Zero, ^^^SAT1.SCND.GTME) /* External reference */
                    }
                }
                Else
                {
                    If (HPBU) {}
                    Else
                    {
                        Store (Local0, BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                        NBIN (Local0)
                    }
                }
            }

            Name (ODEJ, Zero)
            Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query
            {
                If (CSON)
                {
                    Store (One, ODEJ) /* \_SB_.PCI0.LPC_.EC__.ODEJ */
                    Store (BGID (Zero), BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                    NBIN (BDEV)
                    Store (Zero, ODEJ) /* \_SB_.PCI0.LPC_.EC__.ODEJ */
                    ^HKEY.MHKQ (0x3006)
                }
            }

            Method (NBRE, 1, NotSerialized)
            {
                If (LLess (Arg0, 0x0C))
                {
                    If (LEqual (BIDE, 0x03))
                    {
                        Notify (^^^SAT1.SCND.MSTR, 0x03) // Eject Request
                    }
                    Else
                    {
                        Notify (^^^SAT1.PRT1, 0x03) // Eject Request
                    }
                }
            }

            Method (NBEJ, 1, NotSerialized)
            {
                If (LEqual (BSTS, Zero))
                {
                    If (LLess (Arg0, 0x0C))
                    {
                        If (LEqual (BIDE, 0x03))
                        {
                            Notify (^^^SAT1.SCND.MSTR, One) // Device Check
                        }
                        Else
                        {
                            Notify (^^^SAT1.PRT1, One) // Device Check
                        }
                    }
                }

                BEEP (Zero)
                Store (Zero, BSTS) /* \_SB_.PCI0.LPC_.EC__.BSTS */
            }

            Method (NBIN, 1, NotSerialized)
            {
                If (LLess (Arg0, 0x0C))
                {
                    BEN (One)
                    If (LEqual (BIDE, 0x03))
                    {
                        Notify (^^^SAT1.SCND.MSTR, One) // Device Check
                    }
                    Else
                    {
                        Notify (^^^SAT1.PRT1, One) // Device Check
                    }
                }

                BEEP (Zero)
                Store (Zero, BSTS) /* \_SB_.PCI0.LPC_.EC__.BSTS */
            }

            Method (BEJ0, 1, NotSerialized)
            {
                If (Arg0)
                {
                    BDIS ()
                    BHDP (One, Zero)
                    Store (One, BSTS) /* \_SB_.PCI0.LPC_.EC__.BSTS */
                    If (BHKE)
                    {
                        Store (Zero, BHKE) /* \_SB_.PCI0.LPC_.EC__.BHKE */
                        ^HKEY.MHKQ (0x3003)
                    }
                }
                Else
                {
                    Store (Zero, BSTS) /* \_SB_.PCI0.LPC_.EC__.BSTS */
                }
            }

            Method (BEJ3, 1, NotSerialized)
            {
                If (Arg0)
                {
                    BDIS ()
                    Store (One, BSTS) /* \_SB_.PCI0.LPC_.EC__.BSTS */
                }
                Else
                {
                    Store (Zero, BSTS) /* \_SB_.PCI0.LPC_.EC__.BSTS */
                }
            }

            Method (BPTS, 1, NotSerialized)
            {
                Store (One, HDBM) /* \_SB_.PCI0.LPC_.EC__.HDBM */
                If (LNotEqual (BSTS, Zero))
                {
                    Store (0x0F, BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                    Store (Zero, BSTS) /* \_SB_.PCI0.LPC_.EC__.BSTS */
                }

                Store (Zero, BHKE) /* \_SB_.PCI0.LPC_.EC__.BHKE */
                BUWK (Zero)
            }

            Method (BWAK, 1, NotSerialized)
            {
                BUWK (Zero)
                Store (BGID (Zero), Local0)
                If (LEqual (BSTS, Zero))
                {
                    If (LNotEqual (Local0, BDEV))
                    {
                        NBEJ (BDEV)
                        Store (Local0, BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                        NBIN (Local0)
                    }
                    Else
                    {
                        If (LOr (LFDC, LNotEqual (BDEV, 0x0D)))
                        {
                            If (LNotEqual (Local0, 0x0F))
                            {
                                If (HPBU)
                                {
                                    If (LLessEqual (Arg0, 0x02)) {}
                                    Else
                                    {
                                        NBRE (Local0)
                                    }
                                }
                            }
                        }
                    }
                }

                If (LLess (BDEV, 0x0C))
                {
                    Store (Zero, GLIS) /* \_SB_.PCI0.LPC_.GLIS */
                }
                Else
                {
                    Store (One, GLIS) /* \_SB_.PCI0.LPC_.GLIS */
                }
            }

            Method (BDIS, 0, NotSerialized)
            {
                If (LNot (CSON))
                {
                    If (LNot (GLIS))
                    {
                        Store (One, GLIS) /* \_SB_.PCI0.LPC_.GLIS */
                    }

                    Store (One, CSON) /* \_SB_.PCI0.LPC_.CSON */
                    Store (0x0F, IDET) /* \IDET */
                }
            }

            Method (BPON, 1, NotSerialized)
            {
                If (CSON)
                {
                    Store (Zero, CSON) /* \_SB_.PCI0.LPC_.CSON */
                    If (GLIS)
                    {
                        Store (Zero, GLIS) /* \_SB_.PCI0.LPC_.GLIS */
                    }
                }
            }

            Method (BEN, 1, NotSerialized)
            {
                If (CSON)
                {
                    BPON (Arg0)
                    If (LAnd (Arg0, LEqual (ODEJ, One)))
                    {
                        Store (0x09, HANT) /* \_SB_.PCI0.LPC_.EC__.HANT */
                    }

                    If (Arg0)
                    {
                        IRDY ()
                    }
                }
            }

            Method (BSTA, 1, NotSerialized)
            {
                If (CSON)
                {
                    Return (Zero)
                }

                BINI ()
                If (LEqual (Arg0, One))
                {
                    Return (LLess (BDEV, 0x0C))
                }

                Return (Zero)
            }

            Method (BUWK, 1, NotSerialized)
            {
                If (H8DR)
                {
                    If (Arg0)
                    {
                        Store (One, HWBU) /* \_SB_.PCI0.LPC_.EC__.HWBU */
                    }
                    Else
                    {
                        Store (Zero, HWBU) /* \_SB_.PCI0.LPC_.EC__.HWBU */
                    }
                }
                Else
                {
                    If (Arg0)
                    {
                        MBEC (0x32, 0xFF, 0x80)
                    }
                    Else
                    {
                        MBEC (0x32, 0x7F, Zero)
                    }
                }
            }

            Method (BINI, 0, NotSerialized)
            {
                If (LEqual (BDEV, 0xFF))
                {
                    Store (BGID (Zero), BDEV) /* \_SB_.PCI0.LPC_.EC__.BDEV */
                }
            }

            Method (BGID, 1, NotSerialized)
            {
                If (Arg0)
                {
                    Store (0xFF, Local0)
                }
                Else
                {
                    If (H8DR)
                    {
                        Store (HPBU, Local1)
                        Store (HBID, Local2)
                    }
                    Else
                    {
                        Store (RBEC (0x47), Local2)
                        And (Local2, One, Local1)
                        And (Local2, 0x04, Local2)
                        ShiftRight (Local2, 0x02, Local2)
                    }

                    If (Local2)
                    {
                        Store (0x0F, Local0)
                    }
                    Else
                    {
                        If (HDUB)
                        {
                            Store (0x0F, Local0)
                        }
                        Else
                        {
                            If (LOr (LEqual (IDET, 0x03), LEqual (IDET, 0x06)))
                            {
                                Store (IDET, Local0)
                            }
                            Else
                            {
                                Store (0x07, Local0)
                            }
                        }
                    }

                    If (LEqual (Local0, 0x0F)) {}
                }

                If (LAnd (HDUB, LLess (Local0, 0x0C)))
                {
                    Store (0x0F, Local0)
                }

                Return (Local0)
            }

            Method (IRDY, 0, NotSerialized)
            {
                Store (0x01F4, Local0)
                Store (0x3C, Local1)
                Store (Zero, Local2)
                While (Local1)
                {
                    Sleep (Local0)
                    Store (BCHK (), Local3)
                    If (LNot (Local3))
                    {
                        Break
                    }

                    If (LEqual (Local3, 0x02))
                    {
                        Store (One, Local2)
                        Break
                    }

                    Decrement (Local1)
                }

                Return (Local2)
            }
        }

        Scope (PCI0.LPC.EC)
        {
            Method (_Q43, 0, NotSerialized)  // _Qxx: EC Query
            {
                UCMS (0x18)
            }

            Method (SAUM, 1, NotSerialized)
            {
                If (LGreater (Arg0, 0x03))
                {
                    Noop
                }
                Else
                {
                    If (H8DR)
                    {
                        Store (Arg0, HAUM) /* \_SB_.PCI0.LPC_.EC__.HAUM */
                    }
                    Else
                    {
                        MBEC (0x03, 0x9F, ShiftLeft (Arg0, 0x05))
                    }
                }
            }
        }

        Scope (PCI0.LPC.EC.HKEY)
        {
            Method (GSMS, 1, NotSerialized)
            {
                Return (AUDC (Zero, Zero))
            }

            Method (SSMS, 1, NotSerialized)
            {
                Return (AUDC (One, And (Arg0, One)))
            }

            Method (SHDA, 1, NotSerialized)
            {
                Return (AUDC (0x02, And (Arg0, One)))
            }
        }

        Scope (PCI0.LPC.EC)
        {
            Name (BRTW, Package (0x12)
            {
                0x64, 
                0x64, 
                0x05, 
                0x0A, 
                0x14, 
                0x19, 
                0x1E, 
                0x23, 
                0x28, 
                0x2D, 
                0x32, 
                0x37, 
                0x3C, 
                0x41, 
                0x46, 
                0x50, 
                0x5A, 
                0x64
            })
            Name (BRTB, Package (0x04)
            {
                Package (0x16)
                {
                    0x16, 
                    0x04, 
                    0x04, 
                    0x07, 
                    0x09, 
                    0x0C, 
                    0x10, 
                    0x15, 
                    0x1C, 
                    0x25, 
                    0x32, 
                    0x40, 
                    0x50, 
                    0x64, 
                    0x82, 
                    0xA5, 
                    0xCD, 
                    0xFF, 
                    0xDC, 
                    0xDC, 
                    0x04, 
                    0x04
                }, 

                Package (0x16)
                {
                    0x19, 
                    0x04, 
                    0x04, 
                    0x06, 
                    0x08, 
                    0x0B, 
                    0x0F, 
                    0x14, 
                    0x1B, 
                    0x24, 
                    0x31, 
                    0x3F, 
                    0x50, 
                    0x66, 
                    0x82, 
                    0xA5, 
                    0xCD, 
                    0xFF, 
                    0xDC, 
                    0xDC, 
                    0x04, 
                    0x04
                }, 

                Package (0x16)
                {
                    Zero, 
                    0x04, 
                    0x04, 
                    0x07, 
                    0x09, 
                    0x0C, 
                    0x10, 
                    0x15, 
                    0x1C, 
                    0x25, 
                    0x32, 
                    0x40, 
                    0x50, 
                    0x64, 
                    0x82, 
                    0xA5, 
                    0xCD, 
                    0xFF, 
                    0xDC, 
                    0xDC, 
                    0x04, 
                    0x04
                }, 

                Package (0x16)
                {
                    Zero, 
                    0x04, 
                    0x04, 
                    0x07, 
                    0x09, 
                    0x0C, 
                    0x10, 
                    0x15, 
                    0x1C, 
                    0x25, 
                    0x32, 
                    0x40, 
                    0x50, 
                    0x64, 
                    0x82, 
                    0xA5, 
                    0xCD, 
                    0xFF, 
                    0xDC, 
                    0xDC, 
                    0x04, 
                    0x04
                }
            })
            Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query
            {
                Notify (PS2K, 0x0206)
                Notify (PS2K, 0x0286)
            }

            Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query
            {
                Notify (PS2K, 0x0205)
                Notify (PS2K, 0x0285)
            }

            Method (BRNS, 0, NotSerialized)
            {
                Add (BRLV, 0x02, Local0)
                Store (BRTN, Local3)
                If (^^^IGPU.DRDY)
                {
                    If (LEqual (Zero, Local0))
                    {
                        Store (DerefOf (Index (DerefOf (Index (BRTB, Local3)), 0x14)), Local1)
                        Store (DerefOf (Index (DerefOf (Index (BRTB, Local3)), 0x12)), Local2)
                    }
                    Else
                    {
                        Store (DerefOf (Index (DerefOf (Index (BRTB, Local3)), 0x15)), Local1)
                        Store (DerefOf (Index (DerefOf (Index (BRTB, Local3)), 0x13)), Local2)
                    }

                    Or (Local1, ShiftLeft (Local2, 0x09), Local2)
                    ^^^IGPU.AINT (0x03, Local2)
                    Store (DerefOf (Index (DerefOf (Index (BRTB, Local3)), Local0)), Local2)
                    ^^^IGPU.AINT (One, Local2)
                }
                Else
                {
                    UCMS (0x12)
                }
            }
        }

        Scope (PCI0.LPC.EC)
        {
            Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query
            {
                Name (FANS, One)
                Store (HFSP, FANS) /* \_SB_.PCI0.LPC_.EC__._Q19.FANS */
                XOr (FANS, 0x80, Local0)
                If (Local0)
                {
                    Store (0x80, HFSP) /* \_SB_.PCI0.LPC_.EC__.HFSP */
                }
                Else
                {
                    Store (0x07, HFSP) /* \_SB_.PCI0.LPC_.EC__.HFSP */
                }
            }
        }

        Scope (PCI0.LPC.EC)
        {
            Method (_Q63, 0, NotSerialized)  // _Qxx: EC Query
            {
                If (^HKEY.MHKK (0x00080000))
                {
                    ^HKEY.MHKQ (0x1014)
                }

                UCMS (0x0B)
            }
        }

        Scope (PCI0.LPC.EC)
        {
            Method (_Q70, 0, NotSerialized)  // _Qxx: EC Query
            {
                FNST ()
            }

            Method (_Q72, 0, NotSerialized)  // _Qxx: EC Query
            {
                FNST ()
            }

            Method (_Q73, 0, NotSerialized)  // _Qxx: EC Query
            {
                FNST ()
            }

            Method (FNST, 0, NotSerialized)
            {
                If (H8DR)
                {
                    Store (HFNS, Local0)
                    Store (HFNE, Local1)
                }
                Else
                {
                    And (RBEC (0x0E), 0x03, Local0)
                    And (RBEC (Zero), 0x08, Local1)
                }

                If (Local1)
                {
                    If (LEqual (Local0, Zero))
                    {
                        UCMS (0x11)
                    }

                    If (LEqual (Local0, One))
                    {
                        UCMS (0x0F)
                    }

                    If (LEqual (Local0, 0x02))
                    {
                        UCMS (0x10)
                    }

                    ^HKEY.MHKQ (0x6005)
                }
            }
        }

        Scope (PCI0.LPC.EC.HKEY)
        {
            Method (GHSL, 1, NotSerialized)
            {
                Return (FNSC (Zero, Zero))
            }

            Method (SHSL, 1, NotSerialized)
            {
                Return (FNSC (One, And (Arg0, One)))
            }
        }

        Scope (PCI0.LPC.EC.HKEY)
        {
            Name (WGFL, Zero)
            Method (WSIF, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (WLSW, 0, NotSerialized)
            {
                Return (GSTS) /* \_SB_.PCI0.LPC_.EC__.GSTS */
            }

            Method (GWAN, 0, NotSerialized)
            {
                Store (Zero, Local0)
                If (And (WGFL, One))
                {
                    Or (Local0, One, Local0)
                }

                If (And (WGFL, 0x08))
                {
                    Return (Local0)
                }

                If (WPWS ())
                {
                    Or (Local0, 0x02, Local0)
                }

                Or (Local0, 0x04, Local0)
                Return (Local0)
            }

            Method (SWAN, 1, NotSerialized)
            {
                If (And (Arg0, 0x02))
                {
                    WPWC (One)
                }
                Else
                {
                    WPWC (Zero)
                }
            }

            Method (GBDC, 0, NotSerialized)
            {
                Store (Zero, Local0)
                If (And (WGFL, 0x10))
                {
                    Or (Local0, One, Local0)
                }

                If (And (WGFL, 0x80))
                {
                    Return (Local0)
                }

                If (BPWS ())
                {
                    Or (Local0, 0x02, Local0)
                }

                Or (Local0, 0x04, Local0)
                Return (Local0)
            }

            Method (SBDC, 1, NotSerialized)
            {
                If (And (Arg0, 0x02))
                {
                    BPWC (One)
                }
                Else
                {
                    BPWC (Zero)
                }
            }

            Method (WPWS, 0, NotSerialized)
            {
                If (H8DR)
                {
                    Store (DCWW, Local0)
                }
                Else
                {
                    Store (ShiftRight (And (RBEC (0x3A), 0x40), 0x06), Local0)
                }

                Return (Local0)
            }

            Method (WPWC, 1, NotSerialized)
            {
                If (LAnd (Arg0, LAnd (And (WGFL, One), LNot (And (WGFL, 0x08
                    )))))
                {
                    If (H8DR)
                    {
                        Store (One, DCWW) /* \_SB_.PCI0.LPC_.EC__.DCWW */
                    }
                    Else
                    {
                        MBEC (0x3A, 0xFF, 0x40)
                    }

                    Or (WGFL, 0x02, WGFL) /* \_SB_.PCI0.LPC_.EC__.HKEY.WGFL */
                }
                Else
                {
                    If (H8DR)
                    {
                        Store (Zero, DCWW) /* \_SB_.PCI0.LPC_.EC__.DCWW */
                    }
                    Else
                    {
                        MBEC (0x3A, 0xBF, Zero)
                    }

                    And (WGFL, 0xFFFFFFFD, WGFL) /* \_SB_.PCI0.LPC_.EC__.HKEY.WGFL */
                }
            }

            Method (BPWS, 0, NotSerialized)
            {
                If (H8DR)
                {
                    Store (DCBD, Local0)
                }
                Else
                {
                    Store (ShiftRight (And (RBEC (0x3A), 0x10), 0x04), Local0)
                }

                Return (Local0)
            }

            Method (BPWC, 1, NotSerialized)
            {
                If (LAnd (Arg0, LAnd (And (WGFL, 0x10), LNot (And (WGFL, 0x80
                    )))))
                {
                    If (H8DR)
                    {
                        Store (One, DCBD) /* \_SB_.PCI0.LPC_.EC__.DCBD */
                    }
                    Else
                    {
                        MBEC (0x3A, 0xFF, 0x10)
                    }

                    Or (WGFL, 0x20, WGFL) /* \_SB_.PCI0.LPC_.EC__.HKEY.WGFL */
                }
                Else
                {
                    If (H8DR)
                    {
                        Store (Zero, DCBD) /* \_SB_.PCI0.LPC_.EC__.DCBD */
                    }
                    Else
                    {
                        MBEC (0x3A, 0xEF, Zero)
                    }

                    And (WGFL, 0xFFFFFFDF, WGFL) /* \_SB_.PCI0.LPC_.EC__.HKEY.WGFL */
                }
            }

            Method (WGIN, 0, NotSerialized)
            {
                Store (Zero, WGFL) /* \_SB_.PCI0.LPC_.EC__.HKEY.WGFL */
                Store (WGSV (One), WGFL) /* \_SB_.PCI0.LPC_.EC__.HKEY.WGFL */
                If (WIN8)
                {
                    If (LAnd (WGFL, 0x10))
                    {
                        BPWC (One)
                    }
                }

                If (WPWS ())
                {
                    Or (WGFL, 0x02, WGFL) /* \_SB_.PCI0.LPC_.EC__.HKEY.WGFL */
                }

                If (BPWS ())
                {
                    Or (WGFL, 0x20, WGFL) /* \_SB_.PCI0.LPC_.EC__.HKEY.WGFL */
                }
            }

            Method (WGPS, 1, NotSerialized)
            {
                If (LGreaterEqual (Arg0, 0x04))
                {
                    BLTH (0x05)
                }
            }

            Method (WGWK, 1, NotSerialized)
            {
                If (And (WGFL, 0x20))
                {
                    BPWC (One)
                }

                If (And (WGFL, 0x02))
                {
                    WPWC (One)
                }
            }
        }

        Scope (PCI0.LPC.EC)
        {
            Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query
            {
                ^HKEY.MHKQ (0x7000)
            }
        }

        Scope (PCI0.LPC.EC.HKEY)
        {
            Mutex (BFWM, 0x00)
            Method (MHCF, 1, NotSerialized)
            {
                Store (BFWC (Arg0), Local0)
                Return (Local0)
            }

            Method (MHPF, 1, NotSerialized)
            {
                Name (RETB, Buffer (0x25) {})
                Acquire (BFWM, 0xFFFF)
                If (LLessEqual (SizeOf (Arg0), 0x25))
                {
                    Store (Arg0, BFWB) /* \BFWB */
                    If (BFWP ())
                    {
                        CHKS ()
                        BFWL ()
                    }

                    Store (BFWB, RETB) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHPF.RETB */
                }

                Release (BFWM)
                Return (RETB) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHPF.RETB */
            }

            Method (MHIF, 1, NotSerialized)
            {
                Name (RETB, Buffer (0x0A) {})
                Acquire (BFWM, 0xFFFF)
                BFWG (Arg0)
                Store (BFWB, RETB) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHIF.RETB */
                Release (BFWM)
                Return (RETB) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHIF.RETB */
            }

            Method (MHDM, 1, NotSerialized)
            {
                BDMC (Arg0)
            }
        }

        Scope (PCI0.LPC.EC.HKEY)
        {
            Method (PSSG, 1, NotSerialized)
            {
                Return (PSIF (Zero, Zero))
            }

            Method (PSSS, 1, NotSerialized)
            {
                Return (PSIF (One, Arg0))
            }

            Method (PSBS, 1, NotSerialized)
            {
                Return (PSIF (0x02, Arg0))
            }

            Method (BICG, 1, NotSerialized)
            {
                Return (PSIF (0x03, Arg0))
            }

            Method (BICS, 1, NotSerialized)
            {
                Return (PSIF (0x04, Arg0))
            }

            Method (BCTG, 1, NotSerialized)
            {
                Return (PSIF (0x05, Arg0))
            }

            Method (BCCS, 1, NotSerialized)
            {
                Return (PSIF (0x06, Arg0))
            }

            Method (BCSG, 1, NotSerialized)
            {
                Return (PSIF (0x07, Arg0))
            }

            Method (BCSS, 1, NotSerialized)
            {
                Return (PSIF (0x08, Arg0))
            }

            Method (BDSG, 1, NotSerialized)
            {
                Return (PSIF (0x09, Arg0))
            }

            Method (BDSS, 1, NotSerialized)
            {
                Return (PSIF (0x0A, Arg0))
            }
        }

        Scope (PCI0.LPC.EC.HKEY)
        {
            Method (GILN, 0, NotSerialized)
            {
                Return (Or (0x02, ILNF))
            }

            Method (SILN, 1, NotSerialized)
            {
                If (LEqual (One, Arg0))
                {
                    Store (One, ILNF) /* \ILNF */
                    Store (Zero, BBLS) /* \_SB_.PCI0.LPC_.EC__.BBLS */
                    Return (Zero)
                }
                Else
                {
                    If (LEqual (0x02, Arg0))
                    {
                        Store (Zero, ILNF) /* \ILNF */
                        Store (One, BBLS) /* \_SB_.PCI0.LPC_.EC__.BBLS */
                        Return (Zero)
                    }
                    Else
                    {
                        Return (One)
                    }
                }
            }

            Method (GLSI, 0, NotSerialized)
            {
                If (H8DR)
                {
                    Return (Add (0x02, HPLD))
                }
                Else
                {
                    If (And (RBEC (0x46), 0x04))
                    {
                        Return (0x03)
                    }
                    Else
                    {
                        Return (0x02)
                    }
                }
            }
        }

        Scope (PCI0.LPC.EC.HKEY)
        {
            Method (GDLN, 0, NotSerialized)
            {
                Return (Or (0x02, PLUX))
            }

            Method (SDLN, 1, NotSerialized)
            {
                If (LEqual (One, Arg0))
                {
                    Store (One, PLUX) /* \PLUX */
                    Return (Zero)
                }
                Else
                {
                    If (LEqual (0x02, Arg0))
                    {
                        Store (Zero, PLUX) /* \PLUX */
                        Return (Zero)
                    }
                    Else
                    {
                        Return (One)
                    }
                }
            }
        }

        Name (\VHCC, Zero)
        Scope (PCI0.PEG.VID)
        {
            Method (ISOP, 0, NotSerialized)
            {
                Return (LAnd (VDSP, LAnd (VIGD, VDSC)))
            }
        }

        Scope (PCI0)
        {
            Name (OTM, "OTMACPI 2009-Nov-12 18:18:51")
        }

        Scope (PCI0.PEG.VID)
        {
            Method (GOBT, 1, NotSerialized)
            {
                Name (OPVK, Buffer (0xE6)
                {
                    /* 0000 */  0xE4, 0xB8, 0x4F, 0x51, 0x50, 0x72, 0x8A, 0xC2,  /* ..OQPr.. */
                    /* 0008 */  0x4B, 0x56, 0xE6, 0x00, 0x00, 0x00, 0x01, 0x00,  /* KV...... */
                    /* 0010 */  0x31, 0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35,  /* 14859745 */
                    /* 0018 */  0x36, 0x39, 0x38, 0x35, 0x47, 0x65, 0x6E, 0x75,  /* 6985Genu */
                    /* 0020 */  0x69, 0x6E, 0x65, 0x20, 0x4E, 0x56, 0x49, 0x44,  /* ine NVID */
                    /* 0028 */  0x49, 0x41, 0x20, 0x43, 0x65, 0x72, 0x74, 0x69,  /* IA Certi */
                    /* 0030 */  0x66, 0x69, 0x65, 0x64, 0x20, 0x4F, 0x70, 0x74,  /* fied Opt */
                    /* 0038 */  0x69, 0x6D, 0x75, 0x73, 0x20, 0x52, 0x65, 0x61,  /* imus Rea */
                    /* 0040 */  0x64, 0x79, 0x20, 0x4D, 0x6F, 0x74, 0x68, 0x65,  /* dy Mothe */
                    /* 0048 */  0x72, 0x62, 0x6F, 0x61, 0x72, 0x64, 0x20, 0x66,  /* rboard f */
                    /* 0050 */  0x6F, 0x72, 0x20, 0x36, 0x38, 0x38, 0x33, 0x32,  /* or 68832 */
                    /* 0058 */  0x35, 0x6E, 0x6F, 0x7A, 0x6F, 0x6D, 0x69, 0x32,  /* 5nozomi2 */
                    /* 0060 */  0x31, 0x44, 0x35, 0x20, 0x20, 0x20, 0x20, 0x20,  /* 1D5      */
                    /* 0068 */  0x2D, 0x20, 0x40, 0x4A, 0x20, 0x24, 0x55, 0x27,  /* - @J $U' */
                    /* 0070 */  0x5C, 0x22, 0x54, 0x20, 0x29, 0x5F, 0x47, 0x42,  /* \"T )_GB */
                    /* 0078 */  0x20, 0x50, 0x2F, 0x41, 0x4F, 0x5C, 0x37, 0x22,  /*  P/AO\7" */
                    /* 0080 */  0x3D, 0x46, 0x37, 0x39, 0x4B, 0x37, 0x2B, 0x5F,  /* =F79K7+_ */
                    /* 0088 */  0x3F, 0x4B, 0x48, 0x5C, 0x5F, 0x46, 0x58, 0x48,  /* ?KH\_FXH */
                    /* 0090 */  0x5F, 0x44, 0x57, 0x32, 0x26, 0x4A, 0x46, 0x50,  /* _DW2&JFP */
                    /* 0098 */  0x52, 0x25, 0x24, 0x2F, 0x46, 0x24, 0x20, 0x2D,  /* R%$/F$ - */
                    /* 00A0 */  0x20, 0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67,  /*  Copyrig */
                    /* 00A8 */  0x68, 0x74, 0x20, 0x32, 0x30, 0x31, 0x30, 0x20,  /* ht 2010  */
                    /* 00B0 */  0x4E, 0x56, 0x49, 0x44, 0x49, 0x41, 0x20, 0x43,  /* NVIDIA C */
                    /* 00B8 */  0x6F, 0x72, 0x70, 0x6F, 0x72, 0x61, 0x74, 0x69,  /* orporati */
                    /* 00C0 */  0x6F, 0x6E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52,  /* on All R */
                    /* 00C8 */  0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65,  /* ights Re */
                    /* 00D0 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2D, 0x31,  /* served-1 */
                    /* 00D8 */  0x34, 0x38, 0x35, 0x39, 0x37, 0x34, 0x35, 0x36,  /* 48597456 */
                    /* 00E0 */  0x39, 0x38, 0x35, 0x28, 0x52, 0x29               /* 985(R) */
                })
                CreateWordField (Arg0, 0x02, USRG)
                If (LEqual (USRG, 0x564B))
                {
                    Return (OPVK) /* \_SB_.PCI0.PEG_.VID_.GOBT.OPVK */
                }

                Return (Zero)
            }
        }

        Scope (PCI0.PEG.VID)
        {
            Name (OMPR, 0x02)
            Name (HDAS, Zero)
            Method (NVOP, 4, NotSerialized)
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                Store ("------- NV OPTIMUS DSM --------", Debug)
                If (LNotEqual (Arg1, 0x0100))
                {
                    Return (0x80000001)
                }

                Store (ToInteger (Arg2), _T_0) /* \_SB_.PCI0.PEG_.VID_.NVOP._T_0 */
                If (LEqual (_T_0, Zero))
                {
                    Store (Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           /* .... */
                        }, Local0)
                    Divide (Zero, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1))
                    Divide (0x1A, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1))
                    Divide (0x1B, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1))
                    Divide (0x10, 0x08, Local2, Local1)
                    ShiftLeft (One, Local2, Local2)
                    Or (DerefOf (Index (Local0, Local1)), Local2, Index (Local0, Local1))
                    Return (Local0)
                }
                Else
                {
                    If (LEqual (_T_0, 0x1A))
                    {
                        CreateField (Arg3, 0x18, 0x02, OPCE)
                        CreateField (Arg3, Zero, One, FLCH)
                        If (ToInteger (FLCH))
                        {
                            Store (OPCE, OMPR) /* \_SB_.PCI0.PEG_.VID_.OMPR */
                        }

                        Store (Buffer (0x04)
                            {
                                 0x00, 0x00, 0x00, 0x00                           /* .... */
                            }, Local0)
                        CreateField (Local0, Zero, One, OPEN)
                        CreateField (Local0, 0x03, 0x02, CGCS)
                        CreateField (Local0, 0x06, One, SHPC)
                        CreateField (Local0, 0x18, 0x03, DGPC)
                        CreateField (Local0, 0x1B, 0x02, HDAC)
                        Store (One, OPEN) /* \_SB_.PCI0.PEG_.VID_.NVOP.OPEN */
                        Store (One, SHPC) /* \_SB_.PCI0.PEG_.VID_.NVOP.SHPC */
                        Store (One, DGPC) /* \_SB_.PCI0.PEG_.VID_.NVOP.DGPC */
                        If (_STA ())
                        {
                            Store (0x03, CGCS) /* \_SB_.PCI0.PEG_.VID_.NVOP.CGCS */
                        }

                        Store (0x02, HDAC) /* \_SB_.PCI0.PEG_.VID_.NVOP.HDAC */
                        Return (Local0)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x1B))
                        {
                            CreateField (Arg3, Zero, One, HDAU)
                            CreateField (Arg3, One, One, HDAR)
                            Store (Buffer (0x04)
                                {
                                     0x00, 0x00, 0x00, 0x00                           /* .... */
                                }, Local0)
                            CreateField (Local0, 0x02, 0x02, RQGS)
                            CreateField (Local0, 0x04, One, PWST)
                            Store (One, PWST) /* \_SB_.PCI0.PEG_.VID_.NVOP.PWST */
                            If (LAnd (^^^LPC.EC.DOCD, ^^^LPC.EC.ADP1._PSR ()))
                            {
                                Store (One, RQGS) /* \_SB_.PCI0.PEG_.VID_.NVOP.RQGS */
                            }
                            Else
                            {
                                Store (Zero, RQGS) /* \_SB_.PCI0.PEG_.VID_.NVOP.RQGS */
                            }

                            If (ToInteger (HDAR))
                            {
                                Store (ToInteger (HDAU), HDAS) /* \_SB_.PCI0.PEG_.VID_.HDAS */
                            }

                            Return (Local0)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x10))
                            {
                                Return (GOBT (Arg3))
                            }
                        }
                    }
                }

                Return (0x80000002)
            }
        }

        Scope (\)
        {
            Method (CMPB, 2, NotSerialized)
            {
                Store (SizeOf (Arg0), Local1)
                If (LNotEqual (Local1, SizeOf (Arg1)))
                {
                    Return (Zero)
                }

                Store (Zero, Local0)
                While (LLess (Local0, Local1))
                {
                    If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (Arg1, Local0
                        ))))
                    {
                        Return (Zero)
                    }

                    Increment (Local0)
                }

                Return (One)
            }
        }
    }

    Scope (_SB.PCI0.EH02.URTH.URMH.PRTC)
    {
        Name (_EJD, "\\_SB.GDCK")  // _EJD: Ejection Dependent Device
    }

    Scope (_SB.PCI0.EH01.URTH.URMH.PRT5)
    {
        Name (_EJD, "\\_SB.PCI0.EXP4.XHC1")  // _EJD: Ejection Dependent Device
    }

    Scope (_SB.PCI0.EXP4.XHC1)
    {
        Name (_EJD, "\\_SB.PCI0.EH01.URTH.URMH.PRT5")  // _EJD: Ejection Dependent Device
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        0x06, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        0x07, 
        Zero, 
        Zero
    })
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Scope (\)
        {
            OperationRegion (SLPR, SystemIO, 0x0430, 0x08)
            Field (SLPR, ByteAcc, NoLock, Preserve)
            {
                    ,   4, 
                SLPE,   1
            }
        }

        Store (One, Local0)
        If (LEqual (Arg0, SPS))
        {
            Store (Zero, Local0)
        }

        If (LOr (LEqual (Arg0, Zero), LGreaterEqual (Arg0, 0x06)))
        {
            Store (Zero, Local0)
        }

        If (Local0)
        {
            Store (Arg0, SPS) /* \SPS_ */
            Store (Zero, SLPE) /* \SLPE */
            Sleep (0x10)
            \_SB.PCI0.LPC.EC.HKEY.MHKE (Zero)
            If (\_SB.PCI0.LPC.EC.KBLT)
            {
                UCMS (0x0D)
            }

            If (LEqual (Arg0, One))
            {
                Store (\_SB.PCI0.LPC.EC.HFNI, FNID) /* \FNID */
                Store (Zero, \_SB.PCI0.LPC.EC.HFNI)
                Store (Zero, \_SB.PCI0.LPC.EC.HFSP)
            }

            If (LEqual (Arg0, 0x03))
            {
                VVPD (0x03)
                TRAP ()
                Store (\_SB.PCI0.LPC.EC.ADP1._PSR (), OCST) /* \OCST */
            }

            If (LEqual (Arg0, 0x04))
            {
                \_SB.SLPB._PSW (Zero)
                TRAP ()
                AWON (0x04)
            }

            If (LEqual (Arg0, 0x05))
            {
                TRAP ()
                AWON (0x05)
            }

            \_SB.PCI0.LPC.EC.BPTS (Arg0)
            If (LGreaterEqual (Arg0, 0x04))
            {
                Store (Zero, \_SB.PCI0.LPC.EC.HWLB)
            }
            Else
            {
                Store (One, \_SB.PCI0.LPC.EC.HWLB)
            }

            If (LNotEqual (Arg0, 0x05))
            {
                Store (One, \_SB.PCI0.LPC.EC.HCMU)
                Store (\_SB.PCI0.EXP4.PDS, \_SB.PCI0.EXP4.PDSF)
            }

            \_SB.PCI0.LPC.EC.HKEY.WGPS (Arg0)
            If (LEqual (Arg0, 0x05))
            {
                \_SI._SST (Zero)
            }
            Else
            {
                If (LEqual (Arg0, 0x04))
                {
                    \_SI._SST (0x04)
                }
                Else
                {
                    If (LEqual (Arg0, Zero))
                    {
                        \_SI._SST (One)
                    }
                    Else
                    {
                        \_SI._SST (0x03)
                    }
                }
            }
        }
    }

    Name (WAKI, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        Store (SPS, Arg0)
        \_SI._SST (0x02)
        If (LOr (LLess (Arg0, Zero), LGreater (Arg0, 0x05)))
        {
            Store (0x04, Arg0)
        }

        If (LOr (LEqual (Arg0, Zero), LEqual (Arg0, 0x05)))
        {
            \_SI._SST (One)
            Return (WAKI) /* \WAKI */
        }

        Store (Zero, SPS) /* \SPS_ */
        Store (Zero, \_SB.PCI0.LPC.EC.HCMU)
        \_SB.PCI0.LPC.EC.EVNT (One)
        \_SB.PCI0.LPC.EC.HKEY.MHKE (One)
        \_SB.PCI0.LPC.EC.FNST ()
        UCMS (0x0D)
        Store (Zero, LIDB) /* \LIDB */
        If (LEqual (Arg0, One))
        {
            Store (\_SB.PCI0.LPC.EC.HFNI, FNID) /* \FNID */
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (\_SB.PCI0.LPC.EC.ADP1._PSR (), PWRS) /* \PWRS */
            If (OSC4)
            {
                PNTF (0x81)
            }

            If (LNotEqual (OCST, \_SB.PCI0.LPC.EC.ADP1._PSR ()))
            {
                \_SB.PCI0.LPC.EC.ATMC ()
            }

            If (SCRM)
            {
                Store (0x07, \_SB.PCI0.LPC.EC.HFSP)
                If (MTAU)
                {
                    Store (0x03E8, Local2)
                    While (LAnd (\_SB.PCI0.LPC.EC.PIBS, Local2))
                    {
                        Sleep (One)
                        Decrement (Local2)
                    }

                    If (Local2)
                    {
                        Store (One, \_SB.PCI0.LPC.EC.PLSL)
                        Store (MTAU, \_SB.PCI0.LPC.EC.PLTU)
                        Store (PL1L, \_SB.PCI0.LPC.EC.PLLS)
                        Store (PL1M, \_SB.PCI0.LPC.EC.PLMS)
                    }
                }
            }

            If (VIGD)
            {
                \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
                If (WVIS)
                {
                    VBTD ()
                }
            }
            Else
            {
                If (WVIS)
                {
                    \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
                    VBTD ()
                }
            }

            VCMS (One, \_SB.LID._LID ())
            AWON (Zero)
            If (CMPR)
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
                Store (Zero, CMPR) /* \CMPR */
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            NVSS (Zero)
            Store (Zero, \_SB.PCI0.LPC.EC.HSPA)
            Store (\_SB.PCI0.LPC.EC.ADP1._PSR (), PWRS) /* \PWRS */
            Store (Zero, FLPS) /* \FLPS */
            If (OSC4)
            {
                PNTF (0x81)
            }

            \_SB.PCI0.LPC.EC.ATMC ()
            If (LNot (NBCF))
            {
                If (VIGD)
                {
                    \_SB.PCI0.LPC.EC.BRNS ()
                }
                Else
                {
                    VBRC (BRLV)
                }
            }
        }

        If (XOr (\_SB.PCI0.EXP4.PDS, \_SB.PCI0.EXP4.PDSF))
        {
            Store (\_SB.PCI0.EXP4.PDS, \_SB.PCI0.EXP4.PDSF)
            Notify (\_SB.PCI0.EXP4, Zero) // Bus Check
        }

        \_SB.PCI0.LPC.EC.BATW (Arg0)
        \_SB.PCI0.LPC.EC.BWAK (Arg0)
        \_SB.PCI0.LPC.EC.HKEY.WGWK (Arg0)
        Notify (\_TZ.THM0, 0x80) // Thermal Status Change
        VSLD (\_SB.LID._LID ())
        If (VIGD)
        {
            \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
        }
        Else
        {
            If (WVIS)
            {
                \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
            }
        }

        If (LLess (Arg0, 0x04))
        {
            If (And (RRBF, 0x02))
            {
                ShiftLeft (Arg0, 0x08, Local0)
                Store (Or (0x2013, Local0), Local0)
                \_SB.PCI0.LPC.EC.HKEY.MHKQ (Local0)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (Zero, Local0)
            Store (CSUM (Zero), Local1)
            If (LNotEqual (Local1, CHKC))
            {
                Store (One, Local0)
                Store (Local1, CHKC) /* \CHKC */
            }

            Store (CSUM (One), Local1)
            If (LNotEqual (Local1, CHKE))
            {
                Store (One, Local0)
                Store (Local1, CHKE) /* \CHKE */
            }

            If (Local0)
            {
                Notify (_SB, Zero) // Bus Check
            }
        }

        \_SI._SST (One)
        Store (Zero, RRBF) /* \RRBF */
        Return (WAKI) /* \WAKI */
    }

    Scope (_SI)
    {
        Method (_SST, 1, NotSerialized)  // _SST: System Status
        {
            If (LEqual (Arg0, Zero))
            {
                \_SB.PCI0.LPC.EC.LED (Zero, Zero)
                \_SB.PCI0.LPC.EC.LED (0x07, Zero)
            }

            If (LEqual (Arg0, One))
            {
                If (LOr (SPS, WNTF))
                {
                    \_SB.PCI0.LPC.EC.BEEP (0x05)
                }

                \_SB.PCI0.LPC.EC.LED (Zero, 0x80)
                \_SB.PCI0.LPC.EC.LED (0x07, Zero)
            }

            If (LEqual (Arg0, 0x02))
            {
                \_SB.PCI0.LPC.EC.LED (Zero, 0xC0)
                \_SB.PCI0.LPC.EC.LED (0x07, 0xC0)
            }

            If (LEqual (Arg0, 0x03))
            {
                If (LGreater (SPS, 0x03))
                {
                    \_SB.PCI0.LPC.EC.BEEP (0x07)
                }
                Else
                {
                    If (LEqual (SPS, 0x03))
                    {
                        \_SB.PCI0.LPC.EC.BEEP (0x03)
                    }
                    Else
                    {
                        \_SB.PCI0.LPC.EC.BEEP (0x04)
                    }
                }

                If (LEqual (SPS, 0x03)) {}
                Else
                {
                    \_SB.PCI0.LPC.EC.LED (Zero, 0x80)
                }

                \_SB.PCI0.LPC.EC.LED (0x07, 0xC0)
                \_SB.PCI0.LPC.EC.LED (Zero, 0xC0)
            }

            If (LEqual (Arg0, 0x04))
            {
                \_SB.PCI0.LPC.EC.BEEP (0x03)
                \_SB.PCI0.LPC.EC.LED (0x07, 0xC0)
                \_SB.PCI0.LPC.EC.LED (Zero, 0xC0)
            }
        }
    }

    Scope (_GPE)
    {
        Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (B1B2 (\_SB.PCI0.LPC.EC.WAK0, \_SB.PCI0.LPC.EC.WAK1), Local0)
            Store (Local0, RRBF) /* \RRBF */
            Sleep (0x0A)
            If (And (Local0, 0x02)) {}
            If (And (Local0, 0x04))
            {
                Notify (\_SB.LID, 0x02) // Device Wake
            }

            If (And (Local0, 0x08))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If (And (Local0, 0x10))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If (And (Local0, 0x40)) {}
            If (And (Local0, 0x80))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (\_SB.PCI0.EXP1.PS)
            {
                Store (One, \_SB.PCI0.EXP1.PS)
                Store (One, \_SB.PCI0.EXP1.PMCS)
                Notify (\_SB.PCI0.EXP1, 0x02) // Device Wake
            }

            If (\_SB.PCI0.EXP2.PS)
            {
                Store (One, \_SB.PCI0.EXP2.PS)
                Store (One, \_SB.PCI0.EXP2.PMCS)
                Notify (\_SB.PCI0.EXP2, 0x02) // Device Wake
            }

            If (\_SB.PCI0.EXP4.PS)
            {
                Store (One, \_SB.PCI0.EXP4.PS)
                Store (One, \_SB.PCI0.EXP4.PMCS)
                Notify (\_SB.PCI0.EXP4, 0x02) // Device Wake
            }

            If (\_SB.PCI0.EXP5.PS)
            {
                Store (One, \_SB.PCI0.EXP5.PS)
                Store (One, \_SB.PCI0.EXP5.PMCS)
                Notify (\_SB.PCI0.EXP5, 0x02) // Device Wake
            }
        }

        Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (\_SB.PCI0.EXP4.HPCS)
            {
                Sleep (0x64)
                Store (One, \_SB.PCI0.EXP4.HPCS)
                If (\_SB.PCI0.EXP4.PDC)
                {
                    Store (One, \_SB.PCI0.EXP4.PDC)
                    Store (\_SB.PCI0.EXP4.PDS, \_SB.PCI0.EXP4.PDSF)
                    Notify (\_SB.PCI0.EXP4, Zero) // Bus Check
                }
            }
        }

        Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (Zero, \_SB.PCI0.LPC.SWGE)
            If (LAnd (CWUE, And (SWGP, 0x02)))
            {
                And (SWGP, 0xFFFFFFFD, SWGP) /* \SWGP */
                If (OSC4)
                {
                    PNTF (0x81)
                }
            }
        }

        Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (\_SB.PCI0.IGPU.GSSE)
            {
                \_SB.PCI0.IGPU.GSCI ()
            }
            Else
            {
                Store (One, \_SB.PCI0.LPC.SCIS)
            }
        }

        Method (_L16, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (\_SB.PCI0.PEG.VID.ISOP ())
            {
                If (LNot (\_SB.PCI0.LPC.XHPD))
                {
                    Notify (\_SB.PCI0.PEG.VID, 0x81) // Information Change
                }
            }

            XOr (\_SB.PCI0.LPC.XHPD, One, \_SB.PCI0.LPC.XHPD)
        }
    }

    Scope (_SB.PCI0.LPC.EC.HKEY)
    {
        Method (MHQT, 1, NotSerialized)
        {
            If (LAnd (WNTF, TATC))
            {
                If (LEqual (Arg0, Zero))
                {
                    Store (TATC, Local0)
                    Return (Local0)
                }
                Else
                {
                    If (LEqual (Arg0, One))
                    {
                        Store (TDFA, Local0)
                        Add (Local0, ShiftLeft (TDTA, 0x04), Local0)
                        Add (Local0, ShiftLeft (TDFD, 0x08), Local0)
                        Add (Local0, ShiftLeft (TDTD, 0x0C), Local0)
                        Add (Local0, ShiftLeft (TNFT, 0x10), Local0)
                        Add (Local0, ShiftLeft (TNTT, 0x14), Local0)
                        Return (Local0)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            Store (TCFA, Local0)
                            Add (Local0, ShiftLeft (TCTA, 0x04), Local0)
                            Add (Local0, ShiftLeft (TCFD, 0x08), Local0)
                            Add (Local0, ShiftLeft (TCTD, 0x0C), Local0)
                            Return (Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x03)) {}
                            Else
                            {
                                If (LEqual (Arg0, 0x04))
                                {
                                    Store (TATW, Local0)
                                    Return (Local0)
                                }
                                Else
                                {
                                    Noop
                                }
                            }
                        }
                    }
                }
            }

            Return (Zero)
        }

        Method (MHAT, 1, NotSerialized)
        {
            If (LAnd (WNTF, TATC))
            {
                Store (And (Arg0, 0xFF), Local0)
                If (LNot (ATMV (Local0)))
                {
                    Return (Zero)
                }

                Store (And (ShiftRight (Arg0, 0x08), 0xFF), Local0)
                If (LNot (ATMV (Local0)))
                {
                    Return (Zero)
                }

                Store (And (Arg0, 0x0F), TCFA) /* \TCFA */
                Store (And (ShiftRight (Arg0, 0x04), 0x0F), TCTA) /* \TCTA */
                Store (And (ShiftRight (Arg0, 0x08), 0x0F), TCFD) /* \TCFD */
                Store (And (ShiftRight (Arg0, 0x0C), 0x0F), TCTD) /* \TCTD */
                ATMC ()
                If (And (PPMF, 0x80))
                {
                    Store (FTPS, Local1)
                    If (And (Arg0, 0x00010000))
                    {
                        Store (One, FTPS) /* \FTPS */
                    }
                    Else
                    {
                        Store (Zero, FTPS) /* \FTPS */
                    }

                    If (XOr (FTPS, Local1))
                    {
                        If (OSPX)
                        {
                            PNTF (0x80)
                        }
                    }
                }

                Store (SCRM, Local2)
                If (And (Arg0, 0x00040000))
                {
                    Store (One, SCRM) /* \SCRM */
                    Store (0x07, HFSP) /* \_SB_.PCI0.LPC_.EC__.HFSP */
                }
                Else
                {
                    Store (Zero, SCRM) /* \SCRM */
                    Store (0x80, HFSP) /* \_SB_.PCI0.LPC_.EC__.HFSP */
                }

                Store (ETAU, Local3)
                If (And (Arg0, 0x00020000))
                {
                    Store (One, ETAU) /* \ETAU */
                }
                Else
                {
                    Store (Zero, ETAU) /* \ETAU */
                }

                If (MTAU)
                {
                    If (LOr (XOr (SCRM, Local2), XOr (ETAU, Local3)))
                    {
                        Store (0x03E8, Local4)
                        While (PIBS)
                        {
                            Sleep (One)
                            Decrement (Local4)
                            If (LNot (Local4))
                            {
                                Return (Zero)
                            }
                        }

                        Store (One, PLSL) /* \_SB_.PCI0.LPC_.EC__.PLSL */
                        If (And (Arg0, 0x00060000))
                        {
                            Store (MTAU, PLTU) /* \_SB_.PCI0.LPC_.EC__.PLTU */
                        }
                        Else
                        {
                            Store (0x1C, PLTU) /* \_SB_.PCI0.LPC_.EC__.PLTU */
                        }

                        Store (PL1L, PLLS) /* \_SB_.PCI0.LPC_.EC__.PLLS */
                        Store (PL1M, PLMS) /* \_SB_.PCI0.LPC_.EC__.PLMS */
                    }
                }

                Return (One)
            }

            Return (Zero)
        }

        Method (MHGT, 1, NotSerialized)
        {
            If (LAnd (WNTF, TATC))
            {
                Store (0x01000000, Local0)
                If (And (PPMF, 0x80))
                {
                    Or (Local0, 0x08000000, Local0)
                }

                If (SCRM)
                {
                    Or (Local0, 0x10000000, Local0)
                }

                If (ETAU)
                {
                    Or (Local0, 0x04000000, Local0)
                }

                If (FTPS)
                {
                    Or (Local0, 0x02000000, Local0)
                }

                Add (Local0, ShiftLeft (TSFT, 0x10), Local0)
                Add (Local0, ShiftLeft (TSTT, 0x14), Local0)
                Store (And (Arg0, 0xFF), Local1)
                If (LNot (ATMV (Local1)))
                {
                    Or (Local0, 0xFFFF, Local0)
                    Return (Local0)
                }

                Store (And (Arg0, 0x0F), Local1)
                If (LEqual (Local1, Zero))
                {
                    Add (Local0, TIF0, Local0)
                }
                Else
                {
                    If (LEqual (Local1, One))
                    {
                        Add (Local0, TIF1, Local0)
                    }
                    Else
                    {
                        If (LEqual (Local1, 0x02))
                        {
                            Add (Local0, TIF2, Local0)
                        }
                        Else
                        {
                            Add (Local0, 0xFF, Local0)
                        }
                    }
                }

                Store (And (ShiftRight (Arg0, 0x04), 0x0F), Local1)
                If (LEqual (Local1, Zero))
                {
                    Add (Local0, ShiftLeft (TIT0, 0x08), Local0)
                }
                Else
                {
                    If (LEqual (Local1, One))
                    {
                        Add (Local0, ShiftLeft (TIT1, 0x08), Local0)
                    }
                    Else
                    {
                        If (LEqual (Local1, 0x02))
                        {
                            Add (Local0, ShiftLeft (TIT2, 0x08), Local0)
                        }
                        Else
                        {
                            Add (Local0, 0xFF00, Local0)
                        }
                    }
                }

                Return (Local0)
            }

            Return (Zero)
        }

        Method (ATMV, 1, NotSerialized)
        {
            Store (And (Arg0, 0x0F), Local1)
            Store (TNFT, Local0)
            If (LGreaterEqual (Local1, Local0))
            {
                Return (Zero)
            }

            Store (And (ShiftRight (Arg0, 0x04), 0x0F), Local2)
            Store (TNTT, Local0)
            If (LGreaterEqual (Local2, Local0))
            {
                Return (Zero)
            }

            If (TATL)
            {
                If (XOr (Local1, Local2))
                {
                    Return (Zero)
                }
            }

            Return (One)
        }

        Method (MHST, 0, NotSerialized)
        {
            Store (B1B2 (SPD0, SPD1), Local0)
            Return (Local0)
        }

        Method (MHTT, 0, NotSerialized)
        {
            Acquire (BFWM, 0xFFFF)
            GCTP ()
            CreateByteField (BFWB, 0x03, TMP3)
            CreateByteField (BFWB, 0x0B, TMPB)
            If (VIGD)
            {
                Store (Zero, Local0)
            }
            Else
            {
                Store (TMP3, Local0)
                ShiftLeft (Local0, 0x08, Local0)
            }

            Or (Local0, TMPB, Local0)
            ShiftLeft (Local0, 0x08, Local0)
            Or (Local0, TMP0, Local0)
            Release (BFWM)
            Return (Local0)
        }

        Method (MHBT, 0, NotSerialized)
        {
            Name (ABUF, Buffer (0x10) {})
            ATMS (Zero)
            Store (ATMB, ABUF) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHBT.ABUF */
            Return (ABUF) /* \_SB_.PCI0.LPC_.EC__.HKEY.MHBT.ABUF */
        }

        Method (MHFT, 1, NotSerialized)
        {
            FSCT (Arg0)
        }

        Method (MHCT, 1, NotSerialized)
        {
            Store (Zero, Local0)
            If (SPEN)
            {
                Store (LWST, Local0)
                Increment (Local0)
                ShiftLeft (Local0, 0x08, Local0)
            }

            Store (0x08, Local1)
            ShiftLeft (Local1, 0x08, Local1)
            If (LEqual (Arg0, Ones))
            {
                Or (Local1, TPCR, Local1)
                If (SPEN)
                {
                    Or (Local0, PPCR, Local0)
                    If (LNot (LAnd (PPMF, 0x02000000)))
                    {
                        Or (Local1, 0x80, Local1)
                    }

                    If (LNot (LAnd (PPMF, 0x08000000)))
                    {
                        Or (Local1, 0x40, Local1)
                    }
                }
                Else
                {
                    Or (Local1, 0xC0, Local1)
                }
            }
            Else
            {
                If (LAnd (OSPX, SPEN))
                {
                    And (Arg0, 0x00FF0000, Local2)
                    ShiftRight (Local2, 0x10, Local2)
                    Or (Local0, Local2, Local0)
                    If (XOr (Local2, PPCR))
                    {
                        Store (Local2, PPCA) /* \PPCA */
                        PNTF (0x80)
                    }
                }

                If (WVIS)
                {
                    And (Arg0, 0x1F, Local2)
                    Or (Local1, Local2, Local1)
                    If (XOr (Local2, TPCR))
                    {
                        Store (Local2, TPCA) /* \TPCA */
                        PNTF (0x82)
                    }
                }
            }

            ShiftLeft (Local0, 0x10, Local0)
            Or (Local0, Local1, Local0)
            Return (Local0)
        }
    }

    Scope (_SB.PCI0.LPC.EC)
    {
        Method (ATMC, 0, NotSerialized)
        {
            If (LAnd (WNTF, TATC))
            {
                If (HPAC)
                {
                    Store (TCFA, Local0)
                    Store (TCTA, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), Local2)
                    XOr (Local2, ATMX, Local3)
                    Store (Local2, ATMX) /* \_SB_.PCI0.LPC_.EC__.ATMX */
                    If (LEqual (TCTA, Zero))
                    {
                        Store (TCR0, TCRT) /* \TCRT */
                        Store (TPS0, TPSV) /* \TPSV */
                    }
                    Else
                    {
                        If (LEqual (TCTA, One))
                        {
                            Store (TCR1, TCRT) /* \TCRT */
                            Store (TPS1, TPSV) /* \TPSV */
                        }
                        Else
                        {
                        }
                    }
                }
                Else
                {
                    Store (TCFD, Local0)
                    Store (TCTD, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), Local2)
                    XOr (Local2, ATMX, Local3)
                    Store (Local2, ATMX) /* \_SB_.PCI0.LPC_.EC__.ATMX */
                    If (LEqual (TCTD, Zero))
                    {
                        Store (TCR0, TCRT) /* \TCRT */
                        Store (TPS0, TPSV) /* \TPSV */
                    }
                    Else
                    {
                        If (LEqual (TCTD, One))
                        {
                            Store (TCR1, TCRT) /* \TCRT */
                            Store (TPS1, TPSV) /* \TPSV */
                        }
                        Else
                        {
                        }
                    }
                }

                If (Local3)
                {
                    If (^HKEY.DHKC)
                    {
                        ^HKEY.MHKQ (0x6030)
                    }
                }

                Notify (\_TZ.THM0, 0x81) // Thermal Trip Point Change
            }
        }
    }

    Scope (_TZ)
    {
        ThermalZone (THM0)
        {
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (TCRT) /* \TCRT */
            }

            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (TPSV) /* \TPSV */
            }

            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (TTC1) /* \TTC1 */
            }

            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (TTC2) /* \TTC2 */
            }

            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (TTSP) /* \TTSP */
            }

            Method (_PSL, 0, NotSerialized)  // _PSL: Passive List
            {
                If (And (PPMF, 0x01000000))
                {
                    If (LEqual (PNHM, 0x000106E0))
                    {
                        Return (Package (0x08)
                        {
                            \_PR.CPU0, 
                            \_PR.CPU1, 
                            \_PR.CPU2, 
                            \_PR.CPU3, 
                            \_PR.CPU4, 
                            \_PR.CPU5, 
                            \_PR.CPU6, 
                            \_PR.CPU7
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            \_PR.CPU0, 
                            \_PR.CPU1, 
                            \_PR.CPU2, 
                            \_PR.CPU3
                        })
                    }
                }

                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }

            Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
            {
                If (H8DR)
                {
                    Store (\_SB.PCI0.LPC.EC.TMP0, Local0)
                    Store (\_SB.PCI0.LPC.EC.TSL2, Local1)
                    Store (\_SB.PCI0.LPC.EC.TSL3, Local2)
                }
                Else
                {
                    Store (RBEC (0x78), Local0)
                    Store (And (RBEC (0x8A), 0x7F), Local1)
                    Store (And (RBEC (0x8B), 0x7F), Local2)
                }

                If (LEqual (Local0, 0x80))
                {
                    Store (0x30, Local0)
                }

                If (Local2)
                {
                    Return (C2K (0x80))
                }

                If (LNot (\_SB.PCI0.LPC.EC.HKEY.DHKC))
                {
                    If (Local1)
                    {
                        Return (C2K (0x80))
                    }
                }

                Return (C2K (Local0))
            }
        }

        Method (C2K, 1, NotSerialized)
        {
            Add (Multiply (Arg0, 0x0A), 0x0AAC, Local0)
            If (LLessEqual (Local0, 0x0AAC))
            {
                Store (0x0BB8, Local0)
            }

            If (LGreater (Local0, 0x0FAC))
            {
                Store (0x0BB8, Local0)
            }

            Return (Local0)
        }
    }

    Scope (_SB.PCI0.LPC.EC)
    {
        Method (_Q40, 0, NotSerialized)  // _Qxx: EC Query
        {
            Notify (\_TZ.THM0, 0x80) // Thermal Status Change
            If (H8DR)
            {
                Store (TSL2, Local1)
            }
            Else
            {
                Store (And (RBEC (0x8A), 0x7F), Local1)
            }

            If (^HKEY.DHKC)
            {
                If (Local1)
                {
                    ^HKEY.MHKQ (0x6022)
                }
            }

            If (VIGD)
            {
                Noop
            }
            Else
            {
                VTHR ()
            }

            If (And (PPMF, One))
            {
                If (OSPX)
                {
                    PNTF (0x80)
                }
                Else
                {
                    Store (And (TSL0, 0x77), Local2)
                    If (Local2)
                    {
                        STEP (0x09)
                    }
                    Else
                    {
                        STEP (0x0A)
                    }
                }
            }
        }
    }

    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC) /* \GPIC */
    }

    OperationRegion (SMI0, SystemIO, 0xB2, One)
    Field (SMI0, ByteAcc, NoLock, Preserve)
    {
        APMC,   8
    }

    Field (MNVS, AnyAcc, NoLock, Preserve)
    {
        Offset (0xFC0), 
        CMD,    8, 
        ERR,    32, 
        PAR0,   32, 
        PAR1,   32, 
        PAR2,   32, 
        PAR3,   32
    }

    Mutex (MSMI, 0x00)
    Method (SMI, 5, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg0, CMD) /* \CMD_ */
        Store (Arg1, PAR0) /* \PAR0 */
        Store (Arg2, PAR1) /* \PAR1 */
        Store (Arg3, PAR2) /* \PAR2 */
        Store (Arg4, PAR3) /* \PAR3 */
        Store (0xF5, APMC) /* \APMC */
        While (LEqual (ERR, One))
        {
            Sleep (0x64)
            Store (0xF5, APMC) /* \APMC */
        }

        Store (PAR0, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (RPCI, 1, NotSerialized)
    {
        Return (SMI (Zero, Zero, Arg0, Zero, Zero))
    }

    Method (WPCI, 2, NotSerialized)
    {
        SMI (Zero, One, Arg0, Arg1, Zero)
    }

    Method (MPCI, 3, NotSerialized)
    {
        SMI (Zero, 0x02, Arg0, Arg1, Arg2)
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (SMI (Zero, 0x03, Arg0, Zero, Zero))
    }

    Method (WBEC, 2, NotSerialized)
    {
        SMI (Zero, 0x04, Arg0, Arg1, Zero)
    }

    Method (MBEC, 3, NotSerialized)
    {
        SMI (Zero, 0x05, Arg0, Arg1, Arg2)
    }

    Method (RISA, 1, NotSerialized)
    {
        Return (SMI (Zero, 0x06, Arg0, Zero, Zero))
    }

    Method (WISA, 2, NotSerialized)
    {
        SMI (Zero, 0x07, Arg0, Arg1, Zero)
    }

    Method (MISA, 3, NotSerialized)
    {
        SMI (Zero, 0x08, Arg0, Arg1, Arg2)
    }

    Method (VEXP, 0, NotSerialized)
    {
        SMI (One, Zero, Zero, Zero, Zero)
    }

    Method (VUPS, 1, NotSerialized)
    {
        SMI (One, One, Arg0, Zero, Zero)
    }

    Method (VSDS, 2, NotSerialized)
    {
        SMI (One, 0x02, Arg0, Arg1, Zero)
    }

    Method (VDDC, 0, NotSerialized)
    {
        SMI (One, 0x03, Zero, Zero, Zero)
    }

    Method (VVPD, 1, NotSerialized)
    {
        SMI (One, 0x04, Arg0, Zero, Zero)
    }

    Method (VNRS, 1, NotSerialized)
    {
        SMI (One, 0x05, Arg0, Zero, Zero)
    }

    Method (GLPW, 0, NotSerialized)
    {
        Return (SMI (One, 0x06, Zero, Zero, Zero))
    }

    Method (VSLD, 1, NotSerialized)
    {
        SMI (One, 0x07, Arg0, Zero, Zero)
    }

    Method (VEVT, 1, NotSerialized)
    {
        Return (SMI (One, 0x08, Arg0, Zero, Zero))
    }

    Method (VTHR, 0, NotSerialized)
    {
        Return (SMI (One, 0x09, Zero, Zero, Zero))
    }

    Method (VBRC, 1, NotSerialized)
    {
        SMI (One, 0x0A, Arg0, Zero, Zero)
    }

    Method (VBRG, 0, NotSerialized)
    {
        Return (SMI (One, 0x0E, Zero, Zero, Zero))
    }

    Method (VCMS, 2, NotSerialized)
    {
        Return (SMI (One, 0x0B, Arg0, Arg1, Zero))
    }

    Method (VBTD, 0, NotSerialized)
    {
        Return (SMI (One, 0x0F, Zero, Zero, Zero))
    }

    Method (VHYB, 2, NotSerialized)
    {
        Return (SMI (One, 0x10, Arg0, Arg1, Zero))
    }

    Method (VDYN, 2, NotSerialized)
    {
        Return (SMI (One, 0x11, Arg0, Arg1, Zero))
    }

    Method (UCMS, 1, NotSerialized)
    {
        Return (SMI (0x02, Arg0, Zero, Zero, Zero))
    }

    Method (BHDP, 2, NotSerialized)
    {
        Return (SMI (0x03, Zero, Arg0, Arg1, Zero))
    }

    Method (STEP, 1, NotSerialized)
    {
        SMI (0x04, Arg0, Zero, Zero, Zero)
    }

    Method (TRAP, 0, NotSerialized)
    {
        SMI (0x05, Zero, Zero, Zero, Zero)
    }

    Method (CBRI, 0, NotSerialized)
    {
        SMI (0x05, One, Zero, Zero, Zero)
    }

    Method (BCHK, 0, NotSerialized)
    {
        Return (SMI (0x05, 0x04, Zero, Zero, Zero))
    }

    Method (BYRS, 0, NotSerialized)
    {
        SMI (0x05, 0x05, Zero, Zero, Zero)
    }

    Method (LCHK, 1, NotSerialized)
    {
        Return (SMI (0x05, 0x06, Arg0, Zero, Zero))
    }

    Method (BLTH, 1, NotSerialized)
    {
        Return (SMI (0x06, Arg0, Zero, Zero, Zero))
    }

    Method (PRSM, 2, NotSerialized)
    {
        Return (SMI (0x07, Zero, Arg0, Arg1, Zero))
    }

    Method (WGSV, 1, NotSerialized)
    {
        Return (SMI (0x09, Arg0, Zero, Zero, Zero))
    }

    Method (ATMS, 1, NotSerialized)
    {
        Return (SMI (0x0A, Zero, Zero, Zero, Zero))
    }

    Method (FSCT, 1, NotSerialized)
    {
        Return (SMI (0x0A, One, Arg0, Zero, Zero))
    }

    Method (SWTT, 1, NotSerialized)
    {
        If (SMI (0x0A, 0x02, Arg0, Zero, Zero))
        {
            If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
            {
                \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6030)
            }
        }
    }

    Method (GCTP, 0, NotSerialized)
    {
        SMI (0x0A, 0x03, Zero, Zero, Zero)
    }

    Method (FERL, 0, NotSerialized)
    {
        SMI (0x0A, 0x04, Zero, Zero, Zero)
    }

    Method (TPHY, 1, NotSerialized)
    {
        SMI (0x0C, Arg0, Zero, Zero, Zero)
    }

    Method (CSUM, 1, NotSerialized)
    {
        Return (SMI (0x0E, Arg0, Zero, Zero, Zero))
    }

    Method (NVSS, 1, NotSerialized)
    {
        Return (SMI (0x0F, Arg0, Zero, Zero, Zero))
    }

    Method (WMIS, 2, NotSerialized)
    {
        Return (SMI (0x10, Arg0, Arg1, Zero, Zero))
    }

    Method (AWON, 1, NotSerialized)
    {
        Return (SMI (0x12, Arg0, Zero, Zero, Zero))
    }

    Method (PMON, 2, NotSerialized)
    {
        Store (SizeOf (Arg0), Local0)
        Name (TSTR, Buffer (Local0) {})
        Store (Arg0, TSTR) /* \PMON.TSTR */
        Store (TSTR, DBGS) /* \DBGS */
        SMI (0x11, Arg1, Zero, Zero, Zero)
    }

    Method (UAWS, 1, NotSerialized)
    {
        Return (SMI (0x13, Arg0, Zero, Zero, Zero))
    }

    Method (BFWC, 1, NotSerialized)
    {
        Return (SMI (0x14, Zero, Arg0, Zero, Zero))
    }

    Method (BFWP, 0, NotSerialized)
    {
        Return (SMI (0x14, One, Zero, Zero, Zero))
    }

    Method (BFWL, 0, NotSerialized)
    {
        SMI (0x14, 0x02, Zero, Zero, Zero)
    }

    Method (BFWG, 1, NotSerialized)
    {
        SMI (0x14, 0x03, Arg0, Zero, Zero)
    }

    Method (BDMC, 1, NotSerialized)
    {
        SMI (0x14, 0x04, Arg0, Zero, Zero)
    }

    Method (PSIF, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x05, Arg0, Arg1, Zero))
    }

    Method (FNSC, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x06, Arg0, Arg1, Zero))
    }

    Method (AUDC, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x07, Arg0, Arg1, Zero))
    }

    Method (SYBC, 2, NotSerialized)
    {
        Return (SMI (0x14, 0x08, Arg0, Arg1, Zero))
    }

    Method (DPIO, 2, NotSerialized)
    {
        If (LNot (Arg0))
        {
            Return (Zero)
        }

        If (LGreater (Arg0, 0xF0))
        {
            Return (Zero)
        }

        If (LGreater (Arg0, 0xB4))
        {
            If (Arg1)
            {
                Return (0x02)
            }
            Else
            {
                Return (One)
            }
        }

        If (LGreater (Arg0, 0x78))
        {
            Return (0x03)
        }

        Return (0x04)
    }

    Method (DUDM, 2, NotSerialized)
    {
        If (LNot (Arg1))
        {
            Return (0xFF)
        }

        If (LGreater (Arg0, 0x5A))
        {
            Return (Zero)
        }

        If (LGreater (Arg0, 0x3C))
        {
            Return (One)
        }

        If (LGreater (Arg0, 0x2D))
        {
            Return (0x02)
        }

        If (LGreater (Arg0, 0x1E))
        {
            Return (0x03)
        }

        If (LGreater (Arg0, 0x14))
        {
            Return (0x04)
        }

        Return (0x05)
    }

    Method (DMDM, 2, NotSerialized)
    {
        If (Arg1)
        {
            Return (Zero)
        }

        If (LNot (Arg0))
        {
            Return (Zero)
        }

        If (LGreater (Arg0, 0x96))
        {
            Return (One)
        }

        If (LGreater (Arg0, 0x78))
        {
            Return (0x02)
        }

        Return (0x03)
    }

    Method (UUDM, 2, NotSerialized)
    {
        If (LNot (And (Arg0, 0x04)))
        {
            Return (Zero)
        }

        If (And (Arg1, 0x20))
        {
            Return (0x14)
        }

        If (And (Arg1, 0x10))
        {
            Return (0x1E)
        }

        If (And (Arg1, 0x08))
        {
            Return (0x2D)
        }

        If (And (Arg1, 0x04))
        {
            Return (0x3C)
        }

        If (And (Arg1, 0x02))
        {
            Return (0x5A)
        }

        If (And (Arg1, One))
        {
            Return (0x78)
        }

        Return (Zero)
    }

    Method (UMDM, 4, NotSerialized)
    {
        If (LNot (And (Arg0, 0x02)))
        {
            Return (Zero)
        }

        If (And (Arg1, 0x04))
        {
            Return (Arg3)
        }

        If (And (Arg1, 0x02))
        {
            If (LLessEqual (Arg3, 0x78))
            {
                Return (0xB4)
            }
            Else
            {
                Return (Arg3)
            }
        }

        If (And (Arg2, 0x04))
        {
            If (LLessEqual (Arg3, 0xB4))
            {
                Return (0xF0)
            }
            Else
            {
                Return (Arg3)
            }
        }

        Return (Zero)
    }

    Method (UPIO, 4, NotSerialized)
    {
        If (LNot (And (Arg0, 0x02)))
        {
            If (LEqual (Arg2, 0x02))
            {
                Return (0xF0)
            }
            Else
            {
                Return (0x0384)
            }
        }

        If (And (Arg1, 0x02))
        {
            Return (Arg3)
        }

        If (And (Arg1, One))
        {
            If (LLessEqual (Arg3, 0x78))
            {
                Return (0xB4)
            }
            Else
            {
                Return (Arg3)
            }
        }

        If (LEqual (Arg2, 0x02))
        {
            Return (0xF0)
        }
        Else
        {
            Return (0x0384)
        }
    }

    Method (FDMA, 2, NotSerialized)
    {
        If (LNotEqual (Arg1, 0xFF))
        {
            Return (Or (Arg1, 0x40))
        }

        If (LGreaterEqual (Arg0, 0x03))
        {
            Return (Or (Subtract (Arg0, 0x02), 0x20))
        }

        If (Arg0)
        {
            Return (0x12)
        }

        Return (Zero)
    }

    Method (FPIO, 1, NotSerialized)
    {
        If (LGreaterEqual (Arg0, 0x03))
        {
            Return (Or (Arg0, 0x08))
        }

        If (LEqual (Arg0, One))
        {
            Return (One)
        }

        Return (Zero)
    }

    Method (SCMP, 2, NotSerialized)
    {
        Store (SizeOf (Arg0), Local0)
        If (LNotEqual (Local0, SizeOf (Arg1)))
        {
            Return (One)
        }

        Increment (Local0)
        Name (STR1, Buffer (Local0) {})
        Name (STR2, Buffer (Local0) {})
        Store (Arg0, STR1) /* \SCMP.STR1 */
        Store (Arg1, STR2) /* \SCMP.STR2 */
        Store (Zero, Local1)
        While (LLess (Local1, Local0))
        {
            Store (DerefOf (Index (STR1, Local1)), Local2)
            Store (DerefOf (Index (STR2, Local1)), Local3)
            If (LNotEqual (Local2, Local3))
            {
                Return (One)
            }

            Increment (Local1)
        }

        Return (Zero)
    }

    Name (SPS, Zero)
    Name (OSIF, Zero)
    Name (WNTF, Zero)
    Name (WXPF, Zero)
    Name (WVIS, Zero)
    Name (WIN7, Zero)
    Name (WIN8, Zero)
    Name (WSPV, Zero)
    Name (LNUX, Zero)
    Name (H8DR, Zero)
    Name (MEMX, Zero)
    Name (OCST, Zero)
    Name (FNID, Zero)
    Name (RRBF, Zero)
    Name (NBCF, Zero)
    Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (One)
                        {
                             0x03                                             /* . */
                        }, Arg4)
                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (One)
            {
                 0x00                                             /* . */
            }, Arg4)
        Return (Zero)
    }

    Method (B1B2, 2, NotSerialized)
    {
        Return (Or (Arg0, ShiftLeft (Arg1, 0x08)))
    }

    Method (B1B4, 4, NotSerialized)
    {
        Store (Arg3, Local0)
        Or (Arg2, ShiftLeft (Local0, 0x08), Local0)
        Or (Arg1, ShiftLeft (Local0, 0x08), Local0)
        Or (Arg0, ShiftLeft (Local0, 0x08), Local0)
        Return (Local0)
    }

}

