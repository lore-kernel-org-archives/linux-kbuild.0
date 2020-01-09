Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51239 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728488AbgAIP7C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 10:59:02 -0500
MIME-Version: 1.0
References: <20200109125627.24654-1-brgl@bgdev.pl>
In-Reply-To: <20200109125627.24654-1-brgl@bgdev.pl>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jan 2020 00:58:07 +0900
Message-ID: <CAK7LNASBLXzgy2=fGfyrGbbWq2wL7Y9uaSh-MQQcd7tpvUBbMg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix an "implicit declaration of function" warning
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Thu, Jan 9, 2020 at 9:56 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> strncasecmp() & strcasecmp() functions are declared in strings.h, not
> string.h. On most environments the former is implicitly included by
> the latter but on some setups, building menuconfig results in the
> following warning:
>
>   HOSTCC  scripts/kconfig/mconf.o
> scripts/kconfig/mconf.c: In function =E2=80=98search_conf=E2=80=99:
> scripts/kconfig/mconf.c:423:6: warning: implicit declaration of function =
=E2=80=98strncasecmp=E2=80=99 [-Wimplicit-function-declaration]
>   if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) =3D=3D 0=
)
>       ^~~~~~~~~~~
> scripts/kconfig/mconf.c: In function =E2=80=98main=E2=80=99:
> scripts/kconfig/mconf.c:1021:8: warning: implicit declaration of function=
 =E2=80=98strcasecmp=E2=80=99 [-Wimplicit-function-declaration]
>    if (!strcasecmp(mode, "single_menu"))
>         ^~~~~~~~~~
>
> Fix it by explicitly including strings.h.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thanks.

I see strncasecmp() in
scripts/kconfig/nconf.c too.

Could you fix both in a single patch?

You can try it with "make nconfig".



> ---
>  scripts/kconfig/mconf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 49c26ea9dd98..4063dbc1b927 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -15,6 +15,7 @@
>  #include <stdarg.h>
>  #include <stdlib.h>
>  #include <string.h>
> +#include <strings.h>
>  #include <signal.h>
>  #include <unistd.h>
>
> --
> 2.23.0
>


--=20
Best Regards
Masahiro Yamada
