Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:64180 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442228AbgDOVFf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Apr 2020 17:05:35 -0400
From: Kristen Carlson Accardi <kristen@linux.intel.com>
Subject: [PATCH 4/9] x86: Makefile: Add build and config option for CONFIG_FG_KASLR
Date: Wed, 15 Apr 2020 14:04:46 -0700
Message-Id: <20200415210452.27436-5-kristen@linux.intel.com>
In-Reply-To: <20200415210452.27436-1-kristen@linux.intel.com>
References: <20200415210452.27436-1-kristen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: keescook@chromium.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, x86@kernel.org
Cc: arjan@linux.intel.com, linux-kernel@vger.kernel.org, kernel-hardening@lists.openwall.com, rick.p.edgecomb@intel.com, linux-kbuild@vger.kernel.org

Allow user to select CONFIG_FG_KASLR if dependencies are met. Change
the make file to build with -ffunction-sections if CONFIG_FG_KASLR

Signed-off-by: Kristen Carlson Accardi <kristen@linux.intel.com>
---
 Makefile         |  4 ++++
 arch/x86/Kconfig | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Makefile b/Makefile
index 70def4907036..337b72787200 100644
--- a/Makefile
+++ b/Makefile
@@ -866,6 +866,10 @@ ifdef CONFIG_LIVEPATCH
 KBUILD_CFLAGS += $(call cc-option, -flive-patching=inline-clone)
 endif
 
+ifdef CONFIG_FG_KASLR
+KBUILD_CFLAGS += -ffunction-sections
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1d6104ea8af0..6aaece89f712 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2182,6 +2182,19 @@ config RANDOMIZE_BASE
 
 	  If unsure, say Y.
 
+config FG_KASLR
+	bool "Function Granular Kernel Address Space Layout Randomization"
+	depends on $(cc-option, -ffunction-sections)
+	depends on RANDOMIZE_BASE && X86_64
+	help
+	  This option improves the randomness of the kernel text
+	  over basic Kernel Address Space Layout Randomization (KASLR)
+	  by reordering the kernel text at boot time. This feature
+	  uses information generated at compile time to re-layout the
+	  kernel text section at boot time at function level granularity.
+
+	  If unsure, say N.
+
 # Relocation on x86 needs some additional build support
 config X86_NEED_RELOCS
 	def_bool y
-- 
2.20.1
