Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-vbr12.xs4all.nl ([194.109.24.32]:2139 "EHLO
	smtp-vbr12.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751451AbYGBMjS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Jul 2008 08:39:18 -0400
Date: Wed, 2 Jul 2008 14:39:08 +0200 (CEST)
From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: kconfig - hex are considered decimal
In-Reply-To: <20080701061241.GA4922@uranus.ravnborg.org>
Message-ID: <Pine.LNX.4.64.0807021420400.6791@localhost.localdomain>
References: <20080629115120.GA4654@uranus.ravnborg.org>
 <Pine.LNX.4.64.0806301404270.6791@localhost.localdomain>
 <20080630204032.GA29429@uranus.ravnborg.org> <Pine.LNX.4.64.0806302356340.6791@localhost.localdomain>
 <20080701061241.GA4922@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On Tue, 1 Jul 2008, Sam Ravnborg wrote:

> - When changing I see the 0x prefix - which I consider OK for hex values
> - When saving I see the 0x prefix in autoconf.h + .config

I disagree with the proposed patch. It only makes cosmetical changes, but 
it doesn't fix the current inconsistenties. Either we do it properly as in 
the patch below or I'd rather keep it as is.
The patch checks the default values more strictly, I'm open to opinions 
whether that warning is useful or maybe just check that hex values have 
the 0x prefix.

> See patches where kconfig start to use the new
> method for 'all*config' targets - they are cc:ed to you
> and available on linux-kbuild.
> I simply started to use conf_set_all_new_symbols() and
> as a result I could simplify conf.c.
> 
> And things got so simple that I dropped the patches
> introducing aconf.c.

I'd actually prefer to move everything noninteractive out of conf.c, as 
this would be the right place for this:

> -> Give Redhat's nonint_oldconfig a closer look and see
>    how to integrate this functionality

This should be pretty much do it:

	for_all_symbols(i, sym) {
		sym_calc_value(sym);
		if (sym->flags & SYMBOL_WRITE && !sym_has_value(sym))
			printf(...);
	}

The point is that this has nothing to do with what's already in conf.c, 
this should be a separate utility for all noninteractive kconfig jobs.

bye, Roman


[PATCH] normalize int/hex values

Introduce a new strdup_type() which normalizes the input value, so that
all symbol values are properly formatted.
Check the values of defaults a bit more careful, so that their are
either proper constants or other symbols of the same type.

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>

---
 arch/x86/Kconfig            |    4 ++--
 drivers/media/radio/Kconfig |   16 ++++++++--------
 drivers/mtd/devices/Kconfig |    3 +--
 drivers/mtd/maps/Kconfig    |    2 +-
 scripts/kconfig/confdata.c  |    2 +-
 scripts/kconfig/lkc.h       |    2 ++
 scripts/kconfig/menu.c      |   41 ++++++++++++++++++++++++++++++++++++-----
 scripts/kconfig/util.c      |   16 ++++++++++++++++
 sound/oss/Kconfig           |   10 +++++-----
 9 files changed, 72 insertions(+), 24 deletions(-)

Index: linux-2.6/scripts/kconfig/confdata.c
===================================================================
--- linux-2.6.orig/scripts/kconfig/confdata.c
+++ linux-2.6/scripts/kconfig/confdata.c
@@ -132,7 +132,7 @@ static int conf_set_sym_val(struct symbo
 	case S_HEX:
 	done:
 		if (sym_string_valid(sym, p)) {
-			sym->def[def].val = strdup(p);
+			sym->def[def].val = strdup_type(p, sym->type);
 			sym->flags |= def_flags;
 		} else {
 			conf_warning("symbol value '%s' invalid for %s", p, sym->name);
Index: linux-2.6/scripts/kconfig/lkc.h
===================================================================
--- linux-2.6.orig/scripts/kconfig/lkc.h
+++ linux-2.6/scripts/kconfig/lkc.h
@@ -113,6 +113,8 @@ void str_append(struct gstr *gs, const c
 void str_printf(struct gstr *gs, const char *fmt, ...);
 const char *str_get(struct gstr *gs);
 
+char *strdup_type(const char *str, int type);
+
 /* symbol.c */
 extern struct expr *sym_env_list;
 
Index: linux-2.6/scripts/kconfig/menu.c
===================================================================
--- linux-2.6.orig/scripts/kconfig/menu.c
+++ linux-2.6/scripts/kconfig/menu.c
@@ -187,15 +187,46 @@ static int menu_range_valid_sym(struct s
 void sym_check_prop(struct symbol *sym)
 {
 	struct property *prop;
-	struct symbol *sym2;
+	struct symbol *sym2, *def_sym;
+	char *str;
+
 	for (prop = sym->prop; prop; prop = prop->next) {
 		switch (prop->type) {
 		case P_DEFAULT:
-			if ((sym->type == S_STRING || sym->type == S_INT || sym->type == S_HEX) &&
-			    prop->expr->type != E_SYMBOL)
+			if (sym->type != S_STRING && sym->type != S_INT &&
+			    sym->type != S_HEX)
+				break;
+			if (prop->expr->type != E_SYMBOL) {
 				prop_warn(prop,
-				    "default for config symbol '%'"
-				    " must be a single symbol", sym->name);
+					"default for config symbol '%s'"
+					" must be a single symbol", sym->name);
+				break;
+			}
+			def_sym = prop->expr->left.sym;
+			if (def_sym->type == sym->type)
+				/* default is a dynamic value */
+				break;
+			if (def_sym->type != S_UNKNOWN) {
+				prop_warn(prop,
+					"default for config symbol '%s'"
+					" has the wrong type (%s)", sym->name,
+					sym_type_name(def_sym->type));
+				break;
+			}
+			if (!sym_string_valid(sym, def_sym->name)) {
+				prop_warn(prop,
+					"default for config symbol '%s'"
+					" is not valid", sym->name);
+				break;
+			}
+			str = strdup_type(def_sym->name, sym->type);
+			if (strcmp(str, def_sym->name)) {
+				prop_warn(prop,
+					"default for config symbol '%s'"
+					" should be %s", sym->name, str);
+				prop->expr->left.sym = sym_lookup(str, SYMBOL_CONST);
+			}
+			free(str);
 			break;
 		case P_SELECT:
 			sym2 = prop_get_symbol(prop);
Index: linux-2.6/scripts/kconfig/util.c
===================================================================
--- linux-2.6.orig/scripts/kconfig/util.c
+++ linux-2.6/scripts/kconfig/util.c
@@ -131,3 +131,19 @@ const char *str_get(struct gstr *gs)
 	return gs->s;
 }
 
+/* duplicate str, but normalize any number according to the symbol type */
+char *strdup_type(const char *str, int type)
+{
+	char buf[64];
+
+	if (type == S_STRING)
+		return strdup(str);
+	if (type == S_HEX) {
+		unsigned int val = strtoul(str, NULL, 16);
+		sprintf(buf, "%#x", val);
+	} else {
+		int val = strtol(str, NULL, 10);
+		sprintf(buf, "%d", val);
+	}
+	return strdup(buf);
+}
Index: linux-2.6/arch/x86/Kconfig
===================================================================
--- linux-2.6.orig/arch/x86/Kconfig
+++ linux-2.6/arch/x86/Kconfig
@@ -885,11 +885,11 @@ endchoice
 
 config PAGE_OFFSET
 	hex
-	default 0xB0000000 if VMSPLIT_3G_OPT
+	default 0xb0000000 if VMSPLIT_3G_OPT
 	default 0x80000000 if VMSPLIT_2G
 	default 0x78000000 if VMSPLIT_2G_OPT
 	default 0x40000000 if VMSPLIT_1G
-	default 0xC0000000
+	default 0xc0000000
 	depends on X86_32
 
 config HIGHMEM
Index: linux-2.6/drivers/media/radio/Kconfig
===================================================================
--- linux-2.6.orig/drivers/media/radio/Kconfig
+++ linux-2.6/drivers/media/radio/Kconfig
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
@@ -250,7 +250,7 @@ config RADIO_TERRATEC
 config RADIO_TERRATEC_PORT
 	hex "Terratec i/o port (normally 0x590)"
 	depends on RADIO_TERRATEC=y
-	default "590"
+	default "0x590"
 	help
 	  Fill in the I/O port of your TerraTec FM radio card. If unsure, go
 	  with the default.
@@ -268,7 +268,7 @@ config RADIO_TRUST
 config RADIO_TRUST_PORT
 	hex "Trust i/o port (usually 0x350 or 0x358)"
 	depends on RADIO_TRUST=y
-	default "350"
+	default "0x350"
 	help
 	  Enter the I/O port of your Trust FM radio card. If unsure, try the
 	  values "0x350" or "0x358".
@@ -301,7 +301,7 @@ config RADIO_TYPHOON_PROC_FS
 config RADIO_TYPHOON_PORT
 	hex "Typhoon I/O port (0x316 or 0x336)"
 	depends on RADIO_TYPHOON=y
-	default "316"
+	default "0x316"
 	help
 	  Enter the I/O port of your Typhoon or EcoRadio radio card.
 
@@ -335,7 +335,7 @@ config RADIO_ZOLTRIX
 config RADIO_ZOLTRIX_PORT
 	hex "ZOLTRIX I/O port (0x20c or 0x30c)"
 	depends on RADIO_ZOLTRIX=y
-	default "20c"
+	default "0x20c"
 	help
 	  Enter the I/O port of your Zoltrix radio card.
 
Index: linux-2.6/drivers/mtd/devices/Kconfig
===================================================================
--- linux-2.6.orig/drivers/mtd/devices/Kconfig
+++ linux-2.6/drivers/mtd/devices/Kconfig
@@ -240,8 +240,7 @@ config MTD_DOCPROBE_ADVANCED
 config MTD_DOCPROBE_ADDRESS
 	hex "Physical address of DiskOnChip" if MTD_DOCPROBE_ADVANCED
 	depends on MTD_DOCPROBE
-	default "0x0000" if MTD_DOCPROBE_ADVANCED
-	default "0" if !MTD_DOCPROBE_ADVANCED
+	default "0"
 	---help---
 	  By default, the probe for DiskOnChip devices will look for a
 	  DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
Index: linux-2.6/drivers/mtd/maps/Kconfig
===================================================================
--- linux-2.6.orig/drivers/mtd/maps/Kconfig
+++ linux-2.6/drivers/mtd/maps/Kconfig
@@ -92,7 +92,7 @@ endchoice
 
 config MSP_FLASH_MAP_LIMIT
 	hex
-	default "0x02000000"
+	default "0x2000000"
 	depends on MSP_FLASH_MAP_LIMIT_32M
 
 config MTD_PMC_MSP_RAMROOT
Index: linux-2.6/sound/oss/Kconfig
===================================================================
--- linux-2.6.orig/sound/oss/Kconfig
+++ linux-2.6/sound/oss/Kconfig
@@ -129,7 +129,7 @@ config MSNDCLAS_IRQ
 config MSNDCLAS_MEM
 	hex "MSND Classic memory B0000, C8000, D0000, D8000, E0000, E8000"
 	depends on SOUND_MSNDCLAS=y
-	default "D0000"
+	default "0xd0000"
 	help
 	  Memory-mapped I/O base address for the MultiSound Classic and
 	  related cards.
@@ -137,7 +137,7 @@ config MSNDCLAS_MEM
 config MSNDCLAS_IO
 	hex "MSND Classic I/O 210, 220, 230, 240, 250, 260, 290, 3E0"
 	depends on SOUND_MSNDCLAS=y
-	default "290"
+	default "0x290"
 	help
 	  I/O port address for the MultiSound Classic and related cards.
 
@@ -192,7 +192,7 @@ config MSNDPIN_IRQ
 config MSNDPIN_MEM
 	hex "MSND Pinnacle memory B0000, C8000, D0000, D8000, E0000, E8000"
 	depends on SOUND_MSNDPIN=y
-	default "D0000"
+	default "0xd0000"
 	help
 	  Memory-mapped I/O base address for the primary synthesizer on
 	  MultiSound Pinnacle and Fiji sound cards.
@@ -200,7 +200,7 @@ config MSNDPIN_MEM
 config MSNDPIN_IO
 	hex "MSND Pinnacle I/O 210, 220, 230, 240, 250, 260, 290, 3E0"
 	depends on SOUND_MSNDPIN=y
-	default "290"
+	default "0x290"
 	help
 	  Memory-mapped I/O base address for the primary synthesizer on
 	  MultiSound Pinnacle and Fiji sound cards.
@@ -234,7 +234,7 @@ comment "MSND Pinnacle DSP section will 
 config MSNDPIN_CFG
 	hex "MSND Pinnacle config port 250,260,270"
 	depends on MSNDPIN_NONPNP
-	default "250"
+	default "0x250"
 	help
 	  This is the port which the Pinnacle and Fiji uses to configure the
 	  card's resources when not in PnP mode. If your card is in PnP mode,
