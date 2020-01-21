Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:31965 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgAUPsq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 10:48:46 -0500
MIME-Version: 1.0
References: <20200117171435.11591-1-masahiroy@kernel.org>
In-Reply-To: <20200117171435.11591-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Jan 2020 00:47:54 +0900
Message-ID: <CAK7LNAQ-jkwUT3qcuqZeKUhiDjTP_XuEK1qgjTwEoL00v+c07g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -S instead of -E for precise cc-option test
 in Kconfig
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Jan 18, 2020 at 2:16 AM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> Currently, -E (stop after the preprocessing stage) is used to check
> whether the given compiler flag is supported.
>
> While it is faster than -S (or -c), it can be false-positive. You need
> to run the compilation proper to check the flag more precisely.
>
> For example, when testing "--param asan-instrument-allocas=3D1", my gcc
> gives a different result for -E vs -S.
>
> $ gcc -Werror --param asan-instrument-allocas=3D1 -E -x c /dev/null -o /d=
ev/null
> $ echo $?
> 0
>
> $ gcc -Werror --param asan-instrument-allocas=3D1 -S -x c /dev/null -o /d=
ev/null
> cc1: error: invalid --param name =E2=80=98asan-instrument-allocas=E2=80=
=99; did you mean =E2=80=98asan-instrument-writes=E2=80=99?
> $ echo $?
> 1
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>  scripts/Kconfig.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index d4adfbe42690..bfb44b265a94 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -25,7 +25,7 @@ failure =3D $(if-success,$(1),n,y)
>
>  # $(cc-option,<flag>)
>  # Return y if the compiler supports <flag>, n otherwise
> -cc-option =3D $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/n=
ull -o /dev/null)
> +cc-option =3D $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/n=
ull -o /dev/null)
>
>  # $(ld-option,<flag>)
>  # Return y if the linker supports <flag>, n otherwise
> --
> 2.17.1
>


--=20
Best Regards
Masahiro Yamada
