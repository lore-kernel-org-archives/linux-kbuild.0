Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33834 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbfHMPRJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:17:09 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so45201004pgc.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 08:17:09 -0700 (PDT)
Date: Tue, 13 Aug 2019 08:17:06 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: Parameterize kallsyms generation and correct
 reporting
Message-ID: <201908130815.33BA0DE322@keescook>
References: <201908121448.4D023D7@keescook>
 <CAK7LNASSkD3SzS5do1REjTe8n7RqUKsLGc2XwWJ7PKJ-z18Oig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASSkD3SzS5do1REjTe8n7RqUKsLGc2XwWJ7PKJ-z18Oig@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Aug 14, 2019 at 12:00:05AM +0900, Masahiro Yamada wrote:
> On Tue, Aug 13, 2019 at 6:49 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > When kallsyms generation happens, temporary vmlinux outputs are linked
> > but the quiet make output doesn't report it, giving the impression that
> > the prior command is taking longer than expected.
> >
> > Instead, report the KSYM step before the temporary linking. While at it,
> > this consolidates the repeated "kallsyms generation step" into a single
> > function and removes the existing copy/pasting.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> 
> Hmm, I did not notice this.

He either until I was getting link errors from MODINFO :)

> How about showing the link stage explicitly?
> (Is it too verbose?)
> 
>   MODINFO modules.builtin.modinfo
>   LD      .tmp_vmlinux1
>   KSYMS   .tmp_kallsyms1.o
>   LD      .tmp_vmlinux2
>   KSYMS   .tmp_kallsyms2.o
>   LD      vmlinux
>   SORTEX  vmlinux

I'm fine with this -- it's probably the right thing to do since getting
vmlinux link errors fro KSYMS probably doesn't make sense either. ;)

> If this verbosity is OK,
> you can move 'info LD  ${2}' into vmlinux_link()

Done.

> Anyway, I like the clean-ups in this patch.
> 
> This is just my personal preference, but
> may I ask two cosmetic changes?
> 
> [1] Could you move kallsyms_step()
>     between  kallsyms() and mksysmap() ?
>     I want to collect function definitions
>     to the top of the script.
> 
> [2] Could you shorten 'kallsymso_previous'
>     to 'kallsymso_prev' ?

Sounds good. v2 sent.

-- 
Kees Cook
