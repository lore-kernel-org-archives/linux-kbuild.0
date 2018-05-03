Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35459 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751050AbeECJvJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 May 2018 05:51:09 -0400
Received: by mail-lf0-f68.google.com with SMTP id y72-v6so11301935lfd.2
        for <linux-kbuild@vger.kernel.org>; Thu, 03 May 2018 02:51:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180502200137.6870-1-malat@debian.org>
References: <20180423195055.26069-1-malat@debian.org> <20180502200137.6870-1-malat@debian.org>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Thu, 3 May 2018 12:51:07 +0300
Message-ID: <CAAqcGHnLLb1URXUj4U7+C6HRzGNbQbFdHJaxi6hxwH-Nt85Mvw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild/debian: Use KBUILD_BUILD_* when set
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mathieu Malaterre <malat@debian.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 2 May 2018 at 23:01, Mathieu Malaterre <malat@debian.org> wrote:
> Be nice to the user and check env vars KBUILD_BUILD_USER &
> KBUILD_BUILD_HOST when those are set.
>
> Since DEBEMAIL accept a syntax where the full name is present, be extra
> nice to user and extract email address only.
> Cc: Riku Voipio <riku.voipio@linaro.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
> v2: update patch since syntax of DEBEMAIL may contain full name
>
>  scripts/package/mkdebian | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 6adb3a16ba3b..3f4e43446db3 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -73,9 +73,19 @@ fi
>
>  # Try to determine maintainer and email values
>  if [ -n "$DEBEMAIL" ]; then
> -       email=$DEBEMAIL
> +       case "$DEBEMAIL" in
> +         *\ * )
> +           email=$(echo $DEBEMAIL | cut -d '<' -f2 | cut -d '>' -f1)

Why go through all the trouble of deconstructing the string and then
reassemble it a few lines down in the script?

I'll submit an alternative way to handle the Maintainer address setting.

> +           echo >&2 "Extracting email from DEBEMAIL. Use DEBFULLNAME instead."
> +           ;;
> +         *)
> +           email=$DEBEMAIL
> +           ;;
> +       esac
>  elif [ -n "$EMAIL" ]; then
>         email=$EMAIL
> +elif [ -n "$KBUILD_BUILD_USER" ] && [ -n "$KBUILD_BUILD_HOST" ]; then
> +       email=$KBUILD_BUILD_USER@$KBUILD_BUILD_HOST
>  else
>         email=$(id -nu)@$(hostname -f 2>/dev/null || hostname)
>  fi
> --
> 2.11.0
>
