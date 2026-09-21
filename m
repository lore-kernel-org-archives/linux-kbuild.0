Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFBB52CCCD;
	Mon, 21 Sep 2026 22:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029909; cv=none; b=pwQL0O5sDXYmjYOIa6fopL18mbJR98+vp6eKp76VR3URjL7vnZFLFVqsvxKLrA7gx2gihbAuf1TQWO2GmTqxqRkQkAAym75zUiSL5juVqFSqhZGqQyoxCeF4h+/su7cWCdUKXSTXTsaqWzH+Gz3YQlaSC0Ewci1hD6HGdsItc/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029909; c=relaxed/simple;
	bh=6EzeVIiFFyaHeY7UvH2CuYeg5GC9vafeZlgVyc6Aifo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVLpeT15xPM/exByH41cGkwqQAK9mYG51LFZwtm8NOYa1p6JQo2m4gwJLOmWjamEvXQVVujIBTgi6D1g5rDXXudtN/vU5NqAGoiBlTVSOpREgJl+WIx/E155jPlH/l2gbkYSl7gYkAnATOxkRWATrXCXipJnjUMJndY+MJtX3t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ir3704Je; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ir3704Je"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3AA1F000FF;
	Mon, 21 Sep 2026 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029908;
	bh=LLPJxak0RGU/miOhGCQc5ox8yGM1mMBos5nm6pY2Xj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ir3704JeTPuDqzKkEt0mrVU2bLXaAXKvfl1ui99XXVlsO3jlX1zHaqhWORr9FU2pr
	 e6MmazfGEAVstf+FBCJFo9ZmdMKw/xDndN47hpAOZ1z+qY9rO5meKpZaPViSuKp80w
	 ugxK7581aOHKiVFN6heZ/p+/f6tDCK1P8ADSMPnkDsbA4+zd10Vz5nTx6NsmhhAfel
	 9ZVe9EQLOZ+jBXiSEHw4dlrbmn/xNlohoW9gzQ099zasmzY4JUxbRiuHL4on8GsxG/
	 aTGQe10G8DS5iwd6Ze9LF5R5FMkrPSydu9xaJ8665T7JGFBRojQPmoKG7dbRAyhlzd
	 6/naW5pk8AxeA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 20/28] x86/boot: Rework how pi startup symbols get exposed to vmlinux
Date: Mon, 21 Sep 2026 15:31:21 -0700
Message-ID: <55585cff523516bfc77a9496196369a3e20eb1de.1790028654.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790028654.git.jpoimboe@kernel.org>
References: <cover.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

objcopy prefixes every symbol in arch/x86/boot/startup/ with __pi_,
which confines the startup code so that it can only reach other startup
code or symbols deliberately exposed to it with SYM_PIC_ALIAS().

Nine of its functions are called by the core kernel at runtime.  They
are made accessible to the kernel by exports.h, which is included by
vmlinux.lds.S to create aliases for each one.

That's problematic for objtool running on vmlinux.o, which is built
before the linker script runs, so the call sites to the startup symbols
are undefined, so objtool can't see their actual destinations functions.

