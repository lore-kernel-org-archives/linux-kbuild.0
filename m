Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29798 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbfKFCOJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 21:14:09 -0500
MIME-Version: 1.0
References: <20191104131144.14333-1-mcroce@redhat.com>
In-Reply-To: <20191104131144.14333-1-mcroce@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 6 Nov 2019 11:13:18 +0900
Message-ID: <CAK7LNATmSxVkmoepVugds0x0fU+N=xE20Pfb28FG_eUb7XwoMA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add make dir-pkg build option
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matteo Croce <mcroce@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 4, 2019 at 10:12 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Add a 'dir-pkg' target which just creates the same directory structures
> as in tar-pkg, but doesn't package anything.
> Useful when the user wants to copy the kernel tree on a machine using
> ssh, rsync or whatever.
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/Makefile.package | 3 ++-
>  scripts/package/buildtar | 8 ++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 56eadcc48d46..36600ad1d5e6 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -103,7 +103,7 @@ snap-pkg:
>
>  # tarball targets
>  # ---------------------------------------------------------------------------
> -tar-pkgs := tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
> +tar-pkgs := dir-pkg tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
>  PHONY += $(tar-pkgs)
>  $(tar-pkgs):
>         $(MAKE) -f $(srctree)/Makefile
> @@ -147,6 +147,7 @@ help:
>         @echo '  deb-pkg             - Build both source and binary deb kernel packages'
>         @echo '  bindeb-pkg          - Build only the binary kernel deb package'
>         @echo '  snap-pkg            - Build only the binary kernel snap package (will connect to external hosts)'
> +       @echo '  dir-pkg             - Build the kernel as a plain directory structure'
>         @echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
>         @echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
>         @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 2f66c81e4021..77c7caefede1 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -2,7 +2,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  #
> -# buildtar 0.0.4
> +# buildtar 0.0.5
>  #
>  # (C) 2004-2006 by Jan-Benedict Glaw <jbglaw@lug-owl.de>
>  #
> @@ -24,7 +24,7 @@ tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
>  # Figure out how to compress, if requested at all
>  #
>  case "${1}" in
> -       tar-pkg)
> +       dir-pkg|tar-pkg)
>                 opts=
>                 ;;
>         targz-pkg)
> @@ -125,6 +125,10 @@ case "${ARCH}" in
>                 ;;
>  esac
>
> +if [ "${1}" = dir-pkg ]; then
> +       echo "Kernel tree successfully created in $tmpdir"
> +       exit 0
> +fi
>
>  #
>  # Create the tarball
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
