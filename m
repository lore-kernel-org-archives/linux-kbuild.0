Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBC52FE29;
	Mon, 21 Sep 2026 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029912; cv=none; b=ImfedtsRjr/eu15k8ZpPalYbVLJLFQmNtiJc8KfnKyjV0Tr7XCbYuuiNiicVoCmv4NlvptX11xg/K5RtK26eVlhyH1BJEj6/DQNnnllCvSWWtROYW6AFsbnyKJQY09BTv4FU6D/1fGSbYKs2/JOR8Wt5baeOUxfoq0lVA573/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029912; c=relaxed/simple;
	bh=lPvOIFM8MH7QtPLweSigI+KHrf2Q16BYYbv0/S1hXew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1eGt7FbdttDyg/7lu5H8q2Az6QR822Vn9DvKQtz8JG5bI/uRgmL5AAlnjnK8nE3FT74ruSeGvGaOr0Ueai9ilXPaNQFhbGaZKPaecEcJzFEiEJyEsOJOkizte4v0EPVUlRpoHjvFtfoJCEw9pf7LuwB6aEVyuYxQcIkbI/yKEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjiZuLh/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjiZuLh/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185051F00899;
	Mon, 21 Sep 2026 22:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029910;
	bh=uuTzoy5vQkppDlztLfs+qfex64mMeCrjWRuQWpKGuI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AjiZuLh/QxHdgfjG7aqenbUWFhALEKREU7iCqrsRfV0AL4XIqpA091/vKxENpfqhE
	 PHheISiLc9MRTZr1cZk7qg6Vvu7oz+pm0l6eJlvQhuxjS5YsMoUxS6mfO72N4Y+1RH
	 bM6Wie9bHXtuLcB18d6UL13N1C38aNA4Oeoq5uXPCQUBMGeTmKYHneUzf9kZnKb/kv
	 BaeMeMIXhCkLAk5DGIcLhDahMgMMVQBmvtQ+h0E9wQC7Gnx4ZjC9BdEPLP9gy/R/Z1
	 k+jn2F6X3GjT7477mSD3anvEt+BfOr50WihG0JA0DuYOiYHk6AF6XqoOjtUrIRvrUz
	 J7gAtF08Gc73w==
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
Subject: [PATCH v3 24/28] kbuild: Generate the noreturn list and validate modules against it
Date: Mon, 21 Sep 2026 15:31:25 -0700
Message-ID: <ed33f66332772d5156dc91513d00e19218e5e68b.1790028654.git.jpoimboe@kernel.org>
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

Most of the remaining hard-coded noreturn functions are exported symbols
which live in vmlinux.o.  The objtool vmlinux.o pass can detect them
automatically, but modules can't.

Instead of hard-coding them in noreturns.h, dynamically generate the
list in a new scripts/noreturns.builtin file, which objtool on modules
can then read.  That allows most of the remaining hard-coded noreturn
entries to go away, including the Rust ones.  Note this means that
modules need to be linked after vmlinux.o has been built and analyzed by
objtool.

Objtool running on OOT modules will also need to read the generated
file.  Its location in scripts/ should ensure it gets installed with
kernel build files automatically.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 Makefile                                |  8 +++++
 scripts/.gitignore                      |  1 +
 scripts/Makefile.modfinal               | 15 ++++++--
 scripts/Makefile.vmlinux_o              |  2 ++
 tools/objtool/Documentation/objtool.txt |  8 ++---
 tools/objtool/check.c                   | 46 -------------------------
 tools/objtool/noreturns.h               | 17 ++-------
 7 files changed, 29 insertions(+), 68 deletions(-)

diff --git a/Makefile b/Makefile
index 751a08643bf85..53796b151b4eb 100644
--- a/Makefile
+++ b/Makefile
@@ -1750,6 +1750,13 @@ KBUILD_BUILTIN := y
 modules: vmlinux
 endif
 
+# Objtool for modules (run before module link) needs to come after objtool for
+# vmlinux.o so it can read the generated exported noreturns file.
+ifdef CONFIG_OBJTOOL_CONTROL_FLOW
+KBUILD_BUILTIN := y
+modules: vmlinux.o
+endif
+
 modules: modules_prepare
 
 # Target to prepare building external modules
