Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:62993 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935789AbZLHUbY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Dec 2009 15:31:24 -0500
From: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: new kbuild maintainer
Date: Tue, 8 Dec 2009 21:31:25 +0100
References: <1260276751-19501-1-git-send-email-mmarek@suse.cz> <200912082107.19192.a.miskiewicz@gmail.com> <4B1EB5E9.3010506@suse.cz>
In-Reply-To: <4B1EB5E9.3010506@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 8BIT
Message-Id: <200912082131.26051.a.miskiewicz@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Nir Tzachar <nir.tzachar@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tuesday 08 of December 2009, Michal Marek wrote:
> Arkadiusz Miskiewicz napsal(a):
> > On Tuesday 08 of December 2009, Michal Marek wrote:
> >> Arkadiusz Miskiewicz napsal(a):
> >>> Maybe we can get colors back in menuconfig then? ;-)
> >>> http://bugzilla.kernel.org/show_bug.cgi?id=13677
> >>
> >> Does it also happen with Nir's nconfig
> >> (http://lkml.org/lkml/2009/11/25/119)?
> >
> > Yes, it does happen, I have non-color menus. That's because nconfig also
> > mixes wide ncurses library with non wide ncurses headers.
> >
> >   gcc -Wp,-MD,scripts/kconfig/.nconf.o.d -Wall -Wmissing-prototypes
> > -Wstrict- prototypes -O2 -fomit-frame-pointer   -I/usr/include/ncurses -
> > DCURSES_LOC="<ncurses.h>" -DLOCALE   -c -o scripts/kconfig/nconf.o
> > scripts/kconfig/nconf.c
> >
> > /usr/include/ncurses is non wide version of ncurses headers (but on other
> > distros it could be done differently aka /usr/include/ncures being wide
> > version)
> >
> >   gcc  -o scripts/kconfig/nconf scripts/kconfig/nconf.o
> > scripts/kconfig/zconf.tab.o scripts/kconfig/nconf.gui.o -lncursesw -lmenu
> > - lpanel -lncurses
> >
> > and here it's linked to non wide version of library (also to wide, too
> > due to scripts/kconfig/lxdialog/check-lxdialog.sh putting it here)
> >
> > Anyway way to solve this is:
> > - detect if ncurses header is wide or non-wide
> > - link with proper ncurses library based on detected header
> 
> Nir, you surely know ncurses better than me :). Could you look into
> this?   Arkadiusz, which distribution are you using?

PLD/Linux

> Michal

-- 
Arkadiusz Miśkiewicz        PLD/Linux Team
arekm / maven.pl            http://ftp.pld-linux.org/
