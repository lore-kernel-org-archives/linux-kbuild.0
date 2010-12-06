Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:34894 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752015Ab0LFTg7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Dec 2010 14:36:59 -0500
Received: by vws16 with SMTP id 16so2859101vws.19
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Dec 2010 11:36:58 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCHv2] kconfig: simplify select-with-unmet-direct-dependency warning
Date: Mon,  6 Dec 2010 14:35:52 -0500
Message-Id: <1291664152-795-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1291663669-13077-1-git-send-email-lacombar@gmail.com>
References: <1291663669-13077-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>

Hi,

This is, associated with the diff to generate the, a list of the remaining
warning in the tree. The list has been sorted and duplicate have been removed. I
did not care about long line.

The tree these warning originate is v2.6.37-rc4 + the mess I sent this week-end
+ Michal rc-fixes + some local fixes.

 - Arnaud

ps: sorry in advance for the large mail.

CC: Catalin Marinas <catalin.marinas@arm.com>

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5297dbf..ec7cd39 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -629,9 +629,20 @@ int main(int ac, char **av)
 	case alldefconfig:
 		conf_set_all_new_symbols(def_default);
 		break;
-	case randconfig:
-		conf_set_all_new_symbols(def_random);
+	case randconfig: {
+		struct symbol *sym;
+		int i, j;
+		for (i = 0; i < 1024; i++) {
+			conf_set_all_new_symbols(def_random);
+			for_all_symbols(j, sym) {
+				sym_calc_value(sym);
+			}
+			sym_clear_all_valid();
+			sym_clear_all_value();
+		}
+		exit(0);
 		break;
+	}
 	case defconfig:
 		conf_set_all_new_symbols(def_default);
 		break;
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 0c28a79..1284444 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -433,6 +433,15 @@ void sym_clear_all_valid(void)
 		sym_calc_value(modules_sym);
 }
 
