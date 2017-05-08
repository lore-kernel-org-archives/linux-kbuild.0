Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:34807 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdEHXSw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 May 2017 19:18:52 -0400
Received: by mail-pg0-f47.google.com with SMTP id u28so30496311pgn.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 May 2017 16:18:52 -0700 (PDT)
Date: Mon, 8 May 2017 16:18:50 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 1/2] kbuild: clang: Disable 'address-of-packed-member'
 warning
Message-ID: <20170508231850.GG128305@google.com>
References: <20170421213931.155210-1-mka@chromium.org>
 <20170421213931.155210-2-mka@chromium.org>
 <CAK7LNASEnzDPQs2AY115sMx-i2NTUu9h9LHv5eN1ygvW81vtFw@mail.gmail.com>
 <20170502012330.GW128305@google.com>
 <CAK7LNATysoDBqaTDT2zGs-ycHNqoX=RLfbG=1uHzLrVOiwO6fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNATysoDBqaTDT2zGs-ycHNqoX=RLfbG=1uHzLrVOiwO6fw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

Hi Masahiro,

El Sun, May 07, 2017 at 01:52:25AM +0900 Masahiro Yamada ha dit:

> 2017-05-02 10:23 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> > Hi Masahiro,
> >
> > El Sun, Apr 30, 2017 at 10:59:52PM +0900 Masahiro Yamada ha dit:
> >
> >> 2017-04-22 6:39 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> >> > clang generates plenty of these warnings in different parts of the code,
> >> > to an extent that the warnings are little more than noise. Disable the
> >> > 'address-of-packed-member' warning.
> >> >
> >> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >>
> >>
> >> As far as I compiled arch/x86/configs/x86_64_defconfig,
> >> all address-of-packed-member warnings came from the single point:
> >>
> >> ./arch/x86/include/asm/processor.h:534:30: warning: taking address of
> >> packed member 'sp0' of class or structure 'x86_hw_tss' may result in
> >> an unaligned pointer value [-Waddress-of-packed-member]
> >>         return this_cpu_read_stable(cpu_tss.x86_tss.sp0);
> >>                                     ^~~~~~~~~~~~~~~~~~~
> >> ./arch/x86/include/asm/percpu.h:391:59: note: expanded from macro
> >> 'this_cpu_read_stable'
> >> #define this_cpu_read_stable(var)       percpu_stable_op("mov", var)
> >>                                                                 ^~~
> >> ./arch/x86/include/asm/percpu.h:228:16: note: expanded from macro
> >> 'percpu_stable_op'
> >>                     : "p" (&(var)));                    \
> >>                              ^~~
> >>
> >>
> >>
> >> For this case, I was able to fix it with the following patch:
> >>
> >>
> >> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
> >> index 9fa0360..de25d1c 100644
> >> --- a/arch/x86/include/asm/percpu.h
> >> +++ b/arch/x86/include/asm/percpu.h
> >> @@ -211,26 +211,27 @@ do {
> >>         \
> >>  #define percpu_stable_op(op, var)                      \
> >>  ({                                                     \
> >>         typeof(var) pfo_ret__;                          \
> >> +       void *__p = &(var);                             \
> >>         switch (sizeof(var)) {                          \
> >>         case 1:                                         \
> >>                 asm(op "b "__percpu_arg(P1)",%0"        \
> >>                     : "=q" (pfo_ret__)                  \
> >> -                   : "p" (&(var)));                    \
> >> +                   : "p" (__p));                       \
> >>                 break;                                  \
> >>         case 2:                                         \
> >>                 asm(op "w "__percpu_arg(P1)",%0"        \
> >>                     : "=r" (pfo_ret__)                  \
> >> -                   : "p" (&(var)));                    \
> >> +                   : "p" (__p));                       \
> >>                 break;                                  \
> >>         case 4:                                         \
> >>                 asm(op "l "__percpu_arg(P1)",%0"        \
> >>                     : "=r" (pfo_ret__)                  \
> >> -                   : "p" (&(var)));                    \
> >> +                   : "p" (__p));                       \
> >>                 break;                                  \
> >>         case 8:                                         \
> >>                 asm(op "q "__percpu_arg(P1)",%0"        \
> >>                     : "=r" (pfo_ret__)                  \
> >> -                   : "p" (&(var)));                    \
> >> +                   : "p" (__p));                       \
> >>                 break;                                  \
> >>         default: __bad_percpu_size();                   \
> >>         }                                               \
> >
> > Thanks for having a look!
> >
> > It is odd though that you only see warnings from that origin, I
> > encounter plenty of others with x86_64_defconfig, mostly stemming
> > from uaccess macros:
> >
> > kernel/power/user.c:439:35: warning: taking address of packed member
> > 'dev' of class or structure 'compat_resume_swap_area' may result in an
> > unaligned pointer value [-Waddress-of-packed-member]
> >                 err |= get_user(swap_area.dev, &u_swap_area->dev);
> >                                                 ^~~~~~~~~~~~~~~~
> > ./arch/x86/include/asm/uaccess.h:168:23: note: expanded from macro 'get_user'
> >         register __inttype(*(ptr)) __val_gu asm("%"_ASM_DX);            \
> >                              ^~~
> > ./arch/x86/include/asm/uaccess.h:132:41: note: expanded from macro '__inttype'
> > __typeof__(__builtin_choose_expr(sizeof(x) > sizeof(0UL), 0ULL, 0UL))
> >                                         ^
> >
> > I looked into fixing different cases, but didn't see a clear path
> > forward since we can't just cast the type away as in your patch above.
> 
> 
> Curious.
> I tested clang 3.0 thru 4.0, but I could not reproduce this.
> 
> This part just calculates sizeof(*(ptr)).
> I think it is a false positive warning bug if clang reports this.

The instance above is indeed somewhat doubtful, in any case there are
plenty of others, most of them from fs/compat.c using __get/put_user_xyz():

fs/compat.c:366:33: warning: taking address of packed member 'l_whence' of class or structure 'compat_flock64' may result in an unaligned pointer value [-Waddress-of-packed-member]
            __get_user(kfl->l_whence, &ufl->l_whence) ||
                                       ^~~~~~~~~~~~~
arch/x86/include/asm/uaccess.h:505:27: note: expanded from macro '__get_user'
        __get_user_nocheck((x), (ptr), sizeof(*(ptr)))
                                 ^~~
arch/x86/include/asm/uaccess.h:436:29: note: expanded from macro '__get_user_nocheck'
        __get_user_size(__gu_val, (ptr), (size), __gu_err, -EFAULT);    \
                                   ^~~
arch/x86/include/asm/uaccess.h:361:21: note: expanded from macro '__get_user_size'
                __get_user_asm(x, ptr, retval, "w", "w", "=r", errret); \
                                  ^~~
arch/x86/include/asm/uaccess.h:385:19: note: expanded from macro '__get_user_asm'
                     : "m" (__m(addr)), "i" (errret), "0" (err))
                                ^~~~
arch/x86/include/asm/uaccess.h:444:51: note: expanded from macro '__m'
#define __m(x) (*(struct __large_struct __user *)(x))
                                                  ^

The clang version I use is fairly recent since it includes some
fixes needed to build a working kernel (mostly for ARM64).

clang --version
Chromium OS 5.0_pre300080-r1 clang version 5.0.0

Cheers

Matthias
