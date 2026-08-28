Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DC23C1998;
	Fri, 28 Aug 2026 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892734; cv=none; b=HFpAlbDtep0fnAnvnUS4mKtIR3qu9+U29gHbMyvXcwkcPD54/YTCrM9n/IqBZPzLSncvo7g8+lQztAEr5vT2zuvgByvYyriscrHJ3bSp7ny0yn0UXDQjM/bB3dMgBcsm7A/gMEdJ0b+dI22eB3MjZrZZJj65P6c7P/eppqjzHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892734; c=relaxed/simple;
	bh=5T1ameSdsAHZ5Y+yRdo9Ga1xXBqnuQTxHwMu5VGkXHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfacypJndC7s7I2vKik/OYW1+gnBgqrId2p/hAyXLaQVs+ilxf/ZkKEfvQHC922uiQmjkLnAS7gj4nAU5+ziSz7KyeGCYUnmMj/XnFsEKu9UgJf+eZOMsrDN4lfm5IWLGjpuD4xrzarjtu/NqjVzngBz+TamXfYdmBrIaisaJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cH69+7K/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cH69+7K/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C251F000E9;
	Fri, 28 Aug 2026 04:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892733;
	bh=VQGM2RxgTvTiX2GStLq7PaSzjdRxKf+EhyoZDCqKW8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cH69+7K/8+4hQubATdoSa57CEzb+d60zF7e0EXIh/Mg9L8u2FJHj/LOkxVw+4n2E+
	 4ap+9vSXfLJQWN6GZEjloL2LfjS4aN7gssePDd/woXp1I+T94E3V52dGTH7j91A4WU
	 mE0yvqAc9fwvry+BhwcQTPLQ/0GxRyYn0YoX825ooFqfbr/JN82RM64sVJfOyKOOeZ
	 YtjVbi3Z07y4TYNQkP5bvX8UowH/87juHHIS5sg1bjZd6YvGstEmycI0YTX66vGXHS
	 5TWwN94jnMydt7mpV4uksD1DPQONYkagP+8b8rW/LBntm0PBerb+k1WxXa1BcelCOp
	 SoPaCR9saQl7g==
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
Subject: [PATCH 23/27] kbuild: Do the per-module objtool pass right before linking
Date: Thu, 27 Aug 2026 21:51:52 -0700
Message-ID: <fd11abd629eef313fa52a6fd154ac3b2049da8a5.1787890035.git.jpoimboe@kernel.org>
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
index 84ef12f784330..9e672979a976c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -270,15 +270,21 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
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
@@ -495,17 +501,10 @@ $(obj)/lib.a: $(lib-y) FORCE
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