@@ -1780,6 +1787,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  debian snap tar-install PKGBUILD pacman \
 		  .config .config.old .version \
 		  Module.symvers \
+		  scripts/noreturns.builtin \
 		  certs/signing_key.pem \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 4215c2208f7e4..15d99dfd7c936 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -5,6 +5,7 @@
 /insert-sys-cert
 /kallsyms
 /module.lds
+/noreturns.builtin
 /recordmcount
 /rustdoc_test_builder
 /rustdoc_test_gen
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 56b4227cc6863..23b07ad7eb9bd 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -32,6 +32,15 @@ ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
 cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
 endif
 
+ifdef CONFIG_OBJTOOL_CONTROL_FLOW
+noreturns-builtin := $(wildcard $(objtree)/scripts/noreturns.builtin)
+ifeq ($(noreturns-builtin),)
+$(warning scripts/noreturns.builtin is missing)
+else
+objtool-args += --noreturns-read=$(noreturns-builtin)
+endif
+endif
+
 $(modules:%.o=%.ko): private objtool-enabled = $(CONFIG_OBJTOOL_DEFERRED)
 
 mod-objtool = $(if $(objtool-enabled),$(objtool) $(objtool-args) -o $@.o $< ;)
@@ -59,8 +68,10 @@ define rule_ld_ko_o
 	+$(if $(CONFIG_DEBUG_INFO_BTF_MODULES),$(if $(newer-prereqs),$(call cmd,btf_ko)))
 endef
 
-# Re-generate module BTFs if either module's .ko or vmlinux changed
-%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
+# Re-generate module BTFs if either module's .ko or vmlinux changed.
+# Re-run module objtool if the generated noreturn list changed.
+%.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(noreturns-builtin) \
+      $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
 	$(call if_changed_rule,ld_ko_o)
 	+$(call cmd,check_tracepoint)
 
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index df1e3584883e6..9c60a4918a756 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -37,6 +37,8 @@ objtool-enabled := $(CONFIG_OBJTOOL_DEFERRED)
 
 vmlinux-objtool-args-y					+= $(objtool-args-y)
 
+vmlinux-objtool-args-$(CONFIG_OBJTOOL_CONTROL_FLOW)	+= --noreturns-write=scripts/noreturns.builtin
+
 vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
 							   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)
 
diff --git a/tools/objtool/Documentation/objtool.txt b/tools/objtool/Documentation/objtool.txt
index 9e97fc25b2d8a..c7ebfb9a8ca6b 100644
--- a/tools/objtool/Documentation/objtool.txt
+++ b/tools/objtool/Documentation/objtool.txt
@@ -334,8 +334,7 @@ the objtool maintainers.
 
    The call from foo() to bar() doesn't return, but bar() is incorrectly
    annotated.  A noreturn function must be marked __noreturn in both its
-   declaration and its definition, and must have a NORETURN() annotation
-   in tools/objtool/noreturns.h.
+   declaration and its definition.
 
 
 4. file.o: warning: objtool: func(): can't find starting instruction
@@ -393,9 +392,8 @@ the objtool maintainers.
    reasons for this:
 
    a) funcA()'s last instruction is a call to a "noreturn" function like
-      panic().  In this case the noreturn function needs to be added to
-      objtool's hard-coded global_noreturns array.  Feel free to bug the
-      objtool maintainer, or you can submit a patch.
+      panic(), and objtool doesn't know that function never returns.  See
+      warning 3 above.
 
    b) funcA() uses the unreachable() annotation in a section of code
       that is actually reachable.
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 29ef2dc678833..1ac4da1eaab75 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -176,49 +176,6 @@ static bool is_sibling_call(struct instruction *insn)
 	return (is_static_jump(insn) && insn_call_dest(insn));
 }
 
