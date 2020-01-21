Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47304 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgAUPyc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 10:54:32 -0500
MIME-Version: 1.0
References: <e026b0d7a2eceaa1745a001baa9f950ce546addb.1579025325.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <e026b0d7a2eceaa1745a001baa9f950ce546addb.1579025325.git.mirq-linux@rere.qmqm.pl>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Jan 2020 00:53:49 +0900
Message-ID: <CAK7LNASOLPkhk8CFN9Awbh8xav-bxLmDcc=eR7r4vN+NUKKUeg@mail.gmail.com>
Subject: Re: [PATCH v2] builddeb: allow selection of .deb compressor
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Michal Marek <michal.lkml@markovi.net>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 15, 2020 at 3:11 AM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:
>
> Select deb compression using KDEB_COMPRESS make variable. This allows to
> use gzip compression for local or test builds, and that's way faster
> than now-default xz compression.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---


Applied to linux-kbuild.
Thanks.

>  v2: rename KPKG_COMPRESS to KDEB_COMPRESS as suggested by Masahiro Yamad=
a
> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index c4c580f547ef..b68aaeece7c9 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,7 @@ create_package() {
>
>         # Create the package
>         dpkg-gencontrol -p$pname -P"$pdir"
> -       dpkg --build "$pdir" ..
> +       dpkg-deb ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
>  }
>
>  version=3D$KERNELRELEASE
> --
> 2.20.1
>


--=20
Best Regards
Masahiro Yamada
