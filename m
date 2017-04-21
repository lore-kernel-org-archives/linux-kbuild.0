Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:58666 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033632AbdDUGWT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 02:22:19 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 2/2] kbuild: fix asm-offset generation to work with clang
Date: Fri, 21 Apr 2017 15:21:11 +0900
Message-Id: <1492755671-19005-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1492755671-19005-1-git-send-email-yamada.masahiro@socionext.com>
References: <1492755671-19005-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Matthias Kaehlcke <mka@chromium.org>, David Howells <dhowells@redhat.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, Jeroen Hofstee <jeroen@myspectrum.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

From: Jeroen Hofstee <jeroen@myspectrum.nl>

KBuild abuses the asm statement to write to a file and
clang chokes about these invalid asm statements. Hack it
even more by fooling this is actual valid asm code.

[masahiro:
 Import Jeroen's work for U-Boot:
 http://patchwork.ozlabs.org/patch/375026/
 Tweak sed script a little to avoid garbage '#' for GCC case, like
 #define NR_PAGEFLAGS 23 /* __NR_PAGEFLAGS       # */ ]

Signed-off-by: Jeroen Hofstee <jeroen@myspectrum.nl>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
  - V1 did not work with LLVM's integrated assembler because
    it uses <tab> instead of <space> around the .ascii string.
    Restore [:space:].

 include/linux/kbuild.h | 6 +++---
 scripts/Makefile.lib   | 8 ++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/kbuild.h b/include/linux/kbuild.h
index 22a7219..4e80f3a 100644
--- a/include/linux/kbuild.h
+++ b/include/linux/kbuild.h
@@ -2,14 +2,14 @@
 #define __LINUX_KBUILD_H
 
 #define DEFINE(sym, val) \
-        asm volatile("\n->" #sym " %0 " #val : : "i" (val))
+	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
 
-#define BLANK() asm volatile("\n->" : : )
+#define BLANK() asm volatile("\n.ascii \"->\"" : : )
 
 #define OFFSET(sym, str, mem) \
 	DEFINE(sym, offsetof(struct str, mem))
 
 #define COMMENT(x) \
-	asm volatile("\n->#" x)
+	asm volatile("\n.ascii \"->#" x "\"")
 
 #endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 9c20690..9e70196 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -413,10 +413,14 @@ cmd_xzmisc = (cat $(filter-out FORCE,$^) | \
 # ---------------------------------------------------------------------------
 
 # Default sed regexp - multiline due to syntax constraints
+#
+# Use [:space:] because LLVM's integrated assembler inserts <tab> around
+# the .ascii directive whereas GCC keeps the <space> as-is.
 define sed-offsets
-	"/^->/{s:->#\(.*\):/* \1 */:; \
+	's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; \
+	/^->/{s:->#\(.*\):/* \1 */:; \
 	s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
-	s:->::; p;}"
+	s:->::; p;}'
 endef
 
 # Use filechk to avoid rebuilds when a header changes, but the resulting file
-- 
2.7.4

