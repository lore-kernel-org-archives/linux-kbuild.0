Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f209.google.com ([209.85.219.209]:33565 "EHLO
	mail-ew0-f209.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965963AbZLHUHR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Dec 2009 15:07:17 -0500
From: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: new kbuild maintainer
Date: Tue, 8 Dec 2009 21:07:19 +0100
References: <1260276751-19501-1-git-send-email-mmarek@suse.cz> <200912081611.12625.a.miskiewicz@gmail.com> <4B1EAF69.5090609@suse.cz>
In-Reply-To: <4B1EAF69.5090609@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 8BIT
Message-Id: <200912082107.19192.a.miskiewicz@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tuesday 08 of December 2009, Michal Marek wrote:
> Arkadiusz Miskiewicz napsal(a):
> > On Tuesday 08 of December 2009, Sam Ravnborg wrote:
> >> On Tue, Dec 08, 2009 at 01:52:31PM +0100, Michal Marek wrote:
> >>> Sam was fine with handing over kbuild maintainership to me. The git
> >>> trees are already in linux-next, a merge request will follow shortly.
> >>
> >> Yep - thanks for taken over this. Glad to see this is maintained
> >> properly.
> >
> > Maybe we can get colors back in menuconfig then? ;-)
> > http://bugzilla.kernel.org/show_bug.cgi?id=13677
> 
> Does it also happen with Nir's nconfig
> (http://lkml.org/lkml/2009/11/25/119)?

Yes, it does happen, I have non-color menus. That's because nconfig also mixes 
wide ncurses library with non wide ncurses headers.

  gcc -Wp,-MD,scripts/kconfig/.nconf.o.d -Wall -Wmissing-prototypes -Wstrict-
prototypes -O2 -fomit-frame-pointer   -I/usr/include/ncurses -
DCURSES_LOC="<ncurses.h>" -DLOCALE   -c -o scripts/kconfig/nconf.o 
scripts/kconfig/nconf.c

/usr/include/ncurses is non wide version of ncurses headers (but on other 
distros it could be done differently aka /usr/include/ncures being wide 
version)

  gcc  -o scripts/kconfig/nconf scripts/kconfig/nconf.o 
scripts/kconfig/zconf.tab.o scripts/kconfig/nconf.gui.o -lncursesw -lmenu -
lpanel -lncurses

and here it's linked to non wide version of library (also to wide, too due to 
scripts/kconfig/lxdialog/check-lxdialog.sh putting it here)

Anyway way to solve this is:
- detect if ncurses header is wide or non-wide
- link with proper ncurses library based on detected header

> Michal

-- 
Arkadiusz Miśkiewicz        PLD/Linux Team
arekm / maven.pl            http://ftp.pld-linux.org/
