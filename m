Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:38850 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751523AbdILV6A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 17:58:00 -0400
Received: by mail-pg0-f67.google.com with SMTP id m30so1775682pgn.5
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2017 14:57:59 -0700 (PDT)
Subject: [PATCH v8 11/18] RISC-V: Atomic and Locking Code
Date: Tue, 12 Sep 2017 14:57:08 -0700
Message-Id: <20170912215715.4186-12-palmer@dabbelt.com>
In-Reply-To: <20170912215715.4186-1-palmer@dabbelt.com>
References: <20170912215715.4186-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

This contains all the code that directly interfaces with the RISC-V
memory model.  While this code corforms to the current RISC-V ISA
specifications (user 2.2 and priv 1.10), the memory model is somewhat
underspecified in those documents.  There is a working group that hopes
to produce a formal memory model by the end of the year, but my
understanding is that the basic definitions we're relying on here won't
change significantly.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/atomic.h         | 375 ++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/barrier.h        |  68 ++++++
 arch/riscv/include/asm/bitops.h         | 218 +++++++++++++++++++
 arch/riscv/include/asm/cacheflush.h     |  39 ++++
 arch/riscv/include/asm/cmpxchg.h        | 134 ++++++++++++
 arch/riscv/include/asm/io.h             | 303 ++++++++++++++++++++++++++
 arch/riscv/include/asm/spinlock.h       | 165 ++++++++++++++
 arch/riscv/include/asm/spinlock_types.h |  33 +++
 arch/riscv/include/asm/tlb.h            |  24 ++
 arch/riscv/include/asm/tlbflush.h       |  64 ++++++
 10 files changed, 1423 insertions(+)
 create mode 100644 arch/riscv/include/asm/atomic.h
 create mode 100644 arch/riscv/include/asm/barrier.h
 create mode 100644 arch/riscv/include/asm/bitops.h
 create mode 100644 arch/riscv/include/asm/cacheflush.h
 create mode 100644 arch/riscv/include/asm/cmpxchg.h
 create mode 100644 arch/riscv/include/asm/io.h
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 arch/riscv/include/asm/spinlock_types.h
 create mode 100644 arch/riscv/include/asm/tlb.h
 create mode 100644 arch/riscv/include/asm/tlbflush.h

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
new file mode 100644
index 000000000000..e2e37c57cbeb
--- /dev/null
+++ b/arch/riscv/include/asm/atomic.h
@@ -0,0 +1,375 @@
+/*
+ * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public Licence
+ * as published by the Free Software Foundation; either version
+ * 2 of the Licence, or (at your option) any later version.
+ */
+
+#ifndef _ASM_RISCV_ATOMIC_H
+#define _ASM_RISCV_ATOMIC_H
+
+#ifdef CONFIG_GENERIC_ATOMIC64
+# include <asm-generic/atomic64.h>
+#else
+# if (__riscv_xlen < 64)
+#  error "64-bit atomics require XLEN to be at least 64"
+# endif
+#endif
+
+#include <asm/cmpxchg.h>
+#include <asm/barrier.h>
+
+#define ATOMIC_INIT(i)	{ (i) }
+static __always_inline int atomic_read(const atomic_t *v)
+{
+	return READ_ONCE(v->counter);
+}
+static __always_inline void atomic_set(atomic_t *v, int i)
+{
+	WRITE_ONCE(v->counter, i);
+}
+
+#ifndef CONFIG_GENERIC_ATOMIC64
+#define ATOMIC64_INIT(i) { (i) }
+static __always_inline long atomic64_read(const atomic64_t *v)
+{
+	return READ_ONCE(v->counter);
+}
+static __always_inline void atomic64_set(atomic64_t *v, long i)
+{
+	WRITE_ONCE(v->counter, i);
+}
+#endif
+
+/*
+ * First, the atomic ops that have no ordering constraints and therefor don't
+ * have the AQ or RL bits set.  These don't return anything, so there's only
+ * one version to worry about.
+ */
+#define ATOMIC_OP(op, asm_op, c_op, I, asm_type, c_type, prefix)				\
+static __always_inline void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)		\
+{												\
+	__asm__ __volatile__ (									\
+		"amo" #asm_op "." #asm_type " zero, %1, %0"					\
+		: "+A" (v->counter)								\
+		: "r" (I)									\
+		: "memory");									\
+}
+
+#ifdef CONFIG_GENERIC_ATOMIC64
+#define ATOMIC_OPS(op, asm_op, c_op, I)			\
+        ATOMIC_OP (op, asm_op, c_op, I, w,  int,   )
+#else
+#define ATOMIC_OPS(op, asm_op, c_op, I)			\
+        ATOMIC_OP (op, asm_op, c_op, I, w,  int,   )	\
+        ATOMIC_OP (op, asm_op, c_op, I, d, long, 64)
+#endif
+
+ATOMIC_OPS(add, add, +,  i)
+ATOMIC_OPS(sub, add, +, -i)
+ATOMIC_OPS(and, and, &,  i)
+ATOMIC_OPS( or,  or, |,  i)
+ATOMIC_OPS(xor, xor, ^,  i)
+
+#undef ATOMIC_OP
+#undef ATOMIC_OPS
+
+/*
+ * Atomic ops that have ordered, relaxed, acquire, and relese variants.
+ * There's two flavors of these: the arithmatic ops have both fetch and return
+ * versions, while the logical ops only have fetch versions.
+ */
+#define ATOMIC_FETCH_OP(op, asm_op, c_op, I, asm_or, c_or, asm_type, c_type, prefix)			\
+static __always_inline c_type atomic##prefix##_fetch_##op##c_or(c_type i, atomic##prefix##_t *v)	\
+{													\
+	register c_type ret;										\
+	__asm__ __volatile__ (										\
+		"amo" #asm_op "." #asm_type #asm_or " %1, %2, %0"					\
+		: "+A" (v->counter), "=r" (ret)								\
+		: "r" (I)										\
+		: "memory");										\
+	return ret;											\
+}
+
+#define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, asm_type, c_type, prefix)			\
+static __always_inline c_type atomic##prefix##_##op##_return##c_or(c_type i, atomic##prefix##_t *v)	\
+{													\
+        return atomic##prefix##_fetch_##op##c_or(i, v) c_op I;						\
+}
+
+#ifdef CONFIG_GENERIC_ATOMIC64
+#define ATOMIC_OPS(op, asm_op, c_op, I, asm_or, c_or)				\
+        ATOMIC_FETCH_OP (op, asm_op, c_op, I, asm_or, c_or, w,  int,   )	\
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, w,  int,   )
+#else
+#define ATOMIC_OPS(op, asm_op, c_op, I, asm_or, c_or)				\
+        ATOMIC_FETCH_OP (op, asm_op, c_op, I, asm_or, c_or, w,  int,   )	\
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, w,  int,   )	\
+        ATOMIC_FETCH_OP (op, asm_op, c_op, I, asm_or, c_or, d, long, 64)	\
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_or, c_or, d, long, 64)
+#endif
+
+ATOMIC_OPS(add, add, +,  i,      , _relaxed)
+ATOMIC_OPS(add, add, +,  i, .aq  , _acquire)
+ATOMIC_OPS(add, add, +,  i, .rl  , _release)
+ATOMIC_OPS(add, add, +,  i, .aqrl,         )
+
+ATOMIC_OPS(sub, add, +, -i,      , _relaxed)
+ATOMIC_OPS(sub, add, +, -i, .aq  , _acquire)
+ATOMIC_OPS(sub, add, +, -i, .rl  , _release)
+ATOMIC_OPS(sub, add, +, -i, .aqrl,         )
+
+#undef ATOMIC_OPS
+
+#ifdef CONFIG_GENERIC_ATOMIC64
+#define ATOMIC_OPS(op, asm_op, c_op, I, asm_or, c_or)				\
+        ATOMIC_FETCH_OP(op, asm_op, c_op, I, asm_or, c_or, w,  int,   )
+#else
+#define ATOMIC_OPS(op, asm_op, c_op, I, asm_or, c_or)				\
+        ATOMIC_FETCH_OP(op, asm_op, c_op, I, asm_or, c_or, w,  int,   )		\
+        ATOMIC_FETCH_OP(op, asm_op, c_op, I, asm_or, c_or, d, long, 64)
+#endif
+
+ATOMIC_OPS(and, and, &,  i,      , _relaxed)
+ATOMIC_OPS(and, and, &,  i, .aq  , _acquire)
+ATOMIC_OPS(and, and, &,  i, .rl  , _release)
+ATOMIC_OPS(and, and, &,  i, .aqrl,         )
+
+ATOMIC_OPS( or,  or, |,  i,      , _relaxed)
+ATOMIC_OPS( or,  or, |,  i, .aq  , _acquire)
+ATOMIC_OPS( or,  or, |,  i, .rl  , _release)
+ATOMIC_OPS( or,  or, |,  i, .aqrl,         )
+
+ATOMIC_OPS(xor, xor, ^,  i,      , _relaxed)
+ATOMIC_OPS(xor, xor, ^,  i, .aq  , _acquire)
+ATOMIC_OPS(xor, xor, ^,  i, .rl  , _release)
+ATOMIC_OPS(xor, xor, ^,  i, .aqrl,         )
+
+#undef ATOMIC_OPS
+
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_OP_RETURN
+
+/*
+ * The extra atomic operations that are constructed from one of the core
+ * AMO-based operations above (aside from sub, which is easier to fit above).
+ * These are required to perform a barrier, but they're OK this way because
+ * atomic_*_return is also required to perform a barrier.
+ */
+#define ATOMIC_OP(op, func_op, comp_op, I, c_type, prefix)			\
+static __always_inline bool atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
+{										\
+	return atomic##prefix##_##func_op##_return(i, v) comp_op I;		\
+}
+
+#ifdef CONFIG_GENERIC_ATOMIC64
+#define ATOMIC_OPS(op, func_op, comp_op, I)			\
+        ATOMIC_OP (op, func_op, comp_op, I,  int,   )
+#else
+#define ATOMIC_OPS(op, func_op, comp_op, I)			\
+        ATOMIC_OP (op, func_op, comp_op, I,  int,   )		\
+        ATOMIC_OP (op, func_op, comp_op, I, long, 64)
+#endif
+
+ATOMIC_OPS(add_and_test, add, ==, 0)
+ATOMIC_OPS(sub_and_test, sub, ==, 0)
+ATOMIC_OPS(add_negative, add,  <, 0)
+
+#undef ATOMIC_OP
+#undef ATOMIC_OPS
+
+#define ATOMIC_OP(op, func_op, c_op, I, c_type, prefix)				\
+static __always_inline void atomic##prefix##_##op(atomic##prefix##_t *v)	\
+{										\
+	atomic##prefix##_##func_op(I, v);					\
+}
+
+#define ATOMIC_FETCH_OP(op, func_op, c_op, I, c_type, prefix)				\
+static __always_inline c_type atomic##prefix##_fetch_##op(atomic##prefix##_t *v)	\
+{											\
+	return atomic##prefix##_fetch_##func_op(I, v);					\
+}
+
+#define ATOMIC_OP_RETURN(op, asm_op, c_op, I, c_type, prefix)				\
+static __always_inline c_type atomic##prefix##_##op##_return(atomic##prefix##_t *v)	\
+{											\
+        return atomic##prefix##_fetch_##op(v) c_op I;					\
+}
+
+#ifdef CONFIG_GENERIC_ATOMIC64
+#define ATOMIC_OPS(op, asm_op, c_op, I)						\
+        ATOMIC_OP       (op, asm_op, c_op, I,  int,   )				\
+        ATOMIC_FETCH_OP (op, asm_op, c_op, I,  int,   )				\
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I,  int,   )
+#else
+#define ATOMIC_OPS(op, asm_op, c_op, I)						\
+        ATOMIC_OP       (op, asm_op, c_op, I,  int,   )				\
+        ATOMIC_FETCH_OP (op, asm_op, c_op, I,  int,   )				\
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I,  int,   )				\
+        ATOMIC_OP       (op, asm_op, c_op, I, long, 64)				\
+        ATOMIC_FETCH_OP (op, asm_op, c_op, I, long, 64)				\
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I, long, 64)
+#endif
+
+ATOMIC_OPS(inc, add, +,  1)
+ATOMIC_OPS(dec, add, +, -1)
+
+#undef ATOMIC_OPS
+#undef ATOMIC_OP
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_OP_RETURN
+
+#define ATOMIC_OP(op, func_op, comp_op, I, prefix)				\
+static __always_inline bool atomic##prefix##_##op(atomic##prefix##_t *v)	\
+{										\
+	return atomic##prefix##_##func_op##_return(v) comp_op I;		\
+}
+
+ATOMIC_OP(inc_and_test, inc, ==, 0,   )
+ATOMIC_OP(dec_and_test, dec, ==, 0,   )
+#ifndef CONFIG_GENERIC_ATOMIC64
+ATOMIC_OP(inc_and_test, inc, ==, 0, 64)
+ATOMIC_OP(dec_and_test, dec, ==, 0, 64)
+#endif
+
+#undef ATOMIC_OP
+
+/* This is required to provide a barrier on success. */
+static __always_inline int __atomic_add_unless(atomic_t *v, int a, int u)
+{
+       int prev, rc;
+
+	__asm__ __volatile__ (
+		"0:\n\t"
+		"lr.w.aqrl  %[p],  %[c]\n\t"
+		"beq        %[p],  %[u], 1f\n\t"
+		"add       %[rc],  %[p], %[a]\n\t"
+		"sc.w.aqrl %[rc], %[rc], %[c]\n\t"
+		"bnez      %[rc], 0b\n\t"
+		"1:"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		: [a]"r" (a), [u]"r" (u)
+		: "memory");
+	return prev;
+}
+
+#ifndef CONFIG_GENERIC_ATOMIC64
+static __always_inline long __atomic64_add_unless(atomic64_t *v, long a, long u)
+{
+       long prev, rc;
+
+	__asm__ __volatile__ (
+		"0:\n\t"
+		"lr.d.aqrl  %[p],  %[c]\n\t"
+		"beq        %[p],  %[u], 1f\n\t"
+		"add       %[rc],  %[p], %[a]\n\t"
+		"sc.d.aqrl %[rc], %[rc], %[c]\n\t"
+		"bnez      %[rc], 0b\n\t"
+		"1:"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		: [a]"r" (a), [u]"r" (u)
+		: "memory");
+	return prev;
+}
+
+static __always_inline int atomic64_add_unless(atomic64_t *v, long a, long u)
+{
+	return __atomic64_add_unless(v, a, u) != u;
+}
+#endif
+
+/*
+ * The extra atomic operations that are constructed from one of the core
+ * LR/SC-based operations above.
+ */
+static __always_inline int atomic_inc_not_zero(atomic_t *v)
+{
+        return __atomic_add_unless(v, 1, 0);
+}
+
+#ifndef CONFIG_GENERIC_ATOMIC64
+static __always_inline long atomic64_inc_not_zero(atomic64_t *v)
+{
+        return atomic64_add_unless(v, 1, 0);
+}
+#endif
+
+/*
+ * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
+ * {cmp,}xchg and the operations that return, so they need a barrier.  We just
+ * use the other implementations directly.
+ */
+#define ATOMIC_OP(c_t, prefix, c_or, size, asm_or)						\
+static __always_inline c_t atomic##prefix##_cmpxchg##c_or(atomic##prefix##_t *v, c_t o, c_t n) 	\
+{												\
+	return __cmpxchg(&(v->counter), o, n, size, asm_or, asm_or);				\
+}												\
+static __always_inline c_t atomic##prefix##_xchg##c_or(atomic##prefix##_t *v, c_t n) 		\
+{												\
+	return __xchg(n, &(v->counter), size, asm_or);						\
+}
+
+#ifdef CONFIG_GENERIC_ATOMIC64
+#define ATOMIC_OPS(c_or, asm_or)			\
+	ATOMIC_OP( int,   , c_or, 4, asm_or)
+#else
+#define ATOMIC_OPS(c_or, asm_or)			\
+	ATOMIC_OP( int,   , c_or, 4, asm_or)		\
+	ATOMIC_OP(long, 64, c_or, 8, asm_or)
+#endif
+
+ATOMIC_OPS(        , .aqrl)
+ATOMIC_OPS(_acquire,   .aq)
+ATOMIC_OPS(_release,   .rl)
+ATOMIC_OPS(_relaxed,      )
+
+#undef ATOMIC_OPS
+#undef ATOMIC_OP
+
+static __always_inline int atomic_sub_if_positive(atomic_t *v, int offset)
+{
+       int prev, rc;
+
+	__asm__ __volatile__ (
+		"0:\n\t"
+		"lr.w.aqrl  %[p],  %[c]\n\t"
+		"sub       %[rc],  %[p], %[o]\n\t"
+		"bltz      %[rc],    1f\n\t"
+		"sc.w.aqrl %[rc], %[rc], %[c]\n\t"
+		"bnez      %[rc],    0b\n\t"
+		"1:"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		: [o]"r" (offset)
+		: "memory");
+	return prev - offset;
+}
+
+#define atomic_dec_if_positive(v)	atomic_sub_if_positive(v, 1)
+
+#ifndef CONFIG_GENERIC_ATOMIC64
+static __always_inline long atomic64_sub_if_positive(atomic64_t *v, int offset)
+{
+       long prev, rc;
+
+	__asm__ __volatile__ (
+		"0:\n\t"
+		"lr.d.aqrl  %[p],  %[c]\n\t"
+		"sub       %[rc],  %[p], %[o]\n\t"
+		"bltz      %[rc],    1f\n\t"
+		"sc.d.aqrl %[rc], %[rc], %[c]\n\t"
+		"bnez      %[rc],    0b\n\t"
+		"1:"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		: [o]"r" (offset)
+		: "memory");
+	return prev - offset;
+}
+
+#define atomic64_dec_if_positive(v)	atomic64_sub_if_positive(v, 1)
+#endif
+
+#endif /* _ASM_RISCV_ATOMIC_H */
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
new file mode 100644
index 000000000000..183534b7c39b
--- /dev/null
+++ b/arch/riscv/include/asm/barrier.h
@@ -0,0 +1,68 @@
+/*
+ * Based on arch/arm/include/asm/barrier.h
+ *
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2013 Regents of the University of California
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
+
+#ifndef _ASM_RISCV_BARRIER_H
+#define _ASM_RISCV_BARRIER_H
+
+#ifndef __ASSEMBLY__
+
+#define nop()		__asm__ __volatile__ ("nop")
+
+#define RISCV_FENCE(p, s) \
+	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
+
+/* These barriers need to enforce ordering on both devices or memory. */
+#define mb()		RISCV_FENCE(iorw,iorw)
+#define rmb()		RISCV_FENCE(ir,ir)
+#define wmb()		RISCV_FENCE(ow,ow)
+
+/* These barriers do not need to enforce ordering on devices, just memory. */
+#define smp_mb()	RISCV_FENCE(rw,rw)
+#define smp_rmb()	RISCV_FENCE(r,r)
+#define smp_wmb()	RISCV_FENCE(w,w)
+
+/*
+ * These fences exist to enforce ordering around the relaxed AMOs.  The
+ * documentation defines that
+ * "
+ *     atomic_fetch_add();
+ *   is equivalent to:
+ *     smp_mb__before_atomic();
+ *     atomic_fetch_add_relaxed();
+ *     smp_mb__after_atomic();
+ * "
+ * So we emit full fences on both sides.
+ */
+#define __smb_mb__before_atomic()	smp_mb()
+#define __smb_mb__after_atomic()	smp_mb()
+
+/*
+ * These barriers prevent accesses performed outside a spinlock from being moved
+ * inside a spinlock.  Since RISC-V sets the aq/rl bits on our spinlock only
+ * enforce release consistency, we need full fences here.
+ */
+#define smb_mb__before_spinlock()	smp_mb()
+#define smb_mb__after_spinlock()	smp_mb()
+
+#include <asm-generic/barrier.h>
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BARRIER_H */
diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
new file mode 100644
index 000000000000..7c281ef1d583
--- /dev/null
+++ b/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,218 @@
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
+#ifndef _ASM_RISCV_BITOPS_H
+#define _ASM_RISCV_BITOPS_H
+
+#ifndef _LINUX_BITOPS_H
+#error "Only <linux/bitops.h> can be included directly"
+#endif /* _LINUX_BITOPS_H */
+
+#include <linux/compiler.h>
+#include <linux/irqflags.h>
+#include <asm/barrier.h>
+#include <asm/bitsperlong.h>
+
+#ifndef smp_mb__before_clear_bit
+#define smp_mb__before_clear_bit()  smp_mb()
+#define smp_mb__after_clear_bit()   smp_mb()
+#endif /* smp_mb__before_clear_bit */
+
+#include <asm-generic/bitops/__ffs.h>
+#include <asm-generic/bitops/ffz.h>
+#include <asm-generic/bitops/fls.h>
+#include <asm-generic/bitops/__fls.h>
+#include <asm-generic/bitops/fls64.h>
+#include <asm-generic/bitops/find.h>
+#include <asm-generic/bitops/sched.h>
+#include <asm-generic/bitops/ffs.h>
+
+#include <asm-generic/bitops/hweight.h>
+
+#if (BITS_PER_LONG == 64)
+#define __AMO(op)	"amo" #op ".d"
+#elif (BITS_PER_LONG == 32)
+#define __AMO(op)	"amo" #op ".w"
+#else
+#error "Unexpected BITS_PER_LONG"
+#endif
+
+#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
+({								\
+	unsigned long __res, __mask;				\
+	__mask = BIT_MASK(nr);					\
+	__asm__ __volatile__ (					\
+		__AMO(op) #ord " %0, %2, %1"			\
+		: "=r" (__res), "+A" (addr[BIT_WORD(nr)])	\
+		: "r" (mod(__mask))				\
+		: "memory");					\
+	((__res & __mask) != 0);				\
+})
+
+#define __op_bit_ord(op, mod, nr, addr, ord)			\
+	__asm__ __volatile__ (					\
+		__AMO(op) #ord " zero, %1, %0"			\
+		: "+A" (addr[BIT_WORD(nr)])			\
+		: "r" (mod(BIT_MASK(nr)))			\
+		: "memory");
+
+#define __test_and_op_bit(op, mod, nr, addr) 			\
+	__test_and_op_bit_ord(op, mod, nr, addr, )
+#define __op_bit(op, mod, nr, addr)				\
+	__op_bit_ord(op, mod, nr, addr, )
+
+/* Bitmask modifiers */
+#define __NOP(x)	(x)
+#define __NOT(x)	(~(x))
+
+/**
+ * test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation may be reordered on other architectures than x86.
+ */
+static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
+{
+	return __test_and_op_bit(or, __NOP, nr, addr);
+}
+
+/**
+ * test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation can be reordered on other architectures other than x86.
+ */
+static inline int test_and_clear_bit(int nr, volatile unsigned long *addr)
+{
+	return __test_and_op_bit(and, __NOT, nr, addr);
+}
+
+/**
+ * test_and_change_bit - Change a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This operation is atomic and cannot be reordered.
+ * It also implies a memory barrier.
+ */
+static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
+{
+	return __test_and_op_bit(xor, __NOP, nr, addr);
+}
+
+/**
+ * set_bit - Atomically set a bit in memory
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * Note: there are no guarantees that this function will not be reordered
+ * on non x86 architectures, so if you are writing portable code,
+ * make sure not to rely on its reordering guarantees.
+ *
+ * Note that @nr may be almost arbitrarily large; this function is not
+ * restricted to acting on a single-word quantity.
+ */
+static inline void set_bit(int nr, volatile unsigned long *addr)
+{
+	__op_bit(or, __NOP, nr, addr);
+}
+
+/**
+ * clear_bit - Clears a bit in memory
+ * @nr: Bit to clear
+ * @addr: Address to start counting from
+ *
+ * Note: there are no guarantees that this function will not be reordered
+ * on non x86 architectures, so if you are writing portable code,
+ * make sure not to rely on its reordering guarantees.
+ */
+static inline void clear_bit(int nr, volatile unsigned long *addr)
+{
+	__op_bit(and, __NOT, nr, addr);
+}
+
+/**
+ * change_bit - Toggle a bit in memory
+ * @nr: Bit to change
+ * @addr: Address to start counting from
+ *
+ * change_bit()  may be reordered on other architectures than x86.
+ * Note that @nr may be almost arbitrarily large; this function is not
+ * restricted to acting on a single-word quantity.
+ */
+static inline void change_bit(int nr, volatile unsigned long *addr)
+{
+	__op_bit(xor, __NOP, nr, addr);
+}
+
+/**
+ * test_and_set_bit_lock - Set a bit and return its old value, for lock
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is atomic and provides acquire barrier semantics.
+ * It can be used to implement bit locks.
+ */
+static inline int test_and_set_bit_lock(
+	unsigned long nr, volatile unsigned long *addr)
+{
+	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
+}
+
+/**
+ * clear_bit_unlock - Clear a bit in memory, for unlock
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * This operation is atomic and provides release barrier semantics.
+ */
+static inline void clear_bit_unlock(
+	unsigned long nr, volatile unsigned long *addr)
+{
+	__op_bit_ord(and, __NOT, nr, addr, .rl);
+}
+
+/**
+ * __clear_bit_unlock - Clear a bit in memory, for unlock
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * This operation is like clear_bit_unlock, however it is not atomic.
+ * It does provide release barrier semantics so it can be used to unlock
+ * a bit lock, however it would only be used if no other CPU can modify
+ * any bits in the memory until the lock is released (a good example is
+ * if the bit lock itself protects access to the other bits in the word).
+ *
+ * On RISC-V systems there seems to be no benefit to taking advantage of the
+ * non-atomic property here: it's a lot more instructions and we still have to
+ * provide release semantics anyway.
+ */
+static inline void __clear_bit_unlock(
+	unsigned long nr, volatile unsigned long *addr)
+{
+	clear_bit_unlock(nr, addr);
+}
+
+#undef __test_and_op_bit
+#undef __op_bit
+#undef __NOP
+#undef __NOT
+#undef __AMO
+
+#include <asm-generic/bitops/non-atomic.h>
+#include <asm-generic/bitops/le.h>
+#include <asm-generic/bitops/ext2-atomic.h>
+
+#endif /* _ASM_RISCV_BITOPS_H */
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
new file mode 100644
index 000000000000..0595585013b0
--- /dev/null
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -0,0 +1,39 @@
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
+#ifndef _ASM_RISCV_CACHEFLUSH_H
+#define _ASM_RISCV_CACHEFLUSH_H
+
+#include <asm-generic/cacheflush.h>
+
+#undef flush_icache_range
+#undef flush_icache_user_range
+
+static inline void local_flush_icache_all(void)
+{
+	asm volatile ("fence.i" ::: "memory");
+}
+
+#ifndef CONFIG_SMP
+
+#define flush_icache_range(start, end) local_flush_icache_all()
+#define flush_icache_user_range(vma, pg, addr, len) local_flush_icache_all()
+
+#else /* CONFIG_SMP */
+
+#define flush_icache_range(start, end) sbi_remote_fence_i(0)
+#define flush_icache_user_range(vma, pg, addr, len) sbi_remote_fence_i(0)
+
+#endif /* CONFIG_SMP */
+
+#endif /* _ASM_RISCV_CACHEFLUSH_H */
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 000000000000..db249dbc7b97
--- /dev/null
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -0,0 +1,134 @@
+/*
+ * Copyright (C) 2014 Regents of the University of California
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
+#ifndef _ASM_RISCV_CMPXCHG_H
+#define _ASM_RISCV_CMPXCHG_H
+
+#include <linux/bug.h>
+
+#include <asm/barrier.h>
+
+#define __xchg(new, ptr, size, asm_or)				\
+({								\
+	__typeof__(ptr) __ptr = (ptr);				\
+	__typeof__(new) __new = (new);				\
+	__typeof__(*(ptr)) __ret;				\
+	switch (size) {						\
+	case 4:							\
+		__asm__ __volatile__ (				\
+			"amoswap.w" #asm_or " %0, %2, %1"	\
+			: "=r" (__ret), "+A" (*__ptr)		\
+			: "r" (__new)				\
+			: "memory");				\
+		break;						\
+	case 8:							\
+		__asm__ __volatile__ (				\
+			"amoswap.d" #asm_or " %0, %2, %1"	\
+			: "=r" (__ret), "+A" (*__ptr)		\
+			: "r" (__new)				\
+			: "memory");				\
+		break;						\
+	default:						\
+		BUILD_BUG();					\
+	}							\
+	__ret;							\
+})
+
+#define xchg(ptr, x)    (__xchg((x), (ptr), sizeof(*(ptr)), .aqrl))
+
+#define xchg32(ptr, x)				\
+({						\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);	\
+	xchg((ptr), (x));			\
+})
+
+#define xchg64(ptr, x)				\
+({						\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);	\
+	xchg((ptr), (x));			\
+})
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+#define __cmpxchg(ptr, old, new, size, lrb, scb)			\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __new = (new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+		"0:"							\
+			"lr.w" #scb " %0, %2\n"				\
+			"bne         %0, %z3, 1f\n"			\
+			"sc.w" #lrb " %1, %z4, %2\n"			\
+			"bnez        %1, 0b\n"				\
+		"1:"							\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+		"0:"							\
+			"lr.d" #scb " %0, %2\n"				\
+			"bne         %0, %z3, 1f\n"			\
+			"sc.d" #lrb " %1, %z4, %2\n"			\
+			"bnez        %1, 0b\n"				\
+		"1:"							\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg(ptr, o, n) \
+	(__cmpxchg((ptr), (o), (n), sizeof(*(ptr)), .aqrl, .aqrl))
+
+#define cmpxchg_local(ptr, o, n) \
+	(__cmpxchg((ptr), (o), (n), sizeof(*(ptr)), , ))
+
+#define cmpxchg32(ptr, o, n)			\
+({						\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);	\
+	cmpxchg((ptr), (o), (n));		\
+})
+
+#define cmpxchg32_local(ptr, o, n)		\
+({						\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);	\
+	cmpxchg_local((ptr), (o), (n));		\
+})
+
+#define cmpxchg64(ptr, o, n)			\
+({						\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);	\
+	cmpxchg((ptr), (o), (n));		\
+})
+
+#define cmpxchg64_local(ptr, o, n)		\
+({						\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);	\
+	cmpxchg_local((ptr), (o), (n));		\
+})
+
+#endif /* _ASM_RISCV_CMPXCHG_H */
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
new file mode 100644
index 000000000000..c1f32cfcc79b
--- /dev/null
+++ b/arch/riscv/include/asm/io.h
@@ -0,0 +1,303 @@
+/*
+ * {read,write}{b,w,l,q} based on arch/arm64/include/asm/io.h
+ *   which was based on arch/arm/include/io.h
+ *
+ * Copyright (C) 1996-2000 Russell King
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2014 Regents of the University of California
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
+#ifndef _ASM_RISCV_IO_H
+#define _ASM_RISCV_IO_H
+
+#ifdef CONFIG_MMU
+
+extern void __iomem *ioremap(phys_addr_t offset, unsigned long size);
+
+/*
+ * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
+ * change the properties of memory regions.  This should be fixed by the
+ * upcoming platform spec.
+ */
+#define ioremap_nocache(addr, size) ioremap((addr), (size))
+#define ioremap_wc(addr, size) ioremap((addr), (size))
+#define ioremap_wt(addr, size) ioremap((addr), (size))
+
+extern void iounmap(void __iomem *addr);
+
+#endif /* CONFIG_MMU */
+
+/* Generic IO read/write.  These perform native-endian accesses. */
+#define __raw_writeb __raw_writeb
+static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
+{
+	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#define __raw_writew __raw_writew
+static inline void __raw_writew(u16 val, volatile void __iomem *addr)
+{
+	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#define __raw_writel __raw_writel
+static inline void __raw_writel(u32 val, volatile void __iomem *addr)
+{
+	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#ifdef CONFIG_64BIT
+#define __raw_writeq __raw_writeq
+static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
+{
+	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+#endif
+
+#define __raw_readb __raw_readb
+static inline u8 __raw_readb(const volatile void __iomem *addr)
+{
+	u8 val;
+
+	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readw __raw_readw
+static inline u16 __raw_readw(const volatile void __iomem *addr)
+{
+	u16 val;
+
+	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readl __raw_readl
+static inline u32 __raw_readl(const volatile void __iomem *addr)
+{
+	u32 val;
+
+	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#ifdef CONFIG_64BIT
+#define __raw_readq __raw_readq
+static inline u64 __raw_readq(const volatile void __iomem *addr)
+{
+	u64 val;
+
+	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+#endif
+
+/*
+ * FIXME: I'm flip-flopping on whether or not we should keep this or enforce
+ * the ordering with I/O on spinlocks like PowerPC does.  The worry is that
+ * drivers won't get this correct, but I also don't want to introduce a fence
+ * into the lock code that otherwise only uses AMOs (and is essentially defined
+ * by the ISA to be correct).   For now I'm leaving this here: "o,w" is
+ * sufficient to ensure that all writes to the device have completed before the
+ * write to the spinlock is allowed to commit.  I surmised this from reading
+ * "ACQUIRES VS I/O ACCESSES" in memory-barriers.txt.
+ */
+#define mmiowb()	__asm__ __volatile__ ("fence o,w" : : : "memory");
+
+/*
+ * Unordered I/O memory access primitives.  These are even more relaxed than
+ * the relaxed versions, as they don't even order accesses between successive
+ * operations to the I/O regions.
+ */
+#define readb_cpu(c)		({ u8  __r = __raw_readb(c); __r; })
+#define readw_cpu(c)		({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
+#define readl_cpu(c)		({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
+
+#define writeb_cpu(v,c)		((void)__raw_writeb((v),(c)))
+#define writew_cpu(v,c)		((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
+#define writel_cpu(v,c)		((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
+
+#ifdef CONFIG_64BIT
+#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
+#define writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
+#endif
+
+/*
+ * Relaxed I/O memory access primitives. These follow the Device memory
+ * ordering rules but do not guarantee any ordering relative to Normal memory
+ * accesses.  These are defined to order the indicated access (either a read or
+ * write) with all other I/O memory accesses. Since the platform specification
+ * defines that all I/O regions are strongly ordered on channel 2, no explicit
+ * fences are required to enforce this ordering.
+ */
+/* FIXME: These are now the same as asm-generic */
+#define __io_rbr()		do {} while (0)
+#define __io_rar()		do {} while (0)
+#define __io_rbw()		do {} while (0)
+#define __io_raw()		do {} while (0)
+
+#define readb_relaxed(c)	({ u8  __v; __io_rbr(); __v = readb_cpu(c); __io_rar(); __v; })
+#define readw_relaxed(c)	({ u16 __v; __io_rbr(); __v = readw_cpu(c); __io_rar(); __v; })
+#define readl_relaxed(c)	({ u32 __v; __io_rbr(); __v = readl_cpu(c); __io_rar(); __v; })
+
+#define writeb_relaxed(v,c)	({ __io_rbw(); writeb_cpu((v),(c)); __io_raw(); })
+#define writew_relaxed(v,c)	({ __io_rbw(); writew_cpu((v),(c)); __io_raw(); })
+#define writel_relaxed(v,c)	({ __io_rbw(); writel_cpu((v),(c)); __io_raw(); })
+
+#ifdef CONFIG_64BIT
+#define readq_relaxed(c)	({ u64 __v; __io_rbr(); __v = readq_cpu(c); __io_rar(); __v; })
+#define writeq_relaxed(v,c)	({ __io_rbw(); writeq_cpu((v),(c)); __io_raw(); })
+#endif
+
+/*
+ * I/O memory access primitives. Reads are ordered relative to any
+ * following Normal memory access. Writes are ordered relative to any prior
+ * Normal memory access.  The memory barriers here are necessary as RISC-V
+ * doesn't define any ordering between the memory space and the I/O space.
+ */
+#define __io_br()	do {} while (0)
+#define __io_ar()	__asm__ __volatile__ ("fence i,r" : : : "memory");
+#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : : "memory");
+#define __io_aw()	do {} while (0)
+
+#define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(); __v; })
+#define readw(c)	({ u16 __v; __io_br(); __v = readw_cpu(c); __io_ar(); __v; })
+#define readl(c)	({ u32 __v; __io_br(); __v = readl_cpu(c); __io_ar(); __v; })
+
+#define writeb(v,c)	({ __io_bw(); writeb_cpu((v),(c)); __io_aw(); })
+#define writew(v,c)	({ __io_bw(); writew_cpu((v),(c)); __io_aw(); })
+#define writel(v,c)	({ __io_bw(); writel_cpu((v),(c)); __io_aw(); })
+
+#ifdef CONFIG_64BIT
+#define readq(c)	({ u64 __v; __io_br(); __v = readq_cpu(c); __io_ar(); __v; })
+#define writeq(v,c)	({ __io_bw(); writeq_cpu((v),(c)); __io_aw(); })
+#endif
+
+/*
+ * Emulation routines for the port-mapped IO space used by some PCI drivers.
+ * These are defined as being "fully synchronous", but also "not guaranteed to
+ * be fully ordered with respect to other memory and I/O operations".  We're
+ * going to be on the safe side here and just make them:
+ *  - Fully ordered WRT each other, by bracketing them with two fences.  The
+ *    outer set contains both I/O so inX is ordered with outX, while the inner just
+ *    needs the type of the access (I for inX and O for outX).
+ *  - Ordered in the same manner as readX/writeX WRT memory by subsuming their
+ *    fences.
+ *  - Ordered WRT timer reads, so udelay and friends don't get elided by the
+ *    implementation.
+ * Note that there is no way to actually enforce that outX is a non-posted
+ * operation on RISC-V, but hopefully the timer ordering constraint is
+ * sufficient to ensure this works sanely on controllers that support I/O
+ * writes.
+ */
+#define __io_pbr()	__asm__ __volatile__ ("fence io,i"  : : : "memory");
+#define __io_par()	__asm__ __volatile__ ("fence i,ior" : : : "memory");
+#define __io_pbw()	__asm__ __volatile__ ("fence iow,o" : : : "memory");
+#define __io_paw()	__asm__ __volatile__ ("fence o,io"  : : : "memory");
+
+#define inb(c)		({ u8  __v; __io_pbr(); __v = readb_cpu((void*)(PCI_IOBASE + (c))); __io_par(); __v; })
+#define inw(c)		({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(); __v; })
+#define inl(c)		({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(); __v; })
+
+#define outb(v,c)	({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
+#define outw(v,c)	({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
+#define outl(v,c)	({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
+
+#ifdef CONFIG_64BIT
+#define inq(c)		({ u64 __v; __io_pbr(); __v = readq_cpu((void*)(c)); __io_par(); __v; })
+#define outq(v,c)	({ __io_pbw(); writeq_cpu((v),(void*)(c)); __io_paw(); })
+#endif
+
+/*
+ * Accesses from a single hart to a single I/O address must be ordered.  This
+ * allows us to use the raw read macros, but we still need to fence before and
+ * after the block to ensure ordering WRT other macros.  These are defined to
+ * perform host-endian accesses so we use __raw instead of __cpu.
+ */
+#define __io_reads_ins(port, ctype, len, bfence, afence)			\
+	static inline void __ ## port ## len(const volatile void __iomem *addr,	\
+					     void *buffer,			\
+					     unsigned int count)		\
+	{									\
+		bfence;								\
+		if (count) {							\
+			ctype *buf = buffer;					\
+										\
+			do {							\
+				ctype x = __raw_read ## len(addr);		\
+				*buf++ = x;					\
+			} while (--count);					\
+		}								\
+		afence;								\
+	}
+
+#define __io_writes_outs(port, ctype, len, bfence, afence)			\
+	static inline void __ ## port ## len(volatile void __iomem *addr,	\
+					     const void *buffer,		\
+					     unsigned int count)		\
+	{									\
+		bfence;								\
+		if (count) {							\
+			const ctype *buf = buffer;				\
+										\
+			do {							\
+				__raw_writeq(*buf++, addr);			\
+			} while (--count);					\
+		}								\
+		afence;								\
+	}
+
+__io_reads_ins(reads,  u8, b, __io_br(), __io_ar())
+__io_reads_ins(reads, u16, w, __io_br(), __io_ar())
+__io_reads_ins(reads, u32, l, __io_br(), __io_ar())
+#define readsb(addr, buffer, count) __readsb(addr, buffer, count)
+#define readsw(addr, buffer, count) __readsw(addr, buffer, count)
+#define readsl(addr, buffer, count) __readsl(addr, buffer, count)
+
+__io_reads_ins(ins,  u8, b, __io_pbr(), __io_par())
+__io_reads_ins(ins, u16, w, __io_pbr(), __io_par())
+__io_reads_ins(ins, u32, l, __io_pbr(), __io_par())
+#define insb(addr, buffer, count) __insb((void __iomem *)addr, buffer, count)
+#define insw(addr, buffer, count) __insw((void __iomem *)addr, buffer, count)
+#define insl(addr, buffer, count) __insl((void __iomem *)addr, buffer, count)
+
+__io_writes_outs(writes,  u8, b, __io_bw(), __io_aw())
+__io_writes_outs(writes, u16, w, __io_bw(), __io_aw())
+__io_writes_outs(writes, u32, l, __io_bw(), __io_aw())
+#define writesb(addr, buffer, count) __writesb(addr, buffer, count)
+#define writesw(addr, buffer, count) __writesw(addr, buffer, count)
+#define writesl(addr, buffer, count) __writesl(addr, buffer, count)
+
+__io_writes_outs(outs,  u8, b, __io_pbw(), __io_paw())
+__io_writes_outs(outs, u16, w, __io_pbw(), __io_paw())
+__io_writes_outs(outs, u32, l, __io_pbw(), __io_paw())
+#define outsb(addr, buffer, count) __outsb((void __iomem *)addr, buffer, count)
+#define outsw(addr, buffer, count) __outsw((void __iomem *)addr, buffer, count)
+#define outsl(addr, buffer, count) __outsl((void __iomem *)addr, buffer, count)
+
+#ifdef CONFIG_64BIT
+__io_reads_ins(reads, u64, q, __io_br(), __io_ar())
+#define readsq(addr, buffer, count) __readsq(addr, buffer, count)
+
+__io_reads_ins(ins, u64, q, __io_pbr(), __io_par())
+#define insq(addr, buffer, count) __insq((void __iomem *)addr, buffer, count)
+
+__io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
+#define writesq(addr, buffer, count) __writesq(addr, buffer, count)
+
+__io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
+#define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
+#endif
+
+#include <asm-generic/io.h>
+
+#endif /* _ASM_RISCV_IO_H */
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
new file mode 100644
index 000000000000..b3b394ffaf7e
--- /dev/null
+++ b/arch/riscv/include/asm/spinlock.h
@@ -0,0 +1,165 @@
+/*
+ * Copyright (C) 2015 Regents of the University of California
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
+#ifndef _ASM_RISCV_SPINLOCK_H
+#define _ASM_RISCV_SPINLOCK_H
+
+#include <linux/kernel.h>
+#include <asm/current.h>
+
+/*
+ * Simple spin lock operations.  These provide no fairness guarantees.
+ */
+
+/* FIXME: Replace this with a ticket lock, like MIPS. */
+
+#define arch_spin_lock_flags(lock, flags) arch_spin_lock(lock)
+#define arch_spin_is_locked(x)	((x)->lock != 0)
+
+static inline void arch_spin_unlock(arch_spinlock_t *lock)
+{
+	__asm__ __volatile__ (
+		"amoswap.w.rl x0, x0, %0"
+		: "=A" (lock->lock)
+		:: "memory");
+}
+
+static inline int arch_spin_trylock(arch_spinlock_t *lock)
+{
+	int tmp = 1, busy;
+
+	__asm__ __volatile__ (
+		"amoswap.w.aq %0, %2, %1"
+		: "=r" (busy), "+A" (lock->lock)
+		: "r" (tmp)
+		: "memory");
+
+	return !busy;
+}
+
+static inline void arch_spin_lock(arch_spinlock_t *lock)
+{
+	while (1) {
+		if (arch_spin_is_locked(lock))
+			continue;
+
+		if (arch_spin_trylock(lock))
+			break;
+	}
+}
+
+static inline void arch_spin_unlock_wait(arch_spinlock_t *lock)
+{
+	smp_rmb();
+	do {
+		cpu_relax();
+	} while (arch_spin_is_locked(lock));
+	smp_acquire__after_ctrl_dep();
+}
+
+/***********************************************************/
+
+static inline int arch_read_can_lock(arch_rwlock_t *lock)
+{
+	return lock->lock >= 0;
+}
+
+static inline int arch_write_can_lock(arch_rwlock_t *lock)
+{
+	return lock->lock == 0;
+}
+
+static inline void arch_read_lock(arch_rwlock_t *lock)
+{
+	int tmp;
+
+	__asm__ __volatile__(
+		"1:	lr.w	%1, %0\n"
+		"	bltz	%1, 1b\n"
+		"	addi	%1, %1, 1\n"
+		"	sc.w.aq	%1, %1, %0\n"
+		"	bnez	%1, 1b\n"
+		: "+A" (lock->lock), "=&r" (tmp)
+		:: "memory");
+}
+
+static inline void arch_write_lock(arch_rwlock_t *lock)
+{
+	int tmp;
+
+	__asm__ __volatile__(
+		"1:	lr.w	%1, %0\n"
+		"	bnez	%1, 1b\n"
+		"	li	%1, -1\n"
+		"	sc.w.aq	%1, %1, %0\n"
+		"	bnez	%1, 1b\n"
+		: "+A" (lock->lock), "=&r" (tmp)
+		:: "memory");
+}
+
+static inline int arch_read_trylock(arch_rwlock_t *lock)
+{
+	int busy;
+
+	__asm__ __volatile__(
+		"1:	lr.w	%1, %0\n"
+		"	bltz	%1, 1f\n"
+		"	addi	%1, %1, 1\n"
+		"	sc.w.aq	%1, %1, %0\n"
+		"	bnez	%1, 1b\n"
+		"1:\n"
+		: "+A" (lock->lock), "=&r" (busy)
+		:: "memory");
+
+	return !busy;
+}
+
+static inline int arch_write_trylock(arch_rwlock_t *lock)
+{
+	int busy;
+
+	__asm__ __volatile__(
+		"1:	lr.w	%1, %0\n"
+		"	bnez	%1, 1f\n"
+		"	li	%1, -1\n"
+		"	sc.w.aq	%1, %1, %0\n"
+		"	bnez	%1, 1b\n"
+		"1:\n"
+		: "+A" (lock->lock), "=&r" (busy)
+		:: "memory");
+
+	return !busy;
+}
+
+static inline void arch_read_unlock(arch_rwlock_t *lock)
+{
+	__asm__ __volatile__(
+		"amoadd.w.rl x0, %1, %0"
+		: "+A" (lock->lock)
+		: "r" (-1)
+		: "memory");
+}
+
+static inline void arch_write_unlock(arch_rwlock_t *lock)
+{
+	__asm__ __volatile__ (
+		"amoswap.w.rl x0, x0, %0"
+		: "=A" (lock->lock)
+		:: "memory");
+}
+
+#define arch_read_lock_flags(lock, flags) arch_read_lock(lock)
+#define arch_write_lock_flags(lock, flags) arch_write_lock(lock)
+
+#endif /* _ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
new file mode 100644
index 000000000000..83ac4ac9e2ac
--- /dev/null
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -0,0 +1,33 @@
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
+#ifndef _ASM_RISCV_SPINLOCK_TYPES_H
+#define _ASM_RISCV_SPINLOCK_TYPES_H
+
+#ifndef __LINUX_SPINLOCK_TYPES_H
+# error "please don't include this file directly"
+#endif
+
+typedef struct {
+	volatile unsigned int lock;
+} arch_spinlock_t;
+
+#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
+
+typedef struct {
+	volatile unsigned int lock;
+} arch_rwlock_t;
+
+#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
+
+#endif
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
new file mode 100644
index 000000000000..c229509288ea
--- /dev/null
+++ b/arch/riscv/include/asm/tlb.h
@@ -0,0 +1,24 @@
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
+#ifndef _ASM_RISCV_TLB_H
+#define _ASM_RISCV_TLB_H
+
+#include <asm-generic/tlb.h>
+
+static inline void tlb_flush(struct mmu_gather *tlb)
+{
+	flush_tlb_mm(tlb->mm);
+}
+
+#endif /* _ASM_RISCV_TLB_H */
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
new file mode 100644
index 000000000000..5ee4ae370b5e
--- /dev/null
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -0,0 +1,64 @@
+/*
+ * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
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
+#ifndef _ASM_RISCV_TLBFLUSH_H
+#define _ASM_RISCV_TLBFLUSH_H
+
+#ifdef CONFIG_MMU
+
+/* Flush entire local TLB */
+static inline void local_flush_tlb_all(void)
+{
+	__asm__ __volatile__ ("sfence.vma" : : : "memory");
+}
+
+/* Flush one page from local TLB */
+static inline void local_flush_tlb_page(unsigned long addr)
+{
+	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
+}
+
+#ifndef CONFIG_SMP
+
+#define flush_tlb_all() local_flush_tlb_all()
+#define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
+#define flush_tlb_range(vma, start, end) local_flush_tlb_all()
+
+#else /* CONFIG_SMP */
+
+#include <asm/sbi.h>
+
+#define flush_tlb_all() sbi_remote_sfence_vma(0, 0, -1)
+#define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
+#define flush_tlb_range(vma, start, end) \
+	sbi_remote_sfence_vma(0, start, (end) - (start))
+
+#endif /* CONFIG_SMP */
+
+/* Flush the TLB entries of the specified mm context */
+static inline void flush_tlb_mm(struct mm_struct *mm)
+{
+	flush_tlb_all();
+}
+
+/* Flush a range of kernel pages */
+static inline void flush_tlb_kernel_range(unsigned long start,
+	unsigned long end)
+{
+	flush_tlb_all();
+}
+
+#endif /* CONFIG_MMU */
+
+#endif /* _ASM_RISCV_TLBFLUSH_H */
-- 
2.13.5

