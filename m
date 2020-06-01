Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54480 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgFAMqg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 08:46:36 -0400
MIME-Version: 1.0
References: <20200514131234.380097-1-efremov@linux.com> <20200530134415.239427-1-efremov@linux.com>
In-Reply-To: <20200530134415.239427-1-efremov@linux.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 1 Jun 2020 21:45:44 +0900
Message-ID: <CAK7LNATYLE6=gY4UN3wZ5V83eYXsiP0S7TpenvTBJ+UUVrXhzA@mail.gmail.com>
Subject: Re: [RFC PATCH v3] kbuild: add variables for compression tools
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, May 30, 2020 at 10:44 PM Denis Efremov <efremov@linux.com> wrote:
>
> Allow user to use alternative implementations of compression tools,
> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
> speed up the build:
> $ make GZIP=pigz BZIP2=pbzip2
>
> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
> since 2015. However, alternative implementations (e.g., pigz) still rely
> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>
> The credit goes to @grsecurity.
>
> As a sidenote, for multi-threaded lzma, xz compression one can use:
> $ export XZ_OPT="--threads=0"
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
> Changes in v2:
>   - _GZIP used instead of GZIP
>   - tar commands altered to use tools from the vars
> Changes in v3:
>   - _BZIP2 used instead of BZIP2
>   - _LZOP used instead of LZOP
>

> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 6cabf20ce66a..b3b49fe7f25f 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -2,6 +2,11 @@
>  ####
>  # kbuild: Generic definitions
>
> +# GZIP, BZIP2, LZOP env vars are used by the tools
> +unexport GZIP
> +unexport BZIP2
> +unexport LZOP
> +
>  # Convenient variables
>  comma   := ,
>  quote   := "


I do not like unexport in Kbuild.include



One idea is to use MAKEOVERRIDES to
implement this all in top Makefile.




diff --git a/Makefile b/Makefile
index e0aeeedbef55..4b7e7496c904 100644
--- a/Makefile
+++ b/Makefile
@@ -458,6 +458,26 @@ PYTHON             = python
 PYTHON3                = python3
 CHECK          = sparse
 BASH           = bash
+GZIP           = gzip
+BZIP2          = bzip2
+LZMA           = lzma
+LZO            = lzop
+LZ4            = lz4c
+XZ             = xz
+
+# GZIP, BZIP2, LZOP env vars are used by the tools. Support them as the command
+# line interface, but use _GZIP, _BZIP2, _LZOP internally.
+_GZIP          := $(GZIP)
+_BZIP2         := $(BZIP2)
+_LZOP          := $(LZOP)
+
+# Reset GZIP, BZIP2, LZOP in this Makefile
+override GZIP=
+override BZIP2=
+override LZOP=
+
+# Reset GZIP, BZIP2, LZOP in recursive invocations
+MAKEOVERRIDES += GZIP= BZIP2= LZOP=

 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
                  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -506,6 +526,7 @@ CLANG_FLAGS :=
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX
YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
+export _GZIP _BZIP2 _LZOP LZMA LZ4 XZ
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE

 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS





Another solution is to use 'KGZIP' etc. as in v1.





> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 77c7caefede1..165826c12da9 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -19,6 +19,15 @@ set -e
>  tmpdir="${objtree}/tar-install"
>  tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
>
> +if [ x$_GZIP = "x" ]; then
> +       _GZIP=gzip
> +fi
> +if [ x$_BZIP2 = "x" ]; then
> +       _BZIP2=bzip2
> +fi
> +if [ x$XZ = "x" ]; then
> +       XZ=xz
> +fi
>

Is this necessary?
These shell scripts are not intended to be run
stand-alone.


--
Best Regards
Masahiro Yamada
