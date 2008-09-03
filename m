Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:46919 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754202AbYICUDm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Sep 2008 16:03:42 -0400
Received: from shark.he.net ([66.160.160.2]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 3 Sep 2008 13:03:40 -0700
Date: Wed, 3 Sep 2008 13:03:40 -0700 (PDT)
From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: Re: [PATCH] ncurses based config
In-Reply-To: <Pine.LNX.4.64.0809031259110.20541@shark.he.net>
Message-ID: <Pine.LNX.4.64.0809031303210.20541@shark.he.net>
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
 <200809032138.14651.bzolnier@gmail.com> <Pine.LNX.4.64.0809031259110.20541@shark.he.net>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1606286688-1519029538-1220472220=:20541"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Nir Tzachar <nir@tzachar.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1606286688-1519029538-1220472220=:20541
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 3 Sep 2008, Randy.Dunlap wrote:

> On Wed, 3 Sep 2008, Bartlomiej Zolnierkiewicz wrote:
>=20
> >=20
> > Hi,
> >=20
> > On Wednesday 03 September 2008, Nir Tzachar wrote:
> > > This patch was inspired by the kernel projects page, where an ncurses
> > > replacement for menuconfig was mentioned (by Sam Ravnborg).
> > >=20
> > > Building on menuconfig, this patch implements a more modern look inte=
rface using
> > > ncurses and ncurses' satellite libraries (menu, panel, form). The imp=
lementation
> > > does not depend on lxdialog, which is currently distributed with the =
kernel.
> > >=20
> > > The only change outside of nconf.c is due to a name clash: both ncurs=
es and
> > > lkc.h define a fucntion named menu_init(). I changed the internal ver=
sion's
> > > name.=20
> > >=20
> > > Please consider the patch for merging. Comments are appreciated.
> >=20
> > Could you please tell what kernel version is it against?
>=20
> It applies cleanly to 2.6.27-rc5-git4 FWIW.
>=20
> > I'm getting the following error on make nconfig (and also on make menuc=
onfig
> > which works fine without this patch) with the current Linus' tree:
> >=20
> >   HOSTCC  scripts/kconfig/conf.o
> >   HOSTCC  scripts/kconfig/kxgettext.o
> >   HOSTCC  scripts/kconfig/nconf.o
> >   HOSTCC  scripts/kconfig/zconf.tab.o
> > scripts/kconfig/zconf.tab.c: In function =FF=FFconf_parse=FF=FF:
> > scripts/kconfig/zconf.tab.c:2258: warning: implicit declaration of func=
tion =FF=FFmenu_init=FF=FF
> >   HOSTLD  scripts/kconfig/nconf
> > scripts/kconfig/nconf arch/x86/Kconfig
> > make[1]: *** [nconfig] Segmentation fault
> > make: *** [nconfig] Error 2
>=20
> Need to change all /menu_init/ in zconf.tab.c* to /_menu_init/.
>=20
> Need to strip trailing whitespace on new source code lines.
>=20
> I'm seeing cyan (?) foreground on black background.  Is that the colors
> that were planned?
>=20
> Instructions are dark blue on black -- cannot read them.

"make help" needs to have "nconfig" added to it.

--=20
~Randy
---1606286688-1519029538-1220472220=:20541--
