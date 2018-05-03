Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:42893 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbeECRF3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 May 2018 13:05:29 -0400
Received: by mail-oi0-f67.google.com with SMTP id t27-v6so16729296oij.9
        for <linux-kbuild@vger.kernel.org>; Thu, 03 May 2018 10:05:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180503114627.30183-1-riku.voipio@linaro.org>
References: <20180503114627.30183-1-riku.voipio@linaro.org>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 3 May 2018 19:05:08 +0200
Message-ID: <CA+7wUsy5GNTPn2EdsH4NX9xKihLrS-p_kbxXXjJ3ToPCR6sEpQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg improve maintainer address generation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, debian-kernel@lists.debian.org

Hi,

On Thu, May 3, 2018 at 1:46 PM,  <riku.voipio@linaro.org> wrote:
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

Much more elegant indeed.

Acked-by: Mathieu Malaterre <malat@debian.org>

> Reported-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
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
> -maintainer="$name <$email>"
>
>  # Try to determine distribution
>  if [ -n "$KDEB_CHANGELOG_DIST" ]; then
> --
> 2.14.2
>
