Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51609 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbgCXTn7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 15:43:59 -0400
Received: by mail-pj1-f65.google.com with SMTP id w9so11576pjh.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 12:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200324161507.7414-1-masahiroy@kernel.org>
In-Reply-To: <20200324161507.7414-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Mar 2020 12:43:46 -0700
Message-ID: <CAKwvOdkLW=Q5-vaFZDY_UOy66ZZoR7yaSd2zKv8N2Gv8PvJgYw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove AS variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>

Just noting that this got rolled up into a 3 patch series:
https://lore.kernel.org/lkml/CAKwvOdkjiyyt8Ju2j2O4cm1sB34rb_FTgjCRzEiXM6KL4muO_w@mail.gmail.com/T/#u

On Tue, Mar 24, 2020 at 9:15 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As commit 5ef872636ca7 ("kbuild: get rid of misleading $(AS) from
> documents") noted, we rarely use $(AS) in the kernel build.
>
> Now that the only/last user of $(AS) in drivers/net/wan/Makefile was
> converted to $(CC), $(AS) is no longer used in the build process.
>
> You can still pass in AS=clang, which is just a switch to turn on
> the LLVM integrated assembler.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 16d8271192d1..339e8c51a10b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -405,7 +405,6 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>  KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>
>  # Make variables (CC, etc...)
> -AS             = $(CROSS_COMPILE)as
>  LD             = $(CROSS_COMPILE)ld
>  CC             = $(CROSS_COMPILE)gcc
>  CPP            = $(CC) -E
> @@ -472,7 +471,7 @@ KBUILD_LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>  CLANG_FLAGS :=
>
> -export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
> +export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200324161507.7414-1-masahiroy%40kernel.org.



-- 
Thanks,
~Nick Desaulniers
