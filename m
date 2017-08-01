Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:37685 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751157AbdHABAn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Jul 2017 21:00:43 -0400
Received: by mail-pg0-f68.google.com with SMTP id 83so260498pgb.4
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Jul 2017 18:00:43 -0700 (PDT)
Subject: RISC-V Linux Port v7
Date: Mon, 31 Jul 2017 17:59:54 -0700
Message-Id: <20170801010009.3302-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

It's been a while since my last patch set, but the changes han been fairly
minimal:

 * The PCI cleanup patches have been dropped, we'll do them as a separate patch
   set later.
 * We've the Kconfig entries from CONFIG_ISA_* to CONFIG_RISCV_ISA_*, to make
   grep easier.
 * There have been a handful of memory model related tweaks in I/O land,
   particularly relating the PCI and the upcoming platform specification.
   There are significant comments in the relevant files.  This is still a WIP,
   but I think we're close to getting as good as we're going to get until we
   end up with some more specifications.

I'm hoping to begin the push to get this into linux-next now, as I don't know
of any outstanding problems.  As usual, if you've send feedback and it hasn't
been incorporated then I'm sorry I missed it -- please either ping me a new
version of the patch or point me to the old one and I'll try to figure it out.

As usual, the patch set is also availiable on github

  https://github.com/riscv/riscv-linux/tree/riscv-for-submission-v7

Thanks to everyone for all their help!

[PATCH v7 01/15] MAINTAINERS: Add RISC-V
[PATCH v7 02/15] lib: Add shared copies of some GCC library routines
[PATCH v7 03/15] clocksource: New RISC-V SBI timer driver
[PATCH v7 04/15] irqchip: RISC-V Local Interrupt Controller Driver
[PATCH v7 05/15] irqchip: New RISC-V PLIC Driver
[PATCH v7 06/15] tty: New RISC-V SBI console driver
[PATCH v7 07/15] RISC-V: Init and Halt Code
[PATCH v7 08/15] RISC-V: Atomic and Locking Code
[PATCH v7 09/15] RISC-V: Generic library routines and assembly
[PATCH v7 10/15] RISC-V: ELF and module implementation
[PATCH v7 11/15] RISC-V: Task implementation
[PATCH v7 12/15] RISC-V: Device, timer, IRQs, and the SBI
[PATCH v7 13/15] RISC-V: Paging and MMU
[PATCH v7 14/15] RISC-V: User-facing API
[PATCH v7 15/15] RISC-V: Build Infastructure

For reference, here's all the other change messages:

As it's been only a day since the v5 patch set, the changes are pretty minimal:

 * The patch set is now based on linux-next/master, which I believe is a better
   base now that we're getting closer to upstream.
 * EARLY_PRINTK is no longer an option.  Since the SBI console is reasonable,
   there's no penalty to enabling it (and thus no benefit to disabling it).
 * The mmap syscalls were refactored a bit.

Things have really started to calm down, so this is fairly similar to the v4
patch set.  The most interesting changes include:

 * We've moved back to a single patch set.

 * SMP support has been fixed, I was accidentally running on a non-SMP
   configuration.  There were various mistakes all over the tree as a result of
   this.

 * The cmpxchg syscalls have been removed, as they were deemed a bad idea.  As
   a result, RISC-V Linux systems mandate the A extension.  The cooresponding
   Kconfig entry to enable builds on non-A systems has been removed.

 * A few more atomic fixes: mostly fence changes, but those resulted in a
   handful of additional macros that were no longer necessary.

 * riscv_early_sie has been removed.

There have only been a few changes since the v3 patch set:

 * The cmpxchg64 syscall is no longer enabled on 32-bit systems.  It's not
   possible to provide this on SMP systems, and it's not necessary as glibc
   knows not to call it.

 * We provide a ELF_HWCAP so users can determine the ISA of the machine the
   kernel is running on.

 * The multi-line comments are in a better form.

 * There were a handful of headers that could be replaced with the asm-generic
   versions, and a few unnecessary definitions.

 * We no longer use printk, but instead use pr_*.

 * A few Kconfig and defconfig entries have been cleaned up.

A highlight of the changes since the v2 patch set includes:

 * We've split out all our drivers into separate patch sets, which I've already
   sent out to the relevant maintainers.  I haven't included those patches in
   this patch set, but some of them are necessary to build our port.  A git
   tree that contains all our patch sets merged together lives at
   <https://github.com/riscv/riscv-linux/tree/riscv-for-submission-v3>.

 * The patch set is now split up differently: rather than being split per
   directory it is split per topic.  Hopefully this will make it easier to
   review the port on the mailing list.  The split is a bit rough, so you
   probably still want to look at the patch set as a whole.

 * atomic.h has been completely rewritten and is hopefully now correct.  I've
   attempted to sanitize the various other memory model related code as well,
   and I think it should all be sane now aside from a handful of FIXMEs
   commented in the code.

 * We've changed the cmpexchg syscall to always exist and to not be
   multiplexed.  There is also a VDSO entry for compare and exchange, which
   allows kernels with the A extension to execute user code without the A
   extension reasonably fast.

 * Our user-visible register state now contains enough space for the Q
   extension for 128-bit floating point, as well as a few words to allow
   extensibility to future ISA extensions like the eventual V extension for
   vectors.

 * A handful of driver cleanups, but these have been split into separate patch
   sets now so I won't duplicate them here.

A highlight of the changes since the v1 patch set includes:

  * We've split out our drivers into the right places, which means now there's
    a lot more patches.  I'll be submitting these patches to various subsystem
    maintainers and including them in any future RISC-V patch sets until
    they've been merged.

  * The SBI console driver has been completely rewritten to use the HVC helpers
    and is now significantly smaller.

  * We've begun to use weaker barries as opposed to just the big "fence".
    There's still some work to do here, specifically:
    - We need fences in the realxed MMIO functions.
    - The non-relaxed MMIO functions are missing R/W bits on their fences.
    - Many AMOs need the aq and rl bits set.

  * We now have thread_info in task_struct.  As a result, sscratch now contains
    TP instead of SP.  This was necessary because thread_info is no longer on
    the stack.

  * A few shared routines have been added that we use instead of creating
    another arch copy.
