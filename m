Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:64945 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753912Ab2HSC5n (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:43 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 40/74] lto, powerpc: Disable LTO for the powerpc VDSO
Date: Sat, 18 Aug 2012 19:56:36 -0700
Message-Id: <1345345030-22211-41-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, benh@kernel.crashing.org

From: Andi Kleen <ak@linux.intel.com>

VDSO does not play well with LTO, so just disable it.

(note that powerpc will likely need more changes for LTO, this was
just from grep)

Cc: benh@kernel.crashing.org
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/powerpc/kernel/vdso32/Makefile |    2 +-
 arch/powerpc/kernel/vdso64/Makefile |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 53e6c9b..8cc88bf 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -16,7 +16,7 @@ obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
 
 GCOV_PROFILE := n
 
-ccflags-y := -shared -fno-common -fno-builtin
+ccflags-y := -shared -fno-common -fno-builtin $(DISABLE_LTO)
 ccflags-y += -nostdlib -Wl,-soname=linux-vdso32.so.1 \
 		$(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
 asflags-y := -D__VDSO32__ -s
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index effca94..5bca644 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -9,7 +9,7 @@ obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
 
 GCOV_PROFILE := n
 
-ccflags-y := -shared -fno-common -fno-builtin
+ccflags-y := -shared -fno-common -fno-builtin $(DISABLE_LTO)
 ccflags-y += -nostdlib -Wl,-soname=linux-vdso64.so.1 \
 		$(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
 asflags-y := -D__VDSO64__ -s
-- 
1.7.7.6

