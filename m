Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgFZUSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:18:49 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62491C03E97A
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:18:49 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b16so5068925pfi.13
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:18:49 -0700 (PDT)
Date: Fri, 26 Jun 2020 13:18:46 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: Provide way to actually disable stack protector
Message-ID: <202006261314.B6856AA96@keescook>
References: <202006221201.3641ED037E@keescook>
 <CAK7LNAQL=XF+xvsRNTEGXtY7J-fx5FJKpMuScoxLt8SDKGB3_Q@mail.gmail.com>
 <202006222234.FBCEAD7F@keescook>
 <CAK7LNARRU7j_aSgZreuR-jyFYAipaJwZjUwzmE9RcohgKJvS8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARRU7j_aSgZreuR-jyFYAipaJwZjUwzmE9RcohgKJvS8w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Jun 27, 2020 at 04:04:33AM +0900, Masahiro Yamada wrote:
> On Tue, Jun 23, 2020 at 2:37 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Tue, Jun 23, 2020 at 11:33:53AM +0900, Masahiro Yamada wrote:
> > > Is it OK to not patch syscall_x32.c ?
> >
> > Good question. Peter? (It seems all the syscall_*.c files are just a
> > table, not code -- why do they need any instrumentation changes?)

I'd still like to know the answer to this one...

> Is it useful when we know
> DISABLE_STACKPROTECTOR = -fno-stack-protector  ?

I'm fine with that. My point was the using _REMOVE isn't going to work
for some compiler builds.

> I'd rather want to apply this patch
> https://patchwork.kernel.org/patch/11628493/
> and hard-code -fno-stack-protector where necessary.

That's fine. I will send a separate fix for arch/x86/entry/Makefile.

> cc-flags-y comes after KBUILD_CFLAGS
> so that -fno-stack-protector can negate -fstack-protector(-strong)

Okay, good.

-- 
Kees Cook
