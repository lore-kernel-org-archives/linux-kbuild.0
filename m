Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:43104 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbeEUNGS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 May 2018 09:06:18 -0400
Received: by mail-lf0-f67.google.com with SMTP id n18-v6so23783838lfh.10
        for <linux-kbuild@vger.kernel.org>; Mon, 21 May 2018 06:06:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180517134838.8403-1-agimenez@sysvalve.es>
References: <20180517134838.8403-1-agimenez@sysvalve.es>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Mon, 21 May 2018 16:06:15 +0300
Message-ID: <CAAqcGH=PuRgsDU81R5P=_JSvV+vVqntBO6ivEpY2v8AqKAuGsQ@mail.gmail.com>
Subject: Re: [PATCH] build: Exclude cscope and tags files from packaging
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?L=2E_Alberto_Gim=C3=A9nez?= <agimenez@sysvalve.es>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 17 May 2018 at 16:48, L. Alberto Gim=C3=A9nez <agimenez@sysvalve.es> wro=
te:
> When building a Debian package, cscope and tags generated files are
> accounted in the Debian packaging process, even causing some errors
> under some circumstances (generating diff between "pristine" tar and
> "patched sources").

Honestly you should use make mrproper, if you want to spin out source
packages. If otoh you don't have a use for the source package, use
bindeb-pkg.

> Ignore these generated files for packaging related purposes.
>
> Signed-off-by: L. Alberto Gim=C3=A9nez <agimenez@sysvalve.es>
> ---
>  Makefile                 | 5 ++++-
>  scripts/package/Makefile | 4 ++--
>  scripts/package/mkspec   | 6 +++---
>  3 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ba3106b36597..0b862a544a6a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -453,11 +453,14 @@ export MODVERDIR :=3D $(if $(KBUILD_EXTMOD),$(first=
word $(KBUILD_EXTMOD))/).tmp_ve
>  # Files to ignore in find ... statements
>
>  export RCS_FIND_IGNORE :=3D \( -name SCCS -o -name BitKeeper -o -name .s=
vn -o    \
> -                         -name CVS -o -name .pc -o -name .hg -o -name .g=
it \) \
> +                         -name CVS -o -name .pc -o -name .hg -o -name .g=
it -o \
> +                         -name tags -o -name 'cscope*' \) \

tags and cscope are not revision control files tho.

>                           -prune -o

>  export RCS_TAR_IGNORE :=3D --exclude SCCS --exclude BitKeeper --exclude =
.svn \
>                          --exclude CVS --exclude .pc --exclude .hg --excl=
ude .git
>
> +export TAR_EXTRA_IGNORE :=3D --exclude tags --exclude 'cscope*'
> +

Why new variable?

>  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  # Rules shared between *config targets and build targets
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 73503ebce632..520532b3bcb2 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -44,7 +44,7 @@ if test "$(objtree)" !=3D "$(srctree)"; then \
>         false; \
>  fi ; \
>  $(srctree)/scripts/setlocalversion --save-scmversion; \
> -tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> +tar -cz $(RCS_TAR_IGNORE) $(TAR_EXTRA_IGNORE) -f $(2).tar.gz \
>         --transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
>
> @@ -73,7 +73,7 @@ deb-pkg: FORCE
>         $(call cmd,src_tar,$(KDEB_SOURCENAME))
>         origversion=3D$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//=
');\
>                 mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${ori=
gversion}.orig.tar.gz
> -       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) =
-i.git -us -uc
> +       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) =
-i'(.git|cscope.*)' -us -uc
>
>  bindeb-pkg: FORCE
>         $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index e05646dc24dc..e966a87c0011 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -28,9 +28,9 @@ fi
>
>  PROVIDES=3D"$PROVIDES kernel-$KERNELRELEASE"
>  __KERNELRELEASE=3D$(echo $KERNELRELEASE | sed -e "s/-/_/g")
> -EXCLUDES=3D"$RCS_TAR_IGNORE --exclude=3D.tmp_versions --exclude=3D*vmlin=
ux* \
> ---exclude=3D*.o --exclude=3D*.ko --exclude=3D*.cmd --exclude=3DDocumenta=
tion \
> ---exclude=3D.config.old --exclude=3D.missing-syscalls.d"
> +EXCLUDES=3D"$RCS_TAR_IGNORE $TAR_EXTRA_IGNORE --exclude=3D.tmp_versions =
\
> +--exclude=3D*vmlinux* --exclude=3D*.o --exclude=3D*.ko --exclude=3D*.cmd=
 \
> +--exclude=3DDocumentation --exclude=3D.config.old --exclude=3D.missing-s=
yscalls.d"

I take we now have three variants of "exclude these files ending up in
the packages" lists - tar, rpm and .deb. Each choosing slightly
different of subset of files listed in .gitignore. This does not seem
very maintainable.

Riku
