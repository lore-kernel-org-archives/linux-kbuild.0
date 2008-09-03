Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.26]:46573 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752243AbYICU3e convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Sep 2008 16:29:34 -0400
Received: by ey-out-2122.google.com with SMTP id 6so1466793eyi.37
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Sep 2008 13:29:32 -0700 (PDT)
Date: Wed, 3 Sep 2008 22:29:27 +0200
From: Alejandro Riveira =?UTF-8?B?RmVybsOhbmRleg==?=
	<ariveira@gmail.com>
Subject: Re: [PATCH] ncurses based config
Message-ID: <20080903222927.7d191458@Varda>
In-Reply-To: <Pine.LNX.4.64.0809031259110.20541@shark.he.net>
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
	<200809032138.14651.bzolnier@gmail.com>
	<Pine.LNX.4.64.0809031259110.20541@shark.he.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Nir Tzachar <nir@tzachar.com>

El Wed, 3 Sep 2008 13:02:42 -0700 (PDT)
"Randy.Dunlap" <rdunlap@xenotime.net> escribió:

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

 Tried it

> 
> Need to strip trailing whitespace on new source code lines.
> 
> I'm seeing cyan (?) foreground on black background.  Is that the colors
> that were planned?
  
 much nicer colors here (ubuntu) 
 http://img177.imageshack.us/my.php?image=pantallazonm7.png

> 
> Instructions are dark blue on black -- cannot read them.
> 

 
