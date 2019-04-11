Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41021 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfDKOZx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 10:25:53 -0400
MIME-Version: 1.0
References: <1554633831-10303-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1554633831-10303-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Apr 2019 23:24:46 +0900
Message-ID: <CAK7LNAQawsF2PC9VJ8PTHY1fNEAVvg6dm8soQ9rXwboYFxJQrw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check arch/$(SRCARCH)/include/generated before
 out-of-tree build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Apr 7, 2019 at 7:44 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> After cross-compiling the kernel, "make mrproper" should be executed
> with the proper ARCH= option. Otherwise, stale objects will remain
> under arch/$(SRCARCH)/.
>
> One bad scenario is like this:
>
>   $ make ARCH=arm defconfig all   # cross-compile the kernel for arm
>   $ make mrproper                 # mrproper for host-arch (i.e. x86)
>   $ make ARCH=arm O=build_dir defconfig all
>
> If you miss ARCH= for mrproper and cross-compile the kernel with O=
> and ARCH= options, Kbuild will happily start to build, but may fail
> due to stale objects in the srctree.
>
> If $(srctree)/arch/$(SRCARCH)/include/generated/ exists, let's stop
> the out-of-tree build. To detect this, mrproper should clean only
> arch/$(SRCARCH)/include/generated/.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild.

> ---
>
>  Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 10643c3..17945ce 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1091,7 +1091,9 @@ PHONY += prepare archprepare prepare1 prepare3
>  prepare3: include/config/kernel.release
>  ifneq ($(srctree),.)
>         @$(kecho) '  Using $(srctree) as source for kernel'
> -       $(Q)if [ -f $(srctree)/.config -o -d $(srctree)/include/config ]; then \
> +       $(Q)if [ -f $(srctree)/.config -o \
> +                -d $(srctree)/include/config -o \
> +                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
>                 echo >&2 "  $(srctree) is not clean, please run 'make mrproper'"; \
>                 echo >&2 "  in the '$(srctree)' directory.";\
>                 /bin/false; \
> @@ -1350,7 +1352,7 @@ CLEAN_DIRS  += $(MODVERDIR) include/ksym
>
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_DIRS  += include/config usr/include include/generated          \
> -                 arch/*/include/generated .tmp_objdiff
> +                 arch/$(SRCARCH)/include/generated .tmp_objdiff
>  MRPROPER_FILES += .config .config.old .version \
>                   Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
>                   signing_key.pem signing_key.priv signing_key.x509     \
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
