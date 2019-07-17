Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20473 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfGQGzf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:55:35 -0400
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716170606.GA38406@archlinux-threadripper> <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 17 Jul 2019 15:54:48 +0900
Message-ID: <CAK7LNASBiaMX8ihnmhLGmYfHX=ZHZmVN91nxmFZe-OCaw6Px2w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Fail if gold linker is detected
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Nathan Chancellor <natechancellor@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, "H.J. Lu" <hjl.tools@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Mike Lothian <mike@fireburn.co.uk>

On Wed, Jul 17, 2019 at 4:47 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> The gold linker has known issues of failing the build both in random and in
> predictible ways:
>
>  - The x86/X32 VDSO build fails with:
>
>    arch/x86/entry/vdso/vclock_gettime-x32.o:vclock_gettime.c:function do_hres:
>    error: relocation overflow: reference to 'hvclock_page'
>
>    That's a known issue for years and the usual workaround is to disable
>    CONFIG_X86_32
>
>  - A recent build failure is caused by turning a relocation into an
>    absolute one for unknown reasons. See link below.
>
>  - There are a couple of gold workarounds applied already, but reports
>    about broken builds with ld.gold keep coming in on a regular base and in
>    most cases the root cause is unclear.
>
> In context of the most recent fail H.J. stated:
>
>   "Since building a workable kernel for different kernel configurations
>    isn't a requirement for gold, I don't recommend gold for kernel."
>
> So instead of dealing with attempts to duct tape gold support without
> understanding the root cause and without support from the gold folks, fail
> the build when gold is detected.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lore.kernel.org/r/CAMe9rOqMqkQ0LNpm25yE_Yt0FKp05WmHOrwc0aRDb53miFKM+w@mail.gmail.com
> ---

The code looks OK in the build system point of view.

Please let me confirm this, just in case:
For now, we give up all architectures, not only x86, right?

I have not not heard much from other arch maintainers.


-- 
Best Regards
Masahiro Yamada
