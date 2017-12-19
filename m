Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:26679 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936079AbdLSIZ3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Dec 2017 03:25:29 -0500
MIME-Version: 1.0
In-Reply-To: <20171215201639.GA32042@amd>
References: <20171119222703.GA12824@amd> <CAK7LNARWMpxxC9hT8f7rGj5McjdNU1GXfjML9NbWFTCGyQ++dg@mail.gmail.com>
 <20171127094620.GA18072@amd> <20171215201639.GA32042@amd>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Dec 2017 17:24:39 +0900
Message-ID: <CAK7LNASQhFSXCa5=BGobiC7O0yovOzaW=9V=5=toEh8ferRi1w@mail.gmail.com>
Subject: Re: [PATCH] fix perl locale warnings in arch/arm/boot/
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, Keerthy <j-keerthy@ti.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Andrew Morton <akpm@osdl.org>, Russell King <linux@armlinux.org.uk>, kernel list <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-12-16 5:16 GMT+09:00 Pavel Machek <pavel@ucw.cz>:
> On Mon 2017-11-27 10:46:20, Pavel Machek wrote:
>>
>> Commit 429f7a062e3b5cf6fcf01eb00600cee5fe4d751f introduced perl into
>> arch/arm/boot/compressed/Makefile, which unfortunately leads to locale
>> warnings.
>>
>> Fix it by setting default locale.
>>
>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>
> RMK apparently can't be bothered to fix the stuff he broke. Can
> someone take the patch? Arm-soc? Linus? Andrew?
>
> Thanks,
>                                                                 Pavel

Russell does not directly pick up patches from ML.

If you want him to apply your patch,
you need to put it in his patch tracker.
(patches@arm.linux.org.uk)





>> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
>> index 45a6b9b..4656e98 100644
>> --- a/arch/arm/boot/compressed/Makefile
>> +++ b/arch/arm/boot/compressed/Makefile
>> @@ -118,7 +118,7 @@ asflags-y := -DZIMAGE
>>
>>  # Supply kernel BSS size to the decompressor via a linker symbol.
>>  KBSS_SZ = $(shell $(CROSS_COMPILE)nm $(obj)/../../../../vmlinux | \
>> -             perl -e 'while (<>) { \
>> +             LC_ALL=C perl -e 'while (<>) { \
>>                       $$bss_start=hex($$1) if /^([[:xdigit:]]+) B __bss_start$$/; \
>>                       $$bss_end=hex($$1) if /^([[:xdigit:]]+) B __bss_stop$$/; \
>>               }; printf "%d\n", $$bss_end - $$bss_start;')
>>
>>
>
>
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



-- 
Best Regards
Masahiro Yamada
