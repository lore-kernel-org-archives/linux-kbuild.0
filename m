Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752256AbdKHQv5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2017 11:51:57 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ_bugEP8hHKmCif5QCz2=Pw_GpXzYz4zJeXO0HXaT_ag@mail.gmail.com>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQfK_BWQcVW-ScrpAwNAHav3MrrzV-tjn_YUjsuvd7U5A@mail.gmail.com>
 <20171106095139.GG15260@jhogan-linux> <CAK7LNAQ_bugEP8hHKmCif5QCz2=Pw_GpXzYz4zJeXO0HXaT_ag@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 8 Nov 2017 10:51:35 -0600
Message-ID: <CAL_JsqJ8taCKnr_79UumiH2GFYq-fMzzkYm2iYevTOgUUWuzvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: dts: remove bogus bcm96358nb4ser.dtb from dtb-y entry
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: James Hogan <jhogan@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ralf Baechle <ralf@linux-mips.org>, Linux-MIPS <linux-mips@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>

On Mon, Nov 6, 2017 at 5:00 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-11-06 19:41 GMT+09:00 James Hogan <jhogan@kernel.org>:
>> Hi,
>>
>> On Sun, Nov 05, 2017 at 11:11:38PM +0900, Masahiro Yamada wrote:
>>> +CC Ralf Baechle <ralf@linux-mips.org>
>>> +CC linux-mips@linux-mips.org
>>> +CC Kevin Cernekee <cernekee@gmail.com>
>>> +CC Florian Fainelli <f.fainelli@gmail.com>
>>>
>>>
>>> I missed to CC MIPS maintainers.
>>
>> Yes, please resend the patch so it lands in patchwork.linux-mips.org.
>
>
> This is a part of clean-up series of DT building.
>
> I want Acked-by from MIPS maintainers
> so that the whole series can go to a different tree.
> (DT or Kbuild).
>
>
> Sam addressed more clean-up candidates in MIPS Makefiles
> https://patchwork.kernel.org/patch/10041879/
>
> So, I will probably end up with touching those Makefiles more.
>
> All patches must go to the same tree.
>
>
>>> 2017-11-05 14:30 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>>> > arch/mips/boot/dts/brcm/bcm96358nb4ser.dts does not exist, so
>>> > we cannot build bcm96358nb4ser.dtb .
>>
>> This appears to be due to the file being renamed in commit 695835511f96
>> ("MIPS: BMIPS: rename bcm96358nb4ser to bcm6358-neufbox4-sercom").
>> Please can you update the commit message when you resend to mention the
>> cause of the problem.
>>
>> You could also add the following if you like while you're at it:
>>
>> Fixes: 695835511f96 ("MIPS: BMIPS: rename bcm96358nb4ser to bcm6358-neufbox4-sercom")
>> Cc: <stable@vger.kernel.org> # 4.9+

I think this one can be applied independently and we'd want it to if
we tag for stable. So I think it can go thru the MIPS tree.

Rob
