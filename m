Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:60721 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbdEUJQC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 May 2017 05:16:02 -0400
MIME-Version: 1.0
In-Reply-To: <20170520203323.6ug3gq2yoms6acsu@pd.tnic>
References: <20170409130708.4753-1-bp@alien8.de> <CAK7LNAT8tA=_Zi6i9w6cgHfkrwzxDm2-w2vuZpM57-P=YAvTUw@mail.gmail.com>
 <20170520203323.6ug3gq2yoms6acsu@pd.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 21 May 2017 18:15:53 +0900
Message-ID: <CAK7LNAT2tLPn70AcxnAZuv4=VAp2Wfg4ZRMEjVU0K2wntGSN9Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Check for libncurses before menuconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Borislav,


2017-05-21 5:33 GMT+09:00 Borislav Petkov <bp@alien8.de>:
> On Sun, May 21, 2017 at 04:38:35AM +0900, Masahiro Yamada wrote:
>> Strange, I could not reproduce this.
>
> Remove libncurses5-dev or whatever it is called on your system and do:
>
> $ make menuconfig
>   HOSTCC  scripts/kconfig/mconf.o
> In file included from scripts/kconfig/mconf.c:23:0:
> scripts/kconfig/lxdialog/dialog.h:38:20: fatal error: curses.h: No such file or directory
>  #include CURSES_LOC
>                     ^
> compilation terminated.
> scripts/Makefile.host:124: recipe for target 'scripts/kconfig/mconf.o' failed
> make[1]: *** [scripts/kconfig/mconf.o] Error 1
> Makefile:548: recipe for target 'menuconfig' failed
> make: *** [menuconfig] Error 2


OK, I see.

So, it is $(obj)/mconf.o instead of $(obj)/mconf
that should depend on $(obj)/dochecklxdialog.


Could you change line 199

  $(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog

to

  $(addprefix $(obj)/, mconf.o $(lxdialog)): $(obj)/dochecklxdialog

and send v2, please?


This will make sure dochecklxdialog is run before compiling mconf.o
in parallel building.


Thanks!



-- 
Best Regards
Masahiro Yamada
