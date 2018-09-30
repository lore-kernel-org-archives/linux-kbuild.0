Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34007 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728310AbeI3UUF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Sep 2018 16:20:05 -0400
MIME-Version: 1.0
References: <1536906803-29741-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1536906803-29741-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Sep 2018 22:46:17 +0900
Message-ID: <CAK7LNASBFAc9SYaPn4-htcjbi9ZijPJrddFQuNSRfU96svBAbQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add --include-dir flag only for out-of-tree build
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018=E5=B9=B49=E6=9C=8814=E6=97=A5(=E9=87=91) 15:33 Masahiro Yamada <yamada=
.masahiro@socionext.com>:
>
> The --include-dir flag is used to include check-in Makefiles from
> $(objtree) without $(srctree)/ prefix.  Obviously, this is unneeded
> for in-tree build.  Add the flag just before changing the working
> directory.
>
> This becomes effective after invoking sub-make.  Add a little bit
> comments about it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild.



> Changes in v2:
>   - Add some more comments
>
>  Makefile | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f8c8e12..233b57d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -15,10 +15,9 @@ NAME =3D Merciless Moray
>  PHONY :=3D _all
>  _all:
>
> -# o Do not use make's built-in rules and variables
> -#   (this increases performance and avoids hard-to-debug behaviour);
> -# o Look for make include files relative to root of kernel src
> -MAKEFLAGS +=3D -rR --include-dir=3D$(CURDIR)
> +# Do not use make's built-in rules and variables
> +# (this increases performance and avoids hard-to-debug behaviour)
> +MAKEFLAGS +=3D -rR
>
>  # Avoid funny character set dependencies
>  unexport LC_ALL
> @@ -136,6 +135,13 @@ KBUILD_OUTPUT :=3D $(shell mkdir -p $(KBUILD_OUTPUT)=
 && cd $(KBUILD_OUTPUT) \
>  $(if $(KBUILD_OUTPUT),, \
>       $(error failed to create output directory "$(saved-output)"))
>
> +# Look for make include files relative to root of kernel src
> +#
> +# This does not become effective immediately because MAKEFLAGS is re-par=
sed
> +# once after the Makefile is read.  It is OK since we are going to invok=
e
> +# 'sub-make' below.
> +MAKEFLAGS +=3D --include-dir=3D$(CURDIR)
> +
>  PHONY +=3D $(MAKECMDGOALS) sub-make
>
>  $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: su=
b-make
> --
> 2.7.4
>


--=20
Best Regards
Masahiro Yamada
