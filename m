Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:35729 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751639AbcLKBJt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Dec 2016 20:09:49 -0500
From: Adam Borowski <kilobyte@angband.pl>
Date: Sun, 11 Dec 2016 02:09:18 +0100
Message-Id: <20161211010918.16050-1-kilobyte@angband.pl>
In-Reply-To: <20161211005211.GA11607@angband.pl>
References: <20161211005211.GA11607@angband.pl>
Subject: [PATCH v3 1/1] x86/kbuild: enable modversions for symbols exported from asm
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Adam Borowski <kilobyte@angband.pl>

Commit 4efca4ed ("kbuild: modversions for EXPORT_SYMBOL() for asm") adds
modversion support for symbols exported from asm files. Architectures
must include C-style declarations for those symbols in asm/asm-prototypes.h
in order for them to be versioned.

Add these declarations for x86, and an architecture-independent file that
can be used for common symbols.

With f27c2f6 reverting 8ab2ae6 ("default exported asm symbols to zero") we
produce a scary warning on x86, this commit fixes that.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
Tested-by: Kalle Valo <kvalo@codeaurora.org>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
Tested-by: Peter Wu <peter@lekensteyn.nl>
Tested-by: Oliver Hartkopp <socketcan@hartkopp.net>
---
 arch/x86/include/asm/asm-prototypes.h | 16 ++++++++++++++++
 include/asm-generic/asm-prototypes.h  |  7 +++++++
 2 files changed, 23 insertions(+)
 create mode 100644 arch/x86/include/asm/asm-prototypes.h
 create mode 100644 include/asm-generic/asm-prototypes.h

diff --git a/arch/x86/include/asm/asm-prototypes.h b/arch/x86/include/asm/asm-prototypes.h
new file mode 100644
index 000000000000..44b8762fa0c7
--- /dev/null
+++ b/arch/x86/include/asm/asm-prototypes.h
@@ -0,0 +1,16 @@
+#include <asm/ftrace.h>
+#include <asm/uaccess.h>
+#include <asm/string.h>
+#include <asm/page.h>
+#include <asm/checksum.h>
+
+#include <asm-generic/asm-prototypes.h>
+
+#include <asm/page.h>
+#include <asm/pgtable.h>
+#include <asm/special_insns.h>
+#include <asm/preempt.h>
+
+#ifndef CONFIG_X86_CMPXCHG64
+extern void cmpxchg8b_emu(void);
+#endif
diff --git a/include/asm-generic/asm-prototypes.h b/include/asm-generic/asm-prototypes.h
new file mode 100644
index 000000000000..df13637e4017
--- /dev/null
+++ b/include/asm-generic/asm-prototypes.h
@@ -0,0 +1,7 @@
+#include <linux/bitops.h>
+extern void *__memset(void *, int, __kernel_size_t);
+extern void *__memcpy(void *, const void *, __kernel_size_t);
+extern void *__memmove(void *, const void *, __kernel_size_t);
+extern void *memset(void *, int, __kernel_size_t);
+extern void *memcpy(void *, const void *, __kernel_size_t);
+extern void *memmove(void *, const void *, __kernel_size_t);
-- 
2.11.0

