Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35131 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdIMRMu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 13:12:50 -0400
Received: by mail-pf0-f195.google.com with SMTP id i23so332595pfi.2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 10:12:50 -0700 (PDT)
Date: Wed, 13 Sep 2017 10:12:49 -0700 (PDT)
Subject: Re: [PATCH v8 17/18] RISC-V: User-facing API
In-Reply-To: <CAK8P3a2669Bd1GXC33iM0woKxjQBR8NATJuCDuJs7+aGpGHLMA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-fe7c12d5-06c8-4b0a-97c8-18de57326d45@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Wed, 13 Sep 2017 08:56:54 PDT (-0700), Arnd Bergmann wrote:
> On Tue, Sep 12, 2017 at 11:57 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> This patch contains code that is in some way visible to the user:
>> including via system calls, the VDSO, module loading and signal
>> handling.  It also contains some generic code that is ABI visible.
>
> I took a good look at this and found nothing that is really wrong, but
> I noticed two smaller issues that I'd like to bring up for discussion:
>
>> diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
>> new file mode 100644
>> index 000000000000..52eff9febcfd
>> --- /dev/null
>> +++ b/arch/riscv/include/uapi/asm/ucontext.h
>> @@ -0,0 +1,35 @@
>> + * This file was copied from arch/arm64/include/uapi/asm/ucontext.h
>> + */
>> +#ifndef _UAPI__ASM_UCONTEXT_H
>> +#define _UAPI__ASM_UCONTEXT_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct ucontext {
>> +       unsigned long     uc_flags;
>> +       struct ucontext  *uc_link;
>> +       stack_t           uc_stack;
>> +       sigset_t          uc_sigmask;
>> +       /* glibc uses a 1024-bit sigset_t */
>> +       __u8              __unused[1024 / 8 - sizeof(sigset_t)];
>> +       /* last for future expansion */
>> +       struct sigcontext uc_mcontext;
>> +};
>
> This seems odd, the arm64 file was added with this comment
>
> commit 33b36543df336d9158e1a763fe97251885f52c5c
> Author: Will Deacon <will.deacon@arm.com>
> Date:   Fri Jan 16 13:52:14 2015 +0000
>
>     arm64: uapi: expose our struct ucontext to the uapi headers
>
>     arm64 defines its own ucontext structure which is incompatible with the
>     struct defined (and exposed to userspace by) the asm-generic headers.
>
>     glibc carries its own struct definition that is compatible with the
>     arm64 definition, but we should expose our format in the uapi headers in
>     case other libraries want to make use of the ucontext pushed as part of
>     an arm64 sigframe.
>
>     This patch moves the arm64 asm/ucontext.h to the uapi headers, along
>     with the necessary #include of linux/types.h.
>
> which doesn't really explain _why_ they are different from asm-generic.
>
> Can you explain this? Does the ARM64 layout have a significant
> advantage over the asm-generic one, or is it just what you happened
> to use because you copied from ARM64?

I copied those comments from ARM64, and they're pretty useless.  How does this
look?

diff --git a/arch/riscv/include/uapi/asm/ucontext.h b/arch/riscv/include/uapi/asm/ucontext.h
index 52eff9febcfd..1fae8b1697e0 100644
--- a/arch/riscv/include/uapi/asm/ucontext.h
+++ b/arch/riscv/include/uapi/asm/ucontext.h
@@ -26,9 +26,19 @@ struct ucontext {
        struct ucontext  *uc_link;
        stack_t           uc_stack;
        sigset_t          uc_sigmask;
-       /* glibc uses a 1024-bit sigset_t */
+       /* There's some padding here to allow sigset_t to be expanded in the
+        * future.  Though this is unlikely, other architectures put uc_sigmask
+        * at the end of this structure and explicitly state it can be
+        * expanded, so we didn't want to box ourselves in here. */
        __u8              __unused[1024 / 8 - sizeof(sigset_t)];
-       /* last for future expansion */
+       /* We can't put uc_sigmask at the end of this structure because we need
+        * to be able to expand sigcontext in the future.  For example, the
+        * vector ISA extension will almost certainly add ISA state.  We want
+        * to ensure all user-visible ISA state can be saved and restored via a
+        * ucontext, so we're putting this at the end in order to allow for
+        * infinite extensibility.  Since we know this will be extended and we
+        * assume sigset_t won't be extended an extreme amount, we're
+        * prioritizing this. */
        struct sigcontext uc_mcontext;
 };

> If that layout is indeed better, maybe we should change asm-generic
> to use that, and fall back to the old layout for the architectures that
> already use it.

That cropped up during glibc as well, and I think it might be the right answer.
Should I submit another patch that fixes up the other ISAs?

> If one is as good as the other, could you change kernel and glibc
> to use the normal one instead?
>
>> + */
>> +VERSION
>> +{
>> +       LINUX_2.6 {
>> +       global:
>> +               __vdso_rt_sigreturn;
>> +               __vdso_cmpxchg32;
>> +               __vdso_cmpxchg64;
>> +       local: *;
>> +       };
>
> The last vdso that got added was for arm64, and it was still
> during linux-2.6 times.
>
> Should this instead use the version that you are targetting for
> the merge, i.e. 4.15?

That sounds right to me

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 7142e1aafc30..8c9dce95c11d 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -67,7 +67,7 @@ PHDRS
  */
 VERSION
 {
-       LINUX_2.6 {
+       LINUX_4.15 {
        global:
                __vdso_rt_sigreturn;
                __vdso_cmpxchg32;
