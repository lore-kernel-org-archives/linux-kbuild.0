Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:40247 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfAQMKH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 07:10:07 -0500
MIME-Version: 1.0
References: <1547607401-20118-1-git-send-email-yamada.masahiro@socionext.com> <1547607401-20118-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547607401-20118-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 17 Jan 2019 21:09:21 +0900
Message-ID: <CAK7LNASfDS+ZisSj8Bcq9YG4zGEgBgH80ekkgXEFWMYkAcguaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: add -I$(srctree)/$(src) automatically for
 hostprogs with O=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Mauro Rossi <issor.oruam@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>

On Thu, Jan 17, 2019 at 1:18 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When building kernel objects with the O=3D option, scripts/Makefile.lib
> automatically adds both -I$(srctree)/$(src) and -I$(obj) so each
> Makefile does not need to add them explicitly.
>
> In contrast, scripts/Makefile.host adds only -I$(obj) when building
> host programs with the O=3D option. As a result, each Makefile must add
> the extra option to include checkin headers from generated C files.
>
> Let's cater to this in the build system for consistency, and drop
> extra options from the kconfig, dtc, genksyms Makefiles.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


I take back this patch.

I noticed this would break out-of-tree build of PowerPC.

I attached the error log below.

The error summary is, the host program
arch/powerpc/mktree.c is including arch/powerpc/types.h
via a system header.

In arch/powerpc/boot, there are lots of headers
whose name is the same as the system header,
such as types.h, string.h, stdint.h, etc.





  HOSTCC  arch/powerpc/boot/mktree
In file included from /usr/include/x86_64-linux-gnu/sys/uio.h:23:0,
                 from /usr/include/x86_64-linux-gnu/sys/socket.h:26,
                 from /usr/include/netinet/in.h:23,
                 from ../arch/powerpc/boot/mktree.c:18:
/usr/include/x86_64-linux-gnu/sys/types.h:197:1: error: conflicting
types for =E2=80=98int64_t=E2=80=99
 __intN_t (64, __DI__);
 ^
In file included from ../arch/powerpc/boot/stdint.h:13:0,
                 from /usr/include/netinet/in.h:22,
                 from ../arch/powerpc/boot/mktree.c:18:
../arch/powerpc/boot/types.h:26:13: note: previous declaration of
=E2=80=98int64_t=E2=80=99 was here
 typedef s64 int64_t;
             ^
../arch/powerpc/boot/mktree.c: In function =E2=80=98main=E2=80=99:
../arch/powerpc/boot/mktree.c:52:3: warning: implicit declaration of
function =E2=80=98exit=E2=80=99 [-Wimplicit-function-declaration]
   exit(1);
   ^
../arch/powerpc/boot/mktree.c:52:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:52:3: note: include =E2=80=98<stdlib.h>=E2=80=
=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:56:3: warning: implicit declaration of
function =E2=80=98perror=E2=80=99 [-Wimplicit-function-declaration]
   perror("stat");
   ^
../arch/powerpc/boot/mktree.c:57:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(2);
   ^
../arch/powerpc/boot/mktree.c:57:3: note: include =E2=80=98<stdlib.h>=E2=80=
=99 or
provide a declaration of =E2=80=98exit=E2=80=99
In file included from ../arch/powerpc/boot/mktree.c:18:0:
../arch/powerpc/boot/mktree.c:65:21: warning: implicit declaration of
function =E2=80=98strtoul=E2=80=99 [-Wimplicit-function-declaration]
  bt.bb_dest =3D htonl(strtoul(argv[3], NULL, 0));
                     ^
../arch/powerpc/boot/mktree.c:84:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(3);
   ^
../arch/powerpc/boot/mktree.c:84:3: note: include =E2=80=98<stdlib.h>=E2=80=
=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:89:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(3);
   ^
../arch/powerpc/boot/mktree.c:89:3: note: include =E2=80=98<stdlib.h>=E2=80=
=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:102:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(4);
   ^
