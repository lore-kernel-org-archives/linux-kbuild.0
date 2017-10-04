Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20705 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750909AbdJDE7i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 00:59:38 -0400
MIME-Version: 1.0
In-Reply-To: <1505820967-17302-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1505820967-17302-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 4 Oct 2017 13:58:37 +0900
Message-ID: <CAK7LNASc52YJKyowkgy9=82L-SQc3TKUmhaapNcRFoXx81umcA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: comments cleanup in Makefile.lib
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Hi Cao,


2017-09-19 20:36 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> It has:
> 1. Move comments close to what it want to comment.
> 2. Comments cleanup & improvement.
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  scripts/Makefile.lib | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 58c05e5..7de9c08 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -4,8 +4,7 @@ ccflags-y  += $(EXTRA_CFLAGS)
>  cppflags-y += $(EXTRA_CPPFLAGS)
>  ldflags-y  += $(EXTRA_LDFLAGS)
>
> -#
> -# flags that take effect in sub directories
> +# flags that take effect in current and sub directories
>  export KBUILD_SUBDIR_ASFLAGS := $(KBUILD_SUBDIR_ASFLAGS) $(subdir-asflags-y)
>  export KBUILD_SUBDIR_CCFLAGS := $(KBUILD_SUBDIR_CCFLAGS) $(subdir-ccflags-y)
>
> @@ -14,14 +13,16 @@ export KBUILD_SUBDIR_CCFLAGS := $(KBUILD_SUBDIR_CCFLAGS) $(subdir-ccflags-y)
>
>  # When an object is listed to be built compiled-in and modular,
>  # only build the compiled-in version
> -
>  obj-m := $(filter-out $(obj-y),$(obj-m))
>
>  # Libraries are always collected in one lib file.
>  # Filter out objects already built-in
> -
>  lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
>
> +# Determine modorder.
> +# Unfortunately, we don't have information about ordering between -y
> +# and -m subdirs.  Just put -y's first.
> +modorder       := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
>
>  # Handle objects in subdirs
>  # ---------------------------------------------------------------------------
> @@ -29,12 +30,6 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
>  #   and add the directory to the list of dirs to descend into: $(subdir-y)
>  # o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
>  #   and add the directory to the list of dirs to descend into: $(subdir-m)
> -
> -# Determine modorder.
> -# Unfortunately, we don't have information about ordering between -y
> -# and -m subdirs.  Just put -y's first.
> -modorder       := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
> -
>  __subdir-y     := $(patsubst %/,%,$(filter %/, $(obj-y)))
>  subdir-y       += $(__subdir-y)
>  __subdir-m     := $(patsubst %/,%,$(filter %/, $(obj-m)))
> @@ -43,10 +38,9 @@ obj-y                := $(patsubst %/, %/built-in.o, $(obj-y))
>  obj-m          := $(filter-out %/, $(obj-m))
>
>  # Subdirectories we need to descend into
> -
>  subdir-ym      := $(sort $(subdir-y) $(subdir-m))
>
> -# if $(foo-objs) exists, foo.o is a composite object
> +# if $(foo-objs) or $(foo-y) or $(foo-m) exists, foo.o is a composite object


Nit:

"if $(foo-objs), $(foo-y), or $(foo-m) exists" will be better.


>  multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
>  multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
>  multi-used   := $(multi-used-y) $(multi-used-m)
> @@ -90,7 +84,6 @@ subdir-ym     := $(addprefix $(obj)/,$(subdir-ym))
>  obj-dirs       := $(addprefix $(obj)/,$(obj-dirs))
>
>  # These flags are needed for modversions and compiling, so we define them here
> -# already
>  # $(modname_flags) #defines KBUILD_MODNAME as the name of the module it will


I am not sure if "#defines" is intentional or not.
I think "#" is unnecessary.




-- 
Best Regards
Masahiro Yamada
