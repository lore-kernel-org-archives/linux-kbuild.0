Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47446 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751764AbeFENQy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Jun 2018 09:16:54 -0400
MIME-Version: 1.0
In-Reply-To: <20180602160209.23605-1-natechancellor@gmail.com>
References: <20180602160209.23605-1-natechancellor@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Jun 2018 22:15:59 +0900
Message-ID: <CAK7LNATCTZTzcEpW8kBG8GktMeDZSuinAQX7_hnjysj0OaztcQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Avoid format overflow warning from GCC 8.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>

2018-06-03 1:02 GMT+09:00 Nathan Chancellor <natechancellor@gmail.com>:
> In file included from scripts/kconfig/zconf.tab.c:2485:
> scripts/kconfig/confdata.c: In function =E2=80=98conf_write=E2=80=99:
> scripts/kconfig/confdata.c:773:22: warning: =E2=80=98%s=E2=80=99 directiv=
e writing likely 7 or more bytes into a region of size between 1 and 4097 [=
-Wformat-overflow=3D]
>   sprintf(newname, "%s%s", dirname, basename);
>                       ^~
> scripts/kconfig/confdata.c:773:19: note: assuming directive output of 7 b=
ytes
>   sprintf(newname, "%s%s", dirname, basename);
>                    ^~~~~~
> scripts/kconfig/confdata.c:773:2: note: =E2=80=98sprintf=E2=80=99 output =
1 or more bytes (assuming 4104) into a destination of size 4097
>   sprintf(newname, "%s%s", dirname, basename);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> scripts/kconfig/confdata.c:776:23: warning: =E2=80=98.tmpconfig.=E2=80=99=
 directive writing 11 bytes into a region of size between 1 and 4097 [-Wfor=
mat-overflow=3D]
>    sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
>                        ^~~~~~~~~~~
> scripts/kconfig/confdata.c:776:3: note: =E2=80=98sprintf=E2=80=99 output =
between 13 and 4119 bytes into a destination of size 4097
>    sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Increase the size of tmpname and newname to make GCC happy.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Applied to linux-kbuild.  Thanks!


>  scripts/kconfig/confdata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 5f87ad561b08..39e20974f4a3 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -720,7 +720,7 @@ int conf_write(const char *name)
>         struct menu *menu;
>         const char *basename;
>         const char *str;
> -       char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1=
];
> +       char dirname[PATH_MAX+1], tmpname[PATH_MAX+22], newname[PATH_MAX+=
8];
>         char *env;
>
>         dirname[0] =3D 0;
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards
Masahiro Yamada
