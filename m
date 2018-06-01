Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:37330 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750844AbeFAKwg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jun 2018 06:52:36 -0400
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com [209.85.213.49]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id w51AqSdH008150
        for <linux-kbuild@vger.kernel.org>; Fri, 1 Jun 2018 19:52:29 +0900
Received: by mail-vk0-f49.google.com with SMTP id y137-v6so15208451vkd.6
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jun 2018 03:52:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871sdq4wxp.fsf@concordia.ellerman.id.au>
References: <20180530121922.22122-1-npiggin@gmail.com> <87o9gxyzpo.fsf@concordia.ellerman.id.au>
 <CAK7LNARoj4g5Wf2Do1npiQUeTpiiFZLuNdmW4JfZw2D-Oe++jw@mail.gmail.com>
 <87k1rkzbry.fsf@concordia.ellerman.id.au> <CAK7LNARbz8YC7=vB_Pt-FFepLfLY-Yt=8ZiOAoPeZV3EA3VQOg@mail.gmail.com>
 <876034yrek.fsf@concordia.ellerman.id.au> <CAK7LNASxgQOsSveFuKrx7do-+643KUZwU_Gn+z7O7JK+TtMEww@mail.gmail.com>
 <871sdq4wxp.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Jun 2018 19:51:47 +0900
Message-ID: <CAK7LNASwEv8RGi=PtKyDjcwt9DFy93ug22xQAWOJ2b5j+yNkqg@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] powerpc patches for new Kconfig language
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

Hi.

2018-06-01 19:34 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
> Hi Masahiro,
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> ...
>>
>> Also, the change logs could be dropped.
>>
>> I see
>>
>> Since v1: reworded changelog to explain the cause of the problem (thanks
>> Segher) and moved the flags into the 64-32 cross compile case.
>>
>> or
>>
>> Since v1: removed extra -EB in the recordmcount script (thanks mpe)
>>
>>
>> above your signed-off-by.
>>
>>
>> Of course, this is your call,
>> and you do not need to disturb the git history if it is too late.
>
> You're right, sorry those are bit messy.
>
> I'm happy to update them, I haven't merged them yet, but I see you have
> them in your tree.
>
> So I won't change them unless you confirm you're OK with it. Let me
> know.


Could you update your branch, please?

Then, I will re-pull the new one.

Thanks!



-- 
Best Regards
Masahiro Yamada
