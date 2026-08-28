Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6513CB8E3;
	Fri, 28 Aug 2026 04:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892727; cv=none; b=mKQVrtLaWC0FpgixFVYcbB6083nLNzmHjh2LJLGUpJIGB9r/yY7zmaWzsL1slAf1yj7tCuDQOtec4HgnIBCRvFw1RvOoCQtLkOteYafgzQW4tZMMXyh5MuDwLB8L1WkoMMe0nmJZbWyZk6yrC8sQataRqSHFYePo36RD4qtcxOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892727; c=relaxed/simple;
	bh=NxJBbCWzL09dAGhLJHJKulrUlK5ab3gm0E3AEMhUq00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSJxy4WNcGQk2PSCxKbQ65ETZGx9UratNrSmy/vjU/naLX24Z3BZn3MMgEk0WLMHNpGV4sixN0ggS4H22ZCLREAl1B3yAgstnSlslFU6a8+3ef1d54tVQljcdgxtugyEUR7V6EUaRFMB+tBoyox0OPaSQfid08lh4Yb0LkkFNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYN1eeNb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYN1eeNb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C111F000E9;
	Fri, 28 Aug 2026 04:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892726;
	bh=NkCNN0p4Rluw+hrxzgg+pw01rDWc6qKNH7aHyDCrS2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NYN1eeNbxGlRiJREzyY0vfi/fpzjsNQ4pKdpGc63yQWH4NjL4WLzYyZpRaw688/EI
	 vOCpIlxCDQ887z7rGbkzzyOdzr5KkmJGdpiHSXC0HHC098p9kpLDZ9QRTBEq1sEWEg
	 E7MjTAYwVkr26FkF0xu3dT1DfqxlcJyEI+zvHWL8Ktj9yGVxtRkVbkE0x+cRqhUVj7
	 XxywYj8wN4MepCZZZIMyMPBfCBvo2FRGNOeMJc7mHVblyGeg+jKH7RovRbJwbp8lzU
	 M/fU2+vLBJ0k209Jhwlzo475rjbSY7JN7tYMsPXcQITzEbxBNt7SfMSm1Cf9Wh/u+c
	 9fu8D+4JRoxKg==
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
Subject: [PATCH 12/27] kbuild: Defer running objtool to link time for all CFG features
Date: Thu, 27 Aug 2026 21:51:41 -0700
Message-ID: <1447f9f8dc6e7e02e4a8a33ce7ae92ba49d70eb3.1787890035.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787890035.git.jpoimboe@kernel.org>
References: <cover.1787890035.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

noreturns.h file is hand-maintained file which hard codes all the known
__noreturn functions in the kernel.  It's fragile, often missing
entries, and keeping it up to date is a maintenance burden.

For LTO, IBT, and klp-build configs, the majority of those entries
aren't needed, because objtool runs on vmlinux.o, so it already has
visibility into whether a given function returns (with its dead end
detection).

Remove the need for many of the noreturns.h entries by just always
deferring objtool for all features which rely on having the noreturn
information: namely the ones which rely on the reverse-engineered
control flow graph (CFG).

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 lib/Kconfig.debug          |  3 ++-
 scripts/Makefile.vmlinux_o | 14 +++-----------
 tools/objtool/noreturns.h  | 23 -----------------------
 3 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 0ea5ad31969ce..bfb977595631e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -599,7 +599,8 @@ config OBJTOOL_CONTROL_FLOW
 config OBJTOOL_DEFERRED
 	def_bool y
 	depends on OBJTOOL
-	depends on LTO_CLANG || X86_KERNEL_IBT || KLP_BUILD
+	depends on OBJTOOL_CONTROL_FLOW || NOINSTR_VALIDATION || LTO_CLANG || \
+		   X86_KERNEL_IBT || KLP_BUILD
 
 config VMLINUX_MAP
 	bool "Generate vmlinux.map file when linking"
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 9bac917e8b819..df1e3584883e6 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -30,20 +30,12 @@ endif
 # objtool for vmlinux.o
 # ---------------------------------------------------------------------------
 #
-# For CONFIG_OBJTOOL_DEFERRED (IBT or LTO), objtool doesn't run on individual
-# translation units.  Instead it runs on vmlinux.o.
-#
-# For !CONFIG_OBJTOOL_DEFERRED + CONFIG_NOINSTR_VALIDATION, it runs on both
-# translation units and vmlinux.o, with the latter only used for noinstr/unret
-# validation.
+# For CONFIG_OBJTOOL_DEFERRED, objtool doesn't run on individual translation
+# units.  Instead it runs on vmlinux.o.
 
-objtool-enabled := $(or $(CONFIG_OBJTOOL_DEFERRED),$(CONFIG_NOINSTR_VALIDATION))
+objtool-enabled := $(CONFIG_OBJTOOL_DEFERRED)
 
-ifeq ($(CONFIG_OBJTOOL_DEFERRED),y)
 vmlinux-objtool-args-y					+= $(objtool-args-y)
-else
-vmlinux-objtool-args-$(CONFIG_OBJTOOL_WERROR)		+= --werror
-endif
 
 vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
 							   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index 08d441b8895cb..cd41f580ccb72 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -7,44 +7,21 @@
  * Yes, this is unfortunate.  A better solution is in the works.
  */
 NORETURN(__fortify_panic)
-NORETURN(__ia32_sys_exit)
-NORETURN(__ia32_sys_exit_group)
 NORETURN(__kunit_abort)
 NORETURN(__module_put_and_kthread_exit)
 NORETURN(__stack_chk_fail)
-NORETURN(__tdx_hypercall_failed)
 NORETURN(__ubsan_handle_builtin_unreachable)
-NORETURN(__x64_sys_exit)
-NORETURN(__x64_sys_exit_group)
 NORETURN(acpi_processor_ffh_play_dead)
-NORETURN(arch_cpu_idle_dead)
-NORETURN(cpu_bringup_and_idle)
-NORETURN(cpu_startup_entry)
 NORETURN(do_exit)
-NORETURN(do_group_exit)
-NORETURN(do_task_dead)
-NORETURN(ex_handler_msr_mce)
-NORETURN(hlt_play_dead)
-NORETURN(hv_ghcb_terminate)
 NORETURN(kthread_complete_and_exit)
 NORETURN(kunit_try_catch_throw)
-NORETURN(machine_real_restart)
-NORETURN(make_task_dead)
 NORETURN(mpt_halt_firmware)
-NORETURN(mwait_play_dead)
-NORETURN(native_play_dead)
 NORETURN(nmi_panic_self_stop)
 NORETURN(panic)
 NORETURN(vpanic)
 NORETURN(panic_smp_self_stop)
-NORETURN(rest_init)
 NORETURN(rewind_stack_and_make_dead)
 NORETURN(rust_helper_BUG)
 NORETURN(sev_es_terminate)
-NORETURN(start_kernel)
-NORETURN(stop_this_cpu)
-NORETURN(usercopy_abort)
-NORETURN(x86_64_start_kernel)
-NORETURN(x86_64_start_reservations)
 NORETURN(xen_cpu_bringup_again)
 NORETURN(xen_start_kernel)
-- 
2.55.0

