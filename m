Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.169]:30046 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbYICUUq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Sep 2008 16:20:46 -0400
Received: by ug-out-1314.google.com with SMTP id c2so1933512ugf.37
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Sep 2008 13:20:44 -0700 (PDT)
From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [PATCH] ncurses based config
Date: Wed, 3 Sep 2008 22:18:20 +0200
References: <1220469076-16487-1-git-send-email-nir@tzachar.com> <200809032138.14651.bzolnier@gmail.com> <Pine.LNX.4.64.0809031259110.20541@shark.he.net>
In-Reply-To: <Pine.LNX.4.64.0809031259110.20541@shark.he.net>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200809032218.20298.bzolnier@gmail.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Nir Tzachar <nir@tzachar.com>

On Wednesday 03 September 2008, Randy.Dunlap wrote:
> On Wed, 3 Sep 2008, Bartlomiej Zolnierkiewicz wrote:
> 
> > 
> > Hi,
> > 
> > On Wednesday 03 September 2008, Nir Tzachar wrote:
> > > This patch was inspired by the kernel projects page, where an ncurses
> > > replacement for menuconfig was mentioned (by Sam Ravnborg).
> > > 
> > > Building on menuconfig, this patch implements a more modern look interface using
> > > ncurses and ncurses' satellite libraries (menu, panel, form). The implementation
> > > does not depend on lxdialog, which is currently distributed with the kernel.
> > > 
> > > The only change outside of nconf.c is due to a name clash: both ncurses and
> > > lkc.h define a fucntion named menu_init(). I changed the internal version's
> > > name. 
> > > 
> > > Please consider the patch for merging. Comments are appreciated.
> > 
> > Could you please tell what kernel version is it against?
> 
> It applies cleanly to 2.6.27-rc5-git4 FWIW.
> 
> > I'm getting the following error on make nconfig (and also on make menuconfig
> > which works fine without this patch) with the current Linus' tree:
> > 
> >   HOSTCC  scripts/kconfig/conf.o
> >   HOSTCC  scripts/kconfig/kxgettext.o
> >   HOSTCC  scripts/kconfig/nconf.o
> >   HOSTCC  scripts/kconfig/zconf.tab.o
> > scripts/kconfig/zconf.tab.c: In function ÿÿconf_parseÿÿ:
> > scripts/kconfig/zconf.tab.c:2258: warning: implicit declaration of function ÿÿmenu_initÿÿ
> >   HOSTLD  scripts/kconfig/nconf
> > scripts/kconfig/nconf arch/x86/Kconfig
> > make[1]: *** [nconfig] Segmentation fault
> > make: *** [nconfig] Error 2
> 
> Need to change all /menu_init/ in zconf.tab.c* to /_menu_init/.

Thanks, this fixed it.

> Need to strip trailing whitespace on new source code lines.
> 
> I'm seeing cyan (?) foreground on black background.  Is that the colors
> that were planned?
> 
> Instructions are dark blue on black -- cannot read them.

Yeah.  Additionally the main window for selecting options
is limited to ~40 characters x 5 lines.  Is this intended?

Also it seems that hotkeys are not highlighted/working... :(

Thanks,
Bart
