Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:50197 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfBSVt6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 16:49:58 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
Date: Tue, 19 Feb 2019 22:49:06 +0100
Message-Id: <20190219214940.391081-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Dmitry Vyukov <dvyukov@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, Qian Cai <cai@lca.pw>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, Andrey Konovalov <andreyknvl@google.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com

Building an arm64 allmodconfig kernel with clang results in over 140 warnings
about overly large stack frames, the worst ones being:

drivers/gpu/drm/panel/panel-sitronix-st7789v.c:196:12: error: stack frame size of 20224 bytes in function 'st7789v_prepare'
drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c:196:12: error: stack frame size of 13120 bytes in function 'td028ttec1_panel_enable'
drivers/usb/host/max3421-hcd.c:1395:1: error: stack frame size of 10048 bytes in function 'max3421_spi_thread'
drivers/net/wan/slic_ds26522.c:209:12: error: stack frame size of 9664 bytes in function 'slic_ds26522_probe'
drivers/crypto/ccp/ccp-ops.c:2434:5: error: stack frame size of 8832 bytes in function 'ccp_run_cmd'
drivers/media/dvb-frontends/stv0367.c:1005:12: error: stack frame size of 7840 bytes in function 'stv0367ter_algo'

None of these happen with gcc today, and almost all of these are the result
of a single known bug in llvm.  Hopefully it will eventually get fixed with the
clang-9 release.

In the meantime, the best idea I have is to turn off asan-stack for clang-8
and earlier, so we can produce a kernel that is safe to run.

I have posted three patches that address the frame overflow warnings that are
not addressed by turning off asan-stack, so in combination with this change,
we get much closer to a clean allmodconfig build, which in turn is necessary
to do meaningful build regression testing.

Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Qian Cai <cai@lca.pw>
Link: https://bugs.llvm.org/show_bug.cgi?id=38809
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/Kconfig.kasan      | 13 +++++++++++++
 scripts/Makefile.kasan |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index 67d7d1309c52..219cddc913ac 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -103,6 +103,19 @@ config KASAN_INLINE
 
 endchoice
 
+config KASAN_STACK
+	int
+	default 0 if CC_IS_CLANG && (CLANG_VERSION < 90000)
+	default 1
+	help
+	  The LLVM stack address sanitizer has a know bug that
+	  causes excessive stack usage in a lot of functions, see
+	  https://bugs.llvm.org/show_bug.cgi?id=38809
+	  Disabling asan-stack makes it safe to run kernels build
+	  with clang-8 with KASAN enabled, though it loses some of
+	  the functionality.  We assume that clang-9 will have a fix,
+	  so the feature can be used.
+
 config KASAN_S390_4_LEVEL_PAGING
 	bool "KASan: use 4-level paging"
 	depends on KASAN && S390
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index f1fb8e502657..6410bd22fe38 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -26,7 +26,7 @@ else
 	CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
 	 $(call cc-param,asan-globals=1) \
 	 $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
-	 $(call cc-param,asan-stack=1) \
+	 $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK)) \
 	 $(call cc-param,asan-instrument-allocas=1)
 endif
 
-- 
2.20.0
