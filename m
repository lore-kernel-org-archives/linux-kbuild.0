Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:2070 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755985AbaBRO3s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:29:48 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 01/20] x86, lto: Disable LTO for the x86 VDSO
Date: Tue, 18 Feb 2014 15:28:39 +0100
Message-Id: <1392733738-8290-2-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

The VDSO does not play well with LTO, so just disable LTO for it.
Also pass a 32bit linker flag for the 32bit version.

Cc: x86@kernel.org
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/vdso/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/x86/vdso/Makefile b/arch/x86/vdso/Makefile
index fd14be1..db0626c 100644
--- a/arch/x86/vdso/Makefile
+++ b/arch/x86/vdso/Makefile
@@ -2,6 +2,8 @@
 # Building vDSO images for x86.
 #
 
+KBUILD_CFLAGS += $(DISABLE_LTO)
+
 VDSO64-$(CONFIG_X86_64)		:= y
 VDSOX32-$(CONFIG_X86_X32_ABI)	:= y
 VDSO32-$(CONFIG_X86_32)		:= y
@@ -35,7 +37,8 @@ export CPPFLAGS_vdso.lds += -P -C
 
 VDSO_LDFLAGS_vdso.lds = -m64 -Wl,-soname=linux-vdso.so.1 \
 			-Wl,--no-undefined \
-		      	-Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
+			-Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096 \
+			$(DISABLE_LTO)
 
 $(obj)/vdso.o: $(src)/vdso.S $(obj)/vdso.so
 
@@ -127,7 +130,7 @@ vdso32.so-$(VDSO32-y)		+= sysenter
 vdso32-images			= $(vdso32.so-y:%=vdso32-%.so)
 
 CPPFLAGS_vdso32.lds = $(CPPFLAGS_vdso.lds)
-VDSO_LDFLAGS_vdso32.lds = -m32 -Wl,-soname=linux-gate.so.1
+VDSO_LDFLAGS_vdso32.lds = -m32 -Wl,-m,elf_i386 -Wl,-soname=linux-gate.so.1
 
 # This makes sure the $(obj) subdirectory exists even though vdso32/
 # is not a kbuild sub-make subdirectory.
@@ -181,7 +184,8 @@ quiet_cmd_vdso = VDSO    $@
 		       -Wl,-T,$(filter %.lds,$^) $(filter %.o,$^) && \
 		 sh $(srctree)/$(src)/checkundef.sh '$(NM)' '$@'
 
-VDSO_LDFLAGS = -fPIC -shared $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
+VDSO_LDFLAGS = -fPIC -shared $(call cc-ldoption, -Wl$(comma)--hash-style=sysv) \
+		${LTO_CFLAGS}
 GCOV_PROFILE := n
 
 #
-- 
1.8.5.2

