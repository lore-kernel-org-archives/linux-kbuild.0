Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:36322 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756501AbeEJFRX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 01:17:23 -0400
Received: by mail-pl0-f68.google.com with SMTP id v24-v6so610941plo.3
        for <linux-kbuild@vger.kernel.org>; Wed, 09 May 2018 22:17:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 4/5] powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
Date: Thu, 10 May 2018 15:16:58 +1000
Message-Id: <20180510051659.15356-5-npiggin@gmail.com>
In-Reply-To: <20180510051659.15356-1-npiggin@gmail.com>
References: <20180510051659.15356-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

The powerpc toolchain can compile combinations of 32/64 bit and
big/little endian, so it's convenient to consider, e.g.,

  `CC -m64 -mbig-endian`

To be the C compiler for the purpose of invoking it to build target
artifacts. So overriding the the CC variable to include thse flags
works for this purpose.

Unfortunately that is not compatible with the way the proposed new
Kconfig macro language will work.

After previous patches in this series, these flags can be carefully
passed in using flags instead.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile   | 16 +++++++++-------
 scripts/recordmcount.pl |  8 ++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a40f59ca2afe..5f3ec8029e50 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -70,13 +70,15 @@ endif
 endif
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
-override LD	+= -EL
+KBUILD_CFLAGS	+= -mlittle-endian
+LDFLAGS		+= -EL
 LDEMULATION	:= lppc
 GNUTARGET	:= powerpcle
 MULTIPLEWORD	:= -mno-multiple
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
 else
-override LD	+= -EB
+KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
+LDFLAGS		+= -EB
 LDEMULATION	:= ppc
 GNUTARGET	:= powerpc
 MULTIPLEWORD	:= -mmultiple
@@ -89,19 +91,19 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
 endif
 
-cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
 ifneq ($(cc-name),clang)
   cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mno-strict-align
 endif
 
+cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
+cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 
 ifeq ($(HAS_BIARCH),y)
-override AS	+= -a$(BITS)
-override LD	+= -m elf$(BITS)$(LDEMULATION)
-override CC	+= -m$(BITS)
+KBUILD_CFLAGS	+= -m$(BITS)
+KBUILD_AFLAGS	+= -m$(BITS) -Wl,-a$(BITS)
+LDFLAGS		+= -m elf$(BITS)$(LDEMULATION)
 KBUILD_ARFLAGS	+= --target=elf$(BITS)-$(GNUTARGET)
 endif
 
diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index 191eb949d52c..919711dd9d6c 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -274,6 +274,14 @@ if ($arch eq "x86_64") {
     if ($bits == 64) {
 	$type = ".quad";
     }
+    $ld .= " -EB ";
+    if ($endian eq "big") {
+	    $cc .= " -mbig-endian ";
+	    $ld .= " -EB ";
+    } else {
+	    $cc .= " -mlittle-endian ";
+	    $ld .= " -EL ";
+    }
 
 } elsif ($arch eq "arm") {
     $alignment = 2;
-- 
2.17.0

