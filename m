Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:53497 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbdKGRiB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2017 12:38:01 -0500
Received: by mail-lf0-f67.google.com with SMTP id l23so15446684lfk.10
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2017 09:38:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASEWrkV5m6xxXqY6Gq84XZ1oGK86CmE+=k6Pfei=RmnuQ@mail.gmail.com>
References: <20171102212649.108880-1-ndesaulniers@google.com> <CAK7LNASEWrkV5m6xxXqY6Gq84XZ1oGK86CmE+=k6Pfei=RmnuQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Nov 2017 09:37:58 -0800
Message-ID: <CAKwvOdn4EWb_T6QgcYmEN1JKvVzC6otJ=g+2OUa8Chtq7aY1mw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Behan Webster <behanw@converseincode.com>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, Greg Hackmann <ghackmann@google.com>, Matthias Kaehlcke <mka@chromium.org>, Chris Fries <cfries@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Nov 4, 2017 at 8:06 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> ld-option is only used for arch/{arm64,powerpc}/Makefile
>
> arch/arm64/Makefile:  ifeq ($(call ld-option, --fix-cortex-a53-843419),)
> arch/powerpc/Makefile:LDFLAGS_vmlinux += $(call
> ld-option,--orphan-handling=warn)
>
> I think this patch makes sense when it comes along with
> https://patchwork.kernel.org/patch/10030581/

Good point.

> but, it is now being blocked by 0-day bot
> due to a x86 problem.

Looks like that is now resolved (unless 0-day bot strikes again).

> The location of CLANG_GCC_TC define
> only matters after your patch is applied, right?

By "your patch" referring to the 0-day bot thread, yes.

> Did my request for v2 break anything?

Nothing immediately obvious, and no regressions.  It just made this
patch necessary (along with my previous one) for correctly cross
compiling with clang for arm64 and powerpc as you point out.

> One more thing: this patch does not apply to kbuild tree.

I absolutely will rebase it on your tree and send a v2.  Just to help
me understand the contribution model better: none of my other patches
have yet been requested against any trees other than Linus'.  Is this
because of where we are in the release cycle, or that a lot of kbuild
code has changed, or what?
