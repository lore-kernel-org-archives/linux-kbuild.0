Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:45303 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422786Ab3CVSa7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Mar 2013 14:30:59 -0400
Received: by mail-we0-f171.google.com with SMTP id d46so1664979wer.30
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2013 11:30:58 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/2] menuconfig: optionally use pkg-config to detect ncurses libs
Date: Fri, 22 Mar 2013 19:30:53 +0100
References: <cover.1362679061.git.yann.morin.1998@free.fr> <fc9c6e000f62c2eeda426d4d5f022b3d57729bb0.1362679061.git.yann.morin.1998@free.fr> <514B851F.4010500@suse.cz>
In-Reply-To: <514B851F.4010500@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <201303221930.54381.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Justin Lecher <jlec@gentoo.org>

Michal, All,

On Thursday 21 March 2013 Michal Marek wrote:
> Dne 7.3.2013 19:20, Yann E. MORIN napsal(a):
> > From: Justin Lecher <jlec@gentoo.org>
[--SNIP--]
> > diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
> > index 8078813..782d200 100644
> > --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> > +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> > @@ -4,6 +4,8 @@
> >  # What library to link
> >  ldflags()
> >  {
> > +	pkg-config --libs ncursesw 2>/dev/null && exit
> > +	pkg-config --libs ncurses 2>/dev/null && exit
> >  	for ext in so a dll.a dylib ; do
> >  		for lib in ncursesw ncurses curses ; do
> 
> Do you also plan to use pkg-config in the ccflags function?

That was my intention to pursue Justin's work to the CFLAGS, but that is
not so simple for menuconfig as it is for the libs, as:

  - we need the name of the header to include: '-DCURSES_LOC="<path/ncurses.h>"'
    (where 'path' is a relative path) which we use as: #include CURSES_LOC
  - there is no way to get this info from pkg-config

So, I'll be working a bit more on this this WE, and see if I can come with
something meaningful and not too ugly. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
