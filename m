Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:59005 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750983AbdLUNsr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Dec 2017 08:48:47 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [v4] kasan: rework Kconfig settings
Date: Thu, 21 Dec 2017 14:46:39 +0100
Message-Id: <20171221134744.2295529-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@kernel.org>, Byungchul Park <byungchul.park@lge.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

We get a lot of very large stack frames using gcc-7.0.1 with the default
-fsanitize-address-use-after-scope --param asan-stack=1 options, which
can easily cause an overflow of the kernel stack, e.g.

drivers/gpu/drm/i915/gvt/handlers.c:2434:1: warning: the frame size of 46176 bytes is larger than 3072 bytes
drivers/net/wireless/ralink/rt2x00/rt2800lib.c:5650:1: warning: the frame size of 23632 bytes is larger than 3072 bytes
lib/atomic64_test.c:250:1: warning: the frame size of 11200 bytes is larger than 3072 bytes
drivers/gpu/drm/i915/gvt/handlers.c:2621:1: warning: the frame size of 9208 bytes is larger than 3072 bytes
drivers/media/dvb-frontends/stv090x.c:3431:1: warning: the frame size of 6816 bytes is larger than 3072 bytes
fs/fscache/stats.c:287:1: warning: the frame size of 6536 bytes is larger than 3072 bytes

To reduce this risk, -fsanitize-address-use-after-scope is now split
out into a separate CONFIG_KASAN_EXTRA Kconfig option, leading to stack
frames that are smaller than 2 kilobytes most of the time on x86_64. An
earlier version of this patch also prevented combining KASAN_EXTRA with
KASAN_INLINE, but that is no longer necessary with gcc-7.0.1.

All patches to get the frame size below 2048 bytes with CONFIG_KASAN=y and
CONFIG_KASAN_EXTRA=n have been merged by maintainers now, so we can bring
back that default now. KASAN_EXTRA=y still causes lots of warnings but now
defaults to !COMPILE_TEST to disable it in allmodconfig, and it remains
disabled in all other defconfigs since it is a new option.  I arbitrarily
raise the warning limit for KASAN_EXTRA to 3072 to reduce the noise,
but an allmodconfig kernel still has around 50 warnings on gcc-7.

I experimented a bit more with smaller stack frames and have another
follow-up series that reduces the warning limit for 64-bit architectures
to 1280 bytes (without CONFIG_KASAN).

With earlier versions of this patch series, I also had patches to
address the warnings we get with KASAN and/or KASAN_EXTRA, using a
"noinline_if_stackbloat" annotation. That annotation now got replaced with
a gcc-8 bugfix (see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715)
and a workaround for older compilers, which means that KASAN_EXTRA is
now just as bad as before and will lead to an instant stack overflow in
a few extreme cases.

This reverts parts of commit commit 3f181b4 ("lib/Kconfig.debug: disable
-Wframe-larger-than warnings with KASAN=y").
Two patches in linux-next should be merged first to avoid introducing
warnings in an allmodconfig build:
3cd890dbe2a4 ("media: dvb-frontends: fix i2c access helpers for KASAN")
16c3ada89cff ("media: r820t: fix r820t_write_reg for KASAN")

Cc: stable@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
---
 lib/Kconfig.debug      |  2 +-
 lib/Kconfig.kasan      | 11 +++++++++++
 scripts/Makefile.kasan |  3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 811e5019b36a..84b4ffa67596 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -217,7 +217,7 @@ config ENABLE_MUST_CHECK
 config FRAME_WARN
 	int "Warn for stack frames larger than (needs gcc 4.4)"
 	range 0 8192
-	default 0 if KASAN
+	default 3072 if KASAN_EXTRA
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
 	default 1280 if (!64BIT && PARISC)
 	default 1024 if (!64BIT && !PARISC)
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index e39de4191480..8613a6fc4bda 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -21,6 +21,17 @@ config KASAN
 	  Currently CONFIG_KASAN doesn't work with CONFIG_DEBUG_SLAB
 	  (the resulting kernel does not boot).
 
+config KASAN_EXTRA
+	bool "KAsan: extra checks"
+	depends on KASAN && DEBUG_KERNEL && !COMPILE_TEST
+	help
+	  This enables further checks in the kernel address sanitizer, for now
+	  it only includes the address-use-after-scope check that can lead
+	  to excessive kernel stack usage, frame size warnings and longer
+	  compile time.
+	  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715 has more
+
+
 choice
 	prompt "Instrumentation type"
 	depends on KASAN
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 1ce7115aa499..02f4d2974073 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -30,5 +30,8 @@ else
     endif
 endif
 
+ifdef CONFIG_KASAN_EXTRA
 CFLAGS_KASAN += $(call cc-option, -fsanitize-address-use-after-scope)
 endif
+
+endif
-- 
2.9.0

