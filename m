Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36251 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751915AbdHABA7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Jul 2017 21:00:59 -0400
Received: by mail-pg0-f68.google.com with SMTP id y129so270346pgy.3
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Jul 2017 18:00:59 -0700 (PDT)
Subject: [PATCH v7 10/15] RISC-V: ELF and module implementation
Date: Mon, 31 Jul 2017 18:00:04 -0700
Message-Id: <20170801010009.3302-11-palmer@dabbelt.com>
In-Reply-To: <20170801010009.3302-1-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

This patch contains the code that interfaces with ELF objects on RISC-V
systems, the vast majority of which is present to load kernel modules.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/compat.h | 29 ++++++++++++++
 arch/riscv/include/asm/elf.h    | 84 +++++++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h  | 37 ++++++++++++++++++
 arch/riscv/mm/extable.c         | 37 ++++++++++++++++++
 4 files changed, 187 insertions(+)
 create mode 100644 arch/riscv/include/asm/compat.h
 create mode 100644 arch/riscv/include/asm/elf.h
 create mode 100644 arch/riscv/include/asm/hwcap.h
 create mode 100644 arch/riscv/mm/extable.c

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
new file mode 100644
index 000000000000..044aecff8854
--- /dev/null
+++ b/arch/riscv/include/asm/compat.h
@@ -0,0 +1,29 @@
+/*
+ * Copyright (C) 2012 ARM Ltd.
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
+#ifndef __ASM_COMPAT_H
+#define __ASM_COMPAT_H
+#ifdef CONFIG_COMPAT
+
+#if defined(CONFIG_64BIT)
+#define COMPAT_UTS_MACHINE "riscv64\0\0"
+#elif defined(CONFIG_32BIT)
+#define COMPAT_UTS_MACHINE "riscv32\0\0"
+#else
+#error "Unknown RISC-V base ISA"
+#endif
+
+#endif /*CONFIG_COMPAT*/
+#endif /*__ASM_COMPAT_H*/
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
new file mode 100644
index 000000000000..a1ef503d616e
--- /dev/null
+++ b/arch/riscv/include/asm/elf.h
@@ -0,0 +1,84 @@
+/*
+ * Copyright (C) 2003 Matjaz Breskvar <phoenix@bsemi.com>
+ * Copyright (C) 2010-2011 Jonas Bonn <jonas@southpole.se>
+ * Copyright (C) 2012 Regents of the University of California
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef _ASM_RISCV_ELF_H
+#define _ASM_RISCV_ELF_H
+
+#include <uapi/asm/elf.h>
+#include <asm/auxvec.h>
+#include <asm/byteorder.h>
+
+/* TODO: Move definition into include/uapi/linux/elf-em.h */
+#define EM_RISCV	0xF3
+
+/*
+ * These are used to set parameters in the core dumps.
+ */
+#define ELF_ARCH	EM_RISCV
+
+#ifdef CONFIG_64BIT
+#define ELF_CLASS	ELFCLASS64
+#else
+#define ELF_CLASS	ELFCLASS32
+#endif
+
+#if defined(__LITTLE_ENDIAN)
+#define ELF_DATA	ELFDATA2LSB
+#elif defined(__BIG_ENDIAN)
+#define ELF_DATA	ELFDATA2MSB
+#else
+#error "Unknown endianness"
+#endif
+
+/*
+ * This is used to ensure we don't load something for the wrong architecture.
+ */
+#define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+
+#define CORE_DUMP_USE_REGSET
+#define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
+
+/*
+ * This is the location that an ET_DYN program is loaded if exec'ed.  Typical
+ * use of this is to invoke "./ld.so someprog" to test out a new version of
+ * the loader.  We need to make sure that it is out of the way of the program
+ * that it will "exec", and that there is sufficient room for the brk.
+ */
+#define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
+
+/*
+ * This yields a mask that user programs can use to figure out what
+ * instruction set this CPU supports.  This could be done in user space,
+ * but it's not easy, and we've already done it here.
+ */
+#define ELF_HWCAP	(elf_hwcap)
+extern unsigned long elf_hwcap;
+
+/*
+ * This yields a string that ld.so will use to load implementation
+ * specific libraries for optimization.  This is more specific in
+ * intent than poking at uname or /proc/cpuinfo.
+ */
+#define ELF_PLATFORM	(NULL)
+
+#define ARCH_DLINFO						\
+do {								\
+	NEW_AUX_ENT(AT_SYSINFO_EHDR,				\
+		(elf_addr_t)current->mm->context.vdso);		\
+} while (0)
+
+
+#define ARCH_HAS_SETUP_ADDITIONAL_PAGES
+struct linux_binprm;
+extern int arch_setup_additional_pages(struct linux_binprm *bprm,
+	int uses_interp);
+
+#endif /* _ASM_RISCV_ELF_H */
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
new file mode 100644
index 000000000000..8a4ed7bbcbea
--- /dev/null
+++ b/arch/riscv/include/asm/hwcap.h
@@ -0,0 +1,37 @@
+/*
+ * Copied from arch/arm64/include/asm/hwcap.h
+ *
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2017 SiFive
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
+#ifndef __ASM_HWCAP_H
+#define __ASM_HWCAP_H
+
+#include <uapi/asm/hwcap.h>
+
+#ifndef __ASSEMBLY__
+/*
+ * This yields a mask that user programs can use to figure out what
+ * instruction set this cpu supports.
+ */
+#define ELF_HWCAP		(elf_hwcap)
+
+enum {
+	CAP_HWCAP = 1,
+};
+
+extern unsigned long elf_hwcap;
+#endif
+#endif
diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
new file mode 100644
index 000000000000..11bb9417123b
--- /dev/null
+++ b/arch/riscv/mm/extable.c
@@ -0,0 +1,37 @@
+/*
+ * Copyright (C) 2009 Sunplus Core Technology Co., Ltd.
+ *  Lennox Wu <lennox.wu@sunplusct.com>
+ *  Chen Liqin <liqin.chen@sunplusct.com>
+ * Copyright (C) 2013 Regents of the University of California
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see the file COPYING, or write
+ * to the Free Software Foundation, Inc.,
+ */
+
+
+#include <linux/extable.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+
+int fixup_exception(struct pt_regs *regs)
+{
+	const struct exception_table_entry *fixup;
+
+	fixup = search_exception_tables(regs->sepc);
+	if (fixup) {
+		regs->sepc = fixup->fixup;
+		return 1;
+	}
+	return 0;
+}
-- 
2.13.0

