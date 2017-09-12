Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33764 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750988AbdILV5p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 17:57:45 -0400
Received: by mail-pf0-f193.google.com with SMTP id h4so6719475pfk.0
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2017 14:57:44 -0700 (PDT)
Subject: RISC-V Linux Port v8
Date: Tue, 12 Sep 2017 14:56:57 -0700
Message-Id: <20170912215715.4186-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org

I know it may not be the ideal time to submit a patch set right now, as it's
the middle of the merge window, but things have calmed down quite a bit in the
last month so I thought it would be good to get everyone on the same page.
There's been a handful of changes since the last patch set, but most of them
are fairly minor:

* We changed PAGE_OFFSET to allowing mapping more physical memory on 64-bit
  systems.  This is user configurable, as it triggers a different code model
  that generates slightly less efficient code.
* The device tree binding documentation is back, I'd managed to lose it at some
  point.
* We now pass the atomic64 test suite.
* The SBI timer driver has been refactored.

To the best of by knowledge, all the feedback we've gotten so far has been
taken into account for this patch set.  If I've missed anyone's feedback I'm
sorry, just point it out and I'll try to dig it up.

Just to be clear on timelines: we're not pushing to get into 4.14, but we are
hoping we can make it in for 4.15.  If I understand the process correctly, we
should aim to get into linux-next some time in the next month so we can be
merged during the next merge window.

As usual, we've make this patch set availiable Online in addition to via this
submission.  There are a handful of additional patches there, but those should
all be going upstream either in other trees (though frequently in a heavily
modified form, as there was already a fix floating around).

  https://github.com/riscv/riscv-linux/tree/riscv-for-submission-v8

Here's a summary, in case something gets lost

[PATCH v8 01/18] MAINTAINERS: Add RISC-V
[PATCH v8 02/18] lib: Add shared copies of some GCC library routines
[PATCH v8 03/18] dt-bindings: interrupt-controller: RISC-V local
[PATCH v8 04/18] dt-bindings: interrupt-controller: RISC-V PLIC
[PATCH v8 05/18] dt-bindings: RISC-V CPU Bindings
[PATCH v8 06/18] clocksource: New RISC-V SBI timer driver
[PATCH v8 07/18] irqchip: RISC-V Local Interrupt Controller Driver
[PATCH v8 08/18] irqchip: New RISC-V PLIC Driver
[PATCH v8 09/18] tty: New RISC-V SBI console driver
[PATCH v8 10/18] RISC-V: Init and Halt Code
[PATCH v8 11/18] RISC-V: Atomic and Locking Code
[PATCH v8 12/18] RISC-V: Generic library routines and assembly
[PATCH v8 13/18] RISC-V: ELF and module implementation
[PATCH v8 14/18] RISC-V: Task implementation
[PATCH v8 15/18] RISC-V: Device, timer, IRQs, and the SBI
[PATCH v8 16/18] RISC-V: Paging and MMU
[PATCH v8 17/18] RISC-V: User-facing API
[PATCH v8 18/18] RISC-V: Build Infastructure




Here's the change highlights from the whole patch set

(v7) It's been a while since my last patch set, but the changes han been fairly
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

(v6) As it's been only a day since the v5 patch set, the changes are pretty
minimal:

 * The patch set is now based on linux-next/master, which I believe is a better
   base now that we're getting closer to upstream.
 * EARLY_PRINTK is no longer an option.  Since the SBI console is reasonable,
   there's no penalty to enabling it (and thus no benefit to disabling it).
 * The mmap syscalls were refactored a bit.

(v5) Things have really started to calm down, so this is fairly similar to the
v4 patch set.  The most interesting changes include:

 * We've moved back to a single patch set.

 * SMP support has been fixed, I was accidentally running on a non-SMP
   configuration.  There were various mistakes all over the tree as a result of
   this.

 * The cmpxchg syscalls have been removed, as they were deemed a bad idea.  As
   a result, RISC-V Linux systems mandate the A extension.  The corresponding
   Kconfig entry to enable builds on non-A systems has been removed.

 * A few more atomic fixes: mostly fence changes, but those resulted in a
   handful of additional macros that were no longer necessary.

 * riscv_early_sie has been removed.

(v4) There have only been a few changes since the v3 patch set:

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

(v3) A highlight of the changes since the v2 patch set includes:

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

(v2) A highlight of the changes since the v1 patch set includes:

  * We've split out our drivers into the right places, which means now there's
    a lot more patches.  I'll be submitting these patches to various subsystem
    maintainers and including them in any future RISC-V patch sets until
    they've been merged.

  * The SBI console driver has been completely rewritten to use the HVC helpers
    and is now significantly smaller.

  * We've begun to use weaker barriers as opposed to just the big "fence".
    There's still some work to do here, specifically:
    - We need fences in the relaxed MMIO functions.
    - The non-relaxed MMIO functions are missing R/W bits on their fences.
    - Many AMOs need the aq and rl bits set.

  * We now have thread_info in task_struct.  As a result, sscratch now contains
    TP instead of SP.  This was necessary because thread_info is no longer on
    the stack.

  * A few shared routines have been added that we use instead of creating
    another arch copy.
