Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082FF52F294;
	Mon, 21 Sep 2026 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029911; cv=none; b=ddkYUX07X1dqPwVnv9SfB0tnktMV6ZfkL1mfVeN1QJtiGOxeP4+mJJPPGThxzoeh+mtMewbKBOMJk4T6DuFR58y8s10V2aHc5vb11GlhyFgKnlv8YPjaotyTw3v3wvwrsIFO9k8DFH1cqOdU2jl21X6NPCLyFo2I9FTSzfAMWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029911; c=relaxed/simple;
	bh=W5ZGjoRtOHzL10mPGubdyYDAsNVKwK39YvCj5IHnINg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3VhoefFREWbBqY1THKQZSo7pDZx0bfZxlVMW4fgkYd58jLGqyTBL5cN8HJhlxy9kCbNB0kJthu8hmM1kL7sAir7KZvPiko96I9jRPXOhsZJ/idRcyzKw+Tk44bpQLgCxzYJwfpD+gkFtrfc06VujpFenI2Bl8+RsC8wh/KEJek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qb0PlBGl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qb0PlBGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8249A1F0089B;
	Mon, 21 Sep 2026 22:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029909;
	bh=kumwho1XMMoQdxXDVJggSKIbpIDf5SWangEdIvPvT9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qb0PlBGlHuePTl8trPyc6KUriD39eSb9kQCuy4MK63eTR55mbShW8AMjQSx2ogEbd
	 iTCClgDuyBpN+Exo5NzKwJi4chQrWjcQqGkpa1Ozm7sxQiGc6y29poEfQrm1h1G54L
	 j+75jXqzM1I+VWxfIFevLDwtBvUjVTWOKGaq5gV9kEoifm1I/iRTU+l3A6M+xinbgi
	 F5s1BeLEQYe9JPjWyNl2+knXCmMSJ+rYBvGlhYEbGKiag9rF/aiONVQmN/jxrABPDZ
	 MnglZA1wkVweCJPPdoDRRGSHrdiGU5FgBsg/uu0SV++0+Nd1Bf3QihUNponkFT2gHV
	 hOu1j28gKKjIQ==
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
Subject: [PATCH v3 23/28] kbuild: Do the per-module objtool pass right before linking
Date: Mon, 21 Sep 2026 15:31:24 -0700
Message-ID: <0ed8faeff899d3e9f101b6b6cddec0bf89735669.1790028654.git.jpoimboe@kernel.org>
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
 scripts/livepatch/klp-build | 12 ++++++------
 3 files changed, 36 insertions(+), 27 deletions(-)

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
index b52a8489d9f67..82a74de11d0df 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -599,15 +599,15 @@ copy_orig_objects() {
 
 	xtrace_save "copying original objects"
 	for _file in "${files[@]}"; do
-		local rel_file="${_file/.ko/.o}"
-		local file="$PWD/$rel_file"
+		local rel_file="${_file/%.ko/.o}"
+		local file="$PWD/${_file/%.ko/.ko.o}"
 		local orig_file="$ORIG_DIR/$rel_file"
 		local orig_dir="$(dirname "$orig_file")"
 
 		[[ ! -f "$file" ]] && die "missing $(basename "$file") for $_file"
 
 		mkdir -p "$orig_dir"
-		cp -f "$file" "$orig_dir"
+		cp -f "$file" "$orig_file"
 	done
 	xtrace_restore
 
@@ -635,8 +635,8 @@ copy_patched_objects() {
 
 	xtrace_save "copying changed objects"
 	for _file in "${files[@]}"; do
-		local rel_file="${_file/.ko/.o}"
-		local file="$PWD/$rel_file"
+		local rel_file="${_file/%.ko/.o}"
+		local file="$PWD/${_file/%.ko/.ko.o}"
 		local orig_file="$ORIG_DIR/$rel_file"
 		local patched_file="$PATCHED_DIR/$rel_file"
 		local patched_dir="$(dirname "$patched_file")"
@@ -646,7 +646,7 @@ copy_patched_objects() {
 		cmp -s "$orig_file" "$file" && continue
 
 		mkdir -p "$patched_dir"
-		cp -f "$file" "$patched_dir"
+		cp -f "$file" "$patched_file"
 		found=1
 	done
 	xtrace_restore
-- 
2.55.0

