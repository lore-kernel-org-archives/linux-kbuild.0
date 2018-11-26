Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33513 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbeK0Bq4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 20:46:56 -0500
MIME-Version: 1.0
References: <1542841915-19686-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542841915-19686-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 26 Nov 2018 23:51:53 +0900
Message-ID: <CAK7LNAR1kzp+aPezpff3AC=tqEs9hTgrUk6578JzD=up4KXynQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: fix single target build for external module
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Nov 22, 2018 at 6:33 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Building a single target in an external module fails due to missing
> .tmp_versions directory.
>
> For example,
>
>   $ make -C /lib/modules/$(uname -r)/build M=$PWD foo.o
>
> will fail in the following way:
>
>   CC [M]  /home/masahiro/foo/foo.o
> /bin/sh: 1: cannot create /home/masahiro/foo/.tmp_versions/foo.mod: Directory nonexistent
>
> This is because $(cmd_crmodverdir) is executed only for /, %/, %.ko
> single targets for external modules. Create .tmp_versions in the
> 'prepare' target.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild.



>  Makefile | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d5da1df..36f3f0e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1554,9 +1554,6 @@ else # KBUILD_EXTMOD
>
>  # We are always building modules
>  KBUILD_MODULES := 1
> -PHONY += crmodverdir
> -crmodverdir:
> -       $(cmd_crmodverdir)
>
>  PHONY += $(objtree)/Module.symvers
>  $(objtree)/Module.symvers:
> @@ -1568,7 +1565,7 @@ $(objtree)/Module.symvers:
>
>  module-dirs := $(addprefix _module_,$(KBUILD_EXTMOD))
>  PHONY += $(module-dirs) modules
> -$(module-dirs): crmodverdir $(objtree)/Module.symvers
> +$(module-dirs): prepare $(objtree)/Module.symvers
>         $(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@)
>
>  modules: $(module-dirs)
> @@ -1609,7 +1606,8 @@ help:
>
>  # Dummies...
>  PHONY += prepare scripts
> -prepare: ;
> +prepare:
> +       $(cmd_crmodverdir)
>  scripts: ;
>  endif # KBUILD_EXTMOD
>
> @@ -1733,17 +1731,14 @@ endif
>
>  # Modules
>  /: prepare scripts FORCE
> -       $(cmd_crmodverdir)
>         $(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
>         $(build)=$(build-dir)
>  # Make sure the latest headers are built for Documentation
>  Documentation/ samples/: headers_install
>  %/: prepare scripts FORCE
> -       $(cmd_crmodverdir)
>         $(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
>         $(build)=$(build-dir)
>  %.ko: prepare scripts FORCE
> -       $(cmd_crmodverdir)
>         $(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)   \
>         $(build)=$(build-dir) $(@:.ko=.o)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
