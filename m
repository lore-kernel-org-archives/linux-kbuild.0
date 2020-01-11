Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48559 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgAKHVp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:21:45 -0500
MIME-Version: 1.0
References: <20200106083628.29729-1-masahiroy@kernel.org>
In-Reply-To: <20200106083628.29729-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 16:21:04 +0900
Message-ID: <CAK7LNAST-9NUg0zeUny7YU+ihjNMihYAxAUfJy7MU2v11OMFhQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove PYTHON2 variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jan 6, 2020 at 5:36 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Python 2 has retired. There is no user of this variable.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Applied to linux-kbuild.


> ---
>
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4f01de6cd43c..4a0796b05324 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -423,7 +423,6 @@ INSTALLKERNEL  := installkernel
>  DEPMOD         = /sbin/depmod
>  PERL           = perl
>  PYTHON         = python
> -PYTHON2                = python2
>  PYTHON3                = python3
>  CHECK          = sparse
>  BASH           = bash
> @@ -474,7 +473,7 @@ CLANG_FLAGS :=
>
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
> -export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> +export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
