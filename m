Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:45596 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1756354Ab0IZOPV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Sep 2010 10:15:21 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Sun, 26 Sep 2010 07:15:14 -0700
Date: Sun, 26 Sep 2010 07:15:14 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: "make randconfig" gives a looong warning
Message-Id: <20100926071514.dd823884.rdunlap@xenotime.net>
In-Reply-To: <201009261059.55952.toralf.foerster@gmx.de>
References: <201009261059.55952.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Toralf =?ISO-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
Cc: linux-kbuild@vger.kernel.org

On Sun, 26 Sep 2010 10:59:55 +0200 Toralf Förster wrote:

> Hello,
> 
> for a longer time I didn't run ma QA script and now I'm wondering whether this 
> message is worth to be reported or not :
> 
>  make randconfig ...
> warning: (PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || 
> ARCH_HIBERNATION_POSSIBLE) && PM_SLEEP) selects HOTPLUG_CPU which has unmet 
> direct dependencies (SMP && HOTPLUG)
> warning: (MICROCODE || MICROCODE_INTEL && MICROCODE || MICROCODE_AMD && 
> MICROCODE || PCMCIA_LOAD_CIS && PCCARD && PCMCIA && EXPERIMENTAL || USB_IRDA 
> && NET && IRDA && USB || BT_HCIBCM203X && NET && BT && USB || BT_HCIBFUSB && 
> NET && BT && USB || BT_HCIBT3C && NET && BT && PCMCIA || BT_MRVL_SDIO && NET 
> && BT && BT_MRVL && MMC || BT_ATH3K && NET && BT && BT_HCIBTUSB || IWMC3200TOP 
> && MISC_DEVICES && MMC && EXPERIMENTAL || SCSI_AIC94XX && SCSI_LOWLEVEL && 
> SCSI && PCI || SCSI_MVSAS && SCSI_LOWLEVEL && SCSI && PCI || SCSI_IPR && 
> SCSI_LOWLEVEL && PCI && SCSI && ATA || SCSI_QLA_FC && SCSI_LOWLEVEL && PCI && 
> SCSI || BNX2 && NETDEVICES && NETDEV_1000 && PCI || SPIDER_NET && NETDEVICES 
> && NETDEV_1000 && PCI && (PPC_IBM_CELL_BLADE || PPC_CELLEB) || CHELSIO_T3 && 
> NETDEVICES && NETDEV_10000 && CHELSIO_T3_DEPENDS || CHELSIO_T4 && NETDEVICES 
> && NETDEV_10000 && CHELSIO_T4_DEPENDS || MYRI10GE && NETDEVICES && 
> NETDEV_10000 && PCI && INET || NETXEN_NIC && NETDEVICES && NETDEV_10000 && PCI 
> || BNX2X && NETDEVICES && NETDEV_10000 && PCI || QLCNIC && NETDEVICES && 
> NETDEV_10000 && PCI || TMS380TR && NETDEVICES && TR && (PCI || ISA && 
> ISA_DMA_API || MCA) || LIBERTAS_THINFIRM && NETDEVICES && WLAN && MAC80211 || 
> ATMEL && NETDEVICES && WLAN && (PCI || PCMCIA) || PCMCIA_ATMEL && NETDEVICES 
> && WLAN && ATMEL && PCMCIA || AT76C50X_USB && NETDEVICES && WLAN && MAC80211 
> && USB || PRISM54 && NETDEVICES && WLAN && PCI && EXPERIMENTAL || USB_ZD1201 
> && NETDEVICES && WLAN && USB || B43 && NETDEVICES && WLAN && SSB_POSSIBLE && 
> MAC80211 && HAS_DMA || B43LEGACY && NETDEVICES && WLAN && SSB_POSSIBLE && 
> MAC80211 && HAS_DMA || IPW2100 && NETDEVICES && WLAN && PCI && CFG80211 || 
> IPW2200 && NETDEVICES && WLAN && PCI && CFG80211 && CFG80211_WEXT || IWLWIFI 
> && NETDEVICES && WLAN && PCI && MAC80211 || IWM && NETDEVICES && WLAN && MMC 
> && EXPERIMENTAL && CFG80211 || LIBERTAS && NETDEVICES && WLAN && CFG80211 || 
> HERMES && NETDEVICES && WLAN && (PPC_PMAC || PCI || PCMCIA) && CFG80211 && 
> CFG80211_WEXT || ORINOCO_USB && NETDEVICES && WLAN && USB && HERMES || 
> P54_COMMON && NETDEVICES && WLAN && MAC80211 && EXPERIMENTAL || WL1251 && 
> NETDEVICES && WLAN && WL12XX && GENERIC_HARDIRQS || WL1271 && NETDEVICES && 
> WLAN && WL12XX && GENERIC_HARDIRQS && INET || ZD1211RW && NETDEVICES && WLAN 
> && USB && MAC80211 && EXPERIMENTAL || AR9170_USB && NETDEVICES && WLAN && 
> ATH_COMMON && USB && MAC80211 || RT2X00_LIB_FIRMWARE && NETDEVICES && WLAN && 
> RT2X00 || WIMAX_I2400M && NETDEVICES && WIMAX || ATM_FORE200E && ATM_DRIVERS 
> && NETDEVICES && ATM && (PCI || SBUS) || ATM_SOLOS && ATM_DRIVERS && 
> NETDEVICES && ATM && PCI || CYCLADES && SERIAL_NONSTANDARD && (PCI || ISA) || 
> MOXA_INTELLIO && SERIAL_NONSTANDARD && (ISA || EISA || PCI) || ISI && 
> SERIAL_NONSTANDARD && PCI || SERIAL_ICOM && HAS_IOMEM && PCI && (PPC_ISERIES 
> || PPC_PSERIES) || SERIAL_QE && HAS_IOMEM && QUICC_ENGINE || VIDEO_SAA7164 && 
> MEDIA_SUPPORT && VIDEO_CAPTURE_DRIVERS && VIDEO_V4L2 && DVB_CORE && PCI && I2C 
> || DVB_LGS8GXX && MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_FE_CUSTOMISE && 
> DVB_CORE && I2C || DRM_R128 && HAS_IOMEM && DRM && PCI || DRM_RADEON && 
> HAS_IOMEM && DRM && PCI || DRM_MGA && HAS_IOMEM && DRM && PCI || SND_SB16_CSP 
> && SOUND && !M68K && SND && SND_ISA && (SND_SB16 || SND_SBAWE) && (BROKEN || 
> !PPC) || SND_SSCAPE && SOUND && !M68K && SND && SND_ISA || SND_WAVEFRONT && 
> SOUND && !M68K && SND && SND_ISA || SND_MSND_PINNACLE && SOUND && !M68K && SND 
> && SND_ISA && X86 && EXPERIMENTAL || SND_MSND_CLASSIC && SOUND && !M68K && SND 
> && SND_ISA && X86 && EXPERIMENTAL || SND_ASIHPI && SOUND && !M68K && SND && 
> SND_PCI && X86 || SND_DARLA20 && SOUND && !M68K && SND && SND_PCI || 
> SND_GINA20 && SOUND && !M68K && SND && SND_PCI || SND_LAYLA20 && SOUND && 
> !M68K && SND && SND_PCI || SND_DARLA24 && SOUND && !M68K && SND && SND_PCI || 
> SND_GINA24 && SOUND && !M68K && SND && SND_PCI || SND_LAYLA24 && SOUND && 
> !M68K && SND && SND_PCI || SND_MONA && SOUND && !M68K && SND && SND_PCI || 
> SND_MIA && SOUND && !M68K && SND && SND_PCI || SND_ECHO3G && SOUND && !M68K && 
> SND && SND_PCI || SND_INDIGO && SOUND && !M68K && SND && SND_PCI || 
> SND_INDIGOIO && SOUND && !M68K && SND && SND_PCI || SND_INDIGODJ && SOUND && 
> !M68K && SND && SND_PCI || SND_INDIGOIOX && SOUND && !M68K && SND && SND_PCI 
> || SND_INDIGODJX && SOUND && !M68K && SND && SND_PCI || SND_EMU10K1 && SOUND 
> && !M68K && SND && SND_PCI || SND_RIPTIDE && SOUND && !M68K && SND && SND_PCI 
> || SND_HDA_PATCH_LOADER && SOUND && !M68K && SND && SND_PCI && SND_HDA_INTEL 
> && EXPERIMENTAL || SND_SOC_SH4_SIU && SOUND && !M68K && SND && SND_SOC && 
> (SUPERH || ARCH_SHMOBILE) && HAVE_CLK || USB_ISIGHTFW && USB_SUPPORT && USB || 
> USB_SPEEDTOUCH && USB_SUPPORT && USB_ATM || USB_CXACRU && USB_SUPPORT && 
> USB_ATM || USB_UEAGLEATM && USB_SUPPORT && USB_ATM || UWB_I1480U && UWB && 
> UWB_HWA || RT2860 && STAGING && !STAGING_EXCLUDE_BUILD && PCI && X86 && WLAN 
> || RT2870 && STAGING && !STAGING_EXCLUDE_BUILD && USB && (X86 || ARM) && WLAN 
> || DRM_NOUVEAU && STAGING && !STAGING_EXCLUDE_BUILD && DRM && PCI || TI_ST && 
> STAGING && !STAGING_EXCLUDE_BUILD && RFKILL || DELL_RBU && X86) selects 
> FW_LOADER which has unmet direct dependencies (HOTPLUG)

Hi,
I sent a patch for this on SEPT-18 and Greg has merged it into one of
his trees.  Not merged into mainline yet.


thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
