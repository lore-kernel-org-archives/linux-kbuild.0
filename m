Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403823AbgFXVbs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 17:31:48 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC9AC0613ED
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 14:31:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b7so2686969pju.0
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 14:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com> <20200624211540.GS4817@hirez.programming.kicks-ass.net>
In-Reply-To: <20200624211540.GS4817@hirez.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 24 Jun 2020 14:31:36 -0700
Message-ID: <CAKwvOdmxz91c-M8egR9GdR1uOjeZv7-qoTP=pQ55nU8TCpkK6g@mail.gmail.com>
Subject: Re: [PATCH 00/22] add support for Clang LTO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <keescook@chromium.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, linux-arch <linux-arch@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>

On Wed, Jun 24, 2020 at 2:15 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Jun 24, 2020 at 01:31:38PM -0700, Sami Tolvanen wrote:
> > This patch series adds support for building x86_64 and arm64 kernels
> > with Clang's Link Time Optimization (LTO).
> >
> > In addition to performance, the primary motivation for LTO is to allow
> > Clang's Control-Flow Integrity (CFI) to be used in the kernel. Google's
> > Pixel devices have shipped with LTO+CFI kernels since 2018.
> >
> > Most of the patches are build system changes for handling LLVM bitcode,
> > which Clang produces with LTO instead of ELF object files, postponing
> > ELF processing until a later stage, and ensuring initcall ordering.
> >
> > Note that first objtool patch in the series is already in linux-next,
> > but as it's needed with LTO, I'm including it also here to make testing
> > easier.
>
> I'm very sad that yet again, memory ordering isn't addressed. LTO vastly
> increases the range of the optimizer to wreck things.

Hi Peter, could you expand on the issue for the folks on the thread?
I'm happy to try to hack something up in LLVM if we check that X does
or does not happen; maybe we can even come up with some concrete test
cases that can be added to LLVM's codebase?

-- 
Thanks,
~Nick Desaulniers
