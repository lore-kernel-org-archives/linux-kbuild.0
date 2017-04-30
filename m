Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50202 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755413AbdD3OAD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Apr 2017 10:00:03 -0400
MIME-Version: 1.0
In-Reply-To: <20170421213931.155210-2-mka@chromium.org>
References: <20170421213931.155210-1-mka@chromium.org> <20170421213931.155210-2-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Apr 2017 22:59:52 +0900
Message-ID: <CAK7LNASEnzDPQs2AY115sMx-i2NTUu9h9LHv5eN1ygvW81vtFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: clang: Disable 'address-of-packed-member' warning
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

Hi Matthias,



2017-04-22 6:39 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> clang generates plenty of these warnings in different parts of the code,
> to an extent that the warnings are little more than noise. Disable the
> 'address-of-packed-member' warning.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>


As far as I compiled arch/x86/configs/x86_64_defconfig,
all address-of-packed-member warnings came from the single point:

./arch/x86/include/asm/processor.h:534:30: warning: taking address of
packed member 'sp0' of class or structure 'x86_hw_tss' may result in
an unaligned pointer value [-Waddress-of-packed-member]
        return this_cpu_read_stable(cpu_tss.x86_tss.sp0);
                                    ^~~~~~~~~~~~~~~~~~~
./arch/x86/include/asm/percpu.h:391:59: note: expanded from macro
'this_cpu_read_stable'
#define this_cpu_read_stable(var)       percpu_stable_op("mov", var)
                                                                ^~~
./arch/x86/include/asm/percpu.h:228:16: note: expanded from macro
'percpu_stable_op'
                    : "p" (&(var)));                    \
                             ^~~



For this case, I was able to fix it with the following patch:


diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 9fa0360..de25d1c 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -211,26 +211,27 @@ do {
        \
 #define percpu_stable_op(op, var)                      \
 ({                                                     \
        typeof(var) pfo_ret__;                          \
+       void *__p = &(var);                             \
        switch (sizeof(var)) {                          \
        case 1:                                         \
                asm(op "b "__percpu_arg(P1)",%0"        \
                    : "=q" (pfo_ret__)                  \
-                   : "p" (&(var)));                    \
+                   : "p" (__p));                       \
                break;                                  \
        case 2:                                         \
                asm(op "w "__percpu_arg(P1)",%0"        \
                    : "=r" (pfo_ret__)                  \
-                   : "p" (&(var)));                    \
+                   : "p" (__p));                       \
                break;                                  \
        case 4:                                         \
                asm(op "l "__percpu_arg(P1)",%0"        \
                    : "=r" (pfo_ret__)                  \
-                   : "p" (&(var)));                    \
+                   : "p" (__p));                       \
                break;                                  \
        case 8:                                         \
                asm(op "q "__percpu_arg(P1)",%0"        \
                    : "=r" (pfo_ret__)                  \
-                   : "p" (&(var)));                    \
+                   : "p" (__p));                       \
                break;                                  \
        default: __bad_percpu_size();                   \
        }                                               \





I'd like to see as much effort as possible
before we decide to hide this kind of warning.

Is it OK with you ?


-- 
Best Regards
Masahiro Yamada
