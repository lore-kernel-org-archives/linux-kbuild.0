Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:56100 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752377AbYF3Ujp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jun 2008 16:39:45 -0400
Date: Mon, 30 Jun 2008 22:40:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kconfig - hex are considered decimal
Message-ID: <20080630204032.GA29429@uranus.ravnborg.org>
References: <20080629115120.GA4654@uranus.ravnborg.org> <Pine.LNX.4.64.0806301404270.6791@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0806301404270.6791@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Jun 30, 2008 at 03:19:09PM +0200, Roman Zippel wrote:
> Hi,
> 
> On Sun, 29 Jun 2008, Sam Ravnborg wrote:
> 
> > Sample (first line is with unmodifed kconfig):
> > 
> > -CONFIG_RADIO_ZOLTRIX_PORT=0x20c
> > +CONFIG_RADIO_ZOLTRIX_PORT=20c
> > 
> > I guess this has something to do with the way we
> > represent a hex value internally. But I have not yet
> > dived into it.
> > 
> > Can you see where it goes wrong?
> 
> It's not really wrong, it's a valid value there. Only if it's saved like 
> this in the header file, it would be wrong.
> I noticed that during testing too, that value is coming liking that 
> directly from the Kconfig file. The real fix would be to deprecate hex 
> values without prefix and automatically adding the prefix where needed 
> (currently loading of Kconfig/.config).
> I though about making it more consistent, but it's not really a pressing 
> issue, so I left it as is for now.

For now I added this patch (for previous mail).
This makes the configs equal so they can be compared.

	Sam

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 0759761..6f39c80 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -510,7 +510,7 @@ int conf_write(const char *name)
                        case S_HEX:
                                str = sym_get_string_value(sym);
                                if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-                                       fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
+                                       fprintf(out, "CONFIG_%s=0x%s\n", sym->name, str);
                                        break;
                                }
                        case S_INT:

