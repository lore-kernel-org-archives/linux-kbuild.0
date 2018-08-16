Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:58572 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727610AbeHPJ2e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Aug 2018 05:28:34 -0400
Date: Thu, 16 Aug 2018 08:32:09 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kconfig: fix "Can't open ..." in parallel build
Message-ID: <20180816063209.GA31303@nazgul.tnic>
References: <1534394208-13116-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1534394208-13116-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

On Thu, Aug 16, 2018 at 01:36:48PM +0900, Masahiro Yamada wrote:
> If you run "make menuconfig" or "make nconfig" with -j<N> option in a
> fresh source tree, you will see several "Can't open ..." messages:
> 
>   $ make -j8 menuconfig
>     HOSTCC  scripts/basic/fixdep
>     YACC    scripts/kconfig/zconf.tab.c
>     LEX     scripts/kconfig/zconf.lex.c
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .:   HOSTCC  scripts/kconfig/lxdialog/checklist.o
>   Can't open scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>     HOSTCC  scripts/kconfig/lxdialog/inputbox.o
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>     UPD     scripts/kconfig/.mconf-cfg
>   /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>     HOSTCC  scripts/kconfig/lxdialog/menubox.o
>     HOSTCC  scripts/kconfig/lxdialog/textbox.o
>     HOSTCC  scripts/kconfig/lxdialog/util.o
>     HOSTCC  scripts/kconfig/lxdialog/yesno.o
>     HOSTCC  scripts/kconfig/mconf.o
>     HOSTCC  scripts/kconfig/zconf.tab.o
>     HOSTLD  scripts/kconfig/mconf
> 
> Correct dependencies to fix this problem.
> 
> Fixes: 1c5af5cf9308 ("kconfig: refactor ncurses package checks for building mconf and nconf")
> Reported-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/kconfig/Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Yap, works.

Thanks!

Tested-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
