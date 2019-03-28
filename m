Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64578 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfC1JHx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Mar 2019 05:07:53 -0400
MIME-Version: 1.0
References: <1553574418-21033-1-git-send-email-yamada.masahiro@socionext.com> <20190327192021.5d676019@donnerap.cambridge.arm.com>
In-Reply-To: <20190327192021.5d676019@donnerap.cambridge.arm.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Mar 2019 18:07:07 +0900
Message-ID: <CAK7LNAQp2=EBU1ejZ8CDoo6Qbkii+ide+1V=Up26uTKyUwdWCA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not overwrite .gitignore in output directory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Mar 28, 2019 at 4:20 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Tue, 26 Mar 2019 13:26:58 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
> Masahiro,
>
> > Commit 3a51ff344204 ("kbuild: gitignore output directory") seemed to
> > bother people who version-control output directories.
>
> Thanks a lot for the patch, that works for me.
>
> > Andre Przywara says:
> > "Unfortunately this breaks my setup, because I keep a totally separate
> > git repository in my build directories to track (various versions of)
> > .config. So .gitignore there is carefully crafted to ignore most build
> > artefacts, but not .config, for instance."
> >
> > Link: https://lkml.org/lkml/2019/3/22/1819
> > Reported-by: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>


Applied to linux-kbuild/fixes.



> Cheers,
> Andre.
>
> > ---
> >
> >  Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 5fe5431..70fc778 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -499,7 +499,8 @@ outputmakefile:
> >  ifneq ($(KBUILD_SRC),)
> >       $(Q)ln -fsn $(srctree) source
> >       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
> > -     $(Q){ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
> > +     $(Q)test -e .gitignore || \
> > +     { echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
> >  endif
> >
> >  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>


-- 
Best Regards
Masahiro Yamada
