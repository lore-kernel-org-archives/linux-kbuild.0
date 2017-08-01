Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36186 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751699AbdHABAp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Jul 2017 21:00:45 -0400
Received: by mail-pg0-f67.google.com with SMTP id y129so269841pgy.3
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Jul 2017 18:00:45 -0700 (PDT)
Subject: [PATCH v7 02/15] lib: Add shared copies of some GCC library routines
Date: Mon, 31 Jul 2017 17:59:56 -0700
Message-Id: <20170801010009.3302-3-palmer@dabbelt.com>
In-Reply-To: <20170801010009.3302-1-palmer@dabbelt.com>
References: <20170801010009.3302-1-palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org, Palmer Dabbelt <palmer@dabbelt.com>

Many ports (m32r, microblaze, mips, parisc, score, and sparc) use
functionally identical copies of various GCC library routine files,
which came up as we were submitting the RISC-V port (which also uses
some of these).

This patch adds a new copy of these library routine files, which are
functionally identical to the various other copies.  These are
availiable via Kconfig as CONFIG_GENERIC_$ROUTINE, which currently isn't
used anywhere.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 include/lib/libgcc.h | 44 ++++++++++++++++++++++++++++++++
 lib/Kconfig          | 18 +++++++++++++
 lib/Makefile         |  8 ++++++
 lib/ashldi3.c        | 45 ++++++++++++++++++++++++++++++++
 lib/ashrdi3.c        | 46 +++++++++++++++++++++++++++++++++
 lib/cmpdi2.c         | 42 ++++++++++++++++++++++++++++++
 lib/lshrdi3.c        | 45 ++++++++++++++++++++++++++++++++
 lib/muldi3.c         | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/ucmpdi2.c        | 35 +++++++++++++++++++++++++
 9 files changed, 355 insertions(+)
 create mode 100644 include/lib/libgcc.h
 create mode 100644 lib/ashldi3.c
 create mode 100644 lib/ashrdi3.c
 create mode 100644 lib/cmpdi2.c
 create mode 100644 lib/lshrdi3.c
 create mode 100644 lib/muldi3.c
 create mode 100644 lib/ucmpdi2.c

diff --git a/include/lib/libgcc.h b/include/lib/libgcc.h
new file mode 100644
index 000000000000..a5397e34e005
--- /dev/null
+++ b/include/lib/libgcc.h
@@ -0,0 +1,44 @@
+/*
+ * include/lib/libgcc.h
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
+ * to the Free Software Foundation, Inc.
+ */
+
+
+#ifndef __LIB_LIBGCC_H
+#define __LIB_LIBGCC_H
+
+#include <asm/byteorder.h>
+
+typedef int word_type __attribute__ ((mode (__word__)));
+
+#ifdef __BIG_ENDIAN
+struct DWstruct {
+	int high, low;
+};
+#elif defined(__LITTLE_ENDIAN)
+struct DWstruct {
+	int low, high;
+};
+#else
+#error I feel sick.
+#endif
+
+typedef union {
+	struct DWstruct s;
+	long long ll;
+} DWunion;
+
+#endif /* __ASM_LIBGCC_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index 6762529ad9e4..ee7d8bf0b7e1 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -576,3 +576,21 @@ config PRIME_NUMBERS
 	tristate
 
 endmenu
+
+config GENERIC_ASHLDI3
+	bool
+
+config GENERIC_ASHRDI3
+	bool
+
+config GENERIC_LSHRDI3
+	bool
+
+config GENERIC_MULDI3
+	bool
+
+config GENERIC_CMPDI2
+	bool
+
+config GENERIC_UCMPDI2
+	bool
diff --git a/lib/Makefile b/lib/Makefile
index 40c18372b301..a9ee19497331 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -243,3 +243,11 @@ UBSAN_SANITIZE_ubsan.o := n
 obj-$(CONFIG_SBITMAP) += sbitmap.o
 
 obj-$(CONFIG_PARMAN) += parman.o
