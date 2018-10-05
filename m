Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:47244 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbeJEPpM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Oct 2018 11:45:12 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
 <20181005083313.2088252-1-arnd@arndb.de>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <ae573dd3-8a2a-bad6-0132-815d1688a8ae@ideasonboard.com>
Date: Fri, 5 Oct 2018 09:47:23 +0100
MIME-Version: 1.0
In-Reply-To: <20181005083313.2088252-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com

Hi Arnd,

On 05/10/18 09:33, Arnd Bergmann wrote:
> Building any configuration with 'make W=1' produces a warning:
> 
> kernel/bounds.c:16:6: warnign: no previous prototype for 'foo' [-Wmissing-prototypes]
> 

s/warnign/warning/ but I don't think that's too important :D

> When also passing -Werror, this prevents us from building any
> other files. Nobody ever calls the function, but we can't make
> it 'static' either since we want the compiler output.
> 
> Calling it 'main' instead however avoids the warning, because gcc
> does not insist on having a declaration for main.

Aha - even better! (and annoyingly fairly obvious, from the
Why-didn't-I-think-of-that department).

> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
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
>  	/* The enum constants to put into include/generated/bounds.h */
>  	DEFINE(NR_PAGEFLAGS, __NR_PAGEFLAGS);
> @@ -23,4 +23,6 @@ void foo(void)
>  #endif
>  	DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
>  	/* End of constants */
> +
> +	return 0;
>  }
> 
