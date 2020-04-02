Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37081 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389875AbgDBRdc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:33:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id u65so2081764pfb.4
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2020 10:33:31 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:33:28 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Message-ID: <202004021031.511103E30D@keescook>
References: <202004020117.6E434C035@keescook>
 <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Apr 03, 2020 at 02:00:52AM +0900, Masahiro Yamada wrote:
> Hi Kees,
> 
> On Thu, Apr 2, 2020 at 5:18 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > When doing Clang builds of the kernel, it is possible to link with
> > either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> > discover this from a running kernel. Add the "$LD -v" output to
> > /proc/version.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  init/Makefile       | 2 +-
> >  scripts/mkcompile_h | 8 ++++++--
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/init/Makefile b/init/Makefile
> > index 6246a06364d0..82c15bdb42d7 100644
> > --- a/init/Makefile
> > +++ b/init/Makefile
> > @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
> >         @$($(quiet)chk_compile.h)
> >         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
> >         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> > -       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
> > +       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
> > diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> > index 3a5a4b210c86..f98c07709370 100755
> > --- a/scripts/mkcompile_h
> > +++ b/scripts/mkcompile_h
> > @@ -6,7 +6,8 @@ ARCH=$2
> >  SMP=$3
> >  PREEMPT=$4
> >  PREEMPT_RT=$5
> > -CC=$6
> > +LD=$6
> > +CC=$7
> 
> 
> Just a nit.
> 
> If you just append 'LD',
> you do not need to touch the 'CC=$6' line.

Oh! Yes, good point. I had convinced myself that the "CC=$6" was dropping
all the passed-in KBUILD_CFLAGS, but I failed to notice the double quotes.

> If you do not mind, I will fold the following
> on top of your patch.

Yes, that would be great; thanks!

-Kees

> 
> 
> 
> 
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>         @$($(quiet)chk_compile.h)
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
>         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> -       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
> +       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)" "$(LD)"
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 8b38a96163e2..5b80a4699740 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -6,8 +6,8 @@ ARCH=$2
>  SMP=$3
>  PREEMPT=$4
>  PREEMPT_RT=$5
> -LD=$6
> -CC=$7
> +CC=$6
> +LD=$7
> 
> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

-- 
Kees Cook
