Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37503 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbeHHDmd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Aug 2018 23:42:33 -0400
MIME-Version: 1.0
In-Reply-To: <1901723.5RX4ofS7Gn@blindfold>
References: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com> <1901723.5RX4ofS7Gn@blindfold>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 8 Aug 2018 10:24:27 +0900
Message-ID: <CAK7LNATZ0HQEeVaxrHSms0R37TE3UK-=up0Bfh_rcxEi7SWS_g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Kbuild: fix and clean-up arch/um/Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-08-07 5:54 GMT+09:00 Richard Weinberger <richard@nod.at>:
> Am Samstag, 4. August 2018, 06:47:00 CEST schrieb Masahiro Yamada:
>>
>> 1/3 fixes the build failure reported by Randy.
>> (I may have seen a similar report before, but I cannot recall it.)
>>
>> 2/3 and 3/3 clean-up the Makefile a bit more.
>>
>> I'd like to apply this series to kbuild tree.
>> Ack from UML folks are appreciated.
>
> Nice to see this fixed, Masahiro! :-)
>
> Acked-by: Richard Weinberger <richard@nod.at>
>


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
