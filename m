Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:38498 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751090AbdIMRBq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 13:01:46 -0400
Received: by mail-pg0-f67.google.com with SMTP id m30so369453pgn.5
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Sep 2017 10:01:46 -0700 (PDT)
Date: Wed, 13 Sep 2017 10:01:44 -0700 (PDT)
Subject: Re: [PATCH v8 10/18] RISC-V: Init and Halt Code
In-Reply-To: <CAK8P3a3fxTkRjXfHfW=8OoME0DNyU=DKNcaRPWwnaKqF-w1ccg@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <mhng-dd00158c-af84-46d2-a4e3-219e4d9cb1bf@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

On Wed, 13 Sep 2017 08:20:42 PDT (-0700), Arnd Bergmann wrote:
> On Tue, Sep 12, 2017 at 11:57 PM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> This contains the various __init C functions, the initial assembly
>> kernel entry point, and the code to reset the system.  When a file was
>> init-related this patch contains the entire file.
>
> One minor comment:
>
>> +       /*
>> +        * This hart didn't win the lottery, so we wait for the winning hart to
>> +        * get far enough along the boot process that it should continue.
>> +        */
>> +.Lwait_for_cpu_up:
>> +       REG_L sp, (a1)
>> +       REG_L tp, (a2)
>> +       beqz sp, .Lwait_for_cpu_up
>> +       beqz tp, .Lwait_for_cpu_up
>> +       fence
>
> We usually discourage having the CPUs spin in a busy-loop while
> waiting to be started up, at least on ARM platforms. It seems that
> you could however just have them wait for an interrupt before checking
> the sp/tp values. Would that guarantee to put the CPUs in a low
> power state?

There's no way to _force_ a core to go into a low power state, but putting a
WFI (Wait For Interrupt) in there would at least allow implementations that
care to save power.  We already have some WFIs elsewhere, so it's the right
thing to do here.

There's a few sticky bits here:
* WFI can be implemented as a noop, so this could race with other IPI handling.
  I think it's safe: our IPI is just a "maybe there's a new message" signal, so
  if there's a spurious one it's ignored.
* Interrupts are disabled at this time, though since there's no trap vector it
  should be safe to enable them with a local trap vector here.

I added a FIXME for now, I'll fix it by the v9.

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 1c50fe3765b1..76af908f87c1 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -130,6 +130,7 @@ relocate:
         * get far enough along the boot process that it should continue.
         */
 .Lwait_for_cpu_up:
+       /* FIXME: We should WFI to save some energy here. */
        REG_L sp, (a1)
        REG_L tp, (a2)
        beqz sp, .Lwait_for_cpu_up
