Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:48573 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753163Ab1LVRNO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Dec 2011 12:13:14 -0500
Received: by wgbdr13 with SMTP id dr13so16232388wgb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Dec 2011 09:13:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4EF3609D0200007800069A30@nat28.tlf.novell.com>
References: <4EF3609D0200007800069A30@nat28.tlf.novell.com>
Date: Thu, 22 Dec 2011 12:13:13 -0500
Message-ID: <CACqU3MWahjXy3q6AqDARCfPx5r3WF+uoHXZA6mkkpNKDjWcSMA@mail.gmail.com>
Subject: Re: [PATCH] consolidate WARN_...ONCE() static variables
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi,

On Thu, Dec 22, 2011 at 10:53 AM, Jan Beulich <JBeulich@suse.com> wrote:
> Due to the alignment of following variables, these typically consume
> more than just the single byte that 'bool' requires, and as there are
> a few hundred instances, the cache pollution (not so much the waste of
> memory) sums op. Put these variables into their own section, outside
> of half way frequently used memory range.
>
how does this relates to kbuild exactly ? I see you did not even CC'ed LKML.

btw, it might be interesting to have numbers backing this change :)

thanks,
 - Arnaud

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> ---
>  include/asm-generic/bug.h         |    6 +++---
>  include/asm-generic/vmlinux.lds.h |    1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> --- 3.2-rc6/include/asm-generic/bug.h
> +++ 3.2-rc6-warn-once-flag-cold/include/asm-generic/bug.h
> @@ -134,7 +134,7 @@ extern void warn_slowpath_null(const cha
>  #endif
>
>  #define WARN_ON_ONCE(condition)        ({                              \
> -       static bool __warned;                                   \
> +       static bool __section(.data.unlikely) __warned;         \
>        int __ret_warn_once = !!(condition);                    \
>                                                                \
>        if (unlikely(__ret_warn_once))                          \
> @@ -144,7 +144,7 @@ extern void warn_slowpath_null(const cha
>  })
>
>  #define WARN_ONCE(condition, format...)        ({                      \
> -       static bool __warned;                                   \
> +       static bool __section(.data.unlikely) __warned;         \
>        int __ret_warn_once = !!(condition);                    \
>                                                                \
>        if (unlikely(__ret_warn_once))                          \
> @@ -154,7 +154,7 @@ extern void warn_slowpath_null(const cha
>  })
>
>  #define WARN_TAINT_ONCE(condition, taint, format...)   ({      \
> -       static bool __warned;                                   \
> +       static bool __section(.data.unlikely) __warned;         \
>        int __ret_warn_once = !!(condition);                    \
>                                                                \
>        if (unlikely(__ret_warn_once))                          \
> --- 3.2-rc6/include/asm-generic/vmlinux.lds.h
> +++ 3.2-rc6-warn-once-flag-cold/include/asm-generic/vmlinux.lds.h
> @@ -167,6 +167,7 @@
>        CPU_KEEP(exit.data)                                             \
>        MEM_KEEP(init.data)                                             \
>        MEM_KEEP(exit.data)                                             \
> +       *(.data.unlikely)                                               \
>        STRUCT_ALIGN();                                                 \
>        *(__tracepoints)                                                \
>        /* implement dynamic printk debug */                            \
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
