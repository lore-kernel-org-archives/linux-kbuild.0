Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:33660 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750775AbdEBBXd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 May 2017 21:23:33 -0400
Received: by mail-pf0-f175.google.com with SMTP id q20so27790323pfg.0
        for <linux-kbuild@vger.kernel.org>; Mon, 01 May 2017 18:23:32 -0700 (PDT)
Date: Mon, 1 May 2017 18:23:30 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/2] kbuild: clang: Disable 'address-of-packed-member'
 warning
Message-ID: <20170502012330.GW128305@google.com>
References: <20170421213931.155210-1-mka@chromium.org>
 <20170421213931.155210-2-mka@chromium.org>
 <CAK7LNASEnzDPQs2AY115sMx-i2NTUu9h9LHv5eN1ygvW81vtFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNASEnzDPQs2AY115sMx-i2NTUu9h9LHv5eN1ygvW81vtFw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

Hi Masahiro,

El Sun, Apr 30, 2017 at 10:59:52PM +0900 Masahiro Yamada ha dit:

> 2017-04-22 6:39 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> > clang generates plenty of these warnings in different parts of the code,
> > to an extent that the warnings are little more than noise. Disable the
> > 'address-of-packed-member' warning.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> 
> As far as I compiled arch/x86/configs/x86_64_defconfig,
> all address-of-packed-member warnings came from the single point:
> 
> ./arch/x86/include/asm/processor.h:534:30: warning: taking address of
> packed member 'sp0' of class or structure 'x86_hw_tss' may result in
> an unaligned pointer value [-Waddress-of-packed-member]
>         return this_cpu_read_stable(cpu_tss.x86_tss.sp0);
>                                     ^~~~~~~~~~~~~~~~~~~
> ./arch/x86/include/asm/percpu.h:391:59: note: expanded from macro
> 'this_cpu_read_stable'
> #define this_cpu_read_stable(var)       percpu_stable_op("mov", var)
>                                                                 ^~~
> ./arch/x86/include/asm/percpu.h:228:16: note: expanded from macro
> 'percpu_stable_op'
>                     : "p" (&(var)));                    \
>                              ^~~
> 
> 
> 
> For this case, I was able to fix it with the following patch:
> 
> 
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
> index 9fa0360..de25d1c 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -211,26 +211,27 @@ do {
>         \
>  #define percpu_stable_op(op, var)                      \
>  ({                                                     \
>         typeof(var) pfo_ret__;                          \
> +       void *__p = &(var);                             \
>         switch (sizeof(var)) {                          \
>         case 1:                                         \
>                 asm(op "b "__percpu_arg(P1)",%0"        \
>                     : "=q" (pfo_ret__)                  \
> -                   : "p" (&(var)));                    \
> +                   : "p" (__p));                       \
>                 break;                                  \
>         case 2:                                         \
>                 asm(op "w "__percpu_arg(P1)",%0"        \
>                     : "=r" (pfo_ret__)                  \
> -                   : "p" (&(var)));                    \
> +                   : "p" (__p));                       \
>                 break;                                  \
>         case 4:                                         \
>                 asm(op "l "__percpu_arg(P1)",%0"        \
>                     : "=r" (pfo_ret__)                  \
> -                   : "p" (&(var)));                    \
> +                   : "p" (__p));                       \
>                 break;                                  \
>         case 8:                                         \
>                 asm(op "q "__percpu_arg(P1)",%0"        \
>                     : "=r" (pfo_ret__)                  \
> -                   : "p" (&(var)));                    \
> +                   : "p" (__p));                       \
>                 break;                                  \
>         default: __bad_percpu_size();                   \
>         }                                               \

Thanks for having a look!

It is odd though that you only see warnings from that origin, I
encounter plenty of others with x86_64_defconfig, mostly stemming
from uaccess macros:

kernel/power/user.c:439:35: warning: taking address of packed member
'dev' of class or structure 'compat_resume_swap_area' may result in an
unaligned pointer value [-Waddress-of-packed-member]
                err |= get_user(swap_area.dev, &u_swap_area->dev);
                                                ^~~~~~~~~~~~~~~~
./arch/x86/include/asm/uaccess.h:168:23: note: expanded from macro 'get_user'
        register __inttype(*(ptr)) __val_gu asm("%"_ASM_DX);            \
                             ^~~
./arch/x86/include/asm/uaccess.h:132:41: note: expanded from macro '__inttype'
__typeof__(__builtin_choose_expr(sizeof(x) > sizeof(0UL), 0ULL, 0UL))
                                        ^

I looked into fixing different cases, but didn't see a clear path
forward since we can't just cast the type away as in your patch above.

> I'd like to see as much effort as possible
> before we decide to hide this kind of warning.
> 
> Is it OK with you ?

Sounds good, though I will probably leave this one for someone else :)

Cheers

Matthias
