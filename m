Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:50709 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751651AbeBBQVV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:21:21 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/7] [HACK] x86: lto: always link in library files
Date: Fri,  2 Feb 2018 17:20:59 +0100
Message-Id: <20180202162104.2300532-2-arnd@arndb.de>
In-Reply-To: <20180202161550.2106846-1-arnd@arndb.de>
References: <20180202161550.2106846-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Building with LTO on gcc-8, I got many link failures like this:

./ccWpIHzj.ltrans0.ltrans.o: In function `siox_poll_thread':
<artificial>:(.text+0x3042): undefined reference to `memset'
./ccWpIHzj.ltrans0.ltrans.o: In function `iio_push_to_buffers':
<artificial>:(.text+0xdd22): undefined reference to `memcpy'
./ccWpIHzj.ltrans0.ltrans.o: In function `dln2_adc_trigger_h':
<artificial>:(.text+0x24175): undefined reference to `memcpy'
<artificial>:(.text+0x241ec): undefined reference to `memset'
./ccWpIHzj.ltrans3.ltrans.o: In function `ir_update_mapping.isra.1':
<artificial>:(.text+0x1d5a5): undefined reference to `memmove'
./ccWpIHzj.ltrans3.ltrans.o: In function `ir_establish_scancode':
<artificial>:(.text+0x1d6c9): undefined reference to `memmove'
./ccWpIHzj.ltrans9.ltrans.o: In function `write_rbu_image_type':
<artificial>:(.text+0x92d6): undefined reference to `strstr'

It seems that the linker fails to pull in the lib.a file for some
reason I have not found out. We want a proper fix for this, but
in the meantime, this simply makes all those files built-in
all the time, which does the right thing with LTO but might
produce a slightly larger kernel image without it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/lib/Makefile | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 25a972c61b0a..d49f02fd79d6 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -20,32 +20,33 @@ clean-files := inat-tables.c
 
 obj-$(CONFIG_SMP) += msr-smp.o cache-smp.o
 
-lib-y := delay.o misc.o cmdline.o cpu.o
-lib-y += usercopy_$(BITS).o usercopy.o getuser.o putuser.o
-lib-y += memcpy_$(BITS).o
-lib-$(CONFIG_RWSEM_XCHGADD_ALGORITHM) += rwsem.o
-lib-$(CONFIG_INSTRUCTION_DECODER) += insn.o inat.o insn-eval.o
-lib-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
-lib-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
-lib-$(CONFIG_RETPOLINE) += retpoline.o
+lib-y += delay.o
+obj-y += misc.o cmdline.o cpu.o
+obj-y += usercopy_$(BITS).o usercopy.o getuser.o putuser.o
+obj-y += memcpy_$(BITS).o
+obj-$(CONFIG_RWSEM_XCHGADD_ALGORITHM) += rwsem.o
+obj-$(CONFIG_INSTRUCTION_DECODER) += insn.o inat.o insn-eval.o
+obj-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
+obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
+obj-$(CONFIG_RETPOLINE) += retpoline.o
 
 obj-y += msr.o msr-reg.o msr-reg-export.o hweight.o
 
 ifeq ($(CONFIG_X86_32),y)
         obj-y += atomic64_32.o
-        lib-y += atomic64_cx8_32.o
-        lib-y += checksum_32.o
-        lib-y += strstr_32.o
-        lib-y += string_32.o
+        obj-y += atomic64_cx8_32.o
+        obj-y += checksum_32.o
+        obj-y += strstr_32.o
+        obj-y += string_32.o
 ifneq ($(CONFIG_X86_CMPXCHG64),y)
-        lib-y += cmpxchg8b_emu.o atomic64_386_32.o
+        obj-y += cmpxchg8b_emu.o atomic64_386_32.o
 endif
-        lib-$(CONFIG_X86_USE_3DNOW) += mmx_32.o
+        obj-$(CONFIG_X86_USE_3DNOW) += mmx_32.o
 else
         obj-y += iomap_copy_64.o
-        lib-y += csum-partial_64.o csum-copy_64.o csum-wrappers_64.o
-        lib-y += clear_page_64.o copy_page_64.o
-        lib-y += memmove_64.o memset_64.o
-        lib-y += copy_user_64.o
-	lib-y += cmpxchg16b_emu.o
+        obj-y += csum-partial_64.o csum-copy_64.o csum-wrappers_64.o
+        obj-y += clear_page_64.o copy_page_64.o
+        obj-y += memmove_64.o memset_64.o
+        obj-y += copy_user_64.o
+	obj-y += cmpxchg16b_emu.o
 endif
-- 
2.9.0

