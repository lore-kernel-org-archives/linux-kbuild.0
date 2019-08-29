Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:55684 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfH2Q00 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 12:26:26 -0400
MIME-Version: 1.0
References: <20190822044613.5349-1-yamada.masahiro@socionext.com> <20190822044613.5349-6-yamada.masahiro@socionext.com>
In-Reply-To: <20190822044613.5349-6-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 30 Aug 2019 01:25:43 +0900
Message-ID: <CAK7LNAQLnOa6f5jDLochYyFdctzUuMvk4ETGga-f2v-EP6hqnw@mail.gmail.com>
Subject: Re: [PATCH 6/6] kbuild: check clean srctree even earlier
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Aug 22, 2019 at 1:46 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Move the outputmakefile target to the leftmost in the prerequisite list
> so that this is checked first. There is no guarantee that Make runs the
> prerequisites from left to right,

Looks like this is guaranteed.

I did not know POSIX defined this.


I will reword the commit log as follows:


"
kbuild: check clean srctree even earlier

Move the outputmakefile target to the leftmost in the prerequisite list
so that this is checked first. GNU Make processes the prerequisites
left to right.

GNU Make will keep to stick to this behavior, and it seems even
POSIX standard, according to this:
https://lists.gnu.org/archive/html/bug-make/2019-08/msg00030.html

The POSIX standard of make is available here:
https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html

Of course, when the parallel option -j given, other targets will be run
simultaneously but it is nice to show the error as early as possible.
"




> but at least the released versions of
> GNU Make work like that when the parallel build option is not given.
>
> Of course, when the parallel option -j given, other targets will be run
> simultaneously but it is nice to show the error as early as possible.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 960df4d35b15..089983a8a028 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -581,10 +581,10 @@ ifdef config-build
>  include arch/$(SRCARCH)/Makefile
>  export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT
>
> -config: scripts_basic outputmakefile FORCE
> +config: outputmakefile scripts_basic FORCE
>         $(Q)$(MAKE) $(build)=scripts/kconfig $@
>
> -%config: scripts_basic outputmakefile FORCE
> +%config: outputmakefile scripts_basic FORCE
>         $(Q)$(MAKE) $(build)=scripts/kconfig $@
>
>  else #!config-build
> @@ -1123,7 +1123,7 @@ scripts: scripts_basic scripts_dtc
>
>  PHONY += prepare archprepare
>
> -archprepare: archheaders archscripts scripts include/config/kernel.release outputmakefile \
> +archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
>         asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
>
>  prepare0: archprepare
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
