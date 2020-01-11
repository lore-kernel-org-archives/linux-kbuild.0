Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44272 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbgAKGwD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 01:52:03 -0500
MIME-Version: 1.0
References: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 15:51:20 +0900
Message-ID: <CAK7LNAQNYQY=Z6TqacifFi-ycnHgSdWtD+YBQAGWPZA52RQm0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] builddeb: allow selection of .deb compressor
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>

(+CC: Ben Hutchings, Riku Voipio)

On Sat, Jan 4, 2020 at 6:56 PM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.q=
mqm.pl> wrote:
>
> Select deb compression using KPKG_COMPRESS make variable. This allows to
> use gzip compression for local or test builds, and that's way faster
> than now-default xz compression.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index c4c580f547ef..d289c4ebc891 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,7 @@ create_package() {
>
>         # Create the package
>         dpkg-gencontrol -p$pname -P"$pdir"
> -       dpkg --build "$pdir" ..
> +       dpkg-deb ${KPKG_COMPRESS:+-Z$KPKG_COMPRESS} --build "$pdir" ..
>  }
>
>  version=3D$KERNELRELEASE
> --
> 2.20.1
>

I have not seen any comment on this,
but using gzip is indeed way faster.


Some minor comments:

I see some variables staring "KDEB_",
but nothing starting "KPKG_".



masahiro@grover:~/workspace/linux-kbuild$ git grep KDEB_
scripts/Makefile.package:KDEB_SOURCENAME ?=3D linux-$(KERNELRELEASE)
scripts/Makefile.package:export KDEB_SOURCENAME
scripts/Makefile.package:       $(call cmd,src_tar,$(KDEB_SOURCENAME))
scripts/Makefile.package:               mv $(KDEB_SOURCENAME).tar.gz
../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
scripts/package/builddeb:# specified in KDEB_HOOKDIR) that will be
called on package install and
scripts/package/builddeb:debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel}
scripts/package/mkdebian:if [ -n "$KDEB_PKGVERSION" ]; then
scripts/package/mkdebian:       packageversion=3D$KDEB_PKGVERSION
scripts/package/mkdebian:sourcename=3D$KDEB_SOURCENAME
scripts/package/mkdebian:if [ -n "$KDEB_CHANGELOG_DIST" ]; then
scripts/package/mkdebian:        distribution=3D$KDEB_CHANGELOG_DIST
scripts/package/mkdebian:        echo >&2 "Install lsb-release or set
\$KDEB_CHANGELOG_DIST explicitly"
masahiro@grover:~/workspace/linux-kbuild$ git grep KPKG_


Maybe starting KDEB_ seems to be better for consistency?




--=20
Best Regards
Masahiro Yamada
