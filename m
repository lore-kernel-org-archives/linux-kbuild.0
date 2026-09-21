Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4339FCE;
	Mon, 21 Sep 2026 22:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029898; cv=none; b=WRNy7EhLD/3nSYrZUs+m8Hms5SKRUDX9hmCEFFBCDuz8Ns66Qk/VfCObTrSW4ytiik/HTqRrYf+BCa0v/S026BlN7d0/mBEkvDFGRCxSk9LtlZuM6CgjQapPZqk/Cz/lIKG9w9ljDDWd8FWRD1GUc1EC4vpXkj8MR7f8eziL2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029898; c=relaxed/simple;
	bh=VRjq980o9yBAAuAKEGXkiPS+BH55YPQeIUSwHXbBZBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zo2Z2bpaOD49UzgJA8wslHi5abE3hb37M3d4Su2I+A383vQCZiXVlRANHzJ5ljVY8GTi+NV/uLpQeyMCcScPIi9mDtpnwJtmkAOHIajeGkvW/8dVRuVVZNMndxgJDPIzjDD2nOZ4nBSdqujT1S0Grt1qJLEipBG4m4CCtfzQmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0nqFAlb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0nqFAlb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A361F000FF;
	Mon, 21 Sep 2026 22:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029896;
	bh=kT+7a6R4URzozw4gvz65fqS4udHw45SDYEFJ2p6un18=;
	h=From:To:Cc:Subject:Date;
	b=R0nqFAlb2Nl7lcYlGADBS663ziU+B2P0EdwmKX6vfD6nOkiHRjTi+zyRitczdlGsl
	 Bk+1P+qk8Znwl9PlxXJY11WSWcJe0ifxyL6tXVFiDGi62tCEfZ155bjKyJUMvFqzUj
	 5PWFhCp+QFZFc2xHnW53wQy1b2H5q5I1pf/Kt8zB+M79aXw06rBK/75YjwKwq6f0fa
	 jaAA39ZxY9IcEDUpBxazQL/TM2opTP0Vl0UwnJ5sS5m6Fg02bQlXihIXdwsSPc+cTB
	 FbV1rfdTChUNrjLyX2lOaeZYCa4JbngXF5Nj2FCR8CXLqkPF/q0TCZg64Jhb5jb2Pw
	 FXZt/LOttLb4Q==
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
Subject: [PATCH v3 00/28] objtool: dynamically detect noreturns
Date: Mon, 21 Sep 2026 15:31:01 -0700
Message-ID: <cover.1790028654.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changes since v2 (https://lore.kernel.org/cover.1788899473.git.jpoimboe@kernel.org):
- move OBJTOOL_DEFERRED and OBJTOOL_CONTROL_FLOW to OBJTOOL submenu
- remove .discard.addressable from libstub temporary binary before
  absolute symbol reference check
- fix ppc32 build failures by gating rust annotations on CONFIG_OBJTOOL_DEFERRED
- do rust instrinsic noreturn annotations in source code rather than Makefile
- fix read_exports() for exported aliases
- fix klp .ko copying optimization regression

changes since v1 (https://lore.kernel.org/cover.1787890035.git.jpoimboe@kernel.org):
- improve commit log for "kbuild: Defer running objtool to link time for all CFG features"
- rebase on v7.3-rc2 to get a proper Sashiko review

-----

The C and rust manual noreturn lists are a maintenance nightmare.  Get
rid of them by taking advantage of the fact that objtool can run on
linked objects (vmlinux.o and modules) and can thus detect noreturns
dynamically:

  1) When features are enabled which require the noreturn knowledge
     (i.e., control flow analysis) always defer objtool to run on linked
     objects.  That obsoletes most of noreturns.h. (patch 12)

  2) For noreturn functions which are exported by vmlinux, dynamically
     write their names to a file which is then read by objtool running
     on modules.  That obsoletes most of the remaining noreturns.h
     entries and the entirety of is_rust_noreturn(). (patch 24)

  3) For the (four) noreturn functions which are exported by modules,
     manually annotate them at their declaration sites with a new
     ANNOTATE_EXPORTED_NORETURN().  That removes the last few stragglers
     in noreturns.h. (patch 26)


