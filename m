Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64541 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750971AbeEEJqO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 May 2018 05:46:14 -0400
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com [209.85.213.46]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w459ju7t024762
        for <linux-kbuild@vger.kernel.org>; Sat, 5 May 2018 18:45:56 +0900
Received: by mail-vk0-f46.google.com with SMTP id x66-v6so10268620vka.11
        for <linux-kbuild@vger.kernel.org>; Sat, 05 May 2018 02:45:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180503114627.30183-1-riku.voipio@linaro.org>
References: <20180503114627.30183-1-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 5 May 2018 18:45:15 +0900
Message-ID: <CAK7LNASjWd-JGx7MgpmyWSk1aN6S1pELd3rZr7vVjm+WeDaDHQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg improve maintainer address generation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>, Mathieu Malaterre <malat@debian.org>

Hi Riku,


2018-05-03 20:46 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> There is multiple issues with the genaration of maintainer string
>
> It uses DEBEMAIL and EMAIL enviroment variables, which may contain angle brackets,
> creating invalid maintainer strings. The documented KBUILD_BUILD_USER and
> KBUILD_BUILD_HOST variables are not used. Undocumented and uncommon NAME
> variable is used. Refactor the Maintainer string to:
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


Almost looks good to me.

Just small nits.


>  scripts/package/mkdebian | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 6adb3a16ba3b..a70f20eb877a 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -71,22 +71,23 @@ if [ "$ARCH" = "um" ] ; then
>         packagename=user-mode-linux-$version
>  fi
>
> -# Try to determine maintainer and email values
> -if [ -n "$DEBEMAIL" ]; then
> -       email=$DEBEMAIL
> -elif [ -n "$EMAIL" ]; then
> -       email=$EMAIL
> -else
> -       email=$(id -nu)@$(hostname -f 2>/dev/null || hostname)
> -fi
> -if [ -n "$DEBFULLNAME" ]; then
> -       name=$DEBFULLNAME
> -elif [ -n "$NAME" ]; then
> -       name=$NAME
> +email=${DEBEMAIL-$EMAIL}
> +
> +# use email string directly if it contains <email>
> +if echo $email|grep -q '<.*>';
> +then




May I ask two coding style changes?

  - Please add spaces around the pipe operator '|'
  - Move 'then' to the end of the previous line, for style consistency

i.e. like follows:

if echo $email | grep -q '<.*>'; then






> +       maintainer=$email
>  else
> -       name="Anonymous"
> +       # or construct the maintainer string
> +       user=${KBUILD_BUILD_USER-$(id -nu)}
> +       name=${DEBFULLNAME-$user}
> +       if [ -n "$email" ]; then
> +               maintainer="$name <$email>"
> +       else
> +               buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
> +               maintainer="$name <$user@$buildhost>"
> +       fi
>  fi


I think the else-block can be a bit shorter
if you write like follows:


    # or construct the maintainer string
    user=${KBUILD_BUILD_USER-$(id -nu)}
    name=${DEBFULLNAME-$user}
    if [ -z "$email" ]; then
            buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null ||
hostname)}
            email=$user@$buildhost
    fi
    maintainer="$name <$email>"







-- 
Best Regards
Masahiro Yamada
