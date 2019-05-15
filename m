Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59053 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfEOHyA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 03:54:00 -0400
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190515073818.22486-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 15 May 2019 16:53:15 +0900
Message-ID: <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> In the recent build test of linux-next, Stephen saw a build error
> caused by a broken .tmp_versions/*.mod file:
>
>   https://lkml.org/lkml/2019/5/13/991
>
> drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> basename, and there is a race in generating .tmp_versions/asix.mod
>
> Kbuild has not checked this before, and it occasionally shows up with
> obscure error message when this kind of race occurs.
>
> It is not trivial to catch this potential issue by eyes.
>
> Hence, this script.
>
> I compile-tested allmodconfig for the latest kernel as of writing,
> it detected the following:
>
> warning: same basename '88pm800.ko' if the following are built as modules:
>   drivers/regulator/88pm800.ko
>   drivers/mfd/88pm800.ko
> warning: same basename 'adv7511.ko' if the following are built as modules:
>   drivers/gpu/drm/bridge/adv7511/adv7511.ko
>   drivers/media/i2c/adv7511.ko
> warning: same basename 'asix.ko' if the following are built as modules:
>   drivers/net/phy/asix.ko
>   drivers/net/usb/asix.ko
> warning: same basename 'coda.ko' if the following are built as modules:
>   fs/coda/coda.ko
>   drivers/media/platform/coda/coda.ko
> warning: same basename 'realtek.ko' if the following are built as modules:
>   drivers/net/phy/realtek.ko
>   drivers/net/dsa/realtek.ko
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

> diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> new file mode 100755
> index 000000000000..944e68bd22b0
> --- /dev/null
> +++ b/scripts/modules-check.sh
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Warn if two or more modules have the same basename
> +check_same_name_modules()
> +{
> +       same_name_modules=$(cat modules.order modules.builtin | \
> +                               xargs basename -a | sort | uniq -d)
> +
> +       for m in $same_name_modules
> +       do
> +               echo "warning: same basename '$m' if the following are built as modules:"
> +               grep --no-filename -e /$m modules.order modules.builtin | \
> +                                                       sed 's:^kernel/:  :'


Self nit-picking:
It might be better to send these messages to stderr instead of stdout.




--
Best Regards
Masahiro Yamada