../arch/powerpc/boot/mktree.c:102:3: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:107:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(4);
   ^
../arch/powerpc/boot/mktree.c:107:3: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:112:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(4);
   ^
../arch/powerpc/boot/mktree.c:112:3: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:121:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(5);
   ^
../arch/powerpc/boot/mktree.c:121:3: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:127:4: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
    exit(5);
    ^
../arch/powerpc/boot/mktree.c:127:4: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:134:4: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
    exit(5);
    ^
../arch/powerpc/boot/mktree.c:134:4: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:143:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(1);
   ^
../arch/powerpc/boot/mktree.c:143:3: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:147:3: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
   exit(1);
   ^
../arch/powerpc/boot/mktree.c:147:3: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99
../arch/powerpc/boot/mktree.c:150:2: warning: incompatible implicit
declaration of built-in function =E2=80=98exit=E2=80=99
  exit(0);
  ^
../arch/powerpc/boot/mktree.c:150:2: note: include =E2=80=98<stdlib.h>=E2=
=80=99 or
provide a declaration of =E2=80=98exit=E2=80=99


>
>  scripts/Makefile.host     | 4 ++--
>  scripts/dtc/Makefile      | 4 ----
>  scripts/genksyms/Makefile | 4 ----
>  scripts/kconfig/Makefile  | 2 --
>  4 files changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index a115259..c41d5a1d 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -72,8 +72,8 @@ __hostcxx_flags       =3D $(_hostcxx_flags)
>
>  ifeq ($(KBUILD_EXTMOD),)
>  ifneq ($(KBUILD_SRC),)
> -__hostc_flags  =3D -I$(obj) $(call flags,_hostc_flags)
> -__hostcxx_flags        =3D -I$(obj) $(call flags,_hostcxx_flags)
> +__hostc_flags  =3D -I $(srctree)/$(src) -I $(obj) $(call flags,_hostc_fl=
ags)
> +__hostcxx_flags        =3D -I $(srctree)/$(src) -I $(obj) $(call flags,_=
hostcxx_flags)
>  endif
>  endif
>
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 5f227d8..72d3fa4 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -22,9 +22,5 @@ dtc-objs      +=3D yamltree.o
>  HOSTLDLIBS_dtc :=3D -lyaml
>  endif
>
> -# Generated files need one more search path to include headers in source=
 tree
> -HOSTCFLAGS_dtc-lexer.lex.o :=3D -I$(src)
> -HOSTCFLAGS_dtc-parser.tab.o :=3D -I$(src)
> -
>  # dependencies on generated files need to be listed explicitly
>  $(obj)/dtc-lexer.lex.o: $(obj)/dtc-parser.tab.h
> diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
> index 03b7ce9..ae5953d 100644
> --- a/scripts/genksyms/Makefile
> +++ b/scripts/genksyms/Makefile
> @@ -30,9 +30,5 @@ $(obj)/parse.tab.h: $(src)/parse.y FORCE
>
>  endif
>
> -# -I needed for generated C source (shipped source)
> -HOSTCFLAGS_parse.tab.o :=3D -I$(src)
> -HOSTCFLAGS_lex.lex.o :=3D -I$(src)
> -
>  # dependencies on generated files need to be listed explicitly
>  $(obj)/lex.lex.o: $(obj)/parse.tab.h
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 1819735..12cb5eb 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -146,8 +146,6 @@ help:
>  common-objs    :=3D confdata.o expr.o symbol.o preprocess.o zconf.lex.o =
zconf.tab.o
>
>  $(obj)/zconf.lex.o: $(obj)/zconf.tab.h
> -HOSTCFLAGS_zconf.lex.o :=3D -I$(src)
> -HOSTCFLAGS_zconf.tab.o :=3D -I$(src)
>
>  # conf: Used for defconfig, oldconfig and related targets
>  hostprogs-y    +=3D conf
> --
> 2.7.4
>


--=20
Best Regards
Masahiro Yamada
