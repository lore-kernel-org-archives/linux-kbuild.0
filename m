Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:23258 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932732AbeGHCcl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Jul 2018 22:32:41 -0400
MIME-Version: 1.0
In-Reply-To: <20180707010709.16648-8-labbott@redhat.com>
References: <20180707010709.16648-1-labbott@redhat.com> <20180707010709.16648-8-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 8 Jul 2018 11:31:37 +0900
Message-ID: <CAK7LNAS3DDC8JasQTCeOnYJCGoCsuPQcqHsSNm2BaLzaGR2e4g@mail.gmail.com>
Subject: Re: [PATCH 7/7] Kbuild: Use HOST*FLAGS options from the command line
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>

2018-07-07 10:07 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> Now that we have the rename in place, reuse the HOST*FLAGS options as
> something that can be set from the command line and included with the
> rest of the flags.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
>  Makefile | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d925af1fb11b..77c74b3cf30b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -360,10 +360,11 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
>  HOSTCC       = gcc
>  HOSTCXX      = g++
>  KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
> -               -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
> -KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
> -KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
> -KBUILD_HOSTLDLIBS := $(HOST_LFS_LIBS)
> +               -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
> +               $(HOSTCFLAGS)
> +KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
> +KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> +KBUILD_HOSTLDLIBS := $(HOST_LFS_LIBS) $(HOST_LOADLIBES)


Please use HOSTLDLIBS instead of HOST_LOADLIBES.

All of these must be documented in Documentation/kbuild/kbuild.txt





-- 
Best Regards
Masahiro Yamada
