Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:28167 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751848AbdETTim (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 May 2017 15:38:42 -0400
MIME-Version: 1.0
In-Reply-To: <20170409130708.4753-1-bp@alien8.de>
References: <20170409130708.4753-1-bp@alien8.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 21 May 2017 04:38:35 +0900
Message-ID: <CAK7LNAT8tA=_Zi6i9w6cgHfkrwzxDm2-w2vuZpM57-P=YAvTUw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Check for libncurses before menuconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Borislav,


2017-04-09 22:07 GMT+09:00 Borislav Petkov <bp@alien8.de>:
> From: Borislav Petkov <bp@suse.de>
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


Strange, I could not reproduce this.

As far as I tested,
"make menuconfig" invoked dochecklxdialog without this patch.



mconf depends on $(lxdiaglog) at line 184:
mconf-objs     := mconf.o zconf.tab.o $(lxdialog)


$(lxdialog) depends on dochecklxdialog at line 199:
$(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog




> Make that check a prerequisite to mconf so that the user sees the error
> message instead:
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
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  scripts/kconfig/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 90a091b6ae4d..e58220ce65b9 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -24,6 +24,8 @@ xconfig: $(obj)/qconf
>  gconfig: $(obj)/gconf
>         $< $(silent) $(Kconfig)
>
> +$(obj)/mconf: $(obj)/dochecklxdialog
> +
>  menuconfig: $(obj)/mconf
>         $< $(silent) $(Kconfig)
>
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
