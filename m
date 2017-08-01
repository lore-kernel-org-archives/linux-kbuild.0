Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37775 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751806AbdHABBD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Jul 2017 21:01:03 -0400
Received: by mail-pg0-f67.google.com with SMTP id 83so261174pgb.4
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Jul 2017 18:01:03 -0700 (PDT)
Subject: [PATCH v7 12/15] RISC-V: Device, timer, IRQs, and the SBI
Date: Mon, 31 Jul 2017 18:00:06 -0700
Message-Id: <20170801010009.3302-13-palmer@dabbelt.com>
In-Reply-To: <20170801010009.3302-1-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

This patch contains code that interfaces with devices that are mandated
by the RISC-V supervisor specification and that don't have explicit
drivers anywhere else in the tree.  This includes the staticly defined
interrupts, the CSR-mapped timer, and virtualized SBI devices.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/delay.h       |  28 +++++++++
 arch/riscv/include/asm/dma-mapping.h |  38 ++++++++++++
 arch/riscv/include/asm/irq.h         |  28 +++++++++
 arch/riscv/include/asm/irqflags.h    |  63 ++++++++++++++++++++
 arch/riscv/include/asm/pci.h         |  48 +++++++++++++++
 arch/riscv/include/asm/sbi.h         | 100 +++++++++++++++++++++++++++++++
 arch/riscv/include/asm/timex.h       |  59 +++++++++++++++++++
 arch/riscv/lib/delay.c               | 110 +++++++++++++++++++++++++++++++++++
 arch/riscv/mm/ioremap.c              |  92 +++++++++++++++++++++++++++++
 9 files changed, 566 insertions(+)
 create mode 100644 arch/riscv/include/asm/delay.h
 create mode 100644 arch/riscv/include/asm/dma-mapping.h
 create mode 100644 arch/riscv/include/asm/irq.h
 create mode 100644 arch/riscv/include/asm/irqflags.h
 create mode 100644 arch/riscv/include/asm/pci.h
 create mode 100644 arch/riscv/include/asm/sbi.h
 create mode 100644 arch/riscv/include/asm/timex.h
 create mode 100644 arch/riscv/lib/delay.c
 create mode 100644 arch/riscv/mm/ioremap.c

