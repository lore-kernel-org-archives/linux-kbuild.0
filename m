Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48135 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753920AbdGJP2o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jul 2017 11:28:44 -0400
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com [209.85.161.175]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id v6AFSXIK018346
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jul 2017 00:28:33 +0900
Received: by mail-yw0-f175.google.com with SMTP id x125so37378668ywa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jul 2017 08:28:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170709180236.25184-1-u.kleine-koenig@pengutronix.de>
References: <20170629121724.cnv5eymfnlctdifk@pengutronix.de> <20170709180236.25184-1-u.kleine-koenig@pengutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 11 Jul 2017 00:28:31 +0900
Message-ID: <CAK7LNAQTXi_6vygnw+z1s4+FZfbsbmh-9A8fL4Pt59qAUu3d8A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable Large File Support for hostprogs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michal Marek <mmarek@suse.com>, Ben Hutchings <ben@decadent.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-07-10 3:02 GMT+09:00 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutroni=
x.de>:
> This fixes the following build error for me when building on an 32 bit
> machine using an XFS file system:
>
>         $ make scripts/basic/fixdep
>           HOSTCC  scripts/basic/fixdep
>         fixdep: error fstat'ing depfile: scripts/basic/.fixdep.d: Value t=
oo large for defined data type
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since v1:
>  - rebase on current linus/master (conflicts with 9f3f1fd29976 ("kbuild: =
Add __cc-option macro"))
>  - also add HOST_LFS_CFLAGS to HOSTCXXFLAGS
>
>  Makefile | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 06ef9947cf7c..7c901e644bf6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -294,10 +294,16 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; then =
echo $$BASH; \
>           else if [ -x /bin/bash ]; then echo /bin/bash; \
>           else echo sh; fi ; fi)
>
> +HOST_LFS_CFLAGS :=3D $(shell getconf LFS_CFLAGS)
> +HOST_LFS_LDFLAGS :=3D $(shell getconf LFS_LDFLAGS)
> +HOST_LFS_LIBS :=3D $(shell getconf LFS_LIBS)
> +
>  HOSTCC       =3D gcc
>  HOSTCXX      =3D g++
> -HOSTCFLAGS   :=3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fo=
mit-frame-pointer -std=3Dgnu89
> -HOSTCXXFLAGS =3D -O2
> +HOSTCFLAGS   :=3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fo=
mit-frame-pointer -std=3Dgnu89 $(HOST_LFS_CFLAGS)
> +HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS)
> +HOST_LOADLIBES :=3D $(HOST_LFS_LIBS)
> +HOSTCXXFLAGS :=3D -O2 $(HOST_LFS_CFLAGS)
>
>  ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
>  HOSTCFLAGS  +=3D -Wno-unused-value -Wno-unused-parameter \
> @@ -408,7 +414,7 @@ KERNELVERSION =3D $(VERSION)$(if $(PATCHLEVEL),.$(PAT=
CHLEVEL)$(if $(SUBLEVEL),.$(S
>
>  export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
>  export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD C=
C
> -export CPP AR NM STRIP OBJCOPY OBJDUMP
> +export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
>  export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
>  export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
>

Applied to linux-kbuild with Ben's Acked-by.  Thanks!


I slightly fixed up locally:
 - HOSTCFLAGS is too long now.  I wrapped the line with 80 cols.
 - Make HOSTCFLAGS and HOSTCXXFLAGS lined up.




--=20
Best Regards
Masahiro Yamada
