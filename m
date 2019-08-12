Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28767 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbfHLPYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 11:24:40 -0400
MIME-Version: 1.0
References: <20190809002104.18599-1-stancheff@cray.com> <20190809002104.18599-2-stancheff@cray.com>
In-Reply-To: <20190809002104.18599-2-stancheff@cray.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Aug 2019 00:23:38 +0900
Message-ID: <CAK7LNAScm9P+QMZiqqSQnOoPsN54OTcTGpaDgxTbjJ_knoeGhA@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: recursive build of external kernel modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shaun Tancheff <shaun@tancheff.com>
Cc: Shaun Tancheff <stancheff@cray.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, "Martin K . Petersen" <martin.petersen@oracle.com>, Michal Marek <michal.lkml@markovi.net>, Shuah Khan <shuah@kernel.org>, Thomas Renninger <trenn@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM mailing list <linux-pm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>

On Fri, Aug 9, 2019 at 9:21 AM Shaun Tancheff <shaun@tancheff.com> wrote:
>
> When building a tree of external modules stage 2 fails
> silently as the root modules.order is empty.
>
> Modify the modules.order location to be fixed to the
> root when KBUILD_EXTMOD is specified and write all
> module paths to the single modules.order file.

Could you try v5.3-rc4 please?




> Signed-off-by: Shaun Tancheff <stancheff@cray.com>
> ---
>  Makefile               | 1 +
>  scripts/Makefile.build | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 23cdf1f41364..a9964492f47e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1622,6 +1622,7 @@ $(module-dirs): prepare $(objtree)/Module.symvers
>
>  modules: $(module-dirs)
>         @$(kecho) '  Building modules, stage 2.';
> +       $(Q)$rm -f $(KBUILD_EXTMOD)/modules.order
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>
>  PHONY += modules_install
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0d434d0afc0b..f9908b3d59e0 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -64,7 +64,13 @@ builtin-target := $(obj)/built-in.a
>  endif
>
>  ifeq ($(CONFIG_MODULES)$(need-modorder),y1)
> +ifneq ($(KBUILD_EXTMOD),)
> +modorder-target := $(KBUILD_EXTMOD)/modules.order
> +modorder-add := >>
> +else
>  modorder-target := $(obj)/modules.order
> +modorder-add := >
> +endif
>  endif
>
>  mod-targets := $(patsubst %.o, %.mod, $(obj-m))
> @@ -423,7 +429,7 @@ endif # builtin-target
>  $(modorder-target): $(subdir-ym) FORCE
>         $(Q){ $(foreach m, $(modorder), \
>         $(if $(filter %/modules.order, $m), cat $m, echo $m);) :; } \
> -       | $(AWK) '!x[$$0]++' - > $@
> +       | $(AWK) '!x[$$0]++' - $(modorder-add) $@
>
>  #
>  # Rule to compile a set of .o files into one .a file (with symbol table)
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