-/*
- * Checks if a function is a Rust "noreturn" one.
- */
-static bool is_rust_noreturn(const struct symbol *func)
-{
-	/*
-	 * If it does not start with "_R", then it is not a Rust symbol.
-	 */
-	if (strncmp(func->name, "_R", 2))
-		return false;
-
-	/*
-	 * These are just heuristics -- we do not control the precise symbol
-	 * name, due to the crate disambiguators (which depend on the compiler)
-	 * as well as changes to the source code itself between versions (since
-	 * these come from the Rust standard library).
-	 */
-	return str_ends_with(func->name, "_4core3num20from_str_radix_panic")				||
-	       str_ends_with(func->name, "_4core3num22from_ascii_radix_panic")				||
-	       str_ends_with(func->name, "_4core3num28from_ascii_bytes_radix_panic")			||
-	       str_ends_with(func->name, "_4core3str16slice_error_fail")				||
-	       str_ends_with(func->name, "_4core5sliceSp15copy_from_slice17len_mismatch_fail")		||
-	       str_ends_with(func->name, "_4core6option13expect_failed")				||
-	       str_ends_with(func->name, "_4core6option13unwrap_failed")				||
-	       str_ends_with(func->name, "_4core6result13unwrap_failed")				||
-	       str_ends_with(func->name, "_4core9panicking5panic")					||
-	       str_ends_with(func->name, "_4core9panicking9panic_fmt")					||
-	       str_ends_with(func->name, "_4core9panicking14panic_explicit")				||
-	       str_ends_with(func->name, "_4core9panicking14panic_nounwind")				||
-	       str_ends_with(func->name, "_4core9panicking18panic_bounds_check")			||
-	       str_ends_with(func->name, "_4core9panicking18panic_nounwind_fmt")			||
-	       str_ends_with(func->name, "_4core9panicking19assert_failed_inner")			||
-	       str_ends_with(func->name, "_4core9panicking30panic_null_pointer_dereference")		||
-	       str_ends_with(func->name, "_4core9panicking32panic_null_reference_constructed")		||
-	       str_ends_with(func->name, "_4core9panicking36panic_misaligned_pointer_dereference")	||
-	       str_ends_with(func->name, "_7___rustc17rust_begin_unwind")				||
-	       strstr(func->name, "_4core9panicking13assert_failed")					||
-	       strstr(func->name, "_4core9panicking11panic_const24panic_const_")			||
-	       (strstr(func->name, "_4core5slice5index") &&
-		strstr(func->name, "slice_") &&
-		str_ends_with(func->name, "_fail"));
-}
-
 static bool is_listed_noreturn(struct symbol *func)
 {
 #define NORETURN(func) __stringify(func),
@@ -230,9 +187,6 @@ static bool is_listed_noreturn(struct symbol *func)
 	if (is_local_sym(func))
 		return false;
 
-	if (is_rust_noreturn(func))
-		return true;
-
 	for (int i = 0; i < ARRAY_SIZE(global_noreturns); i++)
 		if (!strcmp(func->name, global_noreturns[i]))
 			return true;
diff --git a/tools/objtool/noreturns.h b/tools/objtool/noreturns.h
index 2dce56030b980..4e8007a8c2584 100644
--- a/tools/objtool/noreturns.h
+++ b/tools/objtool/noreturns.h
@@ -1,22 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 /*
- * This is a (sorted!) list of all known __noreturn functions in the kernel.
- * It's needed for objtool to properly reverse-engineer the control flow graph.
- *
- * Yes, this is unfortunate.  A better solution is in the works.
+ * This is a list of noreturn functions which are exported *by modules*.
+ * No other noreturns need to be listed here.
  */
-NORETURN(__fortify_panic)
 NORETURN(__kunit_abort)
-NORETURN(__module_put_and_kthread_exit)
-NORETURN(__stack_chk_fail)
-NORETURN(__ubsan_handle_builtin_unreachable)
-NORETURN(abort)
-NORETURN(acpi_processor_ffh_play_dead)
-NORETURN(do_exit)
-NORETURN(kthread_complete_and_exit)
 NORETURN(kunit_try_catch_throw)
 NORETURN(mpt_halt_firmware)
-NORETURN(panic)
-NORETURN(vpanic)
-NORETURN(rust_helper_BUG)
-- 
2.55.0

