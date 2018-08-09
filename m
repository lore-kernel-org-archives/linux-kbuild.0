Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:28926 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbeHIHW3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Aug 2018 03:22:29 -0400
MIME-Version: 1.0
In-Reply-To: <patch.git-39444503b4d3.your-ad-here.call-01533562662-ext-6094@work.hours>
References: <patch.git-39444503b4d3.your-ad-here.call-01533562662-ext-6094@work.hours>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 9 Aug 2018 13:58:40 +0900
Message-ID: <CAK7LNARivbQ57+raPUkek2=bsnYDhXS+hSK3kwf+0K7Hvxj31g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add Map option to save vmlinux linker map file(s)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-08-06 22:38 GMT+09:00 Vasily Gorbik <gor@linux.ibm.com>:
> Add "Map" kbuild option, so that "make Map=1" would save vmlinux linker
> map into vmlinux.map, which is quite useful during making kernel changes
> related to how the kernel is composed.
>
> KBUILD_SAVE_LINK_MAP flag is exported and architectures
> supporting compressed kernel images might respect it and produce
> arch/*/boot/compressed/vmlinux.map for the decompressor code as well.
>
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> ---


If the map file is quite useful, should it be generated all the time?
Or, how about CONFIG option if you want this conditionally generated?

I do not want to increase fine-grained command-line switches
except _really_ useful ones.




>  .gitignore |  1 +
>  Makefile   | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index 97ba6b79834c..1d2308e597ad 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -44,6 +44,7 @@
>  *.xz
>  Module.symvers
>  modules.builtin
> +vmlinux.map
>
>  #
>  # Top-level generic files
> diff --git a/Makefile b/Makefile
> index 7a3c4548162b..f1790deae03b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -176,6 +176,14 @@ ifndef KBUILD_CHECKSRC
>    KBUILD_CHECKSRC = 0
>  endif
>
> +# Use 'make Map=1' to enable saving linker map file(s):
> +# vmlinux.map for vmlinux,
> +# (arch/*/boot/compressed/vmlinux.map for arch/*/boot/compressed/vmlinux)
> +
> +ifeq ("$(origin Map)", "command line")
> +       export KBUILD_SAVE_LINK_MAP := $(Map)
> +endif
> +
>  # Use make M=dir to specify directory of external module to build
>  # Old syntax make ... SUBDIRS=$PWD is still supported
>  # Setting the environment variable KBUILD_EXTMOD take precedence
> @@ -838,6 +846,11 @@ ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
>  LDFLAGS_vmlinux        += $(call ld-option, -X,)
>  endif
>
> +ifdef KBUILD_SAVE_LINK_MAP
> +LDFLAGS_vmlinux        += -Map=vmlinux.map
> +CLEAN_FILES    += vmlinux.map
> +endif
> +
>  # insure the checker run with the right endianness
>  CHECKFLAGS += $(if $(CONFIG_CPU_BIG_ENDIAN),-mbig-endian,-mlittle-endian)
>
> @@ -1434,6 +1447,7 @@ help:
>         @echo  '                2: warnings which occur quite often but may still be relevant'
>         @echo  '                3: more obscure warnings, can most likely be ignored'
>         @echo  '                Multiple levels can be combined with W=12 or W=123'
> +       @echo  '  make Map=1 [targets] Save vmlinux linker map file(s)'
>         @echo  ''
>         @echo  'Execute "make" or "make all" to build all targets marked with [*] '
>         @echo  'For further info see the ./README file'
> --
> 2.18.0.13.gd42ae10
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
