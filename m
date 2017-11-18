Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:58123 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933100AbdKRCgp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 21:36:45 -0500
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com [209.85.161.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id vAI2aVj0019993
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2017 11:36:32 +0900
Received: by mail-yw0-f170.google.com with SMTP id x20so2377903ywg.4
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2017 18:36:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171105094416.12220-1-bjorn.forsman@gmail.com>
References: <20171105094416.12220-1-bjorn.forsman@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 Nov 2017 11:35:50 +0900
Message-ID: <CAK7LNASacfBcCEdkygt6gwRgZww+mG+tmWeKM_WmMe4OM6sG5Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: /bin/pwd -> pwd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

2017-11-05 18:44 GMT+09:00 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
> Most places use pwd and rely on $PATH lookup. Moving the remaining
> absolute path /bin/pwd users over for consistency.
>
> Also, a reason for doing /bin/pwd -> pwd instead of the other way around
> is because I believe build systems should make little assumptions on
> host filesystem layout. Case in point, we do this kind of patching
> already in NixOS.
>
> Ref. commit 028568d84da3cfca49f5f846eeeef01441d70451
> ("kbuild: revert $(realpath ...) to $(shell cd ... && /bin/pwd)").
>
> Signed-off-by: Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>
> ---
>  Documentation/ia64/xen.txt     | 2 +-
>  Makefile                       | 2 +-
>  tools/power/cpupower/Makefile  | 2 +-
>  tools/scripts/Makefile.include | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/ia64/xen.txt b/Documentation/ia64/xen.txt
> index c61a99f7c8bb..a12c74ce2773 100644
> --- a/Documentation/ia64/xen.txt
> +++ b/Documentation/ia64/xen.txt
> @@ -41,7 +41,7 @@ Getting and Building Xen and Dom0
>
>   5. make initrd for Dom0/DomU
>      # make -C linux-2.6.18-xen.hg ARCH=3Dia64 modules_install \
> -      O=3D$(/bin/pwd)/build-linux-2.6.18-xen_ia64
> +      O=3D$(pwd)/build-linux-2.6.18-xen_ia64
>      # mkinitrd -f /boot/efi/efi/redhat/initrd-2.6.18.8-xen.img \
>        2.6.18.8-xen --builtin mptspi --builtin mptbase \
>        --builtin mptscsih --builtin uhci-hcd --builtin ohci-hcd \
> diff --git a/Makefile b/Makefile
> index 3a8868ee967e..a3eed17080b0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -132,7 +132,7 @@ ifneq ($(KBUILD_OUTPUT),)
>  # check that the output directory actually exists
>  saved-output :=3D $(KBUILD_OUTPUT)
>  KBUILD_OUTPUT :=3D $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTP=
UT) \
> -                                                               && /bin/p=
wd)
> +                                                               && pwd)
>  $(if $(KBUILD_OUTPUT),, \
>       $(error failed to create output directory "$(saved-output)"))
>
> diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefil=
e
> index d6e1c02ddcfe..c76b971d0423 100644
> --- a/tools/power/cpupower/Makefile
> +++ b/tools/power/cpupower/Makefile
> @@ -26,7 +26,7 @@ endif
>
>  ifneq ($(OUTPUT),)
>  # check that the output directory actually exists
> -OUTDIR :=3D $(shell cd $(OUTPUT) && /bin/pwd)
> +OUTDIR :=3D $(shell cd $(OUTPUT) && pwd)
>  $(if $(OUTDIR),, $(error output directory "$(OUTPUT)" does not exist))
>  endif
>
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index 654efd9768fd..3fab179b1aba 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -13,7 +13,7 @@ endif
>
>  # check that the output directory actually exists
>  ifneq ($(OUTPUT),)
> -OUTDIR :=3D $(shell cd $(OUTPUT) && /bin/pwd)
> +OUTDIR :=3D $(shell cd $(OUTPUT) && pwd)
>  $(if $(OUTDIR),, $(error output directory "$(OUTPUT)" does not exist))
>  endif


Applied to linux-kbuild/kbuild.  Thanks!

I will try my best to push this in the current MW.


--=20
Best Regards
Masahiro Yamada
