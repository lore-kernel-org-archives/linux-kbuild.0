Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.190]:23691 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752133AbYICTmQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Sep 2008 15:42:16 -0400
Received: by mu-out-0910.google.com with SMTP id g7so2877173muf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Sep 2008 12:42:14 -0700 (PDT)
From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [PATCH] ncurses based config
Date: Wed, 3 Sep 2008 21:38:14 +0200
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
In-Reply-To: <1220469076-16487-1-git-send-email-nir@tzachar.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Message-Id: <200809032138.14651.bzolnier@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>
Cc: linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Nir Tzachar <nir@tzachar.com>


Hi,

On Wednesday 03 September 2008, Nir Tzachar wrote:
> This patch was inspired by the kernel projects page, where an ncurses
> replacement for menuconfig was mentioned (by Sam Ravnborg).
> 
> Building on menuconfig, this patch implements a more modern look interface using
> ncurses and ncurses' satellite libraries (menu, panel, form). The implementation
> does not depend on lxdialog, which is currently distributed with the kernel.
> 
> The only change outside of nconf.c is due to a name clash: both ncurses and
> lkc.h define a fucntion named menu_init(). I changed the internal version's
> name. 
> 
> Please consider the patch for merging. Comments are appreciated.

Could you please tell what kernel version is it against?

I'm getting the following error on make nconfig (and also on make menuconfig
which works fine without this patch) with the current Linus' tree:

  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/kxgettext.o
  HOSTCC  scripts/kconfig/nconf.o
  HOSTCC  scripts/kconfig/zconf.tab.o
scripts/kconfig/zconf.tab.c: In function ‘conf_parse’:
scripts/kconfig/zconf.tab.c:2258: warning: implicit declaration of function ‘menu_init’
  HOSTLD  scripts/kconfig/nconf
scripts/kconfig/nconf arch/x86/Kconfig
make[1]: *** [nconfig] Segmentation fault
make: *** [nconfig] Error 2
