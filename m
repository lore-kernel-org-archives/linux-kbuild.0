Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:47680 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755934AbdLVWlQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Dec 2017 17:41:16 -0500
Date: Fri, 22 Dec 2017 14:41:13 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] [v4] kasan: rework Kconfig settings
Message-Id: <20171222144113.6bbc49b753a1c7f2329d59e0@linux-foundation.org>
In-Reply-To: <20171221134744.2295529-1-arnd@arndb.de>
References: <20171221134744.2295529-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: stable@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@kernel.org>, Byungchul Park <byungchul.park@lge.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, 21 Dec 2017 14:46:39 +0100 Arnd Bergmann <arnd@arndb.de> wrote:

> We get a lot of very large stack frames using gcc-7.0.1 with the default
> -fsanitize-address-use-after-scope --param asan-stack=1 options, which
> can easily cause an overflow of the kernel stack, e.g.
> 
> drivers/gpu/drm/i915/gvt/handlers.c:2434:1: warning: the frame size of 46176 bytes is larger than 3072 bytes
> drivers/net/wireless/ralink/rt2x00/rt2800lib.c:5650:1: warning: the frame size of 23632 bytes is larger than 3072 bytes
> lib/atomic64_test.c:250:1: warning: the frame size of 11200 bytes is larger than 3072 bytes
> drivers/gpu/drm/i915/gvt/handlers.c:2621:1: warning: the frame size of 9208 bytes is larger than 3072 bytes
> drivers/media/dvb-frontends/stv090x.c:3431:1: warning: the frame size of 6816 bytes is larger than 3072 bytes
> fs/fscache/stats.c:287:1: warning: the frame size of 6536 bytes is larger than 3072 bytes
> 
> To reduce this risk, -fsanitize-address-use-after-scope is now split
> out into a separate CONFIG_KASAN_EXTRA Kconfig option, leading to stack
> frames that are smaller than 2 kilobytes most of the time on x86_64. An
> earlier version of this patch also prevented combining KASAN_EXTRA with
> KASAN_INLINE, but that is no longer necessary with gcc-7.0.1.
> 
> All patches to get the frame size below 2048 bytes with CONFIG_KASAN=y and
> CONFIG_KASAN_EXTRA=n have been merged by maintainers now, so we can bring
> back that default now. KASAN_EXTRA=y still causes lots of warnings but now
> defaults to !COMPILE_TEST to disable it in allmodconfig, and it remains
> disabled in all other defconfigs since it is a new option.  I arbitrarily
> raise the warning limit for KASAN_EXTRA to 3072 to reduce the noise,
> but an allmodconfig kernel still has around 50 warnings on gcc-7.
> 
> I experimented a bit more with smaller stack frames and have another
> follow-up series that reduces the warning limit for 64-bit architectures
> to 1280 bytes (without CONFIG_KASAN).
> 
> With earlier versions of this patch series, I also had patches to
> address the warnings we get with KASAN and/or KASAN_EXTRA, using a
> "noinline_if_stackbloat" annotation. That annotation now got replaced with
> a gcc-8 bugfix (see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715)
> and a workaround for older compilers, which means that KASAN_EXTRA is
> now just as bad as before and will lead to an instant stack overflow in
> a few extreme cases.
> 
> This reverts parts of commit commit 3f181b4 ("lib/Kconfig.debug: disable
> -Wframe-larger-than warnings with KASAN=y").
> Two patches in linux-next should be merged first to avoid introducing
> warnings in an allmodconfig build:
> 3cd890dbe2a4 ("media: dvb-frontends: fix i2c access helpers for KASAN")
> 16c3ada89cff ("media: r820t: fix r820t_write_reg for KASAN")
> 
> Cc: stable@vger.kernel.org

Cc:stable is tricky.  Apart from the ordering/scheduling issue,
16c3ada89cff doesn't have a cc:stable tag so merging this patch into
stable will cause the abovementioned warning.

Do we really need to backport this?

