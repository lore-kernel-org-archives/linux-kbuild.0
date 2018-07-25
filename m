Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:57276 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388464AbeGYBiu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jul 2018 21:38:50 -0400
MIME-Version: 1.0
In-Reply-To: <20180712125013.14285-1-ville.syrjala@linux.intel.com>
References: <20180712125013.14285-1-ville.syrjala@linux.intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 25 Jul 2018 09:28:46 +0900
Message-ID: <CAK7LNAQz1oU9=NHSbw+rOw7LLFP5PpwuvUcjEaVbN+y7uOD-xA@mail.gmail.com>
Subject: Re: [RFC][PATCH] kconfig: Add "m or y" and "y or m" answers for oldconfig
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-12 21:50 GMT+09:00 Ville Syrjala <ville.syrjala@linux.intel.com>:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Make it possible to answer "m or y" or "y or m" to
> oldconfig so that scripted kernel builds can easily
> enable new features not present in the existing .config.
>
> The particular use case I have in mind is continuous integration
> where you probably want to test build any new features. Currently
> you would have to either blindly try both 'y' and 'm' answers
> or parse the output to know which one will be accepted.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  scripts/kconfig/conf.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 671ff5364497..8038f9a6b9f4 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -201,15 +201,33 @@ static int conf_sym(struct menu *menu)
>                         continue;
>                 case 'm':
>                 case 'M':
> -                       newval =3D mod;
> -                       if (!line[1])
> +                       if (!strcmp(line, "m or y") ||
> +                           !strcmp(line, "M or Y")) {
> +                               if (sym_tristate_within_range(sym, mod))
> +                                       newval =3D mod;
> +                               else
> +                                       newval =3D yes;
>                                 break;
> +                       } else {
> +                               newval =3D mod;
> +                               if (!line[1])
> +                                       break;
> +                       }
>                         continue;
>                 case 'y':
>                 case 'Y':
> -                       newval =3D yes;
> -                       if (!line[1] || !strcmp(&line[1], "es"))
> +                       if (!strcmp(line, "y or m") ||
> +                           !strcmp(line, "Y or M")) {
> +                               if (sym_tristate_within_range(sym, yes))
> +                                       newval =3D yes;
> +                               else
> +                                       newval =3D mod;
>                                 break;
> +                       } else {
> +                               newval =3D yes;
> +                               if (!line[1] || !strcmp(&line[1], "es"))
> +                                       break;
> +                       }
>                         continue;
>                 case 0:
>                         newval =3D oldval;




Hmm.

Instead of hard-coding specific patterns,
can you implement this in a more generic way?


For example, how about this?

Use '/' as a delimiter
so that user input will be "m/y", "y/m", "m/n", etc.

Split the input string into tokens by strtok() or something.
Iterate over the tokens until sym_set_tristate_value() succeeds.


Thanks.




> --
> 2.16.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards
Masahiro Yamada
