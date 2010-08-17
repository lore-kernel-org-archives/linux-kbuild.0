Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:50644 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757123Ab0HQPzJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 11:55:09 -0400
Received: by fxm13 with SMTP id 13so3568796fxm.19
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2010 08:55:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4C6A4FA2.80907@suse.cz>
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
	<1281932346-19067-3-git-send-email-lacombar@gmail.com>
	<4C6A4FA2.80907@suse.cz>
Date: Tue, 17 Aug 2010 11:55:07 -0400
Message-ID: <AANLkTindfnx2htJ--AjyMsKatjkAfXmH+po3pGz6DmfD@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: `nconf' needs -lintl
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

2010/8/17 Michal Marek <mmarek@suse.cz>:
> On 16.8.2010 06:19, Arnaud Lacombe wrote:
>> -HOSTLOADLIBES_nconf  = -lmenu -lpanel -lncurses
>> +HOSTLOADLIBES_nconf  = -lmenu -lpanel -lncurses -lintl
>
> This will not work on Linux though, the libintl functions are part of
> glibc itself. There is already scripts/kconfig/check.sh and the
> following snippet in scripts/kconfig/lkc.h
>
> #ifndef KBUILD_NO_NLS
> # include <libintl.h>
> #else
> static inline const char *gettext(const char *txt) { return txt; }
> static inline void textdomain(const char *domainname) {}
> static inline void bindtextdomain(const char *name, const char *dir) {}
> #endif
>
> that take care of disabling libintl support if it doesn't work. Not
> optimal, but it should build in theory. Could you debug why it does not
> work on NetBSD?
>
there seems to be competition between setting HOST_EXTRACFLAGS from
the command line and its assignment in the Makefile:

% gmake -v
GNU Make 3.81

Using the `menuconfig' target:

works:
% gmake V=1 menuconfig
[...]
sh //linux-2.6-stable/scripts/kconfig/lxdialog/check-lxdialog.sh
-check gcc -DCURSES_LOC="<curses.h>" -DLOCALE -DKBUILD_NO_NLS -lcurses
[...]

does not work:
% gmake HOST_EXTRACFLAGS="-DUMMY=1" V=1 menuconfig
[...]
sh /linux-2.6-stable/scripts/kconfig/lxdialog/check-lxdialog.sh -check
gcc -DUMMY=1 -lcurses
[...]

The same apply with `nconfig'. It is built with the command line
HOST_EXTRACFLAGS and the one in the Makefile is ignored.

As a side note, `nconfig' on NetBSD must be build with:

HOST_EXTRACFLAGS:="-I/usr/pkg/include/ -I/usr/pkg/include/ncurses/"
HOSTLDFLAGS="-Wl,-rpath=/usr/pkg/lib/ -L/usr/pkg/lib/"

as ncurses is not the default system curses library.

 - Arnaud
