Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43226 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729931AbfLERSd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Dec 2019 12:18:33 -0500
MIME-Version: 1.0
References: <20191204025148.32101-1-masahiroy@kernel.org>
In-Reply-To: <20191204025148.32101-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Dec 2019 02:17:49 +0900
Message-ID: <CAK7LNAS3wSV6a48zMg=o2RXBz8qaijo6SqBcSyzwf0sW=dF71A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix 'No such file or directory' warning when cleaning
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Dec 4, 2019 at 11:52 AM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> Since commit fcbb8461fd23 ("kbuild: remove header compile test"),
> 'make clean' with O=3D option in the pristine source tree emits
> 'No such file or directory' warning.
>
> $ git clean -d -f -x
> $ make O=3Dfoo clean
> make[1]: Entering directory '/home/masahiro/linux/foo'
> find: =E2=80=98usr/include=E2=80=99: No such file or directory
> make[1]: Leaving directory '/home/masahiro/linux/foo'
>
> Fixes: fcbb8461fd23 ("kbuild: remove header compile test")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>  usr/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index 24543a30b9f0..e5895a79c45f 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -95,7 +95,7 @@ endif
>  # asm-generic/*.h is used by asm/*.h, and should not be included directl=
y
>  header-test- +=3D asm-generic/%
>
> -extra-y :=3D $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name =
'*.h'))
> +extra-y :=3D $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name =
'*.h' 2>/dev/null))
>
>  quiet_cmd_hdrtest =3D HDRTEST $<
>        cmd_hdrtest =3D \
> --
> 2.17.1
>


--=20
Best Regards
Masahiro Yamada
