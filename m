Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:46723 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab0LEGaT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:30:19 -0500
Received: by yxt3 with SMTP id 3so4971442yxt.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:30:19 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 3/5 to 5/5] Add missing hexadicimal prefix
Date: Sun,  5 Dec 2010 01:29:26 -0500
Message-Id: <1291530566-23531-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
References: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

[Included for reference to give an idea of the change needed. Will be sent later
to maintainers if needed.]

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 sound/oss/Kconfig |   38 +++++++++++++++++++-------------------
 1 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/oss/Kconfig b/sound/oss/Kconfig
index 76c0902..66d27dd 100644
--- a/sound/oss/Kconfig
+++ b/sound/oss/Kconfig
@@ -76,17 +76,17 @@ config MSNDCLAS_IRQ
 	  Interrupt Request line for the MultiSound Classic and related cards.
 
 config MSNDCLAS_MEM
-	hex "MSND Classic memory B0000, C8000, D0000, D8000, E0000, E8000"
+	hex "MSND Classic memory 0xB0000, 0xC8000, 0xD0000, 0xD8000, 0xE0000, 0xE8000"
 	depends on SOUND_MSNDCLAS=y
-	default "D0000"
+	default "0xD0000"
 	help
 	  Memory-mapped I/O base address for the MultiSound Classic and
 	  related cards.
 
 config MSNDCLAS_IO
-	hex "MSND Classic I/O 210, 220, 230, 240, 250, 260, 290, 3E0"
+	hex "MSND Classic I/O 0x210, 0x220, 0x230, 0x240, 0x250, 0x260, 0x290, 0x3E0"
 	depends on SOUND_MSNDCLAS=y
-	default "290"
+	default "0x290"
 	help
 	  I/O port address for the MultiSound Classic and related cards.
 
@@ -139,17 +139,17 @@ config MSNDPIN_IRQ
 	  Pinnacle and Fiji sound cards.
 
 config MSNDPIN_MEM
-	hex "MSND Pinnacle memory B0000, C8000, D0000, D8000, E0000, E8000"
+	hex "MSND Pinnacle memory 0xB0000, 0xC8000, 0xD0000, 0xD8000, 0xE0000, 0xE8000"
 	depends on SOUND_MSNDPIN=y
-	default "D0000"
+	default "0xD0000"
 	help
 	  Memory-mapped I/O base address for the primary synthesizer on
 	  MultiSound Pinnacle and Fiji sound cards.
 
 config MSNDPIN_IO
-	hex "MSND Pinnacle I/O 210, 220, 230, 240, 250, 260, 290, 3E0"
+	hex "MSND Pinnacle I/O 0x210, 0x220, 0x230, 0x240, 0x250, 0x260, 0x290, 0x3E0"
 	depends on SOUND_MSNDPIN=y
-	default "290"
+	default "0x290"
 	help
 	  Memory-mapped I/O base address for the primary synthesizer on
 	  MultiSound Pinnacle and Fiji sound cards.
@@ -181,9 +181,9 @@ comment "MSND Pinnacle DSP section will be configured to above parameters."
 	depends on SOUND_MSNDPIN=y && MSNDPIN_NONPNP
 
 config MSNDPIN_CFG
-	hex "MSND Pinnacle config port 250,260,270"
+	hex "MSND Pinnacle config port 0x250, 0x260, 0x270"
 	depends on MSNDPIN_NONPNP
-	default "250"
+	default "0x250"
 	help
 	  This is the port which the Pinnacle and Fiji uses to configure the
 	  card's resources when not in PnP mode. If your card is in PnP mode,
@@ -194,9 +194,9 @@ comment "Pinnacle-specific Device Configuration (0 disables)"
 	depends on SOUND_MSNDPIN=y && MSNDPIN_NONPNP
 
 config MSNDPIN_MPU_IO
-	hex "MSND Pinnacle MPU I/O (e.g. 330)"
+	hex "MSND Pinnacle MPU I/O (e.g. 0x330)"
 	depends on MSNDPIN_NONPNP
