Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53331 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750732AbeEGNgK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 May 2018 09:36:10 -0400
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com [209.85.213.47]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w47Da7ha023262
        for <linux-kbuild@vger.kernel.org>; Mon, 7 May 2018 22:36:08 +0900
Received: by mail-vk0-f47.google.com with SMTP id g83-v6so17425093vkc.6
        for <linux-kbuild@vger.kernel.org>; Mon, 07 May 2018 06:36:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180507071134.5213-1-riku.voipio@linaro.org>
References: <20180507071134.5213-1-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 7 May 2018 22:35:26 +0900
Message-ID: <CAK7LNAQCMsoyKCLh+qVC1wpT3DEvxfssJO9==qRBk93FNJ_rVg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: deb-pkg improve maintainer address generation
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>, Mathieu Malaterre <malat@debian.org>

Hi Riku,

2018-05-07 16:11 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> There is multiple issues with the genaration of maintainer string
>
> It uses DEBEMAIL and EMAIL enviroment variables, which may contain angle =
brackets,
> creating invalid maintainer strings. The documented KBUILD_BUILD_USER and
> KBUILD_BUILD_HOST variables are not used. Undocumented and uncommon NAME
> variable is used.

Sorry, I missed to ask you about 'NAME' variable.


I checked the Debian Administrator's Handbook.

I see the following description


  TIP
  Maintainer=E2=80=99s name and email address

  Most of the programs involved in package maintenance will look for
your name and
  email address in the DEBFULLNAME and DEBEMAIL or EMAIL environment variab=
les.
  Defining them once and for all will avoid you having to type them
multiple times.
  If your usual shell is bash , it is a simple matter of adding the
following two lines
  in your ~/.bashrc file (you will obviously replace the values with
more relevant
  ones!):

  export EMAIL=3D=E2=80=9Dhertzog@debian.org=E2=80=9D
  export DEBFULLNAME=3D=E2=80=9DRaphael Hertzog=E2=80=9D


Indeed, 'NAME' is not mentioned at all here.



On the other hand, I also checked the following link
referred by Mathieu:
https://manpages.debian.org/unstable/devscripts/dch.1.en.html

  If the environment variable DEBFULLNAME is set, this will be used for the
  maintainer full name; if not, then NAME will be checked. If the environme=
nt
  variable DEBEMAIL is set, this will be used for the email address. If thi=
s
  variable has the form "name <email>", then the maintainer name will also =
be
  taken from here if neither DEBFULLNAME nor NAME is set.


Hmm, debchange checks 'NAME' too.



I think you are more familiar with Debian.

I just took a pause to ask
which to follow.






> Refactor the Maintainer string to:
>
> - use EMAIL or DEBEMAIL directly if they are in form "name <user@host>"
> - use KBUILD_BUILD_USER and KBUILD_BUILD_HOST if set before falling
>   back to autodetection
> - no longer use NAME variable or the useless Anonymous string
>
> The logic is switched from multiline if/then/fi statements to compact
> shell variable substition commands.
>
> Reported-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
> v2: include improvements suggested by Masahiro-san
>
>  scripts/package/mkdebian | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 6adb3a16ba3b..985d72d1ab34 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -71,22 +71,21 @@ if [ "$ARCH" =3D "um" ] ; then
>         packagename=3Duser-mode-linux-$version
>  fi
>
> -# Try to determine maintainer and email values
> -if [ -n "$DEBEMAIL" ]; then
> -       email=3D$DEBEMAIL
> -elif [ -n "$EMAIL" ]; then
> -       email=3D$EMAIL
> -else
> -       email=3D$(id -nu)@$(hostname -f 2>/dev/null || hostname)
> -fi
> -if [ -n "$DEBFULLNAME" ]; then
> -       name=3D$DEBFULLNAME
> -elif [ -n "$NAME" ]; then
> -       name=3D$NAME
> +email=3D${DEBEMAIL-$EMAIL}
> +
> +# use email string directly if it contains <email>
> +if echo $email | grep -q '<.*>'; then
> +       maintainer=3D$email
>  else
> -       name=3D"Anonymous"
> +       # or construct the maintainer string
> +       user=3D${KBUILD_BUILD_USER-$(id -nu)}
> +       name=3D${DEBFULLNAME-$user}
> +       if [ -z "$email" ]; then
> +               buildhost=3D${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null=
 || hostname)}
> +               email=3D"$user@$buildhost"
> +       fi
> +       maintainer=3D"$name <$email>"
>  fi
> -maintainer=3D"$name <$email>"
>
>  # Try to determine distribution
>  if [ -n "$KDEB_CHANGELOG_DIST" ]; then
> --
> 2.14.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards
Masahiro Yamada
