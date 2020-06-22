Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50329 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgFVFLF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jun 2020 01:11:05 -0400
MIME-Version: 1.0
References: <591473.1592679153@turing-police>
In-Reply-To: <591473.1592679153@turing-police>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 22 Jun 2020 14:10:13 +0900
Message-ID: <CAK7LNARevD4o1WCRatKqZcf9-arxsvBcyLKHcNSM1ih+TDS5Mw@mail.gmail.com>
Subject: Re: kbuild: separate kerneldoc warnings from compiler warnings
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jun 21, 2020 at 3:52 AM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> This patch introduces a new build flag 'K=3D1' which controls whether ker=
neldoc
> warnings should be issued, separating them from the compiler warnings tha=
t W=3D
> controls.


I do not understand why this change is needed.


IIRC, our goal was to enable this check by default.
https://patchwork.kernel.org/patch/10030521/
but there are so many warnings.


Meanwhile, this is checked only when W=3D is given
because 0-day bot tests with W=3D1 to
block new kerneldoc warnings.

K=3D1 ?   Do people need to learn this new switch?





> Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
>
> diff --git a/Makefile b/Makefile
> index 29abe44ada91..b1c0f9484a66 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1605,6 +1605,7 @@ PHONY +=3D help
>         @echo  '                       (sparse by default)'
>         @echo  '  make C=3D2   [targets] Force check of all c source with=
 $$CHECK'
>         @echo  '  make RECORDMCOUNT_WARN=3D1 [targets] Warn about ignored=
 mcount sections'
> +       @echo  '  make K=3D1   [targets] Warn about problems in kerneldoc=
 comments'
>         @echo  '  make W=3Dn   [targets] Enable extra build checks, n=3D1=
,2,3 where'
>         @echo  '                1: warnings which may be relevant and do =
not occur too often'
>         @echo  '                2: warnings which occur quite often but m=
ay still be relevant'
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 2e8810b7e5ed..9bcb77f5a5f1 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -100,7 +100,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>          cmd_force_checksrc =3D $(CHECK) $(CHECKFLAGS) $(c_flags) $<
>  endif
>
> -ifneq ($(KBUILD_EXTRA_WARN),)
> +ifneq ($(KBUILD_KDOC_WARN),)
>    cmd_checkdoc =3D $(srctree)/scripts/kernel-doc -none $<
>  endif
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 4aea7cf71d11..3fd5881c91b0 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -17,6 +17,12 @@ endif
>
>  export KBUILD_EXTRA_WARN
>
> +ifeq ("$(origin K)", "command line")
> +  KBUILD_KDOC_WARN :=3D $(K)
> +endif
> +
> +export KBUILD_KDOC_WARN
> +
>  #
>  # W=3D1 - warnings which may be relevant and do not occur too often
>  #
>
>


--=20
Best Regards
Masahiro Yamada
