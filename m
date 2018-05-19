Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:56766 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752451AbeESSau (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 May 2018 14:30:50 -0400
Subject: Re: [PATCH 0/5] kconfig: refactor package checks for GUI frontends
References: <1526619146-1895-1-git-send-email-yamada.masahiro@socionext.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <35d9beea-7d99-99dd-a266-431a27d5df19@infradead.org>
Date: Sat, 19 May 2018 11:30:47 -0700
MIME-Version: 1.0
In-Reply-To: <1526619146-1895-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>, Michal Marek <michal.lkml@markovi.net>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arvind Prasanna <arvindprasanna@gmail.com>

On 05/17/18 21:52, Masahiro Yamada wrote:
> Kconfig supports 4 GUI frontends.
> Each of them needs some support packages, but checks them differently:
> 
>   qconf, gconf: check packages in Makefile (pkg-config is required)
>   mconf: lxdialog/check-lxdialog.sh
>   nconf: needs ncurses, but its presence is not checked
> 
> This series refactor the package checks so that all of them work
> in the same way.
> 
> The package check scripts have been moved to scripts/kconfig/*conf-cfg.sh
> 
> The motivation of this clean-up is Randy's following patch:
> https://patchwork.kernel.org/patch/10277723/
> 
> I want to clean up existing code before adding more checks.


Hi.

This is a nice cleanup series.  Thanks for doing this work.

As I noted in my reply to patch 4 (mconf), I can no longer build
mconf and patch 5 (nconf) has the same issue.

On my system, "pkg-config --list-all" lists 153 packages but nothing
about ncurses.

Sure, I could ditch (drop) openSUSE and use something else, but then this
problem would just come up later. :(

[search web...]

I see that a few years ago there was a bug report (in Debian) that the
ncurses-devel package was not built with --enable-pc-files (for pkg-config
files).  There was a similar problem in Arch Linux.  (2011 and 2012)
These should be fixed by now (!), but maybe openSUSE still builds some
libraries without --enable-pc-files.



> Masahiro Yamada (5):
>   kbuild: do not display CHK for filechk
>   kconfig: refactor Qt package checks for building qconf
>   kconfig: refactor GTK+ package checks for building gconf
>   kconfig: refactor ncurses package checks for building mconf
>   kconfig: refactor ncurses package checks for building nconf
> 
>  scripts/Kbuild.include                     |   1 -
>  scripts/kconfig/Makefile                   | 160 ++++++++++-------------------
>  scripts/kconfig/gconf-cfg.sh               |  23 +++++
>  scripts/kconfig/lxdialog/check-lxdialog.sh |  93 -----------------
>  scripts/kconfig/lxdialog/dialog.h          |   2 +-
>  scripts/kconfig/mconf-cfg.sh               |  24 +++++
>  scripts/kconfig/nconf-cfg.sh               |  22 ++++
>  scripts/kconfig/qconf-cfg.sh               |  25 +++++
>  8 files changed, 148 insertions(+), 202 deletions(-)
>  create mode 100755 scripts/kconfig/gconf-cfg.sh
>  delete mode 100755 scripts/kconfig/lxdialog/check-lxdialog.sh
>  create mode 100755 scripts/kconfig/mconf-cfg.sh
>  create mode 100644 scripts/kconfig/nconf-cfg.sh
>  create mode 100755 scripts/kconfig/qconf-cfg.sh


-- 
~Randy
