Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C401524B11;
	Mon, 21 Sep 2026 22:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029904; cv=none; b=BBPkPObdT8jL5eG4iC37iGGFNM+cgo9OMpxJUYyv/eHr6YUorkdQPeLSurBBOWv+9B2r+LApnQZJbTqhLruRyLbZkzNXwyE5w652ihTLt8QHzmivbJa6/0MQpSQHH3vMJf1vnx9S+7d6rtKg7vyYsiXyus9b+Qvy52lQ4Fm6ynE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029904; c=relaxed/simple;
	bh=ATUDpzmwEqITnzTj/+yDlh3bOFQzajwdJfy9nkU1ehg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCu2oyFP1PeAP8GnNopLR4+z0DA1Jf8gsUmIjsbxkquMmsec9T5wx5b6AKGzXQ3bVZspfs6bF/S41Jr9+L560ACYbi04JoYBwLJcl0uUwH8xNDWj9GY5eWbP3sQQDfLAGMZlNEMrANiyMMde+BZ4d+u9MZ0Zvz+g7e5m6yGUTDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tupt4LYK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tupt4LYK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5631F00893;
	Mon, 21 Sep 2026 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029903;
	bh=hJ9l7SzbIzjpalUfArVzpNzAzu0RxaIBA7baZFcCDIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tupt4LYKLn1lK5ta/3JSSqjxrlGoaQZ8nsPPI1vU8Gpq6FzTY7lzew0MsNxQU8hz1
	 AqyyGA+AL+aMh/TIyJYBsFaxH7OgVjs0rMFzvqU3TIfkIyDNGReUFbjklhWB2tr5HO
	 laUEOVgfuWf1F2g4g8SW6SdlVvrNMv6qeCvb1bXWh1UQ+tmCQzbq615hUKvbNjVQ4u
	 9lakTyqqJc/cHDlAgOItMb7OcnCPzbsj2v9ZsYhNRrXldWsXDpaw0iqam0Bj2kE6mt
	 tbG69WymN2bfu3b0vzzARvKvnSqtF9tanghI9RGXu+GrVTUPyQ23PDEFUH5Jliz8lz
	 25H7ju4i6tMIQ==
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
Subject: [PATCH v3 12/28] kbuild: Defer running objtool to link time for all CFG features
Date: Mon, 21 Sep 2026 15:31:13 -0700
Message-ID: <989e3baa55cfb395d5dbcc4223816dbbd4dc45b1.1790028654.git.jpoimboe@kernel.org>
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

Note that NOINSTR_VALIDATION is a special case, where objtool runs on
individual TUs (with all the objtool-args-y), and then again on
vmlinux.o (without objtool-args-y except for --werror).

This change makes NOINSTR_VALIDATION just another OBJTOOL_DEFERRED
feature which runs deferred, and *not* on TUs, so now it gets all the
args like the others, and the special case for adding --werror on
!OBJTOOL_DEFERRED is no longer needed.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 lib/Kconfig.debug          |  3 ++-
 scripts/Makefile.vmlinux_o | 14 +++-----------
 tools/objtool/noreturns.h  | 24 ------------------------
 3 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 798a10ded19fd..e5aea1c0e54a2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -575,7 +575,8 @@ config OBJTOOL_WERROR
 config OBJTOOL_DEFERRED
 	def_bool y
 	depends on OBJTOOL
-	depends on LTO_CLANG || X86_KERNEL_IBT || KLP_BUILD
+	depends on OBJTOOL_CONTROL_FLOW || NOINSTR_VALIDATION || LTO_CLANG || \
+		   X86_KERNEL_IBT || KLP_BUILD
 
 # Objtool reverse-engineers the control flow graph
 config OBJTOOL_CONTROL_FLOW
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
index 72ffa71aa19b8..cd41f580ccb72 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -7,45 +7,21 @@
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
-NORETURN(efi_rts_park_worker)
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

