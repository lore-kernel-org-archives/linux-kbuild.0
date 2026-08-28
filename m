Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEDA387378;
	Fri, 28 Aug 2026 04:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892721; cv=none; b=SQttW9+XO3U6hSf42BTHMKGc2OepuXxfwVS4UAVkG8rgyowmWh3EwE/65x37OZkcanvSjWc/VpJZwEt8QLSZwCEQEb5zRsmnqOV5txbz063JvafjMqQ3BPDTw4KAfgOLt7vZVSV5lEdDIivIjXfPw8/CFBC/fnvUpWfAppzjbS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892721; c=relaxed/simple;
	bh=O17sPWEBzUDpZ3eFIdHZvdyeXtMGdpbhRQ3FrAb7PUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bn/MFByyJq+UPoLGnh0H1Feke7WHYIzAd56UeBGdJf+JLlewiwdNZZxvaKGBWgxrICR8ImGiK1BPcnhRYfJgaTQi6jUBQhTP0rt+P17kyseYcdAtFfx7vp+GC+UyGjuDLr8HLW4Xyaj3BNVDDGRelFrlTJ6qizgM5+2hmse7+vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBd+T0co; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBd+T0co"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6EF1F00A3A;
	Fri, 28 Aug 2026 04:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892720;
	bh=cCzCbUnHZwUow4j2tnWYFPvTYWDRft0EQI0YfGcfzIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FBd+T0coABTJMG5I1mGk0ZyRMFIUcSbIj6FtxF9Y/VbRE5MqsRuVK1Kkes/1lHm4X
	 tDN82upp28YUeyfQdqjR56FHZj5r7eibSKXSdv4AfMrl8FmOkILAniT94ojZEQGvBR
	 VXSLwmIh8WfUxj1a50wJE55try0JHj9sgFQa/sa55Clrhv25Ug9S8PZIYr2l1sP9Td
	 wI34Nj2fXfyvSjhMFL/QGNVyUDfNJM2fxsD9cK3fmy4qMVp1Ujk3ViNh6BC+m2L+In
	 ruznyjRPH7YFeK3fv25A/ENWx9JfiEspvySMbut3bfU1RCu5LmP6ZJHXxQhDFG0SKm
	 qhtGZkEmK5grA==
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
Subject: [PATCH 02/27] kbuild: Add CONFIG_OBJTOOL_DEFERRED
Date: Thu, 27 Aug 2026 21:51:31 -0700
Message-ID: <6b9243d1a7ecfa1bf4fc9163724cbc6b3928be30.1787890035.git.jpoimboe@kernel.org>
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
index 1244dcac2294a..9ca9b2519d604 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -588,6 +588,13 @@ config NOINSTR_VALIDATION
 	select OBJTOOL
 	default y
 
+# For when objtool defers its work to the linked image (vmlinux.o or module.o)
+# rather than running on individual translation units.
+config OBJTOOL_DEFERRED
+	def_bool y
+	depends on OBJTOOL
+	depends on LTO_CLANG || X86_KERNEL_IBT || KLP_BUILD
+
 config VMLINUX_MAP
 	bool "Generate vmlinux.map file when linking"
 	depends on EXPERT
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9117457432463..84ef12f784330 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -277,7 +277,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
 
 ifdef CONFIG_OBJTOOL
-$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
+$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(CONFIG_OBJTOOL_DEFERRED),$(is-single-obj-m),y))
 endif
 
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
@@ -502,7 +502,7 @@ define rule_ld_multi_m
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
index f99e196abeea4..aa10867a04de2 100755
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

