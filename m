Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62685 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751495AbdKIEQj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2017 23:16:39 -0500
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn4EWb_T6QgcYmEN1JKvVzC6otJ=g+2OUa8Chtq7aY1mw@mail.gmail.com>
References: <20171102212649.108880-1-ndesaulniers@google.com>
 <CAK7LNASEWrkV5m6xxXqY6Gq84XZ1oGK86CmE+=k6Pfei=RmnuQ@mail.gmail.com> <CAKwvOdn4EWb_T6QgcYmEN1JKvVzC6otJ=g+2OUa8Chtq7aY1mw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 9 Nov 2017 13:15:48 +0900
Message-ID: <CAK7LNATLG6TXTMNLwZ5ww31OtZc4m8auW=r7hYbn=UM+hz9PDw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Behan Webster <behanw@converseincode.com>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, Greg Hackmann <ghackmann@google.com>, Matthias Kaehlcke <mka@chromium.org>, Chris Fries <cfries@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-08 2:37 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
> On Sat, Nov 4, 2017 at 8:06 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> ld-option is only used for arch/{arm64,powerpc}/Makefile
>>
>> arch/arm64/Makefile:  ifeq ($(call ld-option, --fix-cortex-a53-843419),)
>> arch/powerpc/Makefile:LDFLAGS_vmlinux += $(call
>> ld-option,--orphan-handling=warn)
>>
>> I think this patch makes sense when it comes along with
>> https://patchwork.kernel.org/patch/10030581/
>
> Good point.
>
>> but, it is now being blocked by 0-day bot
>> due to a x86 problem.
>
> Looks like that is now resolved (unless 0-day bot strikes again).
>
>> The location of CLANG_GCC_TC define
>> only matters after your patch is applied, right?
>
> By "your patch" referring to the 0-day bot thread, yes.
>
>> Did my request for v2 break anything?
>
> Nothing immediately obvious, and no regressions.  It just made this
> patch necessary (along with my previous one) for correctly cross
> compiling with clang for arm64 and powerpc as you point out.
>
>> One more thing: this patch does not apply to kbuild tree.
>
> I absolutely will rebase it on your tree and send a v2.  Just to help
> me understand the contribution model better: none of my other patches
> have yet been requested against any trees other than Linus'.  Is this
> because of where we are in the release cycle, or that a lot of kbuild
> code has changed, or what?


Generally speaking,
a preferred way is to base patches on the subsystem tree.

Kernel developers are supposed to do their development on linux-next,
but, in reality, many people work on Linus' tree since it is more stable and
git history is fast-forward.

In many cases, patches based on Linus' tree can apply to sub-systems as well.

I am happy to fix-up a conflict locally
as long as it is trivial, and there is no other reason for re-spin.

Unfortunately, Kbuild tree changed the top-level Makefile a lot in
this development cycle.

If your patch does not apply cleanly, I do not know which context you
are moving the code to.
Also, I found suspicious description in the commit log.

That's why.


-- 
Best Regards
Masahiro Yamada
