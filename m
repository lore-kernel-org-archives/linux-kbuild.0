Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:61510 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751774AbdFIQYb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2017 12:24:31 -0400
MIME-Version: 1.0
In-Reply-To: <20170521094447.m4thpavivflyqtf6@pd.tnic>
References: <20170409130708.4753-1-bp@alien8.de> <CAK7LNAT8tA=_Zi6i9w6cgHfkrwzxDm2-w2vuZpM57-P=YAvTUw@mail.gmail.com>
 <20170520203323.6ug3gq2yoms6acsu@pd.tnic> <CAK7LNAT2tLPn70AcxnAZuv4=VAp2Wfg4ZRMEjVU0K2wntGSN9Q@mail.gmail.com>
 <20170521094447.m4thpavivflyqtf6@pd.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 10 Jun 2017 01:24:11 +0900
Message-ID: <CAK7LNATmuLv18m4cg-Y=ZHbZifbjEkBc5j30Afs_P8=5U-_OhQ@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: Check for libncurses before menuconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-05-21 18:44 GMT+09:00 Borislav Petkov <bp@alien8.de>:
> On Sun, May 21, 2017 at 06:15:53PM +0900, Masahiro Yamada wrote:
>> Could you change line 199
>>
>>   $(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
>>
>> to
>>
>>   $(addprefix $(obj)/, mconf.o $(lxdialog)): $(obj)/dochecklxdialog
>>
>> and send v2, please?
>
> Here it is:
>
> ---
> From: Borislav Petkov <bp@suse.de>
> Date: Sun, 9 Apr 2017 15:07:08 +0200
> Subject: [PATCH v2] kconfig: Check for libncurses before menuconfig
>
> There is a check and a nice user-friendly message when the curses
> library is not present on the system and the user wants to do "make
> menuconfig". It doesn't get issued, though. Instead, we fail the build
> when mconf.c doesn't find the curses.h header:
>
>     HOSTCC  scripts/kconfig/mconf.o
>   In file included from scripts/kconfig/mconf.c:23:0:
>   scripts/kconfig/lxdialog/dialog.h:38:20: fatal error: curses.h: No such file or directory
>    #include CURSES_LOC
>                       ^
>   compilation terminated.
>
> Make sure dochecklxdialog gets run before mconf is compiled so that the
> user sees the error message instead:
>
>   $ make menuconfig
>    *** Unable to find the ncurses libraries or the
>    *** required header files.
>    *** 'make menuconfig' requires the ncurses libraries.
>    ***
>    *** Install ncurses (ncurses-devel) and try again.
>    ***
>   scripts/kconfig/Makefile:203: recipe for target 'scripts/kconfig/dochecklxdialog' failed
>   make[1]: *** [scripts/kconfig/dochecklxdialog] Error 1
>   Makefile:548: recipe for target 'menuconfig' failed
>   make: *** [menuconfig] Error 2
>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: linux-kbuild@vger.kernel.org
> Link: http://lkml.kernel.org/r/20170409130708.4753-1-bp@alien8.de
> ---

Applied to linux-kbuild/fixes.  Thanks!



-- 
Best Regards
Masahiro Yamada
