Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:65068 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfG1EMw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 00:12:52 -0400
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Jul 2019 13:12:02 +0900
Message-ID: <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Handle PREEMPT_RT for version string and magic
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Sebastian Sewior <bigeasy@linutronix.de>

Hi Thomas,

On Sat, Jul 27, 2019 at 5:49 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Update the build scripts and the version magic to reflect when
> CONFIG_PREEMPT_RT is enabled in the same way as CONFIG_PREEMPT is treated.
>
> The resulting version strings:
>
>   Linux m 5.3.0-rc1+ #100 SMP Fri Jul 26 ...
>   Linux m 5.3.0-rc1+ #101 SMP PREEMPT Fri Jul 26 ...
>   Linux m 5.3.0-rc1+ #102 SMP PREEMPT_RT Fri Jul 26 ...
>
> The module vermagic:
>
>   5.3.0-rc1+ SMP mod_unload modversions
>   5.3.0-rc1+ SMP preempt mod_unload modversions
>   5.3.0-rc1+ SMP preempt_rt mod_unload modversions
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org

Since CONFIG_PREEMPTION was introduced after -rc1,
I think this should be queued on top of -rc2.

Just a nit below.


> ---
>  include/linux/vermagic.h |   10 +++++++---
>  init/Makefile            |    5 +++--
>  scripts/Makefile.modpost |    2 +-
>  scripts/mkcompile_h      |    4 +++-
>  4 files changed, 14 insertions(+), 7 deletions(-)
>
> --- a/include/linux/vermagic.h
> +++ b/include/linux/vermagic.h
> @@ -7,10 +7,14 @@
>  #else
>  #define MODULE_VERMAGIC_SMP ""
>  #endif
> -#ifdef CONFIG_PREEMPT
> -#define MODULE_VERMAGIC_PREEMPT "preempt "
> +#ifdef CONFIG_PREEMPTION
> +# ifdef CONFIG_PREEMPT
> +#  define MODULE_VERMAGIC_PREEMPT "preempt "
> +# else
> +#  define MODULE_VERMAGIC_PREEMPT "preempt_rt "
> +# endif
>  #else
> -#define MODULE_VERMAGIC_PREEMPT ""
> +# define MODULE_VERMAGIC_PREEMPT ""

Maybe, is the following more readable?

#if defined(CONFIG_PREEMPT_RT)
#define MODULE_VERMAGIC_PREEMPT "preempt_rt "
#elif defined(CONFIG_PREEMPT)
#define MODULE_VERMAGIC_PREEMPT "preempt "
#else
#define MODULE_VERMAGIC_PREEMPT ""
#endif


Thanks.

-- 
Best Regards
Masahiro Yamada
