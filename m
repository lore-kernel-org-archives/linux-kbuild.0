Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:5107 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834AbYIDKgN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Sep 2008 06:36:13 -0400
Received: by ey-out-2122.google.com with SMTP id 6so1591712eyi.37
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Sep 2008 03:36:12 -0700 (PDT)
Date: Thu, 4 Sep 2008 12:36:09 +0200
From: Alejandro Riveira =?UTF-8?B?RmVybsOhbmRleg==?=
	<ariveira@gmail.com>
Subject: Re: [PATCH] ncurses based config
Message-ID: <20080904123609.1c3638d8@Varda>
In-Reply-To: <1220469076-16487-1-git-send-email-nir@tzachar.com>
References: <1220469076-16487-1-git-send-email-nir@tzachar.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>
Cc: linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Nir Tzachar <nir@tzachar.com>

El Wed,  3 Sep 2008 22:11:16 +0300
"Nir Tzachar" <tzachar@nexus.cs.bgu.ac.il> escribió:

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

  i apliedd your patches and the fixlet pointed out by Randy
  rebased on todays git and the menu crashes when i select
  help on Kernel Hacking>Spinlock and rw-...
  is a Segmentation fault

> 
> ---
>  scripts/kconfig/Makefile |   16 +-
>  scripts/kconfig/lkc.h    |    2 +-
>  scripts/kconfig/mconf.c  |    2 +
>  scripts/kconfig/menu.c   |    2 +-
>  scripts/kconfig/nconf.c  | 1852 ++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 1871 insertions(+), 3 deletions(-)
>  create mode 100644 scripts/kconfig/nconf.c
> 


