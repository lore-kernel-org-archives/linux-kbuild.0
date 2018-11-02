Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:35140 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbeKBUAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Nov 2018 16:00:48 -0400
MIME-Version: 1.0
References: <1540873965-31342-1-git-send-email-yamada.masahiro@socionext.com> <945484cd-50b4-74df-f091-d796264e5643@nvidia.com>
In-Reply-To: <945484cd-50b4-74df-f091-d796264e5643@nvidia.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 2 Nov 2018 19:53:15 +0900
Message-ID: <CAK7LNATZnacTqmA9=K5kvQAmHmAw5Qg3SEAtAx0SQxBGFBKKZQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: consolidate single targets
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jon,

On Fri, Nov 2, 2018 at 6:44 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 30/10/2018 04:32, Masahiro Yamada wrote:
> > Instead of specifying target/source pairs, let's list patterns that we
> > want to handle as single targets. This slightly changes the behavior;
> > the top Makefile previously checked the presence of a source file,
> > now Kbuild will descend into a subdirectory anyway to find out what to
> > do there.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  Makefile | 16 +---------------
> >  1 file changed, 1 insertion(+), 15 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index be76e6e..7d13add 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1713,21 +1713,7 @@ else
> >          target-dir = $(if $(KBUILD_EXTMOD),$(dir $<),$(dir $@))
> >  endif
> >
> > -%.s: %.c prepare scripts FORCE
> > -     $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> > -%.i: %.c prepare scripts FORCE
> > -     $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> > -%.o: %.c prepare scripts FORCE
> > -     $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> > -%.lst: %.c prepare scripts FORCE
> > -     $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> > -%.s: %.S prepare scripts FORCE
> > -     $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> > -%.o: %.S prepare scripts FORCE
> > -     $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> > -%.symtypes: %.c prepare scripts FORCE
> > -     $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> > -%.ll: %.c prepare scripts FORCE
> > +%.i %.ll %.lst %.o %.s %.symtypes: prepare scripts FORCE
> >       $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> >
> >  # Modules
>
> On one of my build machines (an older ubuntu 14.04 machine), this is
> commit is causing 'make mrproper' or 'make distclean' to fail. Reverting
> this commit fixes the problem.
>
> $ make mrproper
> Error: kernelrelease not valid - run 'make prepare' to update it
>   CC      kernel/bounds.s
> In file included from <command-line>:0:0:
> ././include/linux/kconfig.h:5:32: fatal error: generated/autoconf.h: No
> such file or directory
>  #include <generated/autoconf.h>
>                                 ^
> compilation terminated.
> make[1]: *** [kernel/bounds.s] Error 1
> make: *** [prepare0] Error 2
>
> FWIW, this machine has ...
>
> $ make --version
> GNU Make 3.81


Confirmed.

For make 3.81 or 3.82, 'make clean' will fail,
but it will work by passing -r option.


masahiro@pug:~/ref/linux-next$ make-3.81   clean
make-3.81: Circular checkbin.o <- prepare dependency dropped.
  HOSTCC  scripts/basic/fixdep
  CC      scripts/mod/empty.o
In file included from <command-line>:0:0:
././include/linux/kconfig.h:5:32: fatal error: generated/autoconf.h:
No such file or directory
compilation terminated.
make-3.81[2]: *** [scripts/mod/empty.o] Error 1
make-3.81[1]: *** [scripts/mod] Error 2
make-3.81: *** [scripts] Error 2
masahiro@pug:~/ref/linux-next$ make-3.81  -r clean



I know how to fix it, but
I will drop the problematic commit for now.


Thanks.


-- 
Best Regards
Masahiro Yamada
