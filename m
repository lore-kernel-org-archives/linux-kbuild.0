Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:44746 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751237AbYF2V2z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Jun 2008 17:28:55 -0400
Date: Sun, 29 Jun 2008 23:29:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kconfig - hex are considered decimal
Message-ID: <20080629212941.GA10418@uranus.ravnborg.org>
References: <20080629115120.GA4654@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080629115120.GA4654@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Sun, Jun 29, 2008 at 01:51:20PM +0200, Sam Ravnborg wrote:
> Hi Roman.
> 
> I was applying an old patch from you that introduces
> conf_set_all_new_symbols().
> 
> But when I tested it I noticed that all symbols
> of type "hex" were saved as decimal vlaues in .config.
> 
> Sample (first line is with unmodifed kconfig):
> 
> -CONFIG_RADIO_ZOLTRIX_PORT=0x20c
> +CONFIG_RADIO_ZOLTRIX_PORT=20c
> 
> I guess this has something to do with the way we
> represent a hex value internally. But I have not yet
> dived into it.
> 
> Can you see where it goes wrong?

This seems to be the right fix.

	Sam

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 0759761..6f39c80 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -510,7 +510,7 @@ int conf_write(const char *name)
 			case S_HEX:
 				str = sym_get_string_value(sym);
 				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-					fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
+					fprintf(out, "CONFIG_%s=0x%s\n", sym->name, str);
 					break;
 				}
 			case S_INT:
