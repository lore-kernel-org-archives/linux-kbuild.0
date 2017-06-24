Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:23240 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754804AbdFXW7M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jun 2017 18:59:12 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNASbQYZndBPAZU5kXQF23+p4+3caGT_VxM2DYWef9MV43g@mail.gmail.com>
References: <CAK7LNASbQYZndBPAZU5kXQF23+p4+3caGT_VxM2DYWef9MV43g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Jun 2017 07:59:07 +0900
Message-ID: <CAK7LNARaSQGk7-9q3xXyDha8UftK81+Wg=TNd4W7C1XWP+moAw@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v4.12-rc7
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Linus


Sorry, I noticed a typo in my pull-request summary.


> Kbuild fixes for v4.12 (2nd)
>
> - fix warnings of host programs
>
> - fix "make tags" when COMPILE_SOURCE=1 is specified along with O=

COMPILED_SOURCE=1

  instead of

COMPILE_SOURCE=1


Could you fix it locally?







2017-06-25 7:49 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Hi Linus,
>
> This is the 2nd round of Kbuild fixes for v4.12.
> Nothing scary, just some random fixes.
> Please pull!
>
>
> The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d:
>
>   Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> tags/kbuild-fixes-v4.12-2
>
> for you to fetch changes up to ad8181060788c80c0ad75b583f24c22fa962a7a6:
>
>   kconfig: fix sparse warnings in nconfig (2017-06-23 06:00:52 +0900)
>
> ----------------------------------------------------------------
> Kbuild fixes for v4.12 (2nd)
>
> - fix warnings of host programs
>
> - fix "make tags" when COMPILE_SOURCE=1 is specified along with O=
>
> - clarify help message of C=1 option
>
> - fix dependency for ncurses compatibility check
>
> - fix "make headers_install" for fakechroot environment
>
> ----------------------------------------------------------------
> Borislav Petkov (1):
>       kconfig: Check for libncurses before menuconfig
>
> Cao jin (1):
>       Kbuild: tiny correction on `make help`
>
> Nicolas Iooss (1):
>       genksyms: add printf format attribute to error_with_pos()
>
> Randy Dunlap (1):
>       kconfig: fix sparse warnings in nconfig
>
> Richard Genoud (1):
>       kbuild: fix header installation under fakechroot environment
>
> Robert Jarzmik (1):
>       tags: honor COMPILED_SOURCE with apart output directory
>
>  Makefile                     |  2 +-
>  scripts/Makefile.headersinst | 10 +++++++++-
>  scripts/genksyms/genksyms.h  |  2 +-
>  scripts/kconfig/Makefile     |  2 +-
>  scripts/kconfig/nconf.c      | 12 ++++++------
>  scripts/kconfig/nconf.gui.c  |  4 ++--
>  scripts/tags.sh              |  1 +
>  7 files changed, 21 insertions(+), 12 deletions(-)
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
