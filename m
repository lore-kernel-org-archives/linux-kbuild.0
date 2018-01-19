Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:42918 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754951AbeASOyK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jan 2018 09:54:10 -0500
Received: by mail-wm0-f66.google.com with SMTP id b141so3963605wme.1
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Jan 2018 06:54:10 -0800 (PST)
From: Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH] kasan: don't emit builtin calls when sanitization is off
Date: Fri, 19 Jan 2018 15:54:02 +0100
Message-Id: <7d2dddbb7e4d4522fcf8e57c7da072c1ac76e1b0.1516373316.git.andreyknvl@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrey Konovalov <andreyknvl@google.com>

With KASAN enabled the kernel has two different memset() functions, one
with KASAN checks (memset) and one without (__memset). KASAN uses some
macro tricks to use the proper version where required. For example memset()
calls in mm/slub.c are without KASAN checks, since they operate on poisoned
slab object metadata.

The issue is that clang emits memset() calls even when there is no memset()
in the source code. They get linked with improper memset() implementation
and the kernel fails to boot due to a huge amount of KASAN reports during
early boot stages.

The solution is to add -fno-builtin flag for files with KASAN_SANITIZE := n
marker.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---

This patch should be applied on top of the v4 "kasan: support alloca, LLVM"
patchset from Paul Lawrence.

 Makefile               | 3 ++-
 scripts/Makefile.kasan | 3 +++
 scripts/Makefile.lib   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index bf5b8cbb9469..d45e31b293d0 100644
--- a/Makefile
+++ b/Makefile
@@ -432,7 +432,8 @@ export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
-export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE CFLAGS_KASAN CFLAGS_UBSAN
+export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
+export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE CFLAGS_UBSAN
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
 export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index dbbd4382f15a..db473309f136 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -39,4 +39,7 @@ else
 endif
 
 CFLAGS_KASAN += $(call cc-option, -fsanitize-address-use-after-scope)
+
+CFLAGS_KASAN_NOSANITIZE := $(call cc-option, -fno-builtin)
+
 endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1ca4dcd2d500..015aa9dbad86 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -121,7 +121,7 @@ endif
 ifeq ($(CONFIG_KASAN),y)
 _c_flags += $(if $(patsubst n%,, \
 		$(KASAN_SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)y), \
-		$(CFLAGS_KASAN))
+		$(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
 endif
 
 ifeq ($(CONFIG_UBSAN),y)
-- 
2.16.0.rc1.238.g530d649a79-goog

