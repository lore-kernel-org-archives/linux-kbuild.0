Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:33655 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752979AbeFILhu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Jun 2018 07:37:50 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX7oyxQKyc-DTXKG+o0SA_eJhKEFznn3bPxD0Gi=sA01A@mail.gmail.com>
References: <1528417303-14842-1-git-send-email-yamada.masahiro@socionext.com> <CAMuHMdX7oyxQKyc-DTXKG+o0SA_eJhKEFznn3bPxD0Gi=sA01A@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 9 Jun 2018 20:36:56 +0900
Message-ID: <CAK7LNATYmFiCgB8jxOxKtPxjMeVqgXOspE+72B4=uLmuLSyyjw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>

2018-06-08 17:20 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Yamada-san,
>
> On Fri, Jun 8, 2018 at 2:21 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Commit 21c54b774744 ("kconfig: show compiler version text in the top
>> comment") was intended to detect the compiler upgrade, but Geert
>> reported a breakage on the m68k build.
>>
>> The compiler upgrade is detected by the change of the environment
>> variable, CC_VERSION_TEXT, which contains the first line of the output
>> from $(CC) --version.  Currently, this works well when CROSS_COMPILE
>> is given via the environment variable or the Make command line.
>>
>> However, some architectures such as m68k can specify CROSS_COMPILE
>> from arch/$(SRCARCH)/Makefile as well.  In this case, "make ARCH=m68k"
>> ends up with endless syncconfig loop.
>>
>>   $ make ARCH=m68k defconfig
>>   *** Default configuration is based on 'multi_defconfig'
>>   #
>>   # configuration written to .config
>>   #
>>   $ make ARCH=m68k
>>   scripts/kconfig/conf  --syncconfig Kconfig
>>   scripts/kconfig/conf  --syncconfig Kconfig
>>   scripts/kconfig/conf  --syncconfig Kconfig
>>   scripts/kconfig/conf  --syncconfig Kconfig
>
> [...]
>
>> Fixes: 21c54b774744 ("kconfig: show compiler version text in the top comment")
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Thanks for fixing this quickly!
>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>


Applied to linux-kbuild.



-- 
Best Regards
Masahiro Yamada
