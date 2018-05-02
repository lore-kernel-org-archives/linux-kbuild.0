Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:41265 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751063AbeEBLap (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 May 2018 07:30:45 -0400
Received: by mail-lf0-f67.google.com with SMTP id o123-v6so20299186lfe.8
        for <linux-kbuild@vger.kernel.org>; Wed, 02 May 2018 04:30:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180423195055.26069-1-malat@debian.org>
References: <20180423195055.26069-1-malat@debian.org>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Wed, 2 May 2018 14:30:43 +0300
Message-ID: <CAAqcGHn+3HMC_tVsOsLB1Vycdv7SYZ=1SYc0Cg3Gx-Xe=sExMg@mail.gmail.com>
Subject: Re: [PATCH] kbuild/debian: Use KBUILD_BUILD_* when set
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mathieu Malaterre <malat@debian.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 23 April 2018 at 22:50, Mathieu Malaterre <malat@debian.org> wrote:
> Be nice to the user and check env vars KBUILD_BUILD_USER &
> KBUILD_BUILD_HOST when those are set.

mkdebian sets the maintainer address as "$name <$email>", but this
patch only sets the email part. I also wonder about the precedence, I
think KBUILD_* should be considered over the generic Debian variables.

Riku

> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  scripts/package/mkdebian | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 6adb3a16ba3b..05d58d3ae8a0 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -76,6 +76,8 @@ if [ -n "$DEBEMAIL" ]; then
>         email=$DEBEMAIL
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