-	default "0"
+	default "0x0"
 	help
 	  Memory-mapped I/O base address for the Kurzweil daughterboard
 	  synthesizer on MultiSound Pinnacle and Fiji sound cards.
@@ -210,17 +210,17 @@ config MSNDPIN_MPU_IRQ
 	  synthesizer on MultiSound Pinnacle and Fiji sound cards.
 
 config MSNDPIN_IDE_IO0
-	hex "MSND Pinnacle IDE I/O 0 (e.g. 170)"
+	hex "MSND Pinnacle IDE I/O 0 (e.g. 0x170)"
 	depends on MSNDPIN_NONPNP
-	default "0"
+	default "0x0"
 	help
 	  CD-ROM drive 0 memory-mapped I/O base address for the MultiSound
 	  Pinnacle and Fiji sound cards.
 
 config MSNDPIN_IDE_IO1
-	hex "MSND Pinnacle IDE I/O 1 (e.g. 376)"
+	hex "MSND Pinnacle IDE I/O 1 (e.g. 0x376)"
 	depends on MSNDPIN_NONPNP
-	default "0"
+	default "0x0"
 	help
 	  CD-ROM drive 1 memory-mapped I/O base address for the MultiSound
 	  Pinnacle and Fiji sound cards.
@@ -234,9 +234,9 @@ config MSNDPIN_IDE_IRQ
 	  MultiSound Pinnacle and Fiji sound cards.
 
 config MSNDPIN_JOYSTICK_IO
-	hex "MSND Pinnacle joystick I/O (e.g. 200)"
+	hex "MSND Pinnacle joystick I/O (e.g. 0x200)"
 	depends on MSNDPIN_NONPNP
-	default "0"
+	default "0x0"
 	help
 	  Memory-mapped I/O base address for the joystick port on MultiSound
 	  Pinnacle and Fiji sound cards.
@@ -520,7 +520,7 @@ config SC6600_CDROM
 config SC6600_CDROMBASE
 	hex "SC-6600 CDROM Interface I/O Address"
 	depends on SC6600
-	default "0"
+	default "0x0"
 	help
 	  Base I/O port address for the CD-ROM interface of the Audio Excel
 	  DSP 16 card.

-- 
1.7.2.30.gc37d7.dirty

From: Arnaud Lacombe <lacombar@gmail.com>

drivers/media/radio/Kconfig: add missing hexadicimal prefix

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 drivers/media/radio/Kconfig |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/radio/Kconfig b/drivers/media/radio/Kconfig
index 83567b8..a01067a 100644
--- a/drivers/media/radio/Kconfig
+++ b/drivers/media/radio/Kconfig
@@ -58,7 +58,7 @@ config RADIO_RTRACK
 config RADIO_RTRACK_PORT
 	hex "RadioTrack i/o port (0x20f or 0x30f)"
 	depends on RADIO_RTRACK=y
-	default "20f"
+	default "0x20f"
 	help
 	  Enter either 0x30f or 0x20f here.  The card default is 0x30f, if you
 	  haven't changed the jumper setting on the card.
@@ -81,7 +81,7 @@ config RADIO_RTRACK2
 config RADIO_RTRACK2_PORT
 	hex "RadioTrack II i/o port (0x20c or 0x30c)"
 	depends on RADIO_RTRACK2=y
-	default "30c"
+	default "0x30c"
 	help
 	  Enter either 0x30c or 0x20c here.  The card default is 0x30c, if you
 	  haven't changed the jumper setting on the card.
@@ -104,7 +104,7 @@ config RADIO_AZTECH
 config RADIO_AZTECH_PORT
 	hex "Aztech/Packard Bell I/O port (0x350 or 0x358)"
 	depends on RADIO_AZTECH=y
-	default "350"
+	default "0x350"
 	help
 	  Enter either 0x350 or 0x358 here.  The card default is 0x350, if you
 	  haven't changed the setting of jumper JP3 on the card.  Removing the
@@ -133,7 +133,7 @@ config RADIO_GEMTEK
 config RADIO_GEMTEK_PORT
 	hex "Fixed I/O port (0x20c, 0x30c, 0x24c, 0x34c, 0c24c or 0x28c)"
 	depends on RADIO_GEMTEK=y
