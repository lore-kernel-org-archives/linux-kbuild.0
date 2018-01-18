Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:44661 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754904AbeARL4Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jan 2018 06:56:16 -0500
MIME-Version: 1.0
In-Reply-To: <1516248823-22790-1-git-send-email-yamada.masahiro@socionext.com>
References: <1516248823-22790-1-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 18 Jan 2018 12:56:15 +0100
Message-ID: <CAFkk2KTPkHiw5VVO55+9wJq_f-psn11=Cu0VA-qsHnDEVJsPtw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: announce removal of oldnoconfig if used
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Marc Herbert <marc.herbert@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 18, 2018 at 5:13 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The 'oldnoconfig' is really confusing due to its counter-intuitive name.
> It was renamed by commit fb16d8912db5 ("kconfig: replace 'oldnoconfig'
> with 'olddefconfig', and keep the old name as an alias").
>
> The 'oldnoconfig' has been kept as an alias for enough period of time,
> and finally I am planning to remove it.  Meanwhile, the following
> message will be displayed if oldnoconfig is used.
>
>     WARNING: "oldnoconfig" target will be removed after Linux 4.19
>               Please use "olddefconfig" instead.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 61cdc5e..9a349bd 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -92,6 +92,8 @@ PHONY += oldnoconfig savedefconfig defconfig
>  # on its behavior (sets new symbols to their default value but not 'n') with the
>  # counter-intuitive name.
>  oldnoconfig: olddefconfig
> +       @echo "  WARNING: \"oldnoconfig\" target will be removed after Linux 4.19"
> +       @echo "            Please use \"olddefconfig\" instead."
>
>  savedefconfig: $(obj)/conf
>         $< $(silent) --$@=defconfig $(Kconfig)
> --
> 2.7.4
>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>

Maybe it could be extended to "Please use \"olddefconfig\" instead,
which is an alias", to make it extra clear.

Guessing "no" is from the fact that bool/tristate symbols with no user
value default to n unless they're selected or have an active default.
Confusing name still.

Cheers,
Ulf
