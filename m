Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:42177 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750842AbdLWKOw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Dec 2017 05:14:52 -0500
MIME-Version: 1.0
In-Reply-To: <20171222144113.6bbc49b753a1c7f2329d59e0@linux-foundation.org>
References: <20171221134744.2295529-1-arnd@arndb.de> <20171222144113.6bbc49b753a1c7f2329d59e0@linux-foundation.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 23 Dec 2017 11:14:51 +0100
Message-ID: <CAK8P3a0fLdLH6uKHUG946pPCFGBcL8LZEvEuGLqW3wghkVWO7w@mail.gmail.com>
Subject: Re: [PATCH] [v4] kasan: rework Kconfig settings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "# 3.4.x" <stable@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev <kasan-dev@googlegroups.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@kernel.org>, Byungchul Park <byungchul.park@lge.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Dec 22, 2017 at 11:41 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Thu, 21 Dec 2017 14:46:39 +0100 Arnd Bergmann <arnd@arndb.de> wrote:

> Cc:stable is tricky.  Apart from the ordering/scheduling issue,
> 16c3ada89cff doesn't have a cc:stable tag so merging this patch into
> stable will cause the abovementioned warning.
>
> Do we really need to backport this?

I think we do: without this patch, enabling KASAN will lead to
unavoidable kernel
stack overflow in certain device drivers when built with gcc-7 or higher on
linux-4.10+ or any version that contains a backport of commit c5caf21ab0cf8.
Most people are probably still on older compilers, but it will get
worse over time
as they upgrade their distros.

The warnings we get on kernels older than this should all be for code that uses
dangerously large stack frames, though most of them do not cause an actual
stack overflow by themselves.The asan-stack option was added in linux-4.0,
and commit 3f181b4d8652 ("lib/Kconfig.debug: disable -Wframe-larger-than
warnings with KASAN=y") effectively turned off the warning for allmodconfig
kernels, so I would like to see this fix backported to any kernels
later than 4.0.

I have done dozens of fixes for individual functions with stack frames larger
than 2048 bytes with asan-stack, and I plan to make sure that all those fixes
make it into the stable kernels as well (most are already there).

Part of the complication here is that asan-stack (from 4.0) was originally
assumed to always require much larger stacks, but that turned out to be
a combination of multiple gcc bugs that we have now worked around and
fixed, but sanitize-address-use-after-scope (from v4.10) has a much higher
inherent stack usage and also suffers from at least three other problems
that we have analyzed but not yet fixed upstream, each of them makes
the stack usage more severe than it should be.

        Arnd
