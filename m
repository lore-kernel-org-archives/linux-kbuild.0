Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33676 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751027AbeFZRkQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jun 2018 13:40:16 -0400
Received: by mail-pf0-f193.google.com with SMTP id b17-v6so8423232pfi.0
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jun 2018 10:40:16 -0700 (PDT)
Date: Tue, 26 Jun 2018 10:40:13 -0700
From: Kees Cook <keescook@chromium.org>
Subject: [RFC][PATCH] Makefile: globally enable VLA warning
Message-ID: <20180626174013.GA41617@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Palmer Dabbelt <palmer@dabbelt.com>, Matt Redfearn <matt.redfearn@mips.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, David Airlie <airlied@linux.ie>, linux-kbuild@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Linus Torvalds <torvalds@linux-foundation.org>

This is the patch I've got prepared now that fixes for all VLAs have been
sent to maintainers (some are still under review/adjustment, but there
aren't any unexplored cases left). My intention would be to have this land
at the end of the next merge window after all the pending VLA patches
have landed. I just wanted to get any feedback here, since it touches
a couple areas in the process and I didn't want anyone to be surprised. :)

Thanks!

-Kees

----
Now that VLAs have been removed from the kernel, enable the VLA warning
globally. The only exceptions to this are the KASan an UBSan tests which
are explicitly checking that VLAs trigger their respective tests.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile                      | 3 +++
 drivers/gpu/drm/i915/Makefile | 2 +-
 lib/Makefile                  | 2 ++
 scripts/Makefile.extrawarn    | 1 -
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c9132594860b..3d5013ec4116 100644
--- a/Makefile
+++ b/Makefile
@@ -778,6 +778,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 # warn about C99 declaration after statement
 KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
 
+# VLAs should not be used anywhere in the kernel
+KBUILD_CFLAGS += $(call cc-option,-Wvla)
+
 # disable pointer signed / unsigned warnings in gcc 4.0
 KBUILD_CFLAGS += $(call cc-disable-warning, pointer-sign)
 
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4c6adae23e18..289ab5dc5712 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -12,7 +12,7 @@
 # Note the danger in using -Wall -Wextra is that when CI updates gcc we
 # will most likely get a sudden build breakage... Hopefully we will fix
 # new warnings before CI updates!
-subdir-ccflags-y := -Wall -Wextra -Wvla
+subdir-ccflags-y := -Wall -Wextra
 subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
 subdir-ccflags-y += $(call cc-disable-warning, type-limits)
 subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
diff --git a/lib/Makefile b/lib/Makefile
index 90dc5520b784..4720e276232e 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -52,7 +52,9 @@ obj-$(CONFIG_TEST_SYSCTL) += test_sysctl.o
 obj-$(CONFIG_TEST_HASH) += test_hash.o test_siphash.o
 obj-$(CONFIG_TEST_KASAN) += test_kasan.o
 CFLAGS_test_kasan.o += -fno-builtin
+CFLAGS_test_kasan.o += $(call cc-disable-warning, vla)
 obj-$(CONFIG_TEST_UBSAN) += test_ubsan.o
+CFLAGS_test_ubsan.o += $(call cc-disable-warning, vla)
 UBSAN_SANITIZE_test_ubsan.o := y
 obj-$(CONFIG_TEST_KSTRTOX) += test-kstrtox.o
 obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 8d5357053f86..24b2fb1d1297 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -52,7 +52,6 @@ warning-3 += -Wpointer-arith
 warning-3 += -Wredundant-decls
 warning-3 += -Wswitch-default
 warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
-warning-3 += $(call cc-option, -Wvla)
 
 warning := $(warning-$(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
 warning += $(warning-$(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
-- 
2.17.1


-- 
Kees Cook
Pixel Security
