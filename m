Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60726 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbgF3CJA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 22:09:00 -0400
MIME-Version: 1.0
References: <20200628015041.1000002-1-masahiroy@kernel.org> <87imfa8le0.fsf@mpe.ellerman.id.au>
In-Reply-To: <87imfa8le0.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jun 2020 11:08:07 +0900
Message-ID: <CAK7LNATusciypBJ4dYZcyrugdi_rXEV_s=zxAehDxsX+Sd5z4g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Paul Mackerras <paulus@samba.org>, Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 2:55 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > CFLAGS_REMOVE_<file>.o works per object, that is, there is no
> > convenient way to filter out flags for every object in a directory.
> >
> > Add ccflags-remove-y and asflags-remove-y to make it easily.
> >
> > Use ccflags-remove-y to clean up some Makefiles.
> >
> > Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/arm/boot/compressed/Makefile | 6 +-----
> >  arch/powerpc/xmon/Makefile        | 3 +--
> >  arch/sh/boot/compressed/Makefile  | 5 +----
> >  kernel/trace/Makefile             | 4 ++--
> >  lib/Makefile                      | 5 +----
> >  scripts/Makefile.lib              | 4 ++--
> >  6 files changed, 8 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> > index 89c76ca35640..55cbcdd88ac0 100644
> > --- a/arch/powerpc/xmon/Makefile
> > +++ b/arch/powerpc/xmon/Makefile
> > @@ -7,8 +7,7 @@ UBSAN_SANITIZE := n
> >  KASAN_SANITIZE := n
> >
> >  # Disable ftrace for the entire directory
> > -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> > -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> > +ccflags-remove-y += $(CC_FLAGS_FTRACE)
>
> This could be:
>
> ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
>
> Similar to kernel/trace/Makefile below.


I fixed it up, and applied to linux-kbuild.
Thanks.


> I don't mind though.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers
>
> > diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> > index 6575bb0a0434..7492844a8b1b 100644
> > --- a/kernel/trace/Makefile
> > +++ b/kernel/trace/Makefile
> > @@ -2,9 +2,9 @@
> >
> >  # Do not instrument the tracer itself:
> >
> > +ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> > +
> >  ifdef CONFIG_FUNCTION_TRACER
> > -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> > -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> >
> >  # Avoid recursion due to instrumentation.
> >  KCSAN_SANITIZE := n



-- 
Best Regards
Masahiro Yamada
