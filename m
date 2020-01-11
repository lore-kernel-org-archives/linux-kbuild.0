Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:54266 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728441AbgAKHQx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:16:53 -0500
MIME-Version: 1.0
References: <20200109161636.9362-1-brgl@bgdev.pl>
In-Reply-To: <20200109161636.9362-1-brgl@bgdev.pl>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 16:15:51 +0900
Message-ID: <CAK7LNAT34K7OcpXYhsAemd5Jd7px8P1+DyS=7s76pW2h6d663A@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: fix an "implicit declaration of function" warning
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Fri, Jan 10, 2020 at 1:16 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
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

Applied to linux-kbuild.
Thanks.


--=20
Best Regards
Masahiro Yamada
