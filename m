Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47344 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387933AbeHPHfL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Aug 2018 03:35:11 -0400
MIME-Version: 1.0
In-Reply-To: <20180616111004.GB28657@zn.tnic>
References: <20180616111004.GB28657@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Aug 2018 13:38:46 +0900
Message-ID: <CAK7LNATpMkwS523LMDSU2sQfMzTfQ8kv_+MWjz5jdbZHS65G8Q@mail.gmail.com>
Subject: Re: /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Borislav,

2018-06-16 20:10 GMT+09:00 Borislav Petkov <bp@alien8.de>:
> Hi,
>
> I'm seeing this when I do
>
> # make menuconfig
>
> after a fresh repo clean: git clean -dqfx
>
> Might wanna silence it...
>
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   HOSTCC  scripts/kconfig/lxdialog/checklist.o
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   HOSTCC  scripts/kconfig/lxdialog/inputbox.o
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   HOSTCC  scripts/kconfig/lxdialog/menubox.o
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   HOSTCC  scripts/kconfig/lxdialog/textbox.o
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   HOSTCC  scripts/kconfig/lxdialog/util.o
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
> /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
>   HOSTCC  scripts/kconfig/lxdialog/yesno.o
>   UPD     scripts/kconfig/.mconf-cfg
>   HOSTCC  scripts/kconfig/mconf.o
>   HOSTLD  scripts/kconfig/mconf
> scripts/kconfig/mconf  Kconfig
>
> Thx.


Sorry for delay.

Now I addressed this problem.
https://patchwork.kernel.org/patch/10566951/


Thanks.


> --
> Regards/Gruss,
>     Boris.
>
> Good mailing practices for 400: avoid top-posting and trim the reply.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
