Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgGHUBH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 16:01:07 -0400
MIME-Version: 1.0
References: <CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com>
 <20200708190756.16810-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20200708190756.16810-1-rikard.falkeborn@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Jul 2020 23:00:50 +0300
Message-ID: <CAHp75VeA1GGvaxyzraWOO-4zQNC3sbcawsYwWXCNBWavtZGBuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Move -Wtype-limits to W=2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Emil Velikov <emil.l.velikov@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <keescook@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kbuild test robot <lkp@intel.com>, mm-commits@vger.kernel.org, Syed Nayyar Waris <syednwaris@gmail.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Jul 8, 2020 at 10:08 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
>
> -Wtype-limits is included in -Wextra which is added at W=1. It warns
> (among other things) that 'comparison of an unsigned variable `< 0` is
> always false. This causes noisy warnings, especially when used in
> macros, hence it is more suitable for W=2.
>

Suggested-by: Arnd ?

LGTM!

> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
> See also discussion at https://lore.kernel.org/lkml/CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com/
>
>  scripts/Makefile.extrawarn | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 4aea7cf71d11..62c275685b75 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -35,6 +35,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
>  # The following turn off the warnings enabled by -Wextra
>  KBUILD_CFLAGS += -Wno-missing-field-initializers
>  KBUILD_CFLAGS += -Wno-sign-compare
> +KBUILD_CFLAGS += -Wno-type-limits
>
>  KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
>
> @@ -66,6 +67,7 @@ KBUILD_CFLAGS += -Wshadow
>  KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
>  KBUILD_CFLAGS += -Wmissing-field-initializers
>  KBUILD_CFLAGS += -Wsign-compare
> +KBUILD_CFLAGS += -Wtype-limits
>  KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
>  KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
>
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