diff --git a/arch/riscv/include/asm/delay.h b/arch/riscv/include/asm/delay.h
new file mode 100644
index 000000000000..cbb0c9eb96cb
--- /dev/null
+++ b/arch/riscv/include/asm/delay.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
+ * Copyright (C) 2016 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_DELAY_H
+#define _ASM_RISCV_DELAY_H
+
+extern unsigned long riscv_timebase;
+
+#define udelay udelay
+extern void udelay(unsigned long usecs);
+
+#define ndelay ndelay
+extern void ndelay(unsigned long nsecs);
+
+extern void __delay(unsigned long cycles);
+
+#endif /* _ASM_RISCV_DELAY_H */
diff --git a/arch/riscv/include/asm/dma-mapping.h b/arch/riscv/include/asm/dma-mapping.h
new file mode 100644
index 000000000000..3eec1000196d
--- /dev/null
+++ b/arch/riscv/include/asm/dma-mapping.h
@@ -0,0 +1,38 @@
+/*
+ * Copyright (C) 2003-2004 Hewlett-Packard Co
+ *	David Mosberger-Tang <davidm@hpl.hp.com>
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2016 SiFive, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef __ASM_RISCV_DMA_MAPPING_H
+#define __ASM_RISCV_DMA_MAPPING_H
+
+/* Use ops->dma_mapping_error (if it exists) or assume success */
+// #undef DMA_ERROR_CODE
+
+static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
+{
+	return &dma_noop_ops;
+}
+
+static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
+{
+	if (!dev->dma_mask)
+		return false;
+
+	return addr + size - 1 <= *dev->dma_mask;
+}
+
+#endif	/* __ASM_RISCV_DMA_MAPPING_H */
diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
new file mode 100644
index 000000000000..4dee9d4c13c0
--- /dev/null
+++ b/arch/riscv/include/asm/irq.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_IRQ_H
+#define _ASM_RISCV_IRQ_H
+
+#define NR_IRQS         0
+
+#define INTERRUPT_CAUSE_SOFTWARE    1
+#define INTERRUPT_CAUSE_TIMER       5
+#define INTERRUPT_CAUSE_EXTERNAL    9
+
+void riscv_timer_interrupt(void);
+
+#include <asm-generic/irq.h>
+
+#endif /* _ASM_RISCV_IRQ_H */
diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
new file mode 100644
index 000000000000..6fdc860d7f84
--- /dev/null
+++ b/arch/riscv/include/asm/irqflags.h
@@ -0,0 +1,63 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+
+#ifndef _ASM_RISCV_IRQFLAGS_H
+#define _ASM_RISCV_IRQFLAGS_H
+
+#include <asm/processor.h>
+#include <asm/csr.h>
+
+/* read interrupt enabled status */
+static inline unsigned long arch_local_save_flags(void)
+{
+	return csr_read(sstatus);
+}
+
+/* unconditionally enable interrupts */
+static inline void arch_local_irq_enable(void)
+{
+	csr_set(sstatus, SR_IE);
+}
+
+/* unconditionally disable interrupts */
+static inline void arch_local_irq_disable(void)
+{
+	csr_clear(sstatus, SR_IE);
+}
+
+/* get status and disable interrupts */
+static inline unsigned long arch_local_irq_save(void)
+{
+	return csr_read_clear(sstatus, SR_IE);
+}
+
+/* test flags */
+static inline int arch_irqs_disabled_flags(unsigned long flags)
+{
+	return !(flags & SR_IE);
+}
+
+/* test hardware interrupt enable bit */
+static inline int arch_irqs_disabled(void)
+{
+	return arch_irqs_disabled_flags(arch_local_save_flags());
+}
+
+/* set interrupt enabled status */
+static inline void arch_local_irq_restore(unsigned long flags)
+{
+	csr_set(sstatus, flags & SR_IE);
+}
+
+#endif /* _ASM_RISCV_IRQFLAGS_H */
diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
new file mode 100644
index 000000000000..285747fa2ef0
--- /dev/null
+++ b/arch/riscv/include/asm/pci.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright (C) 2016 SiFive
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef __ASM_RISCV_PCI_H
+#define __ASM_RISCV_PCI_H
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+
+#include <asm/io.h>
+
+#define PCIBIOS_MIN_IO		0
+#define PCIBIOS_MIN_MEM		0
+
+/* RISC-V shim does not initialize PCI bus */
+#define pcibios_assign_all_busses() 1
+
+/* RISC-V TileLink and PCIe share the share address space */
+#define PCI_DMA_BUS_IS_PHYS 1
+
+extern int isa_dma_bridge_buggy;
+
+#ifdef CONFIG_PCI
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	/* no legacy IRQ on risc-v */
+	return -ENODEV;
+}
+
+static inline int pci_proc_domain(struct pci_bus *bus)
+{
+	/* always show the domain in /proc */
+	return 1;
+}
+#endif  /* CONFIG_PCI */
+
+#endif  /* __ASM_PCI_H */
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
new file mode 100644
index 000000000000..b6bb10b92fe2
--- /dev/null
+++ b/arch/riscv/include/asm/sbi.h
@@ -0,0 +1,100 @@
+/*
+ * Copyright (C) 2015 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_SBI_H
+#define _ASM_RISCV_SBI_H
+
+#include <linux/types.h>
+
+#define SBI_SET_TIMER 0
+#define SBI_CONSOLE_PUTCHAR 1
+#define SBI_CONSOLE_GETCHAR 2
+#define SBI_CLEAR_IPI 3
+#define SBI_SEND_IPI 4
+#define SBI_REMOTE_FENCE_I 5
+#define SBI_REMOTE_SFENCE_VMA 6
+#define SBI_REMOTE_SFENCE_VMA_ASID 7
+#define SBI_SHUTDOWN 8
+
+#define SBI_CALL(which, arg0, arg1, arg2) ({			\
+	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);	\
+	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);	\
+	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);	\
+	register uintptr_t a7 asm ("a7") = (uintptr_t)(which);	\
+	asm volatile ("ecall"					\
+		      : "+r" (a0)				\
+		      : "r" (a1), "r" (a2), "r" (a7)		\
+		      : "memory");				\
+	a0;							\
+})
+
+/* Lazy implementations until SBI is finalized */
+#define SBI_CALL_0(which) SBI_CALL(which, 0, 0, 0)
+#define SBI_CALL_1(which, arg0) SBI_CALL(which, arg0, 0, 0)
+#define SBI_CALL_2(which, arg0, arg1) SBI_CALL(which, arg0, arg1, 0)
+
+static inline void sbi_console_putchar(int ch)
+{
+	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
+}
+
+static inline int sbi_console_getchar(void)
+{
+	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
+}
+
+static inline void sbi_set_timer(uint64_t stime_value)
+{
+#if __riscv_xlen == 32
+	SBI_CALL_2(SBI_SET_TIMER, stime_value, stime_value >> 32);
+#else
+	SBI_CALL_1(SBI_SET_TIMER, stime_value);
+#endif
+}
+
+static inline void sbi_shutdown(void)
+{
+	SBI_CALL_0(SBI_SHUTDOWN);
+}
+
+static inline void sbi_clear_ipi(void)
+{
+	SBI_CALL_0(SBI_CLEAR_IPI);
+}
+
+static inline void sbi_send_ipi(const unsigned long *hart_mask)
+{
+	SBI_CALL_1(SBI_SEND_IPI, hart_mask);
+}
+
+static inline void sbi_remote_fence_i(const unsigned long *hart_mask)
+{
+	SBI_CALL_1(SBI_REMOTE_FENCE_I, hart_mask);
+}
+
+static inline void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+					 unsigned long start,
+					 unsigned long size)
+{
+	SBI_CALL_1(SBI_REMOTE_SFENCE_VMA, hart_mask);
+}
+
+static inline void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
+					      unsigned long start,
+					      unsigned long size,
+					      unsigned long asid)
+{
+	SBI_CALL_1(SBI_REMOTE_SFENCE_VMA_ASID, hart_mask);
+}
+
+#endif
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
new file mode 100644
index 000000000000..3df4932d8964
--- /dev/null
+++ b/arch/riscv/include/asm/timex.h
@@ -0,0 +1,59 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#ifndef _ASM_RISCV_TIMEX_H
+#define _ASM_RISCV_TIMEX_H
+
+#include <asm/param.h>
+
+typedef unsigned long cycles_t;
+
+static inline cycles_t get_cycles(void)
+{
+	cycles_t n;
+
+	__asm__ __volatile__ (
+		"rdtime %0"
+		: "=r" (n));
+	return n;
+}
+
+#ifdef CONFIG_64BIT
+static inline uint64_t get_cycles64(void)
+{
+        return get_cycles();
+}
+#else
+static inline uint64_t get_cycles64(void)
+{
+	u32 lo, hi, tmp;
+	__asm__ __volatile__ (
+		"1:\n"
+		"rdtimeh %0\n"
+		"rdtime %1\n"
+		"rdtimeh %2\n"
+		"bne %0, %2, 1b"
+		: "=&r" (hi), "=&r" (lo), "=&r" (tmp));
+	return ((u64)hi << 32) | lo;
+}
+#endif
+
+#define ARCH_HAS_READ_CURRENT_TIMER
+
+static inline int read_current_timer(unsigned long *timer_val)
+{
+	*timer_val = get_cycles();
+	return 0;
+}
+
+#endif /* _ASM_RISCV_TIMEX_H */
diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
new file mode 100644
index 000000000000..1cc4ac3964b4
--- /dev/null
+++ b/arch/riscv/lib/delay.c
@@ -0,0 +1,110 @@
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#include <linux/delay.h>
+#include <linux/param.h>
+#include <linux/timex.h>
+#include <linux/export.h>
+
+/*
+ * This is copies from arch/arm/include/asm/delay.h
+ *
+ * Loop (or tick) based delay:
+ *
+ * loops = loops_per_jiffy * jiffies_per_sec * delay_us / us_per_sec
+ *
+ * where:
+ *
+ * jiffies_per_sec = HZ
+ * us_per_sec = 1000000
+ *
+ * Therefore the constant part is HZ / 1000000 which is a small
+ * fractional number. To make this usable with integer math, we
+ * scale up this constant by 2^31, perform the actual multiplication,
+ * and scale the result back down by 2^31 with a simple shift:
+ *
+ * loops = (loops_per_jiffy * delay_us * UDELAY_MULT) >> 31
+ *
+ * where:
+ *
+ * UDELAY_MULT = 2^31 * HZ / 1000000
+ *             = (2^31 / 1000000) * HZ
+ *             = 2147.483648 * HZ
+ *             = 2147 * HZ + 483648 * HZ / 1000000
+ *
+ * 31 is the biggest scale shift value that won't overflow 32 bits for
+ * delay_us * UDELAY_MULT assuming HZ <= 1000 and delay_us <= 2000.
+ */
+#define MAX_UDELAY_US	2000
+#define MAX_UDELAY_HZ	1000
+#define UDELAY_MULT	(2147UL * HZ + 483648UL * HZ / 1000000UL)
+#define UDELAY_SHIFT	31
+
+#if HZ > MAX_UDELAY_HZ
+#error "HZ > MAX_UDELAY_HZ"
+#endif
+
+/*
+ * RISC-V supports both UDELAY and NDELAY.  This is largely the same as above,
+ * but with different constants.  I added 10 bits to the shift to get this, but
+ * the result is that I need a 64-bit multiply, which is slow on 32-bit
+ * platforms.
+ *
+ * NDELAY_MULT = 2^41 * HZ / 1000000000
+ *             = (2^41 / 1000000000) * HZ
+ *             = 2199.02325555 * HZ
+ *             = 2199 * HZ + 23255550 * HZ / 1000000000
+ *
+ * The maximum here is to avoid 64-bit overflow, but it isn't checked as it
+ * won't happen.
+ */
+#define MAX_NDELAY_NS   (1ULL << 42)
+#define MAX_NDELAY_HZ	MAX_UDELAY_HZ
+#define NDELAY_MULT	((unsigned long long)(2199ULL * HZ + 23255550ULL * HZ / 1000000000ULL))
+#define NDELAY_SHIFT	41
+
+#if HZ > MAX_NDELAY_HZ
+#error "HZ > MAX_NDELAY_HZ"
+#endif
+
+void __delay(unsigned long cycles)
+{
+	u64 t0 = get_cycles();
+
+	while ((unsigned long)(get_cycles() - t0) < cycles)
+		cpu_relax();
+}
+
+void udelay(unsigned long usecs)
+{
+	unsigned long ucycles = usecs * lpj_fine * UDELAY_MULT;
+
+	if (unlikely(usecs > MAX_UDELAY_US)) {
+		__delay((u64)usecs * riscv_timebase / 1000000ULL);
+		return;
+	}
+
+	__delay(ucycles >> UDELAY_SHIFT);
+}
+EXPORT_SYMBOL(udelay);
+
+void ndelay(unsigned long nsecs)
+{
+	/*
+	 * This doesn't bother checking for overflow, as it won't happen (it's
+	 * an hour) of delay.
+	 */
+	unsigned long long ncycles = nsecs * lpj_fine * NDELAY_MULT;
+	__delay(ncycles >> NDELAY_SHIFT);
+}
+EXPORT_SYMBOL(ndelay);
diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
new file mode 100644
index 000000000000..e99194a4077e
--- /dev/null
+++ b/arch/riscv/mm/ioremap.c
@@ -0,0 +1,92 @@
+/*
+ * (C) Copyright 1995 1996 Linus Torvalds
+ * (C) Copyright 2012 Regents of the University of California
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#include <linux/export.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/io.h>
+
+#include <asm/pgtable.h>
+
+/*
+ * Remap an arbitrary physical address space into the kernel virtual
+ * address space. Needed when the kernel wants to access high addresses
+ * directly.
+ *
+ * NOTE! We need to allow non-page-aligned mappings too: we will obviously
+ * have to convert them into an offset in a page-aligned mapping, but the
+ * caller shouldn't need to know that small detail.
+ */
+static void __iomem *__ioremap_caller(phys_addr_t addr, size_t size,
+	pgprot_t prot, void *caller)
+{
+	phys_addr_t last_addr;
+	unsigned long offset, vaddr;
+	struct vm_struct *area;
+
+	/* Disallow wrap-around or zero size */
+	last_addr = addr + size - 1;
+	if (!size || last_addr < addr)
+		return NULL;
+
+	/* Page-align mappings */
+	offset = addr & (~PAGE_MASK);
+	addr &= PAGE_MASK;
+	size = PAGE_ALIGN(size + offset);
+
+	area = get_vm_area_caller(size, VM_IOREMAP, caller);
+	if (!area)
+		return NULL;
+	vaddr = (unsigned long)area->addr;
+
+	if (ioremap_page_range(vaddr, vaddr + size, addr, prot)) {
+		free_vm_area(area);
+		return NULL;
+	}
+
+	return (void __iomem *)(vaddr + offset);
+}
+
+/*
+ * ioremap     -   map bus memory into CPU space
+ * @offset:    bus address of the memory
+ * @size:      size of the resource to map
+ *
+ * ioremap performs a platform specific sequence of operations to
+ * make bus memory CPU accessible via the readb/readw/readl/writeb/
+ * writew/writel functions and the other mmio helpers. The returned
+ * address is not guaranteed to be usable directly as a virtual
+ * address.
+ *
+ * Must be freed with iounmap.
+ */
+void __iomem *ioremap(phys_addr_t offset, unsigned long size)
+{
+	return __ioremap_caller(offset, size, PAGE_KERNEL,
+		__builtin_return_address(0));
+}
+EXPORT_SYMBOL(ioremap);
+
+
+/**
+ * iounmap - Free a IO remapping
+ * @addr: virtual address from ioremap_*
+ *
+ * Caller must ensure there is only one unmapping for the same pointer.
+ */
+void iounmap(void __iomem *addr)
+{
+	vunmap((void *)((unsigned long)addr & PAGE_MASK));
+}
+EXPORT_SYMBOL(iounmap);
-- 
2.13.0

