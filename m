Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:23070 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbeHPKvR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Aug 2018 06:51:17 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFxRPLjo_XnWDw5sYLnSjNhf8iPHGXomQitnGJjyuViXCQ@mail.gmail.com>
References: <CAK7LNAT9p+YPmvasWPG1qdriM+dkauf6h3bqJLnxTcZo8LG_SA@mail.gmail.com>
 <CA+55aFxRPLjo_XnWDw5sYLnSjNhf8iPHGXomQitnGJjyuViXCQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Aug 2018 16:53:39 +0900
Message-ID: <CAK7LNASWKrg=U+a1NJW-2SEp2LtG9wwDHQbPdYk=nDHCVSMeEA@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] Kconfig updates for v4.19
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,



2018-08-16 6:10 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> On Wed, Aug 15, 2018 at 10:58 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>> Masahiro Yamada (15):
>>       kconfig: make syncconfig update .config regardless of sym_change_count
>
> This one is annoying me.
>
> I don't care if it updates .config. But it does so *noisily*, so now
> my build scripts en dup having extra noise coming out from them in the
> form of another
>
>   scripts/kconfig/conf  --syncconfig Kconfig
>   #
>   # configuration written to .config
>   #
>
> which is just distracting me and doesn't seem to add any value at all.
>
> Ok, so it happens because I for legacy reasons have a "made dep" that
> isn't useful any more (but my fingers have that as the "let's do a
> kernel build" now macro), but it does seem to be entirely pointless.
> Why make that big noise about something that doesn't even *do*
> anything?
>
>                   Linus


I see.

I wrote this patch:
https://patchwork.kernel.org/patch/10567117/


I will apply it to my tree with some other fixes
and send another pull request in this MW.


-- 
Best Regards
Masahiro Yamada