-	default "34c"
+	default "0x34c"
 	help
 	  Enter either 0x20c, 0x30c, 0x24c or 0x34c here. The card default is
 	  0x34c, if you haven't changed the jumper setting on the card. On
@@ -266,7 +266,7 @@ config RADIO_TERRATEC
 config RADIO_TERRATEC_PORT
 	hex "Terratec i/o port (normally 0x590)"
 	depends on RADIO_TERRATEC=y
-	default "590"
+	default "0x590"
 	help
 	  Fill in the I/O port of your TerraTec FM radio card. If unsure, go
 	  with the default.
@@ -284,7 +284,7 @@ config RADIO_TRUST
 config RADIO_TRUST_PORT
 	hex "Trust i/o port (usually 0x350 or 0x358)"
 	depends on RADIO_TRUST=y
-	default "350"
+	default "0x350"
 	help
 	  Enter the I/O port of your Trust FM radio card. If unsure, try the
 	  values "0x350" or "0x358".
@@ -307,7 +307,7 @@ config RADIO_TYPHOON
 config RADIO_TYPHOON_PORT
 	hex "Typhoon I/O port (0x316 or 0x336)"
 	depends on RADIO_TYPHOON=y
-	default "316"
+	default "0x316"
 	help
 	  Enter the I/O port of your Typhoon or EcoRadio radio card.
 
@@ -341,7 +341,7 @@ config RADIO_ZOLTRIX
 config RADIO_ZOLTRIX_PORT
 	hex "ZOLTRIX I/O port (0x20c or 0x30c)"
 	depends on RADIO_ZOLTRIX=y
-	default "20c"
+	default "0x20c"
 	help
 	  Enter the I/O port of your Zoltrix radio card.
 
-- 
1.7.2.30.gc37d7.dirty


From: Arnaud Lacombe <lacombar@gmail.com>

drivers/mtd/*/Kconfig: add missing hexadicimal prefix

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 drivers/mtd/devices/Kconfig |    5 ++---
 drivers/mtd/maps/Kconfig    |    2 +-
 drivers/mtd/nand/Kconfig    |    2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 35081ce..016e9c8 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -167,7 +167,7 @@ config MTDRAM_ERASE_SIZE
 config MTDRAM_ABS_POS
 	hex "SRAM Hexadecimal Absolute position or 0"
 	depends on MTD_MTDRAM=y
-	default "0"
+	default "0x0"
 	help
 	  If you have system RAM accessible by the CPU but not used by Linux
 	  in normal operation, you can give the physical address at which the
@@ -268,8 +268,7 @@ config MTD_DOCPROBE_ADVANCED
 config MTD_DOCPROBE_ADDRESS
 	hex "Physical address of DiskOnChip" if MTD_DOCPROBE_ADVANCED
 	depends on MTD_DOCPROBE
-	default "0x0000" if MTD_DOCPROBE_ADVANCED
-	default "0" if !MTD_DOCPROBE_ADVANCED
+	default "0x0"
 	---help---
 	  By default, the probe for DiskOnChip devices will look for a
 	  DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index a0dd7bb..02cb84b 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -47,7 +47,7 @@ config MTD_PHYSMAP_START
 config MTD_PHYSMAP_LEN
 	hex "Physical length of flash mapping"
 	depends on MTD_PHYSMAP_COMPAT
-	default "0"
+	default "0x0"
 	help
 	  This is the total length of the mapping of the flash chips on
 	  your particular board. If there is space, or aliases, in the
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8229802..a27253f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -274,7 +274,7 @@ config MTD_NAND_DISKONCHIP_PROBE_ADVANCED
 config MTD_NAND_DISKONCHIP_PROBE_ADDRESS
         hex "Physical address of DiskOnChip" if MTD_NAND_DISKONCHIP_PROBE_ADVANCED
         depends on MTD_NAND_DISKONCHIP
-        default "0"
+        default "0x0"
         ---help---
         By default, the probe for DiskOnChip devices will look for a
         DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
-- 
1.7.2.30.gc37d7.dirty