+
+# GCC library routines
+obj-$(CONFIG_GENERIC_ASHLDI3) += ashldi3.o
+obj-$(CONFIG_GENERIC_ASHRDI3) += ashrdi3.o
+obj-$(CONFIG_GENERIC_LSHRDI3) += lshrdi3.o
+obj-$(CONFIG_GENERIC_MULDI3) += muldi3.o
+obj-$(CONFIG_GENERIC_CMPDI2) += cmpdi2.o
+obj-$(CONFIG_GENERIC_UCMPDI2) += ucmpdi2.o
diff --git a/lib/ashldi3.c b/lib/ashldi3.c
new file mode 100644
index 000000000000..ff4ec63d2ab6
--- /dev/null
+++ b/lib/ashldi3.c
@@ -0,0 +1,45 @@
+/*
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
+ * to the Free Software Foundation, Inc.
+ */
+
+
+#include <linux/export.h>
+
+#include <lib/libgcc.h>
+
+long long notrace __ashldi3(long long u, word_type b)
+{
+	DWunion uu, w;
+	word_type bm;
+
+	if (b == 0)
+		return u;
+
+	uu.ll = u;
+	bm = 32 - b;
+
+	if (bm <= 0) {
+		w.s.low = 0;
+		w.s.high = (unsigned int) uu.s.low << -bm;
+	} else {
+		const unsigned int carries = (unsigned int) uu.s.low >> bm;
+
+		w.s.low = (unsigned int) uu.s.low << b;
+		w.s.high = ((unsigned int) uu.s.high << b) | carries;
+	}
+
+	return w.ll;
+}
+EXPORT_SYMBOL(__ashldi3);
diff --git a/lib/ashrdi3.c b/lib/ashrdi3.c
new file mode 100644
index 000000000000..2e67c97ac65a
--- /dev/null
+++ b/lib/ashrdi3.c
@@ -0,0 +1,46 @@
+/*
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
+ * to the Free Software Foundation, Inc.
+ */
+
+#include <linux/export.h>
+
+#include <lib/libgcc.h>
+
+long long notrace __ashrdi3(long long u, word_type b)
+{
+	DWunion uu, w;
+	word_type bm;
+
+	if (b == 0)
+		return u;
+
+	uu.ll = u;
+	bm = 32 - b;
+
+	if (bm <= 0) {
+		/* w.s.high = 1..1 or 0..0 */
+		w.s.high =
+		    uu.s.high >> 31;
+		w.s.low = uu.s.high >> -bm;
+	} else {
+		const unsigned int carries = (unsigned int) uu.s.high << bm;
+
+		w.s.high = uu.s.high >> b;
+		w.s.low = ((unsigned int) uu.s.low >> b) | carries;
+	}
+
+	return w.ll;
+}
+EXPORT_SYMBOL(__ashrdi3);
diff --git a/lib/cmpdi2.c b/lib/cmpdi2.c
new file mode 100644
index 000000000000..6d7ebf6c2b86
--- /dev/null
+++ b/lib/cmpdi2.c
@@ -0,0 +1,42 @@
+/*
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
+ * to the Free Software Foundation, Inc.
+ */
+
+#include <linux/export.h>
+
+#include <lib/libgcc.h>
+
+word_type notrace __cmpdi2(long long a, long long b)
+{
+	const DWunion au = {
+		.ll = a
+	};
+	const DWunion bu = {
+		.ll = b
+	};
+
+	if (au.s.high < bu.s.high)
+		return 0;
+	else if (au.s.high > bu.s.high)
+		return 2;
+
+	if ((unsigned int) au.s.low < (unsigned int) bu.s.low)
+		return 0;
+	else if ((unsigned int) au.s.low > (unsigned int) bu.s.low)
+		return 2;
+
+	return 1;
+}
+EXPORT_SYMBOL(__cmpdi2);
diff --git a/lib/lshrdi3.c b/lib/lshrdi3.c
new file mode 100644
index 000000000000..8e845f4bb65f
--- /dev/null
+++ b/lib/lshrdi3.c
@@ -0,0 +1,45 @@
+/*
+ * lib/lshrdi3.c
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
+ * to the Free Software Foundation, Inc.
+ */
+
+#include <linux/module.h>
+#include <lib/libgcc.h>
+
+long long notrace __lshrdi3(long long u, word_type b)
+{
+	DWunion uu, w;
+	word_type bm;
+
+	if (b == 0)
+		return u;
+
+	uu.ll = u;
+	bm = 32 - b;
+
+	if (bm <= 0) {
+		w.s.high = 0;
+		w.s.low = (unsigned int) uu.s.high >> -bm;
+	} else {
+		const unsigned int carries = (unsigned int) uu.s.high << bm;
+
+		w.s.high = (unsigned int) uu.s.high >> b;
+		w.s.low = ((unsigned int) uu.s.low >> b) | carries;
+	}
+
+	return w.ll;
+}
+EXPORT_SYMBOL(__lshrdi3);
diff --git a/lib/muldi3.c b/lib/muldi3.c
new file mode 100644
index 000000000000..88938543e10a
--- /dev/null
+++ b/lib/muldi3.c
@@ -0,0 +1,72 @@
+/*
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
+ * to the Free Software Foundation, Inc.
+ */
+
+#include <linux/export.h>
+#include <lib/libgcc.h>
+
+#define W_TYPE_SIZE 32
+
+#define __ll_B ((unsigned long) 1 << (W_TYPE_SIZE / 2))
+#define __ll_lowpart(t) ((unsigned long) (t) & (__ll_B - 1))
+#define __ll_highpart(t) ((unsigned long) (t) >> (W_TYPE_SIZE / 2))
+
+/* If we still don't have umul_ppmm, define it using plain C.  */
+#if !defined(umul_ppmm)
+#define umul_ppmm(w1, w0, u, v)						\
+	do {								\
+		unsigned long __x0, __x1, __x2, __x3;			\
+		unsigned short __ul, __vl, __uh, __vh;			\
+									\
+		__ul = __ll_lowpart(u);					\
+		__uh = __ll_highpart(u);				\
+		__vl = __ll_lowpart(v);					\
+		__vh = __ll_highpart(v);				\
+									\
+		__x0 = (unsigned long) __ul * __vl;			\
+		__x1 = (unsigned long) __ul * __vh;			\
+		__x2 = (unsigned long) __uh * __vl;			\
+		__x3 = (unsigned long) __uh * __vh;			\
+									\
+		__x1 += __ll_highpart(__x0); /* this can't give carry */\
+		__x1 += __x2; /* but this indeed can */			\
+		if (__x1 < __x2) /* did we get it? */			\
+		__x3 += __ll_B; /* yes, add it in the proper pos */	\
+									\
+		(w1) = __x3 + __ll_highpart(__x1);			\
+		(w0) = __ll_lowpart(__x1) * __ll_B + __ll_lowpart(__x0);\
+	} while (0)
+#endif
+
+#if !defined(__umulsidi3)
+#define __umulsidi3(u, v) ({				\
+	DWunion __w;					\
+	umul_ppmm(__w.s.high, __w.s.low, u, v);		\
+	__w.ll;						\
+	})
+#endif
+
+long long notrace __muldi3(long long u, long long v)
+{
+	const DWunion uu = {.ll = u};
+	const DWunion vv = {.ll = v};
+	DWunion w = {.ll = __umulsidi3(uu.s.low, vv.s.low)};
+
+	w.s.high += ((unsigned long) uu.s.low * (unsigned long) vv.s.high
+		+ (unsigned long) uu.s.high * (unsigned long) vv.s.low);
+
+	return w.ll;
+}
+EXPORT_SYMBOL(__muldi3);
diff --git a/lib/ucmpdi2.c b/lib/ucmpdi2.c
new file mode 100644
index 000000000000..49a53505c8e3
--- /dev/null
+++ b/lib/ucmpdi2.c
@@ -0,0 +1,35 @@
+/*
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
+ * to the Free Software Foundation, Inc.
+ */
+
+#include <linux/module.h>
+#include <lib/libgcc.h>
+
+word_type __ucmpdi2(unsigned long long a, unsigned long long b)
+{
+	const DWunion au = {.ll = a};
+	const DWunion bu = {.ll = b};
+
+	if ((unsigned int) au.s.high < (unsigned int) bu.s.high)
+		return 0;
+	else if ((unsigned int) au.s.high > (unsigned int) bu.s.high)
+		return 2;
+	if ((unsigned int) au.s.low < (unsigned int) bu.s.low)
+		return 0;
+	else if ((unsigned int) au.s.low > (unsigned int) bu.s.low)
+		return 2;
+	return 1;
+}
+EXPORT_SYMBOL(__ucmpdi2);
-- 
2.13.0