Josh Poimboeuf (28):
  objtool: Remove obsolete noreturns.h entries
  kbuild: Add CONFIG_OBJTOOL_DEFERRED
  kbuild: Add CONFIG_OBJTOOL_CONTROL_FLOW
  objtool: Fix dead end detection for sibling calls
  objtool: Refactor the noreturn/dead-end detection
  objtool: Ignore traps after noreturn calls in STT_CODE
  objtool: Make .discard.stack_frame_non_standard non-allocatable
  efi/libstub: Drop .discard.addressable from the stub objects
  efi/loongarch: Mark loongarch efi_boot_kernel() non-standard for
    objtool
  objtool: Add ANNOTATE_IGNORE_NORETURN()
  LoongArch: Annotate reboot and kexec paths as returnable
  kbuild: Defer running objtool to link time for all CFG features
  rust: Annotate the intrinsic stubs as returnable
  panic: Mark abort() __noreturn
  x86/xen: Ignore noreturn status of weak mem_map_via_hcall()
  objtool: Detect noreturns in weak functions
  x86/entry: Make rewind_stack_and_make_dead() a real function
  x86/xen: Make xen_cpu_bringup_again() a real function
  x86/xen: Make xen_start_kernel() noreturn
  x86/boot: Rework how pi startup symbols get exposed to vmlinux
  objtool: Fix noreturn detection for non-sibling jumps to SYM_CODE
  objtool: Add options to write/read exported noreturns to/from a file
  kbuild: Do the per-module objtool pass right before linking
  kbuild: Generate the noreturn list and validate modules against it
  objtool: Add ANNOTATE_EXPORTED_NORETURN()
  objtool: Annotate all module-exported noreturns and remove noreturns.h
  objtool: Warn about missing/stale ANNOTATE_EXPORTED_NORETURN() usage
  fixup! objtool: Add options to write/read exported noreturns to/from a
    file

 Makefile                                      |   8 +
 arch/arc/kernel/traps.c                       |   4 +-
 arch/arm/kernel/traps.c                       |   2 +-
 arch/loongarch/kernel/machine_kexec.c         |   2 +
 arch/loongarch/kernel/reset.c                 |   4 +
 arch/x86/boot/startup/Makefile                |  16 +-
 arch/x86/boot/startup/exports.h               |  14 -
 arch/x86/boot/startup/unprefix.syms           |  13 +
 arch/x86/entry/entry_64.S                     |   7 +-
 arch/x86/kernel/vmlinux.lds.S                 |   2 -
 arch/x86/platform/pvh/enlighten.c             |   1 +
 arch/x86/xen/enlighten_pv.c                   |   5 +-
 arch/x86/xen/xen-head.S                       |   5 +-
 arch/x86/xen/xen-ops.h                        |   2 +-
 drivers/firmware/efi/libstub/Makefile         |   7 +-
 drivers/firmware/efi/libstub/loongarch.c      |   8 +
 drivers/message/fusion/mptbase.h              |   2 +
 include/kunit/test.h                          |   1 +
 include/kunit/try-catch.h                     |   2 +
 include/linux/annotate.h                      |  24 +
 include/linux/objtool.h                       |  13 +-
 include/linux/objtool_types.h                 |   1 +
 include/linux/panic.h                         |   2 +-
 include/linux/rtc/ds1685.h                    |   2 +
 kernel/exit.c                                 |   2 +-
 lib/Kconfig.debug                             |  14 +
 lib/Kconfig.ubsan                             |   2 +-
 rust/Makefile                                 |   6 +
 rust/compiler_builtins.rs                     |  12 +
 rust/kernel/.gitignore                        |   1 +
 .../kernel/generated_ignore_noreturn_asm.rs.S |   7 +
 scripts/.gitignore                            |   1 +
 scripts/Makefile.build                        |  31 +-
 scripts/Makefile.lib                          |   4 +-
 scripts/Makefile.modfinal                     |  35 +-
 scripts/Makefile.vmlinux_o                    |  13 +-
 scripts/link-vmlinux.sh                       |   3 +-
 scripts/livepatch/klp-build                   |  12 +-
 tools/include/linux/objtool_types.h           |   1 +
 tools/objtool/Documentation/objtool.txt       |  30 +-
 tools/objtool/builtin-check.c                 |  12 +
 tools/objtool/check.c                         | 435 +++++++++++++-----
 tools/objtool/include/objtool/builtin.h       |   2 +
 tools/objtool/include/objtool/elf.h           |   4 +
 tools/objtool/klp-diff.c                      |  32 ++
 tools/objtool/noreturns.h                     |  56 ---
 46 files changed, 596 insertions(+), 266 deletions(-)
 delete mode 100644 arch/x86/boot/startup/exports.h
 create mode 100644 arch/x86/boot/startup/unprefix.syms
 create mode 100644 rust/kernel/generated_ignore_noreturn_asm.rs.S
 delete mode 100644 tools/objtool/noreturns.h

-- 
2.55.0

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 1344d08b420a2..0d5d99c3cacdd 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -155,9 +155,10 @@ STUBCOPY_FLAGS-$(CONFIG_LOONGARCH)	+= --prefix-alloc-sections=.init \
 					   --prefix-symbols=__efistub_
 STUBCOPY_RELOC-$(CONFIG_LOONGARCH)	:= R_LARCH_MARK_LA
 
