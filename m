Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f67.google.com ([209.85.161.67]:44609 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730213AbeHNBQd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Aug 2018 21:16:33 -0400
Received: by mail-yw1-f67.google.com with SMTP id l9-v6so14813436ywc.11
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Aug 2018 15:32:19 -0700 (PDT)
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id k200-v6sm17642134ywe.1.2018.08.13.15.32.17
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Aug 2018 15:32:17 -0700 (PDT)
Received: by mail-yw1-f53.google.com with SMTP id r3-v6so14820039ywc.5
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Aug 2018 15:32:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180813101435.17016-1-arekm@maven.pl>
References: <20180813101435.17016-1-arekm@maven.pl>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 13 Aug 2018 15:32:16 -0700
Message-ID: <CAGXu5jLMr1+M7Xnt5HFi73fkhgh2YEwJyaPrFb0tQ2i8T0-i-Q@mail.gmail.com>
Subject: Re: [PATCH] Support mksh as /bin/sh.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: arekm@maven.pl
Cc: LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Nicholas Piggin <npiggin@gmail.com>

On Mon, Aug 13, 2018 at 3:14 AM,  <arekm@maven.pl> wrote:
> From: Arkadiusz Mi=C5=9Bkiewicz <arekm@maven.pl>
>
> mksh needs space between ! and ( to work properly. Otherwise this
> happens:
>
> + make oldconfig
> scripts/kconfig/conf  --oldconfig Kconfig
> ./scripts/clang-version.sh[18]: COPYING: not found
> printf: =E2=80=98__clang_major__=E2=80=99: expected a numeric value
> printf: =E2=80=98__clang_minor__=E2=80=99: expected a numeric value
> printf: =E2=80=98__clang_patchlevel__=E2=80=99: expected a numeric value
> init/Kconfig:24:warning: 'CLANG_VERSION': number is invalid
>
> Signed-off-by: Arkadiusz Mi=C5=9Bkiewicz <arekm@maven.pl>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  scripts/clang-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
> index dbf0a31eb111..e65fbc3079d4 100755
> --- a/scripts/clang-version.sh
> +++ b/scripts/clang-version.sh
> @@ -12,7 +12,7 @@
>
>  compiler=3D"$*"
>
> -if !( $compiler --version | grep -q clang) ; then
> +if ! ( $compiler --version | grep -q clang) ; then
>         echo 0
>         exit 1
>  fi
> --
> 2.18.0
>



--=20
Kees Cook
Pixel Security
