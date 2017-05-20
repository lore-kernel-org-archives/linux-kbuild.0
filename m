Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:42326 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751403AbdETUdh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 May 2017 16:33:37 -0400
Date: Sat, 20 May 2017 22:33:23 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kconfig: Check for libncurses before menuconfig
Message-ID: <20170520203323.6ug3gq2yoms6acsu@pd.tnic>
References: <20170409130708.4753-1-bp@alien8.de>
 <CAK7LNAT8tA=_Zi6i9w6cgHfkrwzxDm2-w2vuZpM57-P=YAvTUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAT8tA=_Zi6i9w6cgHfkrwzxDm2-w2vuZpM57-P=YAvTUw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, May 21, 2017 at 04:38:35AM +0900, Masahiro Yamada wrote:
> Strange, I could not reproduce this.

Remove libncurses5-dev or whatever it is called on your system and do:

$ make menuconfig
  HOSTCC  scripts/kconfig/mconf.o
In file included from scripts/kconfig/mconf.c:23:0:
scripts/kconfig/lxdialog/dialog.h:38:20: fatal error: curses.h: No such file or directory
 #include CURSES_LOC
                    ^
compilation terminated.
scripts/Makefile.host:124: recipe for target 'scripts/kconfig/mconf.o' failed
make[1]: *** [scripts/kconfig/mconf.o] Error 1
Makefile:548: recipe for target 'menuconfig' failed
make: *** [menuconfig] Error 2

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
