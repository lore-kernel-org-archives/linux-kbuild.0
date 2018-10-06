Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:58294 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbeJGDhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Oct 2018 23:37:02 -0400
MIME-Version: 1.0
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com> <20181005083313.2088252-1-arnd@arndb.de>
In-Reply-To: <20181005083313.2088252-1-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 7 Oct 2018 05:31:21 +0900
Message-ID: <CAK7LNAQzOeoid3dRnAbZE3H-ZSbcJ4wJa_nreC-VLOutUH_ssA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kieran.bingham+renesas@ideasonboard.com, stable <stable@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Oct 5, 2018 at 5:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Building any configuration with 'make W=1' produces a warning:
>
> kernel/bounds.c:16:6: warnign: no previous prototype for 'foo' [-Wmissing-prototypes]
>
> When also passing -Werror, this prevents us from building any
> other files. Nobody ever calls the function, but we can't make
> it 'static' either since we want the compiler output.
>
> Calling it 'main' instead however avoids the warning, because gcc
> does not insist on having a declaration for main.
>
> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Applied to kbuild/fixes
with 's/warnign/warning/'

Thanks!




> I have run into this problem several times before, and thought I had
> sent a fix at some point. Looking in the archives, I came across
> the suggested fix from Kieran, so I'm following up on that here.
> ---
>  kernel/bounds.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bounds.c b/kernel/bounds.c
> index c373e887c066..9795d75b09b2 100644
> --- a/kernel/bounds.c
> +++ b/kernel/bounds.c
> @@ -13,7 +13,7 @@
>  #include <linux/log2.h>
>  #include <linux/spinlock_types.h>
>
> -void foo(void)
> +int main(void)
>  {
>         /* The enum constants to put into include/generated/bounds.h */
>         DEFINE(NR_PAGEFLAGS, __NR_PAGEFLAGS);
> @@ -23,4 +23,6 @@ void foo(void)
>  #endif
>         DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
>         /* End of constants */
> +
> +       return 0;
>  }
> --
> 2.18.0
>


-- 
Best Regards
Masahiro Yamada