-# Drop the section created by __ADDRESSABLE() so it doesn't get prefixed.
-# Its job is already done.
-STUBCOPY_FLAGS-y			+= --remove-section=.discard.addressable
+# Drop the section created by __ADDRESSABLE() from the absolute symbol check
+# and the objcopy, otherwise it gets prefixed and doesn't get discared.
+STUBCOPY_RM_SECTIONS			:= --remove-section=.discard.addressable
+STUBCOPY_FLAGS-y			+= $(STUBCOPY_RM_SECTIONS)
 
 $(obj)/%.stub.o: $(obj)/%.o FORCE
 	$(call if_changed,stubcopy)
@@ -170,7 +171,7 @@ $(obj)/%.stub.o: $(obj)/%.o FORCE
 #
 quiet_cmd_stubcopy = STUBCPY $@
       cmd_stubcopy =							\
-	$(STRIP) --strip-debug -o $@ $<;				\
+	$(STRIP) --strip-debug $(STUBCOPY_RM_SECTIONS) -o $@ $<;	\
 	if $(OBJDUMP) -r $@ | grep $(STUBCOPY_RELOC-y); then		\
 		echo "$@: absolute symbol references not allowed in the EFI stub" >&2; \
 		/bin/false;						\
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6fd3182f5f458..e5aea1c0e54a2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -570,6 +570,20 @@ config OBJTOOL_WERROR
 
 	  If unsure, say Y.
 
+# For when objtool defers its work to the linked image (vmlinux.o or module.o)
+# rather than running on individual translation units.
+config OBJTOOL_DEFERRED
+	def_bool y
+	depends on OBJTOOL
+	depends on OBJTOOL_CONTROL_FLOW || NOINSTR_VALIDATION || LTO_CLANG || \
+		   X86_KERNEL_IBT || KLP_BUILD
+
+# Objtool reverse-engineers the control flow graph
+config OBJTOOL_CONTROL_FLOW
+	def_bool y
+	depends on OBJTOOL
+	depends on UNWINDER_ORC || STACK_VALIDATION || HAVE_UACCESS_VALIDATION
+
 config STACK_VALIDATION
 	bool "Compile-time stack metadata validation"
 	depends on HAVE_STACK_VALIDATION && UNWINDER_FRAME_POINTER
@@ -588,20 +602,6 @@ config NOINSTR_VALIDATION
 	select OBJTOOL
 	default y
 
-# Objtool reverse-engineers the control flow graph
-config OBJTOOL_CONTROL_FLOW
-	def_bool y
-	depends on OBJTOOL
-	depends on UNWINDER_ORC || STACK_VALIDATION || HAVE_UACCESS_VALIDATION
-
-# Objtool defers its work to the linked image (vmlinux.o or module.o) rather
-# than running on individual translation units.
-config OBJTOOL_DEFERRED
-	def_bool y
-	depends on OBJTOOL
-	depends on OBJTOOL_CONTROL_FLOW || NOINSTR_VALIDATION || LTO_CLANG || \
-		   X86_KERNEL_IBT || KLP_BUILD
-
 config VMLINUX_MAP
 	bool "Generate vmlinux.map file when linking"
 	depends on EXPERT
diff --git a/rust/.gitignore b/rust/.gitignore
index c198d1a52e60e..d3829ffab80ba 100644
--- a/rust/.gitignore
+++ b/rust/.gitignore
@@ -6,6 +6,5 @@ doctests_kernel_generated.rs
 doctests_kernel_generated_kunit.c
 uapi_generated.rs
 exports_*_generated.h
-intrinsics_annotate_generated.c
 doc/
 test/
diff --git a/rust/Makefile b/rust/Makefile
index 0aa9f298a2757..02795bcd54d62 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -36,9 +36,6 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
-always-$(CONFIG_RUST) += intrinsics_annotate_generated.c
-obj-$(CONFIG_RUST)    += intrinsics_annotate_generated.o
-
 always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
@@ -52,6 +49,8 @@ ifndef CONFIG_UML
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
 endif
 
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_OBJTOOL_DEFERRED)) += kernel/generated_ignore_noreturn_asm.rs
+
 # Avoids running `$(RUSTC)` when it may not be available.
 ifdef CONFIG_RUST
 
@@ -705,20 +704,6 @@ ifdef CONFIG_PPC32
 		__udivdi3 __umoddi3
 endif
 
-# For objtool, annotate the redirect-intrinsics as returnable.  Their call
-# sites were compiled against the returnable intrinsics, but the redirected
-# versions are noreturn.
-quiet_cmd_intrinsics_annotate = GEN     $@
-      cmd_intrinsics_annotate = { \
-	echo '/* Generated by rust/Makefile - do not edit */'; \
-	echo '\#include <linux/annotate.h>'; \
-	for s in $(redirect-intrinsics); do \
-		echo "ANNOTATE_IGNORE_NORETURN(__rust$$s);"; \
-	done; } > $@
-
-$(obj)/intrinsics_annotate_generated.c: $(srctree)/rust/Makefile FORCE
-	$(call if_changed,intrinsics_annotate)
-
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
 	$(call rust_exports,$@,"%s\n") | \
