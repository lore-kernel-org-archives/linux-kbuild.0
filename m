Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:28350 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfKIOYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Nov 2019 09:24:40 -0500
MIME-Version: 1.0
References: <20191109121216.61381-1-luc.vanoostenryck@gmail.com>
In-Reply-To: <20191109121216.61381-1-luc.vanoostenryck@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 9 Nov 2019 23:23:49 +0900
Message-ID: <CAK7LNAQops2qF9Ljf+1xg8SKif89mLrjfaKosWrCbfMCzfwnOA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: tell sparse about the $ARCH
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>

On Sat, Nov 9, 2019 at 9:12 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> Sparse uses the same executable for all archs and uses flags
> like -m64, -mbig-endian or -D__arm__ for arch-specific parameters.
> But Sparse also uses value from the host machine used to build
> Sparse as default value for the target machine.
>
> This works, of course, well for native build but can create
> problems when cross-compiling, like defining both '__i386__'
> and '__arm__' when cross-compiling for arm on a x86-64 machine.
>
> Fix this by explicitely telling sparse the target architecture.
>
> Reported-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---

Applied to linux-kbuild. Thanks.


>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 6f54f2f95743..05a8906dde63 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -937,6 +937,9 @@ ifeq ($(CONFIG_RELR),y)
>  LDFLAGS_vmlinux        += --pack-dyn-relocs=relr
>  endif
>
> +# make the checker run with the right architecture
> +CHECKFLAGS += --arch=$(ARCH)
> +
>  # insure the checker run with the right endianness
>  CHECKFLAGS += $(if $(CONFIG_CPU_BIG_ENDIAN),-mbig-endian,-mlittle-endian)
>
> --
> 2.24.0
>


-- 
Best Regards
Masahiro Yamada
