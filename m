Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:65044 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725745AbeKEROX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 12:14:23 -0500
MIME-Version: 1.0
References: <3e40ec15-3a8c-444d-8d32-35ef587f3980@default>
In-Reply-To: <3e40ec15-3a8c-444d-8d32-35ef587f3980@default>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Nov 2018 16:55:10 +0900
Message-ID: <CAK7LNAQUie1D3=0o36idvxR7uLtGRaV-MCs5L_cPcuXj28inEw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: fix two build breaks when O= is used
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zhenzhong.duan@oracle.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, srinivas.eeda@oracle.com, Michal Marek <michal.lkml@markovi.net>

Hi Zhenzhong,

On Fri, Nov 2, 2018 at 8:26 PM Zhenzhong Duan <zhenzhong.duan@oracle.com> wrote:
>
> Running 'make O=/build/kernel binrpm-pkg' failed with below two errors.
>
> Makefile:600: include/config/auto.conf: No such file or directory
>
> + cp make -C /mnt/root/kernel O=/build/kernel image_name make -f
> /mnt/root/kernel/Makefile ...
> cp: invalid option -- 'C'
> Try 'cp --help' for more information.
>
> Export KBUILD_OUTPUT when O= is used so that it could be used in locating
> include/config/auto.conf
>
> Use $srctree to locate source dir when generating image name, no matter
> if O= is used.
>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>


Sorry for the breakage, and thanks for your report.

I'd like to fix the issue in a cleaner way.

See this:
https://patchwork.kernel.org/patch/10667539/


Thanks.


> ---
>  Makefile               | 5 +++++
>  scripts/package/mkspec | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9aa352b..df316e5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -135,6 +135,7 @@ KBUILD_OUTPUT := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) \
>  $(if $(KBUILD_OUTPUT),, \
>       $(error failed to create output directory "$(saved-output)"))
>
> +export KBUILD_OUTPUT
>  # Look for make include files relative to root of kernel src
>  #
>  # This does not become effective immediately because MAKEFLAGS is re-parsed
> @@ -597,7 +598,11 @@ virt-y             := virt/
>  endif # KBUILD_EXTMOD
>
>  ifeq ($(dot-config),1)
> +ifeq ($(KBUILD_OUTPUT),)
>  include include/config/auto.conf
> +else
> +include $(KBUILD_OUTPUT)/include/config/auto.conf
> +endif
>  endif
>
>  # The all: target is the default when no target is given on the
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index e05646d..3b4e5e4 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -84,10 +84,10 @@ $S
>         mkdir -p %{buildroot}/boot
>         %ifarch ia64
>         mkdir -p %{buildroot}/boot/efi
> -       cp \$(make image_name) %{buildroot}/boot/efi/vmlinuz-$KERNELRELEASE
> +       cp \$(make -C \$srctree image_name) %{buildroot}/boot/efi/vmlinuz-$KERNELRELEASE
>         ln -s efi/vmlinuz-$KERNELRELEASE %{buildroot}/boot/
>         %else
> -       cp \$(make image_name) %{buildroot}/boot/vmlinuz-$KERNELRELEASE
> +       cp \$(make -C \$srctree image_name) %{buildroot}/boot/vmlinuz-$KERNELRELEASE
>         %endif
>  $M     make %{?_smp_mflags} INSTALL_MOD_PATH=%{buildroot} KBUILD_SRC= modules_install
>         make %{?_smp_mflags} INSTALL_HDR_PATH=%{buildroot}/usr KBUILD_SRC= headers_install
> --
> 1.8.3.1



-- 
Best Regards
Masahiro Yamada