@@ -766,6 +751,10 @@ $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+ifdef CONFIG_OBJTOOL_DEFERRED
+$(obj)/compiler_builtins.o: $(obj)/kernel/generated_ignore_noreturn_asm.rs
+endif
+
 $(obj)/zerocopy.o: private skip_clippy = 1
 $(obj)/zerocopy.o: private skip_gendwarfksyms = 1
 $(obj)/zerocopy.o: private rustc_target_envs := $(zerocopy-envs)
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index fc6b54636dd54..2d8461c75ec59 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -33,6 +33,18 @@ macro_rules! define_panicking_intrinsics(
             pub extern "C" fn $ident() {
                 panic!($reason);
             }
+
+            // The redirected call sites were compiled against the real
+            // intrinsics, which return.  Tell objtool to ignore the noreturn
+            // status of the panicking intrinsics.
+            #[cfg(CONFIG_OBJTOOL_DEFERRED)]
+            ::core::arch::global_asm!(
+                include!(concat!(
+                    env!("OBJTREE"),
+                    "/rust/kernel/generated_ignore_noreturn_asm.rs"
+                )),
+                sym = sym $ident,
+            );
         )*
     }
 );
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
index f636ad95aaf3d..a78a3e0e220a1 100644
--- a/rust/kernel/.gitignore
+++ b/rust/kernel/.gitignore
@@ -3,3 +3,4 @@
 /generated_arch_static_branch_asm.rs
 /generated_arch_warn_asm.rs
 /generated_arch_reachable_asm.rs
+/generated_ignore_noreturn_asm.rs
diff --git a/rust/kernel/generated_ignore_noreturn_asm.rs.S b/rust/kernel/generated_ignore_noreturn_asm.rs.S
new file mode 100644
index 0000000000000..e2a531cba8acd
--- /dev/null
+++ b/rust/kernel/generated_ignore_noreturn_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/annotate.h>
+
+// Cut here.
+
+ASM_ANNOTATE_LABEL({sym}, ANNOTYPE_IGNORE_NORETURN)
diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index 5237bad90f2cb..82a74de11d0df 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -599,7 +599,7 @@ copy_orig_objects() {
 
 	xtrace_save "copying original objects"
 	for _file in "${files[@]}"; do
-		local rel_file="${_file/.ko/.o}"
+		local rel_file="${_file/%.ko/.o}"
 		local file="$PWD/${_file/%.ko/.ko.o}"
 		local orig_file="$ORIG_DIR/$rel_file"
 		local orig_dir="$(dirname "$orig_file")"
@@ -607,7 +607,7 @@ copy_orig_objects() {
 		[[ ! -f "$file" ]] && die "missing $(basename "$file") for $_file"
 
 		mkdir -p "$orig_dir"
-		cp -f "$file" "$orig_dir"
+		cp -f "$file" "$orig_file"
 	done
 	xtrace_restore
 
@@ -635,7 +635,7 @@ copy_patched_objects() {
 
 	xtrace_save "copying changed objects"
 	for _file in "${files[@]}"; do
-		local rel_file="${_file/.ko/.o}"
+		local rel_file="${_file/%.ko/.o}"
 		local file="$PWD/${_file/%.ko/.ko.o}"
 		local orig_file="$ORIG_DIR/$rel_file"
 		local patched_file="$PATCHED_DIR/$rel_file"
@@ -646,7 +646,7 @@ copy_patched_objects() {
 		cmp -s "$orig_file" "$file" && continue
 
 		mkdir -p "$patched_dir"
-		cp -f "$file" "$patched_dir"
+		cp -f "$file" "$patched_file"
 		found=1
 	done
 	xtrace_restore
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index cfd2d16cd5041..626402023e4a3 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2350,19 +2350,14 @@ static int add_jump_table_alts(struct objtool_file *file)
 static void read_exports(struct objtool_file *file)
 {
 	struct section *sec;
-	struct symbol *func;
 	struct reloc *reloc;
 
 	sec = find_section_by_name(file->elf, ".export_symbol");
 	if (!sec || !sec->rsec)
 		return;
 
-	for_each_reloc(sec->rsec, reloc) {
-		func = find_func_by_offset(reloc->sym->sec,
-					   reloc->sym->offset + reloc_addend(reloc));
-		if (func)
-			func->exported = 1;
-	}
+	for_each_reloc(sec->rsec, reloc)
+		reloc->sym->exported = 1;
 }
 
 static void set_func_state(struct cfi_state *state)
