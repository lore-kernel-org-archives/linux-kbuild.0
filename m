Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1759412C0C;
	Mon, 21 Sep 2026 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029899; cv=none; b=JX7fX1QyY2m+VYVGdjnqenOYUXV5LDOY2C+LAijpX0JIuuvx0IaMNTYtO/LgAtoaYJv7pAUD3eM8RwPw+qabxif6gnD0xv2kIwDD/6B5Gy4oSz2tmzeAbsROejHnH162Xvx7SBzdSOUcJq6nwkl1WWZIPDF3kLpwuJjl4Y+t0ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029899; c=relaxed/simple;
	bh=Z7kDHBEzXJUlhQAN5QB8AGbXYaavCCpTdV3Ij9RRgp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0IRer97HdwVi8YiqUbPut9HSF52xdnTOG3BDpvWKi3Dt4tybBXsKU3jOkWe4+XAOtjsSiSLOxOOQldDTRWPR81SXv2yOLDHvWFGTr/J4Scp+rYB/cC0gMLEMBMh1JT5zgMGGG2m9i/SyJL1SJOmeCe2GGK9XbGt4fQ3FSZltPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KItBxPY3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KItBxPY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CCF1F00899;
	Mon, 21 Sep 2026 22:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029897;
	bh=tisvNz81hHe0/XpQnc1cGDFuGZHhP/OcTzuCWUFg+F4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KItBxPY3R6o5Cfgpg1aELVUDNp8DUUCluGcG48ihRvWBnKLn2HRrl2oXrY6GK5fP3
	 kPcl/WGCwEc1+gT25VuQpGH7XvQpxbJLKZpQdUfTrGFYOKTT2/H1ZLExNmxMk7neZc
	 PUKNtdxAVNKC1oEPlLSOHe2e4NPIHl2pJjxQrqvU/VCjVDdM/utBKas3HNX3NzHzRp
	 iqdBch+YZJg7CdFVhtC4WmAcmqSFdoczhR0jmhcnweHtMSVER55tDnodHMl7e2JL20
	 DhUNvHZ5/qPPtQdHsvKoaI8mmVjYRMH4RNBPhIl9pi4ETuq+o2mwpTQJlRpQxdB9Or
	 AZtagx4hB5xGw==
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
Subject: [PATCH v3 02/28] kbuild: Add CONFIG_OBJTOOL_DEFERRED
Date: Mon, 21 Sep 2026 15:31:03 -0700
Message-ID: <cb189a2b71edeffae3e45163e3b8661f5757e0b7.1790028654.git.jpoimboe@kernel.org>
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

For LTO, IBT, and KLP builds, the running of objtool is deferred to
vmlinux.o rather than individual translation units.  In preparation for
deferring it in more cases, add a new config option.

No functional change.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/boot/startup/Makefile |  2 +-
 lib/Kconfig.debug              |  7 +++++++
 scripts/Makefile.build         |  4 ++--
 scripts/Makefile.lib           |  4 +---
 scripts/Makefile.vmlinux_o     | 13 +++++++------
 scripts/link-vmlinux.sh        |  3 +--
 6 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 5e499cfb29b5c..ab6e9970d4f4e 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -36,7 +36,7 @@ $(patsubst %.o,$(obj)/%.o,$(lib-y)): OBJECT_FILES_NON_STANDARD := y
 # relocations, even if other objtool actions are being deferred.
 #
 $(pi-objs): objtool-enabled	= 1
-$(pi-objs): objtool-args	= $(if $(delay-objtool),--dry-run,$(objtool-args-y)) --noabs
+$(pi-objs): objtool-args	= $(if $(CONFIG_OBJTOOL_DEFERRED),--dry-run,$(objtool-args-y)) --noabs
 
 #
 # Confine the startup code by prefixing all symbols with __pi_ (for position
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625e..55732323dc16e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -570,6 +570,13 @@ config OBJTOOL_WERROR
 
 	  If unsure, say Y.
 
+# For when objtool defers its work to the linked image (vmlinux.o or module.o)
+# rather than running on individual translation units.
+config OBJTOOL_DEFERRED
+	def_bool y
+	depends on OBJTOOL
+	depends on LTO_CLANG || X86_KERNEL_IBT || KLP_BUILD
+
 config STACK_VALIDATION
 	bool "Compile-time stack metadata validation"
 	depends on HAVE_STACK_VALIDATION && UNWINDER_FRAME_POINTER
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4349108e75e1f..87993362595ce 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -278,7 +278,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
 
 ifdef CONFIG_OBJTOOL
-$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
+$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(CONFIG_OBJTOOL_DEFERRED),$(is-single-obj-m),y))
 endif
 
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
@@ -504,7 +504,7 @@ define rule_ld_multi_m
 	$(call cmd,gen_objtooldep)
 endef
 
-$(multi-obj-m): private objtool-enabled := $(delay-objtool)
+$(multi-obj-m): private objtool-enabled := $(CONFIG_OBJTOOL_DEFERRED)
 $(multi-obj-m): private part-of-module := y
 $(multi-obj-m): %.o: %.mod FORCE
 	$(call if_changed_rule,ld_multi_m)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a4fdd8bd975d..3622237e41d2e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -210,11 +210,9 @@ objtool-args-$(or $(CONFIG_GCOV_KERNEL),$(CONFIG_KCOV))	+= --no-unreachable
 objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --werror
 
 objtool-args = $(objtool-args-y)					\
-	$(if $(delay-objtool), --link)					\
+	$(if $(CONFIG_OBJTOOL_DEFERRED), --link)			\
 	$(if $(part-of-module), --module)
 
-delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT),$(CONFIG_KLP_BUILD))
-
 cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
 cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
 
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 24a3a4fd271c2..9bac917e8b819 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -30,15 +30,16 @@ endif
 # objtool for vmlinux.o
 # ---------------------------------------------------------------------------
 #
-# For delay-objtool (IBT or LTO), objtool doesn't run on individual translation
-# units.  Instead it runs on vmlinux.o.
+# For CONFIG_OBJTOOL_DEFERRED (IBT or LTO), objtool doesn't run on individual
+# translation units.  Instead it runs on vmlinux.o.
 #
-# For !delay-objtool + CONFIG_NOINSTR_VALIDATION, it runs on both translation
-# units and vmlinux.o, with the latter only used for noinstr/unret validation.
+# For !CONFIG_OBJTOOL_DEFERRED + CONFIG_NOINSTR_VALIDATION, it runs on both
+# translation units and vmlinux.o, with the latter only used for noinstr/unret
+# validation.
 
-objtool-enabled := $(or $(delay-objtool),$(CONFIG_NOINSTR_VALIDATION))
+objtool-enabled := $(or $(CONFIG_OBJTOOL_DEFERRED),$(CONFIG_NOINSTR_VALIDATION))
 
-ifeq ($(delay-objtool),y)
+ifeq ($(CONFIG_OBJTOOL_DEFERRED),y)
 vmlinux-objtool-args-y					+= $(objtool-args-y)
 else
 vmlinux-objtool-args-$(CONFIG_OBJTOOL_WERROR)		+= --werror
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index ab0b8125c8cbc..07ba4360b2c89 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -60,8 +60,7 @@ vmlinux_link()
 	# skip output file argument
 	shift
 
-	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT ||
-	   is_enabled CONFIG_KLP_BUILD; then
+	if is_enabled CONFIG_OBJTOOL_DEFERRED || is_enabled CONFIG_LTO_CLANG; then
 		# Use vmlinux.o instead of performing the slow LTO link again.
 		objs=vmlinux.o
 		libs=
-- 
2.55.0

