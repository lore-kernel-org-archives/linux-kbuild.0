Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:44615 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbfGCU41 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jul 2019 16:56:27 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/3] kasan: disable CONFIG_KASAN_STACK with clang on arm32
Date: Wed,  3 Jul 2019 22:54:37 +0200
Message-Id: <20190703205527.955320-2-arnd@arndb.de>
In-Reply-To: <20190703205527.955320-1-arnd@arndb.de>
References: <20190703205527.955320-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Abbott Liu <liuwenliang@huawei.com>, linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@google.com>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

The CONFIG_KASAN_STACK symbol tells us whether we should be using the
asan-stack=1 parameter. On clang-8, this causes explosive kernel stack
frame growth, so it is currently disabled, hopefully to be turned back
on when a future clang version is fixed. Examples include

drivers/media/dvb-frontends/mb86a20s.c:1942:12: error: stack frame size of 4128 bytes in function
drivers/net/wireless/atmel/atmel.c:1307:5: error: stack frame size of 4928 bytes in function 'atmel_open'
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1521:1: error: stack frame size of 5440 bytes in function
drivers/media/i2c/mt9t112.c:670:12: error: stack frame size of 9344 bytes in function 'mt9t112_init_camera'
drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c:185:12: error: stack frame size of 10048 bytes

For the 32-bit ARM build, the logic I introduced earlier does
not work because $(CFLAGS_KASAN_SHADOW) is empty, and we don't add
those flags.

Moving the asan-stack= parameter down fixes this. No idea of any
of the other parameters should also be moved though.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.kasan | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 6410bd22fe38..fc57fcf49722 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -26,10 +26,11 @@ else
 	CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
 	 $(call cc-param,asan-globals=1) \
 	 $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
-	 $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK)) \
 	 $(call cc-param,asan-instrument-allocas=1)
 endif
 
+CFLAGS_KASAN += $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK))
+
 endif # CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_SW_TAGS
-- 
2.20.0
