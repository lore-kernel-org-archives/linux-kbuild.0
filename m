Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F7D498908;
	Tue,  8 Sep 2026 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899682; cv=none; b=qGToEZDP51mW1OIBaRXQ68eRp0AxifBZmYutBAHqHgs58TaBVuGs39N8aa3n0C4E4vwNarx5ihnrkMZ2dj7emDfJ8UWl7Rd4xfThQ5sfzVbQx08vV+Ehbagn/S79O9pgdET2DbRwvbaMrJiYVomaCf8PlFa95dqozJraq1qyQlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899682; c=relaxed/simple;
	bh=NvWQ6A9jDXTmC/WgfFV4efgx7iQ3U33maXAeo2CXNnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEv3OS3jw6QHdW9UIqKiiQ8QX7IPmZtueWftB+daUVBdQ432jPRM1ZXYegSQ3BcCZVGxmfqGoZVGcFo9ejQv0QP1hxK+1JoGJq3k2k9iyzNU/oT0QQk4fiWmif0R8dIc16QKoBNzWLnMX05m/X9/diBN6VCdk4X2AxSyVaDqmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtyMamfx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtyMamfx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D34B1F00A3D;
	Tue,  8 Sep 2026 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899680;
	bh=pMpgp20DUb7lXRczJjADzt8b4v0RXm38T6+7jtk2dqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HtyMamfxqSRL3NWzRKXvVLrmFDzKwA5VcQiWNP4QntRbV1WLVSQqrDCgXz+6MwCOP
	 UyqNC7y0SqgN6DCwUykfNespe6hnZUu+jh9Kxrrkx42xO6Uv6R8IJ8UUuJtgiNrJ26
	 9brK1OJ3JMzBNF97IHl1ZoD5c88kDxLXRk0okwTd2t4dsL83ineMKel3aXGp7H/yuF
	 OG6U8dGZ5AtVvWobc3/KNS+a84nmjMm5clkC2kKU+AN+AF24tP+h6ARCe4IkLBkLKf
	 EFlr/0nzLTp6NATk5dCkGj8TTZxzOf09khRCm61lSo/HymmGJftozxtukU0D5jckgn
	 OCHjpU1kay3Dw==
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
Subject: [PATCH v2 23/27] kbuild: Do the per-module objtool pass right before linking
Date: Tue,  8 Sep 2026 13:33:35 -0700
Message-ID: <f40d4f48d350d2ea3e4424d5d553a75fccc0f1bd.1788899473.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788899473.git.jpoimboe@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_OBJTOOL_CONTROL_FLOW, the objtool pass on vmlinux.o is going
to be generating a list of its exported noreturns which will then be
read by the modules' objtool pass, so there will need to be a build
dependency between them.

In preparation for that, run objtool right before the module link so its
no longer done on the descend in the deferred case.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 scripts/Makefile.build      | 31 +++++++++++++++----------------
 scripts/Makefile.modfinal   | 20 +++++++++++++++-----
 scripts/livepatch/klp-build |  4 ++--
 3 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 87993362595ce..c1b22b4a4e217 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -271,15 +271,21 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
 	$(sub_cmd_record_mcount))
 endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
-# 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
-# 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
-# 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
-
+ifdef CONFIG_OBJTOOL
+#
+# NOTE: these variables are deprecated, and have no effect when
+# CONFIG_OBJTOOL_DEFERRED is enabled.  Objtool-allergic code can instead be
+# marked with STACK_FRAME_NON_STANDARD() or ANNOTATE_*().
+#
+#   'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
+#   'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
+#   'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
+#
 is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
 
-ifdef CONFIG_OBJTOOL
-$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(CONFIG_OBJTOOL_DEFERRED),$(is-single-obj-m),y))
-endif
+# Enable per-TU objtool for !CONFIG_OBJTOOL_DEFERRED
+$(obj)/%.o: private objtool-enabled = $(if $(CONFIG_OBJTOOL_DEFERRED),,$(if $(is-standard-object),y))
+endif # CONFIG_OBJTOOL
 
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 cmd_warn_shared_object = $(if $(word 2, $(modname-multi)),$(warning $(kbuild-file): $*.o is added to multiple modules: $(modname-multi)))
@@ -497,17 +503,10 @@ $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
 quiet_cmd_ld_multi_m = LD [M]  $@
-      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool)
+      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$<
 
-define rule_ld_multi_m
-	$(call cmd_and_savecmd,ld_multi_m)
-	$(call cmd,gen_objtooldep)
-endef
-
-$(multi-obj-m): private objtool-enabled := $(CONFIG_OBJTOOL_DEFERRED)
-$(multi-obj-m): private part-of-module := y
 $(multi-obj-m): %.o: %.mod FORCE
-	$(call if_changed_rule,ld_multi_m)
+	$(call if_changed,ld_multi_m)
 $(call multi_depend, $(multi-obj-m), .o, -objs -y -m)
 
 # Add intermediate targets:
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 01a37ec872b90..56b4227cc6863 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -32,11 +32,18 @@ ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
 cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
 endif
 
+$(modules:%.o=%.ko): private objtool-enabled = $(CONFIG_OBJTOOL_DEFERRED)
+
+mod-objtool = $(if $(objtool-enabled),$(objtool) $(objtool-args) -o $@.o $< ;)
+mod-obj = $(if $(objtool-enabled),$@.o,$<)
+
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o =							\
+	$(mod-objtool)							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
 		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
-		-T $(objtree)/scripts/module.lds -o $@ $(filter %.o, $^)
+		-T $(objtree)/scripts/module.lds -o $@			\
+		$(mod-obj) $(filter-out $<, $(filter %.o, $^))
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
@@ -46,12 +53,15 @@ quiet_cmd_btf_ko = BTF [M] $@
 		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
 	fi;
 
+define rule_ld_ko_o
+	+$(call cmd_and_savecmd,ld_ko_o)
+	+$(call cmd,gen_objtooldep)
+	+$(if $(CONFIG_DEBUG_INFO_BTF_MODULES),$(if $(newer-prereqs),$(call cmd,btf_ko)))
+endef
+
 # Re-generate module BTFs if either module's .ko or vmlinux changed
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
-	+$(call if_changed,ld_ko_o)
-ifdef CONFIG_DEBUG_INFO_BTF_MODULES
-	+$(if $(newer-prereqs),$(call cmd,btf_ko))
-endif
+	$(call if_changed_rule,ld_ko_o)
 	+$(call cmd,check_tracepoint)
 
 targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index b52a8489d9f67..5237bad90f2cb 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -600,7 +600,7 @@ copy_orig_objects() {
 	xtrace_save "copying original objects"
 	for _file in "${files[@]}"; do
 		local rel_file="${_file/.ko/.o}"
-		local file="$PWD/$rel_file"
+		local file="$PWD/${_file/%.ko/.ko.o}"
 		local orig_file="$ORIG_DIR/$rel_file"
 		local orig_dir="$(dirname "$orig_file")"
 
@@ -636,7 +636,7 @@ copy_patched_objects() {
 	xtrace_save "copying changed objects"
 	for _file in "${files[@]}"; do
 		local rel_file="${_file/.ko/.o}"
-		local file="$PWD/$rel_file"
+		local file="$PWD/${_file/%.ko/.ko.o}"
 		local orig_file="$ORIG_DIR/$rel_file"
 		local patched_file="$PATCHED_DIR/$rel_file"
 		local patched_dir="$(dirname "$patched_file")"
-- 
2.55.0

