Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:46920 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751406AbdCWNBS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Mar 2017 09:01:18 -0400
From: Chao Peng <chao.p.peng@linux.intel.com>
Subject: [PATCH] x86/boot: Support uncompressed kernel
Date: Thu, 23 Mar 2017 08:51:07 -0400
Message-Id: <1490273467-97948-1-git-send-email-chao.p.peng@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org, Michal Marek <mmarek@suse.com>, Kees Cook <keescook@chromium.org>, Yinghai Lu <yinghai@kernel.org>, Baoquan He <bhe@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chao Peng <chao.p.peng@linux.intel.com>, Borislav Petkov <bp@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Petr Mladek <pmladek@suse.com>, "David S. Miller" <davem@davemloft.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Thomas Garnier <thgarnie@google.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Tejun Heo <tj@kernel.org>, Daniel Mack <daniel@zonque.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Helge Deller <deller@gmx.de>, Rik van Riel <riel@redhat.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Compressed kernel has its own drawback: uncompressing takes time. Even
though the time is short enough to ignore for most cases but for cases that
time is critical this is still a big number. In our on-going optimization
for kernel boot time, the measured overall kernel boot time is ~90ms while
the uncompressing takes ~50ms with gzip.

The patch adds a 'CONFIG_KERNEL_RAW' configure choice so the built binary
can have no uncompressing at all. The experiment shows:

    kernel               kernel size    time in decompress_kernel
    compressed (gzip)    3.3M           53ms
    uncompressed         14M            3ms

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/boot/compressed/Makefile |  3 +++
 arch/x86/boot/compressed/misc.c   | 14 ++++++++++++++
 init/Kconfig                      |  7 +++++++
 scripts/Makefile.lib              |  8 ++++++++
 4 files changed, 32 insertions(+)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index f9ce75d..fc0e1c0 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -73,6 +73,8 @@ $(obj)/vmlinux.relocs: vmlinux FORCE
 vmlinux.bin.all-y := $(obj)/vmlinux.bin
 vmlinux.bin.all-$(CONFIG_X86_NEED_RELOCS) += $(obj)/vmlinux.relocs
 
+$(obj)/vmlinux.bin.raw: $(vmlinux.bin.all-y) FORCE
+	$(call if_changed,raw)
 $(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,gzip)
 $(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y) FORCE
@@ -86,6 +88,7 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4)
 
+suffix-$(CONFIG_KERNEL_RAW)	:= raw
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
 suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 79dac17..fb3cd43 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -123,6 +123,20 @@ static char *vidmem;
 static int vidport;
 static int lines, cols;
 
+#ifdef CONFIG_KERNEL_RAW
+#include <linux/decompress/mm.h>
+static int __decompress(unsigned char *buf, long len,
+			long (*fill)(void*, unsigned long),
+			long (*flush)(void*, unsigned long),
+			unsigned char *outbuf, long olen,
+			long *pos,
+			void (*error)(char *x))
+{
+	memcpy(outbuf, buf, olen);
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_KERNEL_GZIP
 #include "../../../../lib/decompress_inflate.c"
 #endif
diff --git a/init/Kconfig b/init/Kconfig
index 2232080..1db2ea2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -137,6 +137,13 @@ choice
 
 	  If in doubt, select 'gzip'
 
+config KERNEL_RAW
+	bool "RAW"
+	help
+	  No compression. It creates much bigger kernel and uses much more
+	  space (disk/memory) than other choices. It can be useful when
+	  decompression speed is the most concern while space is not a problem.
+
 config KERNEL_GZIP
 	bool "Gzip"
 	depends on HAVE_KERNEL_GZIP
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 2edbcad..384128d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -344,6 +344,14 @@ cmd_lz4 = (cat $(filter-out FORCE,$^) | \
 	lz4c -l -c1 stdin stdout && $(call size_append, $(filter-out FORCE,$^))) > $@ || \
 	(rm -f $@ ; false)
 
+# RAW
+# ---------------------------------------------------------------------------
+quiet_cmd_raw = RAW     $@
+cmd_raw = (cat $(filter-out FORCE,$^) && \
+	$(call size_append, $(filter-out FORCE,$^))) > $@ || \
+	(rm -f $@ ; false)
+
+
 # U-Boot mkimage
 # ---------------------------------------------------------------------------
 
-- 
1.8.3.1

