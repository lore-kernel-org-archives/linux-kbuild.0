Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:45792 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfCMNtI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 09:49:08 -0400
MIME-Version: 1.0
References: <20190312215203.27643-1-natechancellor@gmail.com>
 <80fb5b7f-42f9-4fd1-00cf-bfa7965ff8f7@rasmusvillemoes.dk> <20190313134447.GA19066@archlinux-ryzen>
In-Reply-To: <20190313134447.GA19066@archlinux-ryzen>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Mar 2019 14:48:49 +0100
Message-ID: <CAK8P3a344k=MDAX-d21U4+H+mv7Vcd9YhAN4NPEJm1CXv76tkw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Add '-fno-builtin-bcmp' to CLANG_FLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, James Y Knight <jyknight@google.com>, clang-built-linux@googlegroups.com, "# 3.4.x" <stable@vger.kernel.org>

On Wed, Mar 13, 2019 at 2:44 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> On Wed, Mar 13, 2019 at 09:13:11AM +0100, Rasmus Villemoes wrote:
> > Wouldn't it be better to just define bcmp as an alias for memcmp? They
> > seem to have compatible prototypes, and then somebody might someday sit
> > down and implement some word-at-a-time version of bcmp making use of the
> > weaker guarantees about the return value to gain some performance. But I
> > suppose that can also be done later.
>
> Thank you much for the review, I didn't even realize this was possible :)
>
> I'd certainly like to explore it as that is what glibc does. How would
> you suggest going about it here?

I suggested a possible implementation (likely contains bugs) and
an alias for architectures that require strict alignment, see
https://bugs.llvm.org/show_bug.cgi?id=41035#c11

We could start out with just the alias.

       Arnd