+void sym_clear_all_value(void)
+{
+	struct symbol *sym;
+	int i;
+
+	for_all_symbols(i, sym)
+		sym->flags &= ~SYMBOL_DEF_USER;
+}
+
 void sym_set_changed(struct symbol *sym)
 {
 	struct property *prop;

---


warning: (ARCH_LPC32XX && ARCH_S3C64XX && ARCH_TCC8K) selects USB_ARCH_HAS_OHCI which has unmet direct dependencies (USB_SUPPORT)
warning: (ARCH_OMAP2PLUS_TYPICAL) selects MENELAUS which has unmet direct dependencies (MFD_SUPPORT && I2C=y && ARCH_OMAP2)
warning: (ARCH_RPC && MACH_VPAC270 && MACH_REALVIEW_PB11MP && MACH_REALVIEW_PBA8 && MACH_REALVIEW_PBX && MACH_BAST_IDE && MACH_ANUBIS) selects HAVE_PATA_PLATFORM which has unmet direct dependencies (ATA && ATA_SFF)
warning: (ARCH_SHMOBILE) selects PM which has unmet direct dependencies (EXPERIMENTAL && !IA64_HP_SIM)
warning: (ARCH_SHMOBILE) selects PM_RUNTIME which has unmet direct dependencies (EXPERIMENTAL && PM)
warning: (ARCH_STMP3XXX && ARCH_OMAP3) selects USB_ARCH_HAS_EHCI which has unmet direct dependencies (USB_SUPPORT)
warning: (AX88796_93CX6 && RTL8180 && RTL8187 && ADM8211 && RT2400PCI && RT2500PCI && RT61PCI && RT2800PCI && R8187SE) selects EEPROM_93CX6 which has unmet direct dependencies (MISC_DEVICES)
warning: (BCM63XX_CPU_6338 && BCM63XX_CPU_6345) selects USB_OHCI_BIG_ENDIAN_DESC which has unmet direct dependencies (USB_SUPPORT && USB_OHCI_HCD)
warning: (BCM63XX_CPU_6338 && BCM63XX_CPU_6345) selects USB_OHCI_BIG_ENDIAN_MMIO which has unmet direct dependencies (USB_SUPPORT && USB_OHCI_HCD)
warning: (BFIN_MAC) selects BFIN_MAC_USE_L1 which has unmet direct dependencies (NETDEVICES && NET_ETHERNET && BFIN_MAC && (BF527 || BF537))
warning: (BOARD_HAMMERHEAD) selects USB_ARCH_HAS_HCD which has unmet direct dependencies (USB_SUPPORT)
warning: (CAVIUM_OCTEON_REFERENCE_BOARD && BCM63XX_CPU_6338) selects USB_ARCH_HAS_OHCI which has unmet direct dependencies (USB_SUPPORT)
warning: (CAVIUM_OCTEON_REFERENCE_BOARD) selects USB_ARCH_HAS_EHCI which has unmet direct dependencies (USB_SUPPORT)
warning: (COMPAT) selects COMPAT_BINFMT_ELF which has unmet direct dependencies (COMPAT && BINFMT_ELF)
warning: (CRASH_DUMP) selects RELOCATABLE which has unmet direct dependencies (PPC64)
warning: (CRYPTO_GHASH) selects CRYPTO_GF128MUL which has unmet direct dependencies (CRYPTO && EXPERIMENTAL)
warning: (E500 && PPC_FSL_BOOK3E) selects FSL_EMB_PERFMON which has unmet direct dependencies (E500 || PPC_83xx)
warning: (EP8248E && MPC85xx_MDS && MACB && IXP4XX_ETH && W90P910_ETH && MIPS_AU1X00_ENET && SH_ETH && BFIN_MAC && PXA168_ETH && TI_DAVINCI_EMAC && TI_DAVINCI_MDIO && ETHOC && GRETH && SMSC911X && DNET && TC35815 && R6040 && SMSC9420 && CPMAC && FEC && FEC_MPC52xx && XILINX_EMACLITE && BCM63XX_ENET && FS_ENET && OCTEON_MGMT_ETHERNET && SB1250_MAC && TIGON3 && FSL_PQ_MDIO && GIANFAR && UCC_GETH && MV643XX_ETH && XILINX_LL_TEMAC && S6GMAC && STMMAC_ETH && PASEMI_MAC && OCTEON_ETHERNET) selects PHYLIB which has unmet direct dependencies (!S390 && NETDEVICES)
warning: (ETRAX_AXISFLASHMAP && ETRAX_AXISFLASHMAP) selects MTD_BLOCK which has unmet direct dependencies (MTD && BLOCK)
warning: (ETRAX_ETHERNET && ETRAX_ETHERNET) selects MII which has unmet direct dependencies (NETDEVICES)
warning: (ETRAX_ETHERNET && ETRAX_ETHERNET) selects NET_ETHERNET which has unmet direct dependencies (NETDEVICES && !UML)
warning: (ETRAX_NANDFLASH && MTD_DOC2000 && MTD_DOC2001 && MTD_DOC2001PLUS) selects MTD_NAND_IDS which has unmet direct dependencies (MTD && MTD_NAND)
warning: (ETRAX_SPI_GPIO) selects SPI_ETRAX_GPIO which has unmet direct dependencies (SPI_MASTER && ETRAX_ARCH_V32 && EXPERIMENTAL)
warning: (ETRAX_SPI_SSER0 && ETRAX_SPI_SSER1) selects SPI_ETRAX_SSER which has unmet direct dependencies (SPI_MASTER && ETRAX_ARCH_V32 && EXPERIMENTAL)
warning: (ETRAX_USB_HOST && MOUSE_APPLETOUCH && MOUSE_BCM5974 && JOYSTICK_XPAD && TABLET_USB_ACECAD && TABLET_USB_AIPTEK && TABLET_USB_HANWANG && TABLET_USB_KBTAB && TABLET_USB_WACOM && TOUCHSCREEN_USB_COMPOSITE && INPUT_ATI_REMOTE && INPUT_ATI_REMOTE2 && INPUT_KEYSPAN_REMOTE && INPUT_POWERMATE && INPUT_YEALINK && INPUT_CM109) selects USB which has unmet direct dependencies (USB_SUPPORT && USB_ARCH_HAS_HCD)
warning: (G2_DMA) selects SH_DMA_API which has unmet direct dependencies (SH_DMA)
warning: (GENERIC_ACL && JFFS2_FS_POSIX_ACL && NFSD_V4 && NFS_ACL_SUPPORT && 9P_FS_POSIX_ACL) selects FS_POSIX_ACL which has unmet direct dependencies (BLOCK)
warning: (GPIO_RDC321X) selects MFD_RDC321X which has unmet direct dependencies (MFD_SUPPORT && PCI)
warning: (GPIO_VX855) selects MFD_VX855 which has unmet direct dependencies (MFD_SUPPORT && PCI)
warning: (I2C_ISCH && GPIO_SCH && GPIO_VX855 && GPIO_RDC321X) selects MFD_CORE which has unmet direct dependencies (MFD_SUPPORT)
warning: (I2C_ISCH && GPIO_SCH) selects LPC_SCH which has unmet direct dependencies (MFD_SUPPORT && PCI)
warning: (IA64) selects ARCH_SUPPORTS_MSI which has unmet direct dependencies (!IA64_HP_SIM)
warning: (IA64_GENERIC && IA64_DIG_VTD) selects DMAR which has unmet direct dependencies (!IA64_HP_SIM && IA64_GENERIC && ACPI && EXPERIMENTAL)
warning: (IA64_GENERIC && IA64_DIG_VTD) selects PCI_MSI which has unmet direct dependencies (!IA64_HP_SIM && PCI && ARCH_SUPPORTS_MSI)
warning: (IA64_GENERIC && IA64_SGI_SN2 && IA64_SGI_UV) selects NUMA which has unmet direct dependencies (!IA64_HP_SIM && !FLATMEM)
warning: (IMA) selects TCG_TPM which has unmet direct dependencies (HAS_IOMEM && EXPERIMENTAL)
warning: (ISDN_PPP) selects SLHC which has unmet direct dependencies (NETDEVICES)
warning: (IWM && WIMAX_IWMC3200_SDIO) selects IWMC3200TOP which has unmet direct dependencies (MISC_DEVICES && MMC && EXPERIMENTAL)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && FUNCTION_TRACER && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || M68KNOMMU || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300) || ARCH_WANT_FRAME_POINTERS)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && FUNCTION_TRACER && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (MCOUNT)
warning: (MAC80211_LEDS && ADB_PMU_LED_IDE && INPUT_WINBOND_CIR) selects LEDS_TRIGGERS which has unmet direct dependencies (NEW_LEDS && LEDS_CLASS)
warning: (MACH_ANUBIS && SMDK6410_WM1190_EV1 && SMDK6410_WM1192_EV1) selects S3C24XX_GPIO_EXTRA64 which has unmet direct dependencies (PLAT_S3C24XX)
warning: (MACH_DAVINCI_DA830_EVM) selects GPIO_PCF857X which has unmet direct dependencies (GPIOLIB && I2C)
warning: (MACH_DOVE_DB && MACH_DB88F5281 && MACH_RD88F5182 && MACH_KUROBOX_PRO && MACH_DNS323 && MACH_LINKSTATION_PRO && MACH_LINKSTATION_MINI && MACH_LINKSTATION_LS_HGL && MACH_EDMINI_V2 && MACH_D2NET && MACH_BIGDISK && MACH_NET2BIG) selects I2C_BOARDINFO which has unmet direct dependencies (I2C)
warning: (MACH_MINI2440) selects LEDS_TRIGGER_BACKLIGHT which has unmet direct dependencies (NEW_LEDS && LEDS_CLASS && LEDS_TRIGGERS)
warning: (MEDIA_TUNER) selects MEDIA_TUNER_TEA5761 which has unmet direct dependencies (MEDIA_SUPPORT && VIDEO_MEDIA && I2C && EXPERIMENTAL)
warning: (MICROBLAZE) selects USB_ARCH_HAS_EHCI which has unmet direct dependencies (USB_SUPPORT)
warning: (MMC_TIFM_SD && MEMSTICK_TIFM_MS) selects TIFM_CORE which has unmet direct dependencies (MISC_DEVICES && EXPERIMENTAL && PCI)
warning: (MOUSE_APPLETOUCH && MOUSE_BCM5974 && JOYSTICK_XPAD && TABLET_USB_ACECAD && TABLET_USB_AIPTEK && TABLET_USB_HANWANG && TABLET_USB_KBTAB && TABLET_USB_WACOM && TOUCHSCREEN_USB_COMPOSITE && INPUT_ATI_REMOTE && INPUT_ATI_REMOTE2 && INPUT_KEYSPAN_REMOTE && INPUT_POWERMATE && INPUT_YEALINK && INPUT_CM109 && IR_IMON && IR_MCEUSB && IR_STREAMZAP) selects USB which has unmet direct dependencies (USB_SUPPORT && USB_ARCH_HAS_HCD)
warning: (MPC836x_RDK && MTD_NAND_FSL_ELBC && MTD_NAND_FSL_UPM) selects FSL_LBC which has unmet direct dependencies (FSL_SOC)
warning: (MTD_DOC2000 && MTD_DOC2001 && MTD_DOC2001PLUS) selects MTD_NAND_IDS which has unmet direct dependencies (MTD && MTD_NAND)
warning: (NETFILTER_XT_MATCH_REALM) selects NET_CLS_ROUTE which has unmet direct dependencies (NET && NET_SCHED)
warning: (NUMA && IA64_GENERIC && IA64_SGI_SN2 && IA64_SGI_UV) selects ACPI_NUMA which has unmet direct dependencies (ACPI && NUMA && (X86 || IA64))
warning: (OLPC) selects OLPC_OPENFIRMWARE which has unmet direct dependencies (X86_32 && !X86_64 && !X86_PAE)
warning: (PAGE_POISONING) selects DEBUG_PAGEALLOC which has unmet direct dependencies (DEBUG_KERNEL && ARCH_SUPPORTS_DEBUG_PAGEALLOC && (!HIBERNATION || !PPC && !SPARC) && !KMEMCHECK)
warning: (PARISC) selects GENERIC_HARDIRQS_NO__DO_IRQ which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (PERF_EVENTS) selects IRQ_WORK which has unmet direct dependencies (HAVE_IRQ_WORK)
warning: (PLAT_S3C64XX) selects SAMSUNG_WAKEMASK which has unmet direct dependencies (PLAT_SAMSUNG && PM)
warning: (PM_SLEEP_SMP) selects HOTPLUG_CPU which has unmet direct dependencies (SMP && HOTPLUG && EXPERIMENTAL && (PPC_PSERIES || PPC_PMAC))
warning: (POWERTV) selects USB_OHCI_LITTLE_ENDIAN which has unmet direct dependencies (USB_SUPPORT && USB_OHCI_HCD)
warning: (PPC_CELL_NATIVE && 440EPX && 440GRX && 440GX && 440SPe && 460EX && 460SX && APM821xx && 405EX) selects IBM_NEW_EMAC_EMAC4 which has unmet direct dependencies (NETDEVICES && NET_ETHERNET)
warning: (PPC_CELL_NATIVE && 440GX && 460EX && 460SX && APM821xx) selects IBM_NEW_EMAC_TAH which has unmet direct dependencies (NETDEVICES && NET_ETHERNET)
warning: (PPC_CELL_NATIVE && BLUESTONE && CANYONLANDS && GLACIER && EIGER && 440EPX && 440GRX && 440GX && 460SX && 405EX) selects IBM_NEW_EMAC_RGMII which has unmet direct dependencies (NETDEVICES && NET_ETHERNET)
warning: (PPC_CELL_NATIVE && CANYONLANDS && GLACIER && 440EP && 440EPX && 440GRX && 440GP && 440GX && 460SX && 405GP) selects IBM_NEW_EMAC_ZMII which has unmet direct dependencies (NETDEVICES && NET_ETHERNET)
warning: (PPC_PS3 && 440EP) selects USB_ARCH_HAS_OHCI which has unmet direct dependencies (USB_SUPPORT)
warning: (PPC_PS3 && PPC_CELLEB && XPS_USB_HCD_XILINX && USB_OCTEON_EHCI) selects USB_EHCI_BIG_ENDIAN_MMIO which has unmet direct dependencies (USB_SUPPORT && USB_EHCI_HCD && (PPC_CELLEB || PPC_PS3 || 440EPX || ARCH_IXP4XX || XPS_USB_HCD_XILINX || PPC_MPC512x || CPU_CAVIUM_OCTEON))
warning: (PPC_PS3 && PPC_CELLEB) selects USB_OHCI_BIG_ENDIAN_MMIO which has unmet direct dependencies (USB_SUPPORT && USB_OHCI_HCD)
warning: (PPC_PS3 && SPU_FS) selects MEMORY_HOTPLUG which has unmet direct dependencies ((SPARSEMEM || X86_64_ACPI_NUMA) && HOTPLUG && ARCH_ENABLE_MEMORY_HOTPLUG && (IA64 || X86 || PPC_BOOK3S_64 || SUPERH || S390))
warning: (PPC_PS3) selects USB_OHCI_LITTLE_ENDIAN which has unmet direct dependencies (USB_SUPPORT && USB_OHCI_HCD)
warning: (RADIO_MIROPCM20) selects SND_ISA which has unmet direct dependencies (SOUND && !M68K && SND && ISA && ISA_DMA_API)
warning: (SA1100_H3100 && SA1100_H3600) selects HTC_EGPIO which has unmet direct dependencies (MFD_SUPPORT && GENERIC_HARDIRQS && GPIOLIB && ARM)
warning: (SB1XXX_CORELIS) selects DEBUG_INFO which has unmet direct dependencies (DEBUG_KERNEL)
warning: (SCSI_SNI_53C710) selects 53C700_LE_ON_BE which has unmet direct dependencies (SCSI_LOWLEVEL && SCSI && SCSI_LASI700)
warning: (SCSI_SRP) selects SCSI_TGT which has unmet direct dependencies (SCSI && EXPERIMENTAL)
warning: (SIBYTE_SWARM && SIBYTE_LITTLESUR) selects HAVE_PATA_PLATFORM which has unmet direct dependencies (ATA && ATA_SFF)
warning: (SINGLE_MEMORY_CHUNK) selects NEED_MULTIPLE_NODES which has unmet direct dependencies (DISCONTIGMEM || NUMA)
warning: (SMDK6410_WM1192_EV1) selects MFD_WM831X which has unmet direct dependencies (MFD_SUPPORT && GENERIC_HARDIRQS)
warning: (SMDK6410_WM1192_EV1) selects MFD_WM831X_I2C which has unmet direct dependencies (MFD_SUPPORT && I2C=y && GENERIC_HARDIRQS)
warning: (SMP) selects IRQ_PER_CPU which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (SMP) selects TICKSOURCE_CORETMR which has unmet direct dependencies (GENERIC_CLOCKEVENTS)
warning: (SND_SOC_SH4_SIU) selects SH_DMAE which has unmet direct dependencies (DMADEVICES && (SUPERH && SH_DMA || ARM && ARCH_SHMOBILE) && !SH_DMA_API)
warning: (SOC_TX4927 && SOC_TX4938 && SOC_TX4939) selects HAS_TXX9_ACLC which has unmet direct dependencies (SOUND && !M68K && SND && SND_SOC)
warning: (STUB_POULSBO && DRM_I915 && DRM_NOUVEAU) selects ACPI_VIDEO which has unmet direct dependencies (ACPI && X86 && BACKLIGHT_CLASS_DEVICE && VIDEO_OUTPUT_CONTROL && INPUT)
warning: (STUB_POULSBO && FB_BACKLIGHT && DRM_I915 && PANEL_SHARP_LS037V7DW01 && PANEL_ACX565AKM && USB_APPLEDISPLAY && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_ASUS && ACPI_CMPC) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (ST_BT) selects TI_ST which has unmet direct dependencies (MISC_DEVICES && RFKILL)
warning: (UBIFS_FS_DEBUG && LOCKDEP && LATENCYTOP) selects KALLSYMS_ALL which has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)
warning: (USB_MUSB_HDRC_HCD && USB_MUSB_OTG && USB_LANGWELL_OTG) selects USB_OTG which has unmet direct dependencies (USB_SUPPORT && USB && EXPERIMENTAL && USB_SUSPEND)
warning: (USB_WUSB) selects UWB which has unmet direct dependencies (EXPERIMENTAL && PCI)
warning: (VIDEO_AU0828) selects DVB_AU8522 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C && VIDEO_V4L2)
warning: (VIDEO_BT848_DVB) selects DVB_BT8XX which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && PCI && I2C && VIDEO_BT848)
warning: (VIDEO_CX23885 && DVB_USB_DIB0700 && DVB_USB_CXUSB) selects DVB_DIB7000P which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX23885 && DVB_USB_DW2102) selects DVB_DS3000 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX23885 && DVB_USB_DW2102) selects DVB_STV6110 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX23885 && VIDEO_CX18 && VIDEO_PVRUSB2_DVB) selects DVB_S5H1409 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && DVB_USB_CXUSB) selects DVB_CX22702 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && DVB_USB_DW2102 && DVB_USB_AZ6027) selects DVB_STB6100 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && DVB_USB_DW2102 && DVB_USB_LME2510) selects DVB_STV0288 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && DVB_USB_DW2102) selects DVB_STB6000 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && DVB_USB_OPERA1 && DVB_USB_DW2102) selects DVB_STV0299 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && VIDEO_CX23885 && DVB_USB_DW2102) selects DVB_CX24116 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && VIDEO_CX23885 && DVB_USB_DW2102) selects DVB_STV0900 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && VIDEO_CX23885 && VIDEO_PVRUSB2_DVB && VIDEO_EM28XX_DVB && DVB_USB_CXUSB) selects DVB_LGDT330X which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB && VIDEO_CX23885 && VIDEO_SAA7164 && VIDEO_PVRUSB2_DVB && DVB_USB_DIB0700) selects DVB_S5H1411 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB) selects DVB_CX24123 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_CX88_DVB) selects DVB_OR51132 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_EM28XX_DVB && DVB_USB_DW2102 && DVB_USB_ANYSEE) selects DVB_TDA10023 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && DVB_USB_DIB0700) selects DVB_LGDT3305 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && DVB_USB_DW2102) selects DVB_MT312 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && DVB_USB_DW2102) selects DVB_ZL10039 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && DVB_USB_M920X) selects DVB_TDA1004X which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && DVB_USB_TTUSB2 && DVB_USB_LME2510) selects DVB_TDA10086 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && DVB_USB_TTUSB2 && DVB_USB_LME2510) selects DVB_TDA826X which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && VIDEO_CX23885 && DVB_USB_TTUSB2) selects DVB_LNBP21 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && VIDEO_CX23885 && VIDEO_SAA7164 && VIDEO_PVRUSB2_DVB) selects DVB_TDA10048 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && VIDEO_CX88_DVB && DVB_USB_A800 && DVB_USB_DIBUSB_MB && DVB_USB_UMT_010 && DVB_USB_CXUSB && DVB_USB_DIGITV && DVB_USB_NOVA_T_USB2 && DVB_USB_OPERA1 && DVB_USB_DW2102 && DVB_USB_ANYSEE && DVB_USB_AF9015) selects DVB_PLL which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && VIDEO_CX88_DVB && DVB_USB_UMT_010 && DVB_USB_CXUSB && DVB_USB_M920X && DVB_USB_DIGITV && DVB_USB_ANYSEE) selects DVB_MT352 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && VIDEO_CX88_DVB && VIDEO_CX23885 && VIDEO_EM28XX_DVB && DVB_USB_CXUSB && DVB_USB_GL861 && DVB_USB_AU6610 && DVB_USB_ANYSEE && DVB_USB_DTV5100 && DVB_USB_CE6230 && VIDEO_TM6000_DVB) selects DVB_ZL10353 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && VIDEO_CX88_DVB) selects DVB_ISL6421 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB && VIDEO_CX88_DVB) selects DVB_NXT200X which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB) selects DVB_ISL6405 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
warning: (VIDEO_SAA7134_DVB) selects DVB_ZL10036 which has unmet direct dependencies (MEDIA_SUPPORT && DVB_CAPTURE_DRIVERS && DVB_CORE && I2C)
