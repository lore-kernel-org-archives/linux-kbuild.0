Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:65259 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933931AbcKVWzJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Nov 2016 17:55:09 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kasan: turn off -fsanitize-address-use-after-scope for now
Date: Tue, 22 Nov 2016 23:54:06 +0100
Message-Id: <20161122225424.3739294-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Martin=20Li=C5=A1ka?= <marxin@gcc.gnu.org>, Andrey Ryabinin <a.ryabinin@samsung.com>, stable@vger.kernel.org, Michal Marek <mmarek@suse.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org

In the upcoming gcc-7 release, the -fsanitize=kernel-address option
implies -fsanitize-address-use-after-scope, which relies on the
definition of two global functions, causing many link errors if they
are not defined, e.g:

arch/x86/built-in.o: In function `x86_pmu_handle_irq':
(.text+0x88e6): undefined reference to `__asan_unpoison_stack_memory'
arch/x86/built-in.o: In function `x86_pmu_handle_irq':
(.text+0x8ad7): undefined reference to `__asan_poison_stack_memory'
kernel/built-in.o: In function `perf_tp_event':
(.text+0x225472): undefined reference to `__asan_unpoison_stack_memory'
kernel/built-in.o: In function `perf_tp_event':
(.text+0x22583a): undefined reference to `__asan_unpoison_stack_memory'
kernel/built-in.o: In function `perf_tp_event':
(.text+0x2258ae): undefined reference to `__asan_poison_stack_memory'
kernel/built-in.o: In function `perf_event_aux_event':

I think we really want to define those two functions so we can make
use of a helpful feature, but as I have no idea what they are supposed
to do, I'd suggest to turn the option off on existing kernels to allow
building with gcc-7 and kasan.

For some reason, the problem showed up in only a few randconfig builds,
but it is easy to reproduce using an x86-64 tinyconfig build with
CONFIG_KASAN=y.

If we decide to take this approach, we probably want to do the same
change on all stable kernels that support KASAN, i.e. v4.0 or higher.

Link: https://gcc.gnu.org/viewcvs/gcc?limit_changes=0&view=revision&revision=241896
Cc: Martin Liška <marxin@gcc.gnu.org>
Cc: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.kasan | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 37323b0df374..0e68fef09f76 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -29,3 +29,5 @@ else
     endif
 endif
 endif
+
+CFLAGS_KASAN += $(call cc-option, -fno-sanitize-address-use-after-scope)
-- 
2.9.0

