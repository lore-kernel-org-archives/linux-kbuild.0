Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46697 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfCMPcO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 11:32:14 -0400
Date: Wed, 13 Mar 2019 08:32:09 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] Makefile: Add '-fno-builtin-bcmp' to CLANG_FLAGS
Message-ID: <20190313153209.GA14098@archlinux-ryzen>
References: <20190312215203.27643-1-natechancellor@gmail.com>
 <80fb5b7f-42f9-4fd1-00cf-bfa7965ff8f7@rasmusvillemoes.dk>
 <20190313134447.GA19066@archlinux-ryzen>
 <CAK8P3a344k=MDAX-d21U4+H+mv7Vcd9YhAN4NPEJm1CXv76tkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a344k=MDAX-d21U4+H+mv7Vcd9YhAN4NPEJm1CXv76tkw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, James Y Knight <jyknight@google.com>, clang-built-linux@googlegroups.com, "# 3.4.x" <stable@vger.kernel.org>

On Wed, Mar 13, 2019 at 02:48:49PM +0100, Arnd Bergmann wrote:
> On Wed, Mar 13, 2019 at 2:44 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > On Wed, Mar 13, 2019 at 09:13:11AM +0100, Rasmus Villemoes wrote:
> > > Wouldn't it be better to just define bcmp as an alias for memcmp? They
> > > seem to have compatible prototypes, and then somebody might someday sit
> > > down and implement some word-at-a-time version of bcmp making use of the
> > > weaker guarantees about the return value to gain some performance. But I
> > > suppose that can also be done later.
> >
> > Thank you much for the review, I didn't even realize this was possible :)
> >
> > I'd certainly like to explore it as that is what glibc does. How would
> > you suggest going about it here?
> 
> I suggested a possible implementation (likely contains bugs) and
> an alias for architectures that require strict alignment, see
> https://bugs.llvm.org/show_bug.cgi?id=41035#c11
> 
> We could start out with just the alias.
> 
>        Arnd

So I've been messing around with this for a bit (forgive me, I'm still
learning all of the intricacies around here) and this is what I came up
with for when __ARCH_HAVE_MEMCMP is unset (not particularly difficult
obviously). I can compile, link, and boot an x86 in QEMU.

However, I am not sure how to handle memcmp definitions that are written
in assembly like arm64, as the alias attribute only works when the alias
is defined in the same translation unit. Thoughts?

Cheers,
Nathan

========================================

diff --git a/lib/string.c b/lib/string.c
index 38e4ca08e757..69a9daca9179 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -864,6 +864,9 @@ __visible int memcmp(const void *cs, const void *ct, size_t count)
        return res;
 }
 EXPORT_SYMBOL(memcmp);
+
+int bcmp(const void *cs, const void *ct, size_t count) __weak __alias(memcmp);
+EXPORT_SYMBOL(bcmp);
 #endif
 
 #ifndef __HAVE_ARCH_MEMSCAN
