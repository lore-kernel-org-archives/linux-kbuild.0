Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41287 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbdKTQTp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 11:19:45 -0500
MIME-Version: 1.0
In-Reply-To: <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
 <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 Nov 2017 01:18:47 +0900
Message-ID: <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
Subject: Re: [PATCH 2/7] kbuild: Add P= command line flag to run checkpatch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-11-17 2:01 GMT+09:00 Knut Omang <knut.omang@oracle.com>:
> Add interpretation of a new environment variable P=3D{1,2} in spirit of t=
he
> C=3D option, but executing checkpatch instead of sparse.
>
> Signed-off-by: Knut Omang <knut.omang@oracle.com>
> Reviewed-by: H=C3=A5kon Bugge <haakon.bugge@oracle.com>
> Acked-by: =C3=85smund =C3=98stvold <asmund.ostvold@oracle.com>
> ---
>  Makefile               | 20 +++++++++++++++++++-
>  scripts/Makefile.build | 13 +++++++++++++
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index ccd9818..eb4bca9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -176,6 +176,20 @@ ifndef KBUILD_CHECKSRC
>    KBUILD_CHECKSRC =3D 0
>  endif
>
> +# Run scripts/checkpatch.pl with --ignore-cfg checkpatch.cfg
> +#
> +# Use 'make P=3D1' to enable checking of only re-compiled files.
> +# Use 'make P=3D2' to enable checking of *all* source files, regardless
> +#
> +# See the file "Documentation/dev-tools/run-checkpatch.rst" for more det=
ails,
> +#
> +ifeq ("$(origin P)", "command line")
> +  KBUILD_CHECKPATCH =3D $(P)
> +endif
> +ifndef KBUILD_CHECKPATCH
> +  KBUILD_CHECKPATCH =3D 0
> +endif


I am unhappy about adding a new interface
for each checker.

The default of CHECK is "sparse", but
users can override it to use another checker.



As Decumentation/dev-tools/coccinelle.rst says,
if you want to use coccinelle as a checker,

make C=3D1 CHECK=3D"scripts/coccicheck"


Recently, I saw a patch to use scripts/kernel-doc as a checker.
https://patchwork.kernel.org/patch/10030521/



If I accept your patch,
we would end up with

KBUILD_CHECKPATCH,
KBUILD_CHECKCOCCI
KBUILD_CHECKDOC,
...


This is ugly.



--=20
Best Regards
Masahiro Yamada
