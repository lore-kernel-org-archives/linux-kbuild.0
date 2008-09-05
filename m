Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.186]:53994 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754167AbYIENuA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Sep 2008 09:50:00 -0400
Received: by mu-out-0910.google.com with SMTP id g7so352872muf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Sep 2008 06:49:58 -0700 (PDT)
Date: Fri, 5 Sep 2008 15:49:53 +0200
From: Alejandro Riveira =?UTF-8?B?RmVybsOhbmRleg==?=
	<ariveira@gmail.com>
Subject: Re: [PATCH] ncurses based config V2
Message-ID: <20080905154953.3abefbce@Varda>
In-Reply-To: <1220603220-17090-1-git-send-email-nir@tzachar.com>
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
	<1220603220-17090-1-git-send-email-nir@tzachar.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>
Cc: linux-kernel@vger.kernel.org, bzolnier@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, rdunlap@xenotime.net, kosaki.motohiro@jp.fujitsu.com, 7eggert@gmx.de, Nir Tzachar <nir@tzachar.com>

El Fri,  5 Sep 2008 11:27:00 +0300
"Nir Tzachar" <tzachar@nexus.cs.bgu.ac.il> escribió:

> Changes:
> 1) Fixed segfaults in help window.
> 2) Removed the instructions window, made the instructions appear as a button
>    which displays a popup window.
> 3) Added hot keys support. As ncurses does not support several colors inside
>    a menu, keys are highlighted using "()".
> 4) Optimized for 80x24 terminals.
> 6) Fixed zconf.y to use _menu_init
> 7) added nconfig to "make help"
> 8) Misc fixes.
> 
> Comments are appreciated.
> Cheers.
> ---
>  scripts/kconfig/Makefile            |   17 +-
>  scripts/kconfig/lkc.h               |    2 +-
>  scripts/kconfig/mconf.c             |    2 +
>  scripts/kconfig/menu.c              |    2 +-
>  scripts/kconfig/nconf.c             | 2019 +++++++++++++++++++++++++++++++++++
>  scripts/kconfig/zconf.tab.c_shipped |    2 +-
>  scripts/kconfig/zconf.y             |    2 +-
>  7 files changed, 2041 insertions(+), 5 deletions(-)
>  create mode 100644 scripts/kconfig/nconf.c

 Tried it and the segmentation fault disappeared 

> 
