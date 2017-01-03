Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57125 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757907AbdACOP2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jan 2017 09:15:28 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 1/3] asm-prototypes: Clear any CPP defines before declaring the functions
Date: Tue,  3 Jan 2017 15:14:54 +0100
Message-Id: <20170103141456.12743-1-mmarek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Adam Borowski <kilobyte@angband.pl>

The asm-prototypes.h file is used to provide dummy function declarations
for genksyms, when processing asm files with EXPORT_SYMBOL. Make sure
that any architecture defines get out of our way. x86 currently has an
issue with memcpy on 64bit with CONFIG_KMEMCHECK=y and with
memset/__memset on 32bit:

	$ cat init/test.c
	#include <asm/asm-prototypes.h>
	$ make -s init/test.o
	$ make -s init/test.o
	In file included from ./arch/x86/include/asm/string.h:4:0,
			 from ./include/linux/string.h:18,
			 from ./include/linux/bitmap.h:8,
			 from ./include/linux/cpumask.h:11,
			 from ./arch/x86/include/asm/cpumask.h:4,
			 from ./arch/x86/include/asm/msr.h:10,
			 from ./arch/x86/include/asm/processor.h:20,
			 from ./arch/x86/include/asm/cpufeature.h:4,
			 from ./arch/x86/include/asm/thread_info.h:52,
			 from ./include/linux/thread_info.h:25,
			 from ./arch/x86/include/asm/preempt.h:6,
			 from ./include/linux/preempt.h:59,
			 from ./include/linux/spinlock.h:50,
			 from ./include/linux/seqlock.h:35,
			 from ./include/linux/time.h:5,
			 from ./include/uapi/linux/timex.h:56,
			 from ./include/linux/timex.h:56,
			 from ./include/linux/sched.h:19,
			 from ./include/linux/uaccess.h:4,
			 from ./arch/x86/include/asm/asm-prototypes.h:2,
			 from init/test.c:1:
	./arch/x86/include/asm/string_64.h:52:47: error: expected declaration specifiers or ‘...’ before ‘(’ token
	 #define memcpy(dst, src, len) __inline_memcpy((dst), (src), (len))
	 ./include/asm-generic/asm-prototypes.h:6:14: note: in expansion of macro ‘memcpy’
	  extern void *memcpy(void *, const void *, __kernel_size_t);

						       ^
	...

During real build, this manifests itself by genksyms segfaulting.

Reported-by: Borislav Petkov <bp@alien8.de>
Cc: Adam Borowski <kilobyte@angband.pl>
Signed-off-by: Michal Marek <mmarek@suse.com>
---
 include/asm-generic/asm-prototypes.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/asm-generic/asm-prototypes.h b/include/asm-generic/asm-prototypes.h
index df13637e4017..939869c772b1 100644
--- a/include/asm-generic/asm-prototypes.h
+++ b/include/asm-generic/asm-prototypes.h
@@ -1,7 +1,13 @@
 #include <linux/bitops.h>
+#undef __memset
 extern void *__memset(void *, int, __kernel_size_t);
+#undef __memcpy
 extern void *__memcpy(void *, const void *, __kernel_size_t);
+#undef __memmove
 extern void *__memmove(void *, const void *, __kernel_size_t);
+#undef memset
 extern void *memset(void *, int, __kernel_size_t);
+#undef memcpy
 extern void *memcpy(void *, const void *, __kernel_size_t);
+#undef memmove
 extern void *memmove(void *, const void *, __kernel_size_t);
-- 
2.10.2