Instead of making aliases at link time, rename the needed symbols using
a second objcopy pass so they're visible in vmlinux.o.  That also means
objtool can now detect that sev_es_terminate() is noreturn, so it can be
removed from noreturns.h.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/boot/startup/Makefile      | 14 ++++++++++----
 arch/x86/boot/startup/exports.h     | 14 --------------
 arch/x86/boot/startup/unprefix.syms | 13 +++++++++++++
 arch/x86/kernel/vmlinux.lds.S       |  2 --
 tools/objtool/noreturns.h           |  1 -
 5 files changed, 23 insertions(+), 21 deletions(-)
 delete mode 100644 arch/x86/boot/startup/exports.h
 create mode 100644 arch/x86/boot/startup/unprefix.syms

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index ab6e9970d4f4e..5255abe2bd77f 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -41,12 +41,18 @@ $(pi-objs): objtool-args	= $(if $(CONFIG_OBJTOOL_DEFERRED),--dry-run,$(objtool-a
 #
 # Confine the startup code by prefixing all symbols with __pi_ (for position
 # independent). This ensures that startup code can only call other startup
-# code, or code that has explicitly been made accessible to it via a symbol
-# alias.
+# code.
 #
+# The few pi symbols which are allowed to be called by the core kernel are then
+# un-prefixed back to their original name using a second objcopy.
+#
+quiet_cmd_pi_objcopy = $(quiet_cmd_objcopy)
+      cmd_pi_objcopy = $(cmd_objcopy) && \
+		       $(OBJCOPY) --redefine-syms=$(src)/unprefix.syms $@
+
 $(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_
-$(obj)/%.pi.o: $(obj)/%.o FORCE
-	$(call if_changed,objcopy)
+$(obj)/%.pi.o: $(obj)/%.o $(src)/unprefix.syms FORCE
+	$(call if_changed,pi_objcopy)
 
 targets	+= $(obj-y)
 obj-y	:= $(patsubst %.o,%.pi.o,$(obj-y))
diff --git a/arch/x86/boot/startup/exports.h b/arch/x86/boot/startup/exports.h
deleted file mode 100644
index 01d2363dc445f..0000000000000
--- a/arch/x86/boot/startup/exports.h
+++ /dev/null
@@ -1,14 +0,0 @@
-
-/*
- * The symbols below are functions that are implemented by the startup code,
- * but called at runtime by the SEV code residing in the core kernel.
- */
-PROVIDE(early_set_pages_state		= __pi_early_set_pages_state);
-PROVIDE(early_snp_set_memory_private	= __pi_early_snp_set_memory_private);
-PROVIDE(early_snp_set_memory_shared	= __pi_early_snp_set_memory_shared);
-PROVIDE(get_hv_features			= __pi_get_hv_features);
-PROVIDE(sev_es_terminate		= __pi_sev_es_terminate);
-PROVIDE(snp_cpuid			= __pi_snp_cpuid);
-PROVIDE(snp_cpuid_get_table		= __pi_snp_cpuid_get_table);
-PROVIDE(svsm_issue_call			= __pi_svsm_issue_call);
-PROVIDE(svsm_process_result_codes	= __pi_svsm_process_result_codes);
diff --git a/arch/x86/boot/startup/unprefix.syms b/arch/x86/boot/startup/unprefix.syms
new file mode 100644
index 0000000000000..fd80adf558a51
--- /dev/null
+++ b/arch/x86/boot/startup/unprefix.syms
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+# The symbols below are functions that are implemented by the startup code,
+# but called at runtime by the SEV code residing in the core kernel.  Undo the
+# __pi_ prefixing so the core kernel can call them.
+__pi_early_set_pages_state           early_set_pages_state
+__pi_early_snp_set_memory_private    early_snp_set_memory_private
+__pi_early_snp_set_memory_shared     early_snp_set_memory_shared
+__pi_get_hv_features                 get_hv_features
+__pi_sev_es_terminate                sev_es_terminate
+__pi_snp_cpuid                       snp_cpuid
+__pi_snp_cpuid_get_table             snp_cpuid_get_table
+__pi_svsm_issue_call                 svsm_issue_call
+__pi_svsm_process_result_codes       svsm_process_result_codes
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2438b89a4620a..4394ee6bd288f 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -527,5 +527,3 @@ xen_elfnote_entry_value =
 xen_elfnote_phys32_entry_value =
 	ABSOLUTE(xen_elfnote_phys32_entry) + ABSOLUTE(pvh_start_xen - LOAD_OFFSET);
 #endif
-
-#include "../boot/startup/exports.h"
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index c4b93fc6e6299..2dce56030b980 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -20,4 +20,3 @@ NORETURN(mpt_halt_firmware)
 NORETURN(panic)
 NORETURN(vpanic)
 NORETURN(rust_helper_BUG)
-NORETURN(sev_es_terminate)
-- 
2.55.0

