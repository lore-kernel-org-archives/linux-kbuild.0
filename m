Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C35E21CC51
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2026 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111400; cv=none; b=agORzhZL+nleWaKa7yqRQvhaugeMuufNNLfgAPBegDVCz16OwZYSbiI85QUcgkry1k8yAv7NAuBTYFO55YFa9xf2BBuD0fM1NVr+uD+Rj6oazfpKnpFC0s2YK5D4e6hVKyT/oxWvwtyD7ZadO6ZfNvEI9JtgxZAVyC0HP0NwvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111400; c=relaxed/simple;
	bh=4+Oz360zwazfoirGT8giu2mK1dFmnnpEtxH2ch3V8pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgFWRIlRDnrfYf4XTrj/kTozJhS5re3xYzLQPvXiIXnMDvYMGS/DRVk1lGFGeoRm3AFwar8mn1T6B5wotkvxkKrwzYRaM8sg6eNmNcQXjExqwx2NV+IfwnkoHd6bJzSkw9kM50fdroCBt/W3c2eU1SHcvBzSLjLeG37EremOvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMIg7Bc6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMIg7Bc6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495635a85d2so17864025e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Jul 2026 17:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111393; x=1785716193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bN6ma0rV34kLGFrt0qX3ZHqBrLP/aoHUexBxcJPZ7Qw=;
        b=bMIg7Bc66DR4qTTXQJ2e2f71uuzyjF6/n4nNwMuM8vNjIZrl7AKhPwJChmU2wvAChM
         x7mzBv7HN0t1Mo1AKWXa7FUtr7pNQQzBHdQ1xwk6ZdIg9TYGGycd6zd6jG6YFwCzh4NL
         Xo1U+6fnjJlgHMiPMRySCeKQDlpulcgRVo1BV2olK9QyiYp0X57tFY14JI3peFOUN6i0
         U2lDNG3HdoCtYMIFdscSAbsly81FSqxHyHRIRkWaX3c1ga0/dIRj3GmOVy8VB1+04FNS
         RnbiS/vr/5Jl3jVlUohbKKR/WJjlTF6BvgJsaaQpxxIq2eKFDQYGVdGjaBdTgMUb+Jee
         hpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111393; x=1785716193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bN6ma0rV34kLGFrt0qX3ZHqBrLP/aoHUexBxcJPZ7Qw=;
        b=rVb14R4wDQEBvLe5RVgVxrYnn1IcXkmq9Fzq345xMRcvHflTzbRy5bYhlTqnCCmQbs
         MdCcb1zsH+MCRuUTaWY5GeaPjJWCWa0P0dTBW4uhM9WJ0hKGC2QrFsrRJafEMoK3ArID
         HpHG6ohagVIRsiDGJq68gM6EXmDc5lBXiTYrBcJPru5LuFAchPFcw3oHMeYKKr+wSDWq
         4Cch83EsLpELf39v/qOTnzsIxlTiX9IEY6G6/+u+GgjBxQoNRlcWwGxAXuzfQ1Qt/OUJ
         7TYM64iZjweoYlVZlohQ3ZAZfipTBfQgKYGtpb/4+CpRAx/GBZiXCqKvdhGhvCZ+gDyn
         dXDA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4VxMS8NAcHFM/SbV9pz4kM3o/nLrsOFICKfuiElShdHmOMlDlKhthCMjrInYC7mwfba2HnAKZghg1rQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGnLiuUhJ4/Bx1btls0A6VP2b4guVyxi2Ir5/NB2NJQ3bMsbyo
	z/2M/PtVWceRgbc3BPmN8sNqaJAOeACe5VV5aRj/BgKxM9GoJ+yWJZT1
X-Gm-Gg: AR+sD12pZnt0c9MEEdiDGDPbdSLq1GuBbnfgYhUUpMRnw514+7wIco/z1fIlw85yRTu
	s6Es9lB1vGIzJIIRrJsROjtL0f9YzxqfvqLCcf4b17LMMBEtOAfhV+Um7+OHiphRjlklaYMoiVy
	P09QnjFlTUDXp0fp3TJr1LeFUSc7FjcFC+HiJnfqxolOp0dgXZmeQSXK5yuvYf9EDM2gQMEAAsK
	RVMI08dV82yomZSVLqvqu4x3a7IfUPHoFHA8sSAYp888gUIYEtXDcpKULEaxvWRDWCinCdoKtRD
	le4+KYw1g5QEO4CqphIU4MjuHKtMxXjnkZ/dd/fa11agcV8aJgStqYpelTGbsP/Igvbqh3aNLVR
	f2zWKad5e2pNGAnyfAfC0NMIanPYaAJLt6jiEIyosUTDpoR70N5kSQ/wlH+dOlL4O5CrQttaB6F
	fQU8qHIangIE0V7A4RBfpKmxS8pp9wFT/YMyOBBwa8dpQl+mctU+MGKtYNpBod/XWNIw==
X-Received: by 2002:a05:600c:8b52:b0:493:c2cc:aecb with SMTP id 5b1f17b1804b1-496b570fc3cmr87617415e9.38.1785111392714;
        Sun, 26 Jul 2026 17:16:32 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485f65csm176403555e9.5.2026.07.26.17.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:16:32 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	akpm@linux-foundation.org,
	jani.nikula@linux.intel.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ljs@kernel.org,
	andrew.jones@linux.dev,
	masahiroy@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 2/5] kconfig: add kconfirm
Date: Mon, 27 Jul 2026 01:16:20 +0100
Message-ID: <20260727001623.2794156-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727001623.2794156-1-julianbraha@gmail.com>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add kconfirm into scripts/kconfig/

kconfirm is a static analysis tool with various checks for Kconfig, and
intended to have zero false alarms by default, though some are expected
for host compiler-related config options due to macro expansion. The
default checks currently include dead code, constant conditions, and
invalid (reverse) ranges.

There are also optional checks for dead links in the help texts, and for
config options that select visible config options.

kconfirm runs semantic analysis on the unsimplified parse tree that the
Kconfig parser provides. Config option definitions are collected into its
symbol table, and checks run from there using informed heuristics. The
dead link check uses the curl CLI to check the liveness of links, and is
optional.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Makefile                                 |  17 +-
 scripts/kconfig/.gitignore               |   1 +
 scripts/kconfig/Makefile                 |  54 ++
 scripts/kconfig/kconfig.rs               | 445 ++++++++++++++
 scripts/kconfig/kconfirm/.gitignore      |   2 +
 scripts/kconfig/kconfirm/analyze.rs      | 340 +++++++++++
 scripts/kconfig/kconfirm/arch.rs         |  53 ++
 scripts/kconfig/kconfirm/checks.rs       | 748 +++++++++++++++++++++++
 scripts/kconfig/kconfirm/dead_links.rs   | 230 +++++++
 scripts/kconfig/kconfirm/kconfirm-cfg.sh |  57 ++
 scripts/kconfig/kconfirm/kconfirm.rs     | 278 +++++++++
 scripts/kconfig/kconfirm/output.rs       |  87 +++
 scripts/kconfig/kconfirm/symbol_table.rs | 105 ++++
 13 files changed, 2415 insertions(+), 2 deletions(-)
 create mode 100644 scripts/kconfig/kconfig.rs
 create mode 100644 scripts/kconfig/kconfirm/.gitignore
 create mode 100644 scripts/kconfig/kconfirm/analyze.rs
 create mode 100644 scripts/kconfig/kconfirm/arch.rs
 create mode 100644 scripts/kconfig/kconfirm/checks.rs
 create mode 100644 scripts/kconfig/kconfirm/dead_links.rs
 create mode 100755 scripts/kconfig/kconfirm/kconfirm-cfg.sh
 create mode 100644 scripts/kconfig/kconfirm/kconfirm.rs
 create mode 100644 scripts/kconfig/kconfirm/output.rs
 create mode 100644 scripts/kconfig/kconfirm/symbol_table.rs

diff --git a/Makefile b/Makefile
index b568bfe8f3ec..e036af320486 100644
--- a/Makefile
+++ b/Makefile
@@ -298,7 +298,7 @@ no-dot-config-targets := $(clean-targets) \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 dt_style_selftest \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
-			 run-command
+			 run-command kconfirm kconfirmtest
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
@@ -1879,6 +1879,7 @@ help:
 	@echo  '  headerdep         - Detect inclusion cycles in headers'
 	@echo  '  coccicheck        - Check with Coccinelle'
 	@echo  '  kconfig-sym-check - Check for dangling Kconfig symbol references'
+	@echo  '  kconfirm          - Run static analysis on the Kconfig tree'
 	@echo  '  clang-analyzer    - Check with clang static analyzer'
 	@echo  '  clang-tidy        - Check with clang-tidy'
 	@echo  ''
@@ -2328,7 +2329,7 @@ endif
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
-PHONY += includecheck versioncheck coccicheck kconfig-sym-check
+PHONY += includecheck versioncheck coccicheck kconfig-sym-check kconfirm kconfirmtest
 
 includecheck:
 	find $(srctree)/* $(RCS_FIND_IGNORE) \
@@ -2346,6 +2347,18 @@ coccicheck:
 kconfig-sym-check:
 	$(Q)$(PERL) $(srctree)/scripts/kconfig/kconfig-sym-check.pl $(srctree) $(KCONFIG_SYM_CHECK_EXCLUDES)
 
+kconfirm-hostrustc = $(if $(filter 1,$(KBUILD_CLIPPY)),HOSTRUSTC=$(CLIPPY_DRIVER))
+
+kconfirm: export CC_VERSION_TEXT := $(CC_VERSION_TEXT)
+kconfirm: export RUSTC_VERSION_TEXT := $(RUSTC_VERSION_TEXT)
+kconfirm: export PAHOLE_VERSION := $(PAHOLE_VERSION)
+kconfirm: outputmakefile scripts_basic
+	$(Q)$(MAKE) $(build)=scripts/kconfig $(kconfirm-hostrustc) kconfirm || \
+		(printf "\n  kconfirm failed to build or run. It is built with the Rust\n  toolchain (rustc, bindgen). See Documentation/dev-tools/kconfirm.rst\n\n" && false)
+
+kconfirmtest: outputmakefile scripts_basic
+	$(Q)$(MAKE) $(build)=scripts/kconfig $(kconfirm-hostrustc) kconfirmtest
+
 PHONY += checkstack kernelrelease kernelversion image_name
 
 # UML needs a little special treatment here.  It wants to use the host
diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index 0b2ff775b2e3..0c2f9763029c 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -4,4 +4,5 @@
 /[gmnq]conf-bin
 /[gmnq]conf-cflags
 /[gmnq]conf-libs
+/kconfig_bindings.rs
 /qconf-moc.cc
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 5baf1c44ffa2..ffdf36a21d79 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -154,6 +154,7 @@ help:
 	@echo  '                    default value without prompting'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  '  kconfirmtest	  - Run kconfirm tests (requires python3 and pytest)'
 	@echo  ''
 	@echo  'Configuration topic targets:'
 	@$(foreach f, $(all-config-fragments), \
@@ -234,3 +235,56 @@ $(obj)/%conf-cflags $(obj)/%conf-libs $(obj)/%conf-bin: $(src)/%conf-cfg.sh
 	$(call cmd,conf_cfg)
 
 clean-files += *conf-cflags *conf-libs *conf-bin
+
+# kconfirm: analyzes Kconfig using the un-simplified parse tree.
+hostprogs	+= kconfirm/kconfirm
+kconfirm/kconfirm-rust := y
+kconfirm/kconfirm-objs := $(common-objs)
+targets += kconfig_bindings.rs
+
+HOSTRUSTFLAGS_kconfirm/kconfirm := \
+	$(addprefix -Clink-arg=$(obj)/,$(kconfirm/kconfirm-objs))
+KCONFIG_BINDINGS := $(abspath $(obj)/kconfig_bindings.rs)
+export KCONFIG_BINDINGS
+
+# The Rust bindings are generated from the parser's C headers.
+quiet_cmd_kconfig_bindgen = BINDGEN $@
+      cmd_kconfig_bindgen = \
+	$(BINDGEN) $< --rust-target 1.85 \
+		--no-doc-comments --no-prepend-enum-name \
+		--allowlist-function 'conf_parse' \
+		--allowlist-function 'conf_set_pre_finalize_callback' \
+		--allowlist-function 'expr_print' \
+		--allowlist-type 'expr' --allowlist-type 'menu' \
+		--allowlist-type 'property' --allowlist-type 'symbol' \
+		--allowlist-type 'expr_type' --allowlist-type 'menu_type' \
+		--allowlist-type 'prop_type' --allowlist-type 'symbol_type' \
+		-o $@ -- -I $(src) -I $(srctree)/scripts/include
+
+$(obj)/kconfig_bindings.rs: $(src)/lkc.h $(src)/expr.h $(src)/lkc_proto.h \
+			    $(srctree)/scripts/include/list_types.h FORCE
+	$(call if_changed,kconfig_bindgen)
+
+$(obj)/kconfirm/kconfirm: $(obj)/kconfig_bindings.rs \
+			  $(addprefix $(obj)/,$(kconfirm/kconfirm-objs))
+
+# Alert the user when the Rust toolchain is missing or too old.
+PHONY += kconfirm-tool-check
+kconfirm-tool-check:
+	$(Q)$(CONFIG_SHELL) $(src)/kconfirm/kconfirm-cfg.sh
+
+$(obj)/kconfig_bindings.rs: | kconfirm-tool-check
+$(obj)/kconfirm/kconfirm: | kconfirm-tool-check
+
+PHONY += kconfirm
+kconfirm: $(obj)/kconfirm/kconfirm
+	$(Q)$< --linux-path $(abspath $(srctree)) --kconfig $(Kconfig) \
+		$(KCONFIRM_ARGS)
+
+PHONY += kconfirmtest
+kconfirmtest: $(obj)/kconfirm/kconfirm
+	$(Q)$(PYTHON3) -B -m pytest $(src)/kconfirm/tests \
+		--kconfirm $(abspath $<) \
+		-o cache_dir=$(abspath $(obj)/kconfirm/tests/.cache) \
+		$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=no)
+clean-files += kconfirm/tests/.cache
diff --git a/scripts/kconfig/kconfig.rs b/scripts/kconfig/kconfig.rs
new file mode 100644
index 000000000000..2b27f3c83a51
--- /dev/null
+++ b/scripts/kconfig/kconfig.rs
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Julian Braha <julianbraha@gmail.com>
+ */
+//! Rust abstraction over the Kconfig parser and its bindings. Only covers
+//! the unsimplified parse tree for now; useful for static analyzers, such as
+//! kconfirm.
+//!
+//! The `raw` module below is generated by bindgen from the parser's C headers.
+use std::{
+    ffi::CStr,
+    fmt,
+    os::raw::{
+        c_char,
+        c_int,
+        c_void, //
+    },
+    panic::{
+        catch_unwind,
+        AssertUnwindSafe, //
+    },
+    ptr, //
+};
+
+#[allow(
+    clippy::all,
+    dead_code,
+    non_camel_case_types,
+    non_upper_case_globals,
+    unreachable_pub
+)]
+mod raw {
+    include!(env!("KCONFIG_BINDINGS"));
+}
+
+use raw::*;
+
+type Expr = expr;
+type Menu = menu;
+type Symbol = symbol;
+
+#[derive(Clone, Debug, PartialEq, Eq, Hash)]
+pub(crate) struct Expression {
+    rendered: String,
+    negation: String,
+}
+
+impl Expression {
+    pub(crate) fn is_negation_of(&self, other: &Self) -> bool {
+        self.negation == other.rendered
+    }
+
+    fn constant(value: &str, negation: &str) -> Self {
+        Self {
+            rendered: value.to_string(),
+            negation: negation.to_string(),
+        }
+    }
+}
+
+impl fmt::Display for Expression {
+    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.rendered.fmt(formatter)
+    }
+}
+
+#[derive(Clone, Debug)]
+pub(crate) struct DefaultAttribute {
+    pub(crate) expression: Expression,
+    pub(crate) r#if: Option<Expression>,
+}
+
+impl fmt::Display for DefaultAttribute {
+    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.expression.fmt(formatter)
+    }
+}
+
+#[derive(Clone, Debug)]
+pub(crate) struct Select {
+    pub(crate) symbol: String,
+    pub(crate) r#if: Option<Expression>,
+}
+
+impl fmt::Display for Select {
+    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.symbol.fmt(formatter)
+    }
+}
+
+pub(crate) type Imply = Select;
+
+#[derive(Clone, Debug)]
+pub(crate) struct RangeBound {
+    pub(crate) value: String,
+}
+
+impl fmt::Display for RangeBound {
+    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.value.fmt(formatter)
+    }
+}
+
+#[derive(Clone, Debug)]
+pub(crate) struct Range {
+    pub(crate) lower_bound: RangeBound,
+    pub(crate) upper_bound: RangeBound,
+    pub(crate) r#if: Option<Expression>,
+}
+
+impl fmt::Display for Range {
+    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(formatter, "{} {}", self.lower_bound, self.upper_bound)
+    }
+}
+
+#[derive(Clone, Debug)]
+pub(crate) struct Prompt {
+    pub(crate) r#if: Option<Expression>,
+}
+
+#[derive(Clone, Debug)]
+pub(crate) enum Attribute {
+    Default(DefaultAttribute),
+    DependsOn(Expression),
+    Select(Select),
+    Imply(Imply),
+    Range(Range),
+    Help(String),
+    Prompt(Prompt),
+}
+
+#[derive(Debug)]
+pub(crate) struct Config {
+    pub(crate) symbol: String,
+    pub(crate) attributes: Vec<Attribute>,
+}
+
+#[derive(Debug)]
+pub(crate) struct KconfigMenu {
+    pub(crate) depends_on: Vec<Expression>,
+    pub(crate) entries: Vec<Entry>,
+}
+
+#[derive(Debug)]
+pub(crate) struct Choice {
+    pub(crate) options: Vec<Attribute>,
+    pub(crate) entries: Vec<Entry>,
+}
+
+#[derive(Debug)]
+pub(crate) struct If {
+    pub(crate) condition: Expression,
+    pub(crate) entries: Vec<Entry>,
+}
+
+#[derive(Debug)]
+pub(crate) enum Entry {
+    Config(Config),
+    Menu(KconfigMenu),
+    Choice(Choice),
+    If(If),
+    Comment,
+}
+
+#[expect(
+    clippy::disallowed_methods,
+    reason = "host tools use the platform c_char ABI, not the kernel's unsigned c_char"
+)]
+fn string(pointer: *const c_char) -> Option<String> {
+    if pointer.is_null() {
+        None
+    } else {
+        // SAFETY: All strings in the parse tree are NUL-terminated.
+        let string = unsafe { CStr::from_ptr(pointer) };
+        Some(string.to_string_lossy().into_owned())
+    }
+}
+
+fn symbol_name(symbol: *const Symbol) -> String {
+    // SAFETY: Callers only pass non-null symbols from the parse tree.
+    string(unsafe { (*symbol).name }).unwrap_or_default()
+}
+
+/// Appends one `expr_print()` fragment to the `String` that backs `data`.
+///
+/// # Safety
+///
+/// `data` must be the `String` pointer supplied by [`render()`], and `text`
+/// must be NUL-terminated or null.
+unsafe extern "C" fn append_expr_text(
+    data: *mut c_void,
+    _symbol: *mut Symbol,
+    text: *const c_char,
+) {
+    // SAFETY: `render()` passes a `String` that outlives the `expr_print()`
+    // call.
+    let output = unsafe { &mut *data.cast::<String>() };
+    if let Some(text) = string(text) {
+        output.push_str(&text);
+    }
+}
+
+/// Renders `expr` the way the frontends print it.
+fn render(expr: *const Expr, prevtoken: expr_type) -> String {
+    let mut output = String::new();
+    // SAFETY: `expr` points into the parse tree, the callback is
+    // synchronous, and `output` outlives the call.
+    unsafe {
+        expr_print(
+            expr,
+            Some(append_expr_text),
+            ptr::from_mut(&mut output).cast(),
+            prevtoken as c_int,
+        );
+    }
+    output
+}
+
+fn expression(expr: *const Expr) -> Option<Expression> {
+    if expr.is_null() {
+        return None;
+    }
+
+    let rendered = render(expr, E_NONE);
+
+    // Render the negation of `expr` through the same printer, so that it
+    // can be compared with another rendered expression.
+    // SAFETY: `expr` is non-null, and `E_NOT` nodes keep their operand in
+    // `left.expr`.
+    let negation = if unsafe { (*expr).type_ } == E_NOT {
+        // SAFETY: `expr` is non-null, and `E_NOT` nodes keep their operand in
+        // `left.expr`.
+        render(unsafe { (*expr).left.expr }, E_NONE)
+    } else {
+        format!("!{}", render(expr, E_NOT))
+    };
+
+    Some(Expression { rendered, negation })
+}
+
+fn dependencies(expr: *const Expr, output: &mut Vec<Expression>) {
+    if expr.is_null() {
+        return;
+    }
+
+    // SAFETY: `expr` points into the parse tree.
+    if unsafe { (*expr).type_ } == E_AND {
+        // SAFETY: `E_AND` nodes have an expression on both sides.
+        let (left, right) = unsafe { ((*expr).left.expr, (*expr).right.expr) };
+        dependencies(left, output);
+        dependencies(right, output);
+    } else if let Some(expr) = expression(expr) {
+        output.push(expr);
+    }
+}
+
+fn range_bound(symbol: *const Symbol) -> RangeBound {
+    RangeBound {
+        // SAFETY: Range expressions contain a symbol in each operand.
+        value: symbol_name(symbol),
+    }
+}
+
+fn attributes(menu: *const Menu, symbol: *const Symbol) -> Vec<Attribute> {
+    let mut attributes = Vec::new();
+
+    let mut menu_dependencies = Vec::new();
+    // SAFETY: `menu` points into the parse tree.
+    dependencies(unsafe { (*menu).dep }, &mut menu_dependencies);
+    attributes.extend(menu_dependencies.into_iter().map(Attribute::DependsOn));
+
+    // SAFETY: `symbol` points into the parse tree.
+    let mut property = unsafe { (*symbol).prop };
+    while !property.is_null() {
+        // A property belongs to the menu node of the location that defined it.
+        // SAFETY: Property links are valid during the callback.
+        if ptr::eq(unsafe { (*property).menu }, menu) {
+            // SAFETY: Property expression pointers remain during the
+            // callback.
+            let (value, condition) = unsafe { ((*property).expr, (*property).visible.expr) };
+            let condition = expression(condition);
+            // SAFETY: `property` points into the parse tree.
+            let property_type = unsafe { (*property).type_ };
+            match property_type {
+                // The parser rewrites a `menuconfig` prompt to `P_MENU`. Menus
+                // and the mainmenu have no symbol for properties, so their
+                // `P_MENU` never ends up in a property list.
+                P_PROMPT | P_MENU => {
+                    attributes.push(Attribute::Prompt(Prompt { r#if: condition }));
+                }
+                P_DEFAULT => {
+                    if let Some(expression) = expression(value) {
+                        attributes.push(Attribute::Default(DefaultAttribute {
+                            expression,
+                            r#if: condition,
+                        }));
+                    }
+                }
+                P_SELECT | P_IMPLY => {
+                    // SAFETY: Select and imply values are `E_SYMBOL`
+                    // expressions, which keep their symbol in `left.sym`.
+                    let target = unsafe { (*value).left.sym };
+                    let select = Select {
+                        // SAFETY: `target` is a non-null symbol.
+                        symbol: symbol_name(target),
+                        r#if: condition,
+                    };
+                    if property_type == P_SELECT {
+                        attributes.push(Attribute::Select(select));
+                    } else {
+                        attributes.push(Attribute::Imply(select));
+                    }
+                }
+                P_RANGE => {
+                    // SAFETY: Range values are `E_RANGE` expressions, which
+                    // keep a symbol in each operand.
+                    let (lower_bound, upper_bound) =
+                        unsafe { ((*value).left.sym, (*value).right.sym) };
+                    attributes.push(Attribute::Range(Range {
+                        lower_bound: range_bound(lower_bound),
+                        upper_bound: range_bound(upper_bound),
+                        r#if: condition,
+                    }));
+                }
+                _ => {}
+            }
+        }
+        // SAFETY: `property` points into the property list.
+        property = unsafe { (*property).next };
+    }
+
+    // SAFETY: The help pointer is parser-owned and remains valid during the
+    // callback.
+    let help = unsafe { (*menu).help };
+    if let Some(help) = string(help) {
+        attributes.push(Attribute::Help(help));
+    }
+
+    attributes
+}
+
+fn menu_dependencies(menu: *const Menu) -> Vec<Expression> {
+    let mut output = Vec::new();
+    // SAFETY: `menu` points into the parse tree.
+    dependencies(unsafe { (*menu).dep }, &mut output);
+    output
+}
+
+fn entries(parent: *const Menu) -> Vec<Entry> {
+    let mut output = Vec::new();
+    // SAFETY: `parent` points into the parse tree.
+    let mut menu: *const Menu = unsafe { (*parent).list };
+
+    while !menu.is_null() {
+        // SAFETY: Menu links and fields remain valid during the callback.
+        let symbol: *const Symbol = unsafe { (*menu).sym };
+        // SAFETY: `menu` points into the parse tree.
+        let menu_type = unsafe { (*menu).type_ };
+        let entry = match menu_type {
+            // The parser records `config` and `menuconfig` entries as a menu
+            // node carrying a symbol. Neither opens a submenu while parsing;
+            // `menu_finalize()` is what nests later entries underneath them,
+            // and it has not run yet.
+            M_NORMAL | M_MENU if !symbol.is_null() => Entry::Config(Config {
+                symbol: symbol_name(symbol),
+                attributes: attributes(menu, symbol),
+            }),
+            M_NORMAL => panic!("Kconfig 'config' entry without a symbol"),
+            M_MENU => Entry::Menu(KconfigMenu {
+                depends_on: menu_dependencies(menu),
+                entries: entries(menu),
+            }),
+            // A choice is recorded as a symbol with no name, so its `options`
+            // are read the same way a config's attributes are.
+            M_CHOICE => Entry::Choice(Choice {
+                options: attributes(menu, symbol),
+                entries: entries(menu),
+            }),
+            M_IF => Entry::If(If {
+                // SAFETY: `If` entries always have a dependency expression.
+                condition: expression(unsafe { (*menu).dep })
+                    .unwrap_or_else(|| Expression::constant("y", "n")),
+                entries: entries(menu),
+            }),
+            M_COMMENT => Entry::Comment,
+            value => panic!("unknown Kconfig menu type {value}"),
+        };
+        output.push(entry);
+
+        // SAFETY: `menu` points into the sibling list.
+        menu = unsafe { (*menu).next };
+    }
+
+    output
+}
+
+struct ParseState {
+    entries: Option<Vec<Entry>>,
+    panicked: bool,
+}
+
+/// Collects the parse tree before the parser finalizes (simplifies) it.
+///
+/// # Safety
+///
+/// `data` must point to the [`ParseState`] supplied by [`parse_kconfig()`].
+unsafe extern "C" fn collect_entries(root: *const Menu, data: *mut c_void) {
+    // SAFETY: `parse_kconfig()` passes a non-null `ParseState` that outlives
+    // the synchronous `conf_parse()` call.
+    let state = unsafe { &mut *data.cast::<ParseState>() };
+    match catch_unwind(AssertUnwindSafe(|| entries(root))) {
+        Ok(entries) => state.entries = Some(entries),
+        Err(_) => state.panicked = true,
+    }
+}
+
+/// Parses the Kconfig tree rooted at `name` relative to the current directory.
+///
+/// # Panics
+///
+/// Panics if the parser does not invoke the traversal callback or if
+/// traversing its parse tree encounters an unsupported node.
+#[expect(
+    clippy::disallowed_methods,
+    reason = "host tools use the platform c_char ABI, not the kernel's unsigned c_char"
+)]
+pub(crate) fn parse_kconfig(name: &CStr) -> Vec<Entry> {
+    let mut state = ParseState {
+        entries: None,
+        panicked: false,
+    };
+
+    // SAFETY: `conf_parse()` is synchronous, so `state` outlives the callback
+    // and its user-data pointer.
+    unsafe {
+        conf_set_pre_finalize_callback(Some(collect_entries), ptr::from_mut(&mut state).cast());
+        conf_parse(name.as_ptr());
+        conf_set_pre_finalize_callback(None, ptr::null_mut());
+    }
+    assert!(!state.panicked, "failed to traverse Kconfig graph");
+    state
+        .entries
+        .expect("Kconfig parser calls the traversal callback")
+}
diff --git a/scripts/kconfig/kconfirm/.gitignore b/scripts/kconfig/kconfirm/.gitignore
new file mode 100644
index 000000000000..f21a4d460aee
--- /dev/null
+++ b/scripts/kconfig/kconfirm/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/kconfirm
diff --git a/scripts/kconfig/kconfirm/analyze.rs b/scripts/kconfig/kconfirm/analyze.rs
new file mode 100644
index 000000000000..192669405a88
--- /dev/null
+++ b/scripts/kconfig/kconfirm/analyze.rs
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Julian Braha <julianbraha@gmail.com>
+ */
+use crate::{
+    dead_links::{
+        self,
+        check_link,
+        LinkStatus, //
+    },
+    kconfig::{
+        Attribute::*,
+        Choice,
+        Config,
+        Entry,
+        Expression,
+        If,
+        Imply,
+        KconfigMenu,
+        Select, //
+    },
+    output::{
+        Finding,
+        Severity, //
+    },
+    symbol_table::{
+        AttributeDef,
+        SymbolUpdate, //
+    },
+    AnalysisArgs,
+    Check,
+    SymbolTable, //
+};
+use std::{
+    collections::HashSet, //
+    option::Option,       //
+};
+
+fn check_text(
+    unique_links: &mut HashSet<String>,
+    text: &str,
+    args: &AnalysisArgs,
+    findings: &mut Vec<Finding>,
+    symbol: Option<&str>,
+    arch: &str,
+    context: &str,
+) {
+    if !args.is_enabled(Check::DeadLink) {
+        return;
+    }
+
+    for link in dead_links::find_links(text) {
+        // Avoid checking the same link more than once.
+        if !unique_links.insert(link.clone()) {
+            continue;
+        }
+
+        let status = check_link(&link);
+        if status != LinkStatus::Ok && status != LinkStatus::ProbablyBlocked {
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DeadLink,
+                symbol: symbol.map(|s| s.to_string()),
+                message: format!(
+                    "{} contains link {} with status {}",
+                    context,
+                    link,
+                    status.as_str()
+                ),
+                arch: arch.to_owned(),
+            });
+        }
+    }
+}
+
+#[derive(Clone)]
+pub(crate) struct Context {
+    pub(crate) arch: String,
+    pub(crate) definition_condition: Vec<Expression>,
+    pub(crate) visibility: Vec<Option<Expression>>,
+    pub(crate) dependencies: Vec<Expression>,
+}
+
+impl Context {
+    fn with_arch(arch: &str) -> Context {
+        Context {
+            arch: arch.to_owned(),
+            definition_condition: vec![],
+            visibility: vec![],
+            dependencies: vec![],
+        }
+    }
+
+    fn child(&self) -> Self {
+        self.clone()
+    }
+
+    fn with_dep(mut self, dep: Expression) -> Self {
+        self.dependencies.push(dep);
+        self
+    }
+
+    fn with_visibility(mut self, cond: Option<Expression>) -> Self {
+        self.visibility.push(cond);
+        self
+    }
+
+    fn with_definition(mut self, cond: Expression) -> Self {
+        self.definition_condition.push(cond);
+        self
+    }
+}
+
+fn recurse_entries(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    unique_links: &mut HashSet<String>,
+    entries: Vec<Entry>,
+    ctx: Context,
+    findings: &mut Vec<Finding>,
+) {
+    for entry in entries {
+        process_entry(args, symtab, unique_links, entry, ctx.clone(), findings);
+    }
+}
+
+/// Traverses parsed Kconfig entries, populates `symtab`, and returns findings.
+pub(crate) fn analyze(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    arch: &str,
+    entries: Vec<Entry>,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut unique_links = HashSet::new();
+
+    let ctx = Context::with_arch(arch);
+
+    recurse_entries(args, symtab, &mut unique_links, entries, ctx, &mut findings);
+
+    findings
+}
+
+// Config here refers to a config option in the parse tree.
+fn handle_config(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Config,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+    unique_links: &mut HashSet<String>,
+) {
+    let config_symbol = entry.symbol;
+
+    let mut child_ctx = ctx.child();
+
+    let mut dependencies = Vec::new();
+    let mut kconfig_selects: Vec<Select> = Vec::new();
+    let mut kconfig_implies: Vec<Imply> = Vec::new();
+    let mut ranges = Vec::new();
+    let mut defaults = Vec::new();
+    let mut found_prompt = false;
+
+    for attribute in entry.attributes {
+        match attribute {
+            Default(default) => defaults.push(default),
+            DependsOn(depends_on) => dependencies.push(depends_on),
+            Select(select) => kconfig_selects.push(select),
+            Imply(imply) => kconfig_implies.push(imply),
+            // Kconfig range bounds are inclusive.
+            Range(range) => ranges.push(range),
+            Help(h) => {
+                check_text(
+                    unique_links,
+                    &h,
+                    args,
+                    findings,
+                    Some(&config_symbol),
+                    &ctx.arch,
+                    "help text",
+                );
+            }
+
+            // A prompt's `if` expression determines its visibility.
+            Prompt(prompt) => {
+                found_prompt = true;
+                if let Some(c) = prompt.r#if {
+                    child_ctx = child_ctx.with_visibility(Some(c));
+                }
+            }
+        }
+    }
+
+    if !found_prompt {
+        child_ctx = child_ctx.with_visibility(None);
+    }
+
+    // Add inherited dependencies to this symbol's own dependencies.
+    dependencies.extend(child_ctx.dependencies.clone());
+    symtab.merge_insert(SymbolUpdate {
+        symbol: config_symbol.clone(),
+        is_definition: true,
+        attributes: AttributeDef {
+            dependencies,
+            ranges,
+            defaults,
+            visibility: child_ctx.visibility.clone(),
+            selects: kconfig_selects
+                .clone()
+                .into_iter()
+                .map(|select| (select.symbol, select.r#if))
+                .collect(),
+            implies: kconfig_implies
+                .into_iter()
+                .map(|imply| (imply.symbol, imply.r#if))
+                .collect(),
+        },
+        definition_condition: child_ctx.definition_condition.clone(),
+        selected_by: None,
+    });
+
+    for select in kconfig_selects {
+        symtab.merge_insert(SymbolUpdate {
+            symbol: select.symbol,
+            is_definition: false,
+            attributes: AttributeDef::default(),
+            definition_condition: child_ctx.definition_condition.clone(),
+            selected_by: Some((config_symbol.clone(), select.r#if)),
+        });
+    }
+}
+
+fn handle_menu(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: KconfigMenu,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+    unique_links: &mut HashSet<String>,
+) {
+    let mut child_ctx = ctx.child();
+
+    for dep in entry.depends_on {
+        child_ctx = child_ctx.with_dep(dep.clone());
+        // Menu dependencies also constrain the visibility of their contained
+        // entries.
+        child_ctx = child_ctx.with_visibility(Some(dep));
+    }
+
+    let nested_entries = entry.entries;
+
+    recurse_entries(
+        args,
+        symtab,
+        unique_links,
+        nested_entries,
+        child_ctx.clone(),
+        findings,
+    );
+}
+
+fn handle_choice(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: Choice,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+    unique_links: &mut HashSet<String>,
+) {
+    let mut child_ctx = ctx.child();
+
+    // Choice members inherit both outer and choice-specific dependencies.
+    for attribute in entry.options {
+        match attribute {
+            DependsOn(depends_on) => {
+                child_ctx = child_ctx.with_dep(depends_on);
+            }
+
+            // A prompt's `if` expression determines its visibility.
+            Prompt(prompt) => {
+                if let Some(i) = prompt.r#if {
+                    child_ctx = child_ctx.with_visibility(Some(i));
+                }
+            }
+            _ => {}
+        }
+    }
+
+    let nested_entries = entry.entries;
+
+    recurse_entries(
+        args,
+        symtab,
+        unique_links,
+        nested_entries,
+        child_ctx.clone(),
+        findings,
+    );
+}
+
+fn handle_if(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    entry: If,
+    ctx: &Context,
+    findings: &mut Vec<Finding>,
+    unique_links: &mut HashSet<String>,
+) {
+    let mut child_ctx = ctx.child();
+    child_ctx = child_ctx.with_definition(entry.condition.clone());
+    child_ctx = child_ctx.with_dep(entry.condition);
+    let nested_entries = entry.entries;
+
+    recurse_entries(
+        args,
+        symtab,
+        unique_links,
+        nested_entries,
+        child_ctx,
+        findings,
+    );
+}
+
+fn process_entry(
+    args: &AnalysisArgs,
+    symtab: &mut SymbolTable,
+    unique_links: &mut HashSet<String>,
+    entry: Entry,
+    ctx: Context,
+    findings: &mut Vec<Finding>,
+) {
+    // Each handler updates the context for the construct it processes.
+    match entry {
+        Entry::Config(c) => handle_config(args, symtab, c, &ctx, findings, unique_links),
+        Entry::Menu(m) => handle_menu(args, symtab, m, &ctx, findings, unique_links),
+        Entry::Choice(c) => handle_choice(args, symtab, c, &ctx, findings, unique_links),
+        Entry::If(i) => handle_if(args, symtab, i, &ctx, findings, unique_links),
+        Entry::Comment => {}
+    }
+}
diff --git a/scripts/kconfig/kconfirm/arch.rs b/scripts/kconfig/kconfirm/arch.rs
new file mode 100644
index 000000000000..9af24771a341
--- /dev/null
+++ b/scripts/kconfig/kconfirm/arch.rs
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Julian Braha <julianbraha@gmail.com>
+ */
+use std::{
+    fs,
+    io,
+    path::Path, //
+};
+
+/// Returns the architecture directory names in a Linux source tree.
+pub(crate) fn available_architectures(linux_path: &Path) -> io::Result<Vec<String>> {
+    let mut architectures = Vec::new();
+
+    for entry in fs::read_dir(linux_path.join("arch"))? {
+        let entry = entry?;
+        if !entry.file_type()?.is_dir() {
+            continue;
+        }
+
+        let architecture = entry.file_name().into_string().map_err(|name| {
+            io::Error::new(
+                io::ErrorKind::InvalidData,
+                format!("architecture directory name is not valid UTF-8: {name:?}"),
+            )
+        })?;
+        architectures.push(architecture);
+    }
+
+    architectures.sort();
+    Ok(architectures)
+}
+
+/// Maps the build architecture to its source directory, like the top-level
+/// Makefile's `SRCARCH`.
+pub(crate) fn arch_to_srcarch(arch: &str) -> &str {
+    match arch {
+        "i386" | "x86_64" => "x86",
+        "sparc32" | "sparc64" => "sparc",
+        "parisc64" => "parisc",
+        _ => arch,
+    }
+}
+
+/// Maps an architecture source directory to its Kconfig option name.
+pub(crate) fn arch_dir_to_config(arch_dir: &str) -> String {
+    match arch_dir {
+        "powerpc" => String::from("PPC"),
+        "sh" => String::from("SUPERH"),
+        "um" => String::from("UML"),
+        _ => arch_dir.to_uppercase(),
+    }
+}
diff --git a/scripts/kconfig/kconfirm/checks.rs b/scripts/kconfig/kconfirm/checks.rs
new file mode 100644
index 000000000000..c810db342fb7
--- /dev/null
+++ b/scripts/kconfig/kconfirm/checks.rs
@@ -0,0 +1,748 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Julian Braha <julianbraha@gmail.com>
+ */
+use crate::{
+    kconfig::{
+        Expression,
+        RangeBound, //
+    },
+    output::{
+        Finding,
+        Severity, //
+    },
+    symbol_table::{
+        AttributeDef,
+        SymbolInfo, //
+    },
+};
+use std::{
+    collections::HashSet,
+    num::ParseIntError,
+    str::FromStr, //
+};
+
+/// A diagnostic check that can be enabled or disabled from the command line.
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
+pub(crate) enum Check {
+    DeadLink,
+    SelectVisible,
+    DuplicateDependency,
+    DuplicateRange,
+    DeadRange,
+    DuplicateSelect,
+    DeadSelect,
+    DeadDefault,
+    ConstantCondition,
+    DuplicateDefault,
+    DuplicateDefaultValue,
+    DuplicateImply,
+    DeadImply,
+    ReverseRange,
+}
+
+impl Check {
+    /// Returns the stable command-line and diagnostic identifier for a check.
+    pub(crate) fn as_str(self) -> &'static str {
+        match self {
+            Check::DeadLink => "dead_link",
+            Check::SelectVisible => "select_visible",
+            Check::DuplicateDependency => "duplicate_dependency",
+            Check::DuplicateRange => "duplicate_range",
+            Check::DeadRange => "dead_range",
+            Check::DuplicateSelect => "duplicate_select",
+            Check::DeadSelect => "dead_select",
+            Check::DeadDefault => "dead_default",
+            Check::ConstantCondition => "constant_condition",
+            Check::DuplicateDefault => "duplicate_default",
+            Check::DuplicateDefaultValue => "duplicate_default_value",
+            Check::DuplicateImply => "duplicate_imply",
+            Check::DeadImply => "dead_imply",
+            Check::ReverseRange => "reverse_range",
+        }
+    }
+}
+
+#[derive(Debug)]
+pub(crate) struct ParseCheckError {
+    pub(crate) input: String,
+}
+
+impl std::fmt::Display for ParseCheckError {
+    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
+        write!(f, "unknown check '{}'", self.input)
+    }
+}
+
+impl std::error::Error for ParseCheckError {}
+
+impl FromStr for Check {
+    type Err = ParseCheckError;
+
+    fn from_str(name: &str) -> Result<Self, Self::Err> {
+        match name {
+            "dead_link" => Ok(Check::DeadLink),
+            "select_visible" => Ok(Check::SelectVisible),
+            "duplicate_dependency" => Ok(Check::DuplicateDependency),
+            "duplicate_range" => Ok(Check::DuplicateRange),
+            "dead_range" => Ok(Check::DeadRange),
+            "duplicate_select" => Ok(Check::DuplicateSelect),
+            "dead_select" => Ok(Check::DeadSelect),
+            "dead_default" => Ok(Check::DeadDefault),
+            "constant_condition" => Ok(Check::ConstantCondition),
+            "duplicate_default" => Ok(Check::DuplicateDefault),
+            "duplicate_default_value" => Ok(Check::DuplicateDefaultValue),
+            "duplicate_imply" => Ok(Check::DuplicateImply),
+            "dead_imply" => Ok(Check::DeadImply),
+            "reverse_range" => Ok(Check::ReverseRange),
+            _ => Err(ParseCheckError {
+                input: name.to_string(),
+            }),
+        }
+    }
+}
+
+/// The set of checks enabled for one analysis run.
+#[derive(Debug)]
+pub(crate) struct AnalysisArgs {
+    enabled_checks: HashSet<Check>,
+}
+
+impl AnalysisArgs {
+    /// Creates an analysis configuration with no checks enabled.
+    pub(crate) fn new() -> Self {
+        Self {
+            enabled_checks: HashSet::new(),
+        }
+    }
+
+    /// Enables `check`, returning whether it was newly enabled.
+    pub(crate) fn enable_check(&mut self, check: Check) -> bool {
+        self.enabled_checks.insert(check)
+    }
+
+    /// Disables `check`, returning whether it had been enabled.
+    pub(crate) fn disable_check(&mut self, check: Check) -> bool {
+        self.enabled_checks.remove(&check)
+    }
+
+    /// Returns whether `check` is enabled.
+    pub(crate) fn is_enabled(&self, check: Check) -> bool {
+        self.enabled_checks.contains(&check)
+    }
+}
+
+/// Checks int/hex ranges with lower bound > upper bound.
+pub(crate) fn check_reverse_ranges(
+    arch: &str,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    for range in &info.ranges {
+        // Return an error when a bound cannot be parsed as an `i128`.
+        fn range_bound_to_int(range_bound: &RangeBound) -> Result<i128, ParseIntError> {
+            if range_bound.value.starts_with("0x") || range_bound.value.starts_with("0X") {
+                let trimmed = range_bound
+                    .value
+                    .trim_start_matches("0x")
+                    .trim_start_matches("0X");
+                i128::from_str_radix(trimmed, 16)
+            } else {
+                range_bound.value.parse()
+            }
+        }
+
+        let maybe_lower_bound = range_bound_to_int(&range.lower_bound);
+        let maybe_upper_bound = range_bound_to_int(&range.upper_bound);
+
+        match (maybe_lower_bound, maybe_upper_bound) {
+            (Ok(lower_bound), Ok(upper_bound)) => {
+                if lower_bound > upper_bound {
+                    let message = format!(
+                        "reverse range {} for config option: {}, no value is valid",
+                        range, var_symbol,
+                    );
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::ReverseRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        arch: arch.to_owned(),
+                        message,
+                    });
+                }
+            }
+            (Result::Err(_), _) | (_, Result::Err(_)) => continue,
+        }
+    }
+
+    findings
+}
+
+pub(crate) fn check_constant_conditions(
+    arch: &str,
+    var_symbol: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let default_conditions: Vec<&Expression> = info
+        .defaults
+        .iter()
+        .filter_map(|conditional_default| conditional_default.r#if.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.dependencies,
+        default_conditions,
+        "default",
+    );
+
+    let select_conditions: Vec<&Expression> = info
+        .selects
+        .iter()
+        .filter_map(|conditional_select| conditional_select.1.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.dependencies,
+        select_conditions,
+        "select",
+    );
+
+    let imply_conditions: Vec<&Expression> = info
+        .implies
+        .iter()
+        .filter_map(|imp| imp.1.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.dependencies,
+        imply_conditions,
+        "imply",
+    );
+
+    let range_conditions: Vec<&Expression> = info
+        .ranges
+        .iter()
+        .filter_map(|conditional_range| conditional_range.r#if.as_ref())
+        .collect();
+
+    check_conditions(
+        arch,
+        &mut findings,
+        var_symbol,
+        &info.dependencies,
+        range_conditions,
+        "range",
+    );
+
+    fn check_conditions(
+        arch: &str,
+        findings: &mut Vec<Finding>,
+        symbol: &str,
+        dependencies: &[Expression],
+        attribute_conditions: Vec<&Expression>,
+        context: &str,
+    ) {
+        for attribute_condition in attribute_conditions {
+            if dependencies.contains(attribute_condition) {
+                let message = format!(
+                    "constant {} condition 'if {}' for config option: {}, this condition is a dependency and will always be true",
+                    context,
+                    attribute_condition,
+                    symbol,
+                );
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: Check::ConstantCondition,
+                    symbol: Some(symbol.to_owned()),
+                    arch: arch.to_owned(),
+                    message,
+                });
+            } else if dependencies
+                .iter()
+                .any(|dependency| attribute_condition.is_negation_of(dependency))
+            {
+                let message = format!(
+                    "constant {} condition 'if {}' for config option: {}, this condition negates a dependency and will always be false",
+                    context, attribute_condition, symbol,
+                );
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: Check::ConstantCondition,
+                    symbol: Some(symbol.to_owned()),
+                    arch: arch.to_owned(),
+                    message,
+                });
+            }
+        }
+    }
+    findings
+}
+
+pub(crate) fn check_variable_info(
+    args: &AnalysisArgs,
+    var_symbol: &str,
+    arch: &str,
+    info: &AttributeDef,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    if args.is_enabled(Check::DuplicateDependency) {
+        findings.extend(check_duplicate_dependencies(arch, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DuplicateImply) || args.is_enabled(Check::DeadImply) {
+        findings.extend(check_implies(arch, var_symbol, info, args));
+    }
+
+    if args.is_enabled(Check::DuplicateRange) || args.is_enabled(Check::DeadRange) {
+        findings.extend(check_ranges(arch, var_symbol, info, args));
+    }
+
+    if args.is_enabled(Check::DuplicateSelect) || args.is_enabled(Check::DeadSelect) {
+        findings.extend(check_selects(arch, var_symbol, info, args));
+    }
+
+    if args.is_enabled(Check::ConstantCondition) {
+        findings.extend(check_constant_conditions(arch, var_symbol, info));
+    }
+
+    if args.is_enabled(Check::DeadDefault)
+        || args.is_enabled(Check::DuplicateDefault)
+        || args.is_enabled(Check::DuplicateDefaultValue)
+    {
+        findings.extend(check_defaults(arch, var_symbol, info, args));
+    }
+
+    if args.is_enabled(Check::ReverseRange) {
+        findings.extend(check_reverse_ranges(arch, var_symbol, info));
+    }
+
+    findings
+}
+
+pub(crate) fn check_select_visible(
+    var_symbol: &str,
+    info: &SymbolInfo,
+    arch: &str,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    if info.selected_by.is_empty() {
+        return Vec::new();
+    }
+
+    for (selector, select_conditions) in &info.selected_by {
+        for _condition in select_conditions {
+            let message = format!(
+                "selects the visible {}; consider using 'depends on' or 'imply' instead",
+                var_symbol
+            );
+
+            for (if_conditions, attributes) in &info.attribute_defs {
+                if if_conditions.is_empty() && attributes.visibility.is_empty() {
+                    // Empty visibility makes the symbol unconditionally
+                    // visible (for this architecture).
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::SelectVisible,
+                        symbol: Some(selector.to_owned()),
+                        message: message.clone(),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+fn is_duplicate<T: Eq + std::hash::Hash>(set: &mut HashSet<T>, key: T) -> bool {
+    !set.insert(key)
+}
+
+fn check_duplicate_dependencies(arch: &str, var_symbol: &str, info: &AttributeDef) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen = HashSet::new();
+
+    for dep in &info.dependencies {
+        if is_duplicate(&mut seen, dep.to_string()) {
+            let message = format!("duplicate dependency on {dep}");
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DuplicateDependency,
+                symbol: Some(var_symbol.to_owned()),
+                message,
+                arch: arch.to_owned(),
+            });
+        }
+    }
+
+    findings
+}
+
+/// Checks for `duplicate_imply` and `dead_imply`.
+fn check_implies(
+    arch: &str,
+    var_symbol: &str,
+    info: &AttributeDef,
+    args: &AnalysisArgs,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // Symbols implied unconditionally.
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // Each tuple represents (symbol, implication condition).
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    for (imply_var, imply_cond) in &info.implies {
+        match &imply_cond {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // Report duplicate conditional implies. The insertion must
+                // happen even when the check is disabled.
+                if !conditional.insert((imply_var.clone(), cond_str.clone()))
+                    && args.is_enabled(Check::DuplicateImply)
+                {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!(
+                            "duplicate imply of {} with condition {}",
+                            imply_var, cond_str
+                        ),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // An unconditional imply makes this conditional one dead.
+                if unconditional.contains(imply_var) && args.is_enabled(Check::DeadImply) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead imply of {}", imply_var),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+
+            None => {
+                // Report duplicate unconditional implies. The insertion must
+                // happen even when the check is disabled.
+                if !unconditional.insert(imply_var.clone())
+                    && args.is_enabled(Check::DuplicateImply)
+                {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateImply,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate imply of {}", imply_var),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // An unconditional imply makes this conditional one dead.
+                if args.is_enabled(Check::DeadImply) {
+                    for (sym, _) in &conditional {
+                        if sym == imply_var {
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::DeadImply,
+                                symbol: Some(var_symbol.to_owned()),
+                                message: format!("dead imply of {}", imply_var),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+/// Checks `duplicate_range` and `dead_range`.
+fn check_ranges(
+    arch: &str,
+    var_symbol: &str,
+    info: &AttributeDef,
+    args: &AnalysisArgs,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    // Unconditional ranges, for duplicate detection.
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // Each tuple represents (range bounds, condition).
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    // Kconfig uses the first range whose condition is satisfied. Once an
+    // unconditional range has been reached, every non-duplicate range after it
+    // is unreachable, regardless of its bounds.
+    let mut seen_unconditional = false;
+
+    for range in &info.ranges {
+        // Use both bounds to identify a range.
+        let range_key = format!("{} {}", range.lower_bound, range.upper_bound);
+
+        let duplicate = match &range.r#if {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // Report duplicate conditional ranges. The insertion must
+                // happen even when the check is disabled.
+                let duplicate = !conditional.insert((range_key, cond_str.clone()));
+                if duplicate && args.is_enabled(Check::DuplicateRange) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate range {} with condition {}", range, cond_str),
+                        arch: arch.to_owned(),
+                    });
+                }
+                duplicate
+            }
+
+            None => {
+                // Report duplicate unconditional ranges. The insertion must
+                // happen even when the check is disabled.
+                let duplicate = !unconditional.insert(range_key);
+                if duplicate && args.is_enabled(Check::DuplicateRange) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateRange,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate range {}", range),
+                        arch: arch.to_owned(),
+                    });
+                }
+                duplicate
+            }
+        };
+
+        if seen_unconditional && !duplicate && args.is_enabled(Check::DeadRange) {
+            findings.push(Finding {
+                severity: Severity::Warning,
+                check: Check::DeadRange,
+                symbol: Some(var_symbol.to_owned()),
+                message: format!("dead range of {}", range),
+                arch: arch.to_owned(),
+            });
+        }
+
+        if range.r#if.is_none() {
+            seen_unconditional = true;
+        }
+    }
+
+    findings
+}
+
+/// Checks for `duplicate_select` and `dead_select`.
+fn check_selects(
+    arch: &str,
+    var_symbol: &str,
+    info: &AttributeDef,
+    args: &AnalysisArgs,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+
+    //  Unconditional selects.
+    let mut unconditional: HashSet<String> = HashSet::new();
+
+    // Each tuple represents (symbol, condition).
+    let mut conditional: HashSet<(String, String)> = HashSet::new();
+
+    for select in &info.selects {
+        let select_var = select.0.clone();
+
+        match &select.1 {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+
+                // Report duplicate conditional selects. The insertion must
+                // happen even when the check is disabled.
+                if !conditional.insert((select_var.clone(), cond_str.clone()))
+                    && args.is_enabled(Check::DuplicateSelect)
+                {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!(
+                            "duplicate select of {} with condition {}",
+                            select.0, cond_str
+                        ),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // An unconditional select makes this conditional one dead.
+                if unconditional.contains(&select_var) && args.is_enabled(Check::DeadSelect) {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DeadSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("dead select of {}", select.0),
+                        arch: arch.to_owned(),
+                    });
+                }
+            }
+
+            None => {
+                // Report duplicate unconditional selects. The insertion must
+                // happen even when the check is disabled.
+                if !unconditional.insert(select_var.clone())
+                    && args.is_enabled(Check::DuplicateSelect)
+                {
+                    findings.push(Finding {
+                        severity: Severity::Warning,
+                        check: Check::DuplicateSelect,
+                        symbol: Some(var_symbol.to_owned()),
+                        message: format!("duplicate select of {}", select.0),
+                        arch: arch.to_owned(),
+                    });
+                }
+
+                // An unconditional select makes this conditional one dead.
+                if args.is_enabled(Check::DeadSelect) {
+                    for (sym, _) in &conditional {
+                        if sym == &select_var {
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::DeadSelect,
+                                symbol: Some(var_symbol.to_owned()),
+                                message: format!("dead select of {}", select.0),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    }
+                }
+            }
+        }
+    }
+
+    findings
+}
+
+fn check_defaults(
+    arch: &str,
+    var_symbol: &str,
+    info: &AttributeDef,
+    args: &AnalysisArgs,
+) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut seen_conditions = HashSet::new();
+    let mut seen_values = HashSet::new();
+    let mut seen_unconditional_values: HashSet<String> = HashSet::new();
+    let mut already_unconditional = false;
+
+    for default in &info.defaults {
+        let val_str = default.expression.to_string();
+
+        let has_real_condition = match &default.r#if {
+            Some(cond) => {
+                let cond_str = cond.to_string();
+                !cond_str.is_empty()
+            }
+            None => false,
+        };
+
+        let is_value_dup = if has_real_condition {
+            is_duplicate(&mut seen_values, val_str.clone())
+        } else {
+            false
+        };
+
+        // Any default following an unconditional one is dead or a duplicate.
+        if already_unconditional {
+            let duplicate_unconditional =
+                default.r#if.is_none() && seen_unconditional_values.contains(&val_str);
+
+            if duplicate_unconditional && args.is_enabled(Check::DuplicateDefault) {
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: Check::DuplicateDefault,
+                    symbol: Some(var_symbol.to_owned()),
+                    message: format!("duplicate default of {}", val_str),
+                    arch: arch.to_owned(),
+                });
+            } else if !duplicate_unconditional && args.is_enabled(Check::DeadDefault) {
+                findings.push(Finding {
+                    severity: Severity::Warning,
+                    check: Check::DeadDefault,
+                    symbol: Some(var_symbol.to_owned()),
+                    message: format!("dead default of {}", val_str),
+                    arch: arch.to_owned(),
+                });
+            }
+        }
+
+        if args.is_enabled(Check::DuplicateDefaultValue) {
+            if default.r#if.is_some() && is_value_dup {
+                findings.push(Finding {
+                    severity: Severity::Style,
+                    check: Check::DuplicateDefaultValue,
+                    symbol: Some(var_symbol.to_owned()),
+                    message: format!(
+                        "duplicate default value of {}; consider combining the conditions with a logical-or: ||",
+                        val_str
+                    ),
+                    arch: arch.to_owned(),
+                });
+            }
+        }
+
+        match &default.r#if {
+            Some(cond) => {
+                if is_duplicate(&mut seen_conditions, cond.to_string()) {
+                    if is_value_dup {
+                        if args.is_enabled(Check::DuplicateDefault) {
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::DuplicateDefault,
+                                symbol: Some(var_symbol.to_owned()),
+                                message: format!("duplicate default of {}", val_str),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    } else {
+                        if args.is_enabled(Check::DeadDefault) {
+                            findings.push(Finding {
+                                severity: Severity::Warning,
+                                check: Check::DeadDefault,
+                                symbol: Some(var_symbol.to_owned()),
+                                message: format!("dead default of {}", val_str),
+                                arch: arch.to_owned(),
+                            });
+                        }
+                    }
+                }
+            }
+            None => {
+                seen_unconditional_values.insert(val_str);
+                already_unconditional = true;
+            }
+        }
+    }
+
+    findings
+}
diff --git a/scripts/kconfig/kconfirm/dead_links.rs b/scripts/kconfig/kconfirm/dead_links.rs
new file mode 100644
index 000000000000..205ba820fa44
--- /dev/null
+++ b/scripts/kconfig/kconfirm/dead_links.rs
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Julian Braha <julianbraha@gmail.com>
+ */
+use std::{
+    collections::HashSet,
+    process::{
+        Command,
+        Stdio, //
+    },
+};
+
+struct HttpResponse {
+    response_code: u16,
+    location: Option<String>,
+}
+
+/// Verifies that the `curl` command is available.
+pub(crate) fn check_curl_available() -> Result<(), String> {
+    match Command::new("curl")
+        .arg("--version")
+        .stdout(Stdio::null())
+        .stderr(Stdio::null())
+        .status()
+    {
+        Ok(status) if status.success() => Ok(()),
+        Ok(status) => Err(format!("`curl --version` exited with {status}")),
+        Err(error) => Err(format!("failed to execute `curl`: {error}")),
+    }
+}
+
+/// Performs an HTTP `HEAD` request without following redirects.
+fn head_request(url: &str) -> Result<HttpResponse, String> {
+    let output = Command::new("curl")
+        .args([
+            "--head",
+            "--silent",
+            "--show-error",
+            "--max-time",
+            "10",
+            "--user-agent",
+            "link-checker/1.0",
+            "--output",
+            "/dev/null",
+            "--write-out",
+            "%{http_code}\n%{redirect_url}",
+            "--url",
+            url,
+        ])
+        .output()
+        .map_err(|error| format!("failed to execute `curl`: {error}"))?;
+
+    if !output.status.success() {
+        let error = String::from_utf8_lossy(&output.stderr);
+        let error = error.trim();
+
+        return if error.is_empty() {
+            Err(format!("`curl` exited with {}", output.status))
+        } else {
+            Err(error.to_owned())
+        };
+    }
+
+    let output = String::from_utf8(output.stdout)
+        .map_err(|error| format!("`curl` produced invalid UTF-8: {error}"))?;
+    let (response_code, location) = output
+        .split_once('\n')
+        .ok_or("`curl` did not produce an HTTP response code")?;
+    let response_code = response_code
+        .parse()
+        .map_err(|error| format!("invalid HTTP response code from `curl`: {error}"))?;
+    let location = location.trim();
+
+    Ok(HttpResponse {
+        response_code,
+        location: (!location.is_empty()).then(|| location.to_owned()),
+    })
+}
+
+/// Result of checking whether a help-text link is reachable.
+#[derive(PartialEq, Debug)]
+pub(crate) enum LinkStatus {
+    Ok,
+    ProbablyBlocked,
+    Redirected(String),
+    NotFound,
+    ServerError,
+    Unreachable(String),
+}
+
+impl LinkStatus {
+    /// Returns a stable diagnostic label for the status.
+    pub(crate) fn as_str(&self) -> &'static str {
+        match self {
+            Self::Ok => "ok",
+            Self::ProbablyBlocked => "probably blocked",
+            Self::Redirected(_) => "redirected",
+            Self::NotFound => "not found",
+            Self::ServerError => "server error",
+            Self::Unreachable(_) => "unreachable",
+        }
+    }
+}
+
+/// Checks one link without following redirects.
+pub(crate) fn check_link(url: &str) -> LinkStatus {
+    let Some((scheme, _)) = url.split_once("://") else {
+        return LinkStatus::Unreachable("invalid URL".into());
+    };
+
+    if scheme.eq_ignore_ascii_case("http") || scheme.eq_ignore_ascii_case("https") {
+        check_http(url)
+    } else {
+        LinkStatus::Unreachable("unsupported URL scheme".into())
+    }
+}
+
+fn check_http(url: &str) -> LinkStatus {
+    let response = match head_request(url) {
+        Ok(r) => r,
+        Err(e) => return LinkStatus::Unreachable(e),
+    };
+
+    match response.response_code {
+        200..=299 => LinkStatus::Ok,
+
+        301 | 302 | 303 | 307 | 308 => {
+            LinkStatus::Redirected(response.location.unwrap_or_else(|| "unknown".into()))
+        }
+
+        403 | 429 => LinkStatus::ProbablyBlocked,
+
+        404 => LinkStatus::NotFound,
+
+        500..=599 => LinkStatus::ServerError,
+
+        _ => LinkStatus::ProbablyBlocked,
+    }
+}
+
+/// Extracts links from a Kconfig help text.
+pub(crate) fn find_links(text: &str) -> Vec<String> {
+    fn is_scheme_char(c: u8) -> bool {
+        c.is_ascii_alphanumeric() || matches!(c, b'+' | b'-' | b'.')
+    }
+
+    fn is_url_terminator(c: u8) -> bool {
+        c.is_ascii_whitespace() || matches!(c, b'"' | b'\'' | b'<' | b'>')
+    }
+
+    let bytes = text.as_bytes();
+
+    let mut links = Vec::new();
+    let mut seen = HashSet::new();
+
+    let mut i = 0;
+
+    while i + 3 < bytes.len() {
+        if bytes[i] == b':' && bytes[i + 1] == b'/' && bytes[i + 2] == b'/' {
+            // Walk backward to find the start of the scheme.
+            let mut start = i;
+
+            while start > 0 && is_scheme_char(bytes[start - 1]) {
+                start -= 1;
+            }
+
+            // Require a non-empty scheme.
+            if start == i {
+                i += 3;
+                continue;
+            }
+
+            // Require an alphabetic first character.
+            if !bytes[start].is_ascii_alphabetic() {
+                i += 3;
+                continue;
+            }
+
+            // Walk forward to the end of the URL.
+            let mut end = i + 3;
+
+            while end < bytes.len() && !is_url_terminator(bytes[end]) {
+                end += 1;
+            }
+
+            let mut url = &text[start..end];
+
+            // Trim trailing punctuation.
+            url = url.trim_end_matches(&['.', ',', ';', ':', '!', '?'][..]);
+
+            // Trim unmatched Markdown delimiters.
+            while let Some(last) = url.chars().last() {
+                let trim = match last {
+                    ')' => url.matches('(').count() < url.matches(')').count(),
+
+                    ']' => url.matches('[').count() < url.matches(']').count(),
+
+                    '}' => url.matches('{').count() < url.matches('}').count(),
+
+                    _ => false,
+                };
+
+                if trim {
+                    url = &url[..url.len() - last.len_utf8()];
+                } else {
+                    break;
+                }
+            }
+
+            let Some((scheme, _)) = url.split_once("://") else {
+                i = end;
+                continue;
+            };
+            if !scheme.eq_ignore_ascii_case("http") && !scheme.eq_ignore_ascii_case("https") {
+                i = end;
+                continue;
+            }
+
+            if seen.insert(url) {
+                links.push(url.to_string());
+            }
+
+            i = end;
+        } else {
+            i += 1;
+        }
+    }
+
+    links
+}
diff --git a/scripts/kconfig/kconfirm/kconfirm-cfg.sh b/scripts/kconfig/kconfirm/kconfirm-cfg.sh
new file mode 100755
index 000000000000..0c5b0c91016a
--- /dev/null
+++ b/scripts/kconfig/kconfirm/kconfirm-cfg.sh
@@ -0,0 +1,57 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+#
+# kconfirm is written in Rust, so check that the compiler is available and
+# recent enough. Bindgen is also required because kconfirm uses generated
+# Rust bindings to access the Kconfig parser.
+
+set -eu
+
+min_tool_version=$(dirname "$0")/../../min-tool-version.sh
+
+rustc=${RUSTC:-rustc}
+bindgen=${BINDGEN:-bindgen}
+
+fail()
+{
+	echo >&2 "*"
+	echo >&2 "* $1"
+	echo >&2 "*"
+	echo >&2 "* kconfirm is written in Rust. For instructions on installing"
+	echo >&2 "* the Rust toolchain, see Documentation/rust/quick-start.rst;"
+	echo >&2 "* for kconfirm's requirements, see"
+	echo >&2 "* Documentation/dev-tools/kconfirm.rst."
+	echo >&2 "*"
+	exit 1
+}
+
+if ! command -v "$rustc" >/dev/null; then
+	fail "Unable to find the Rust compiler '$rustc'."
+fi
+
+if ! command -v "$bindgen" >/dev/null; then
+	fail "Unable to find the Rust bindings generator '$bindgen'."
+fi
+
+rustc_version=$(LC_ALL=C "$rustc" --version 2>/dev/null \
+	| sed -nE '1s:.*rustc ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p')
+if [ -z "$rustc_version" ]; then
+	fail "Running '$rustc --version' did not produce an output."
+fi
+
+rustc_min_version=$("$min_tool_version" rustc)
+if ! printf '%s\n%s\n' "$rustc_min_version" "$rustc_version" | sort -CV; then
+	fail "'$rustc' is too old: $rustc_version < $rustc_min_version required."
+fi
+
+bindgen_version=$(LC_ALL=C "$bindgen" --version 2>/dev/null \
+	| sed -nE '1s:.*bindgen ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p')
+if [ -z "$bindgen_version" ]; then
+	fail "Running '$bindgen --version' did not produce an output."
+fi
+
+bindgen_min_version=$("$min_tool_version" bindgen)
+if ! printf '%s\n%s\n' "$bindgen_min_version" "$bindgen_version" | sort -CV; then
+	fail "'$bindgen' is too old: $bindgen_version < $bindgen_min_version required."
+fi
diff --git a/scripts/kconfig/kconfirm/kconfirm.rs b/scripts/kconfig/kconfirm/kconfirm.rs
new file mode 100644
index 000000000000..ceb4dd83c5bb
--- /dev/null
+++ b/scripts/kconfig/kconfirm/kconfirm.rs
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Julian Braha <julianbraha@gmail.com>
+ */
+//! A static analyzer for Kconfig.
+
+use crate::{
+    analyze::analyze,
+    arch::{
+        arch_dir_to_config,
+        arch_to_srcarch,
+        available_architectures, //
+    },
+    checks::{
+        check_select_visible,
+        check_variable_info,
+        AnalysisArgs,
+        Check, //
+    },
+    kconfig::parse_kconfig,
+    output::{
+        print_findings,
+        Finding, //
+    },
+    symbol_table::SymbolTable, //
+};
+use std::{
+    env,
+    ffi::{
+        CStr,
+        CString,
+        OsString, //
+    },
+    fs,
+    io,
+    path::PathBuf,
+    str::FromStr, //
+};
+
+mod analyze;
+mod arch;
+mod checks;
+mod dead_links;
+#[path = "../kconfig.rs"]
+mod kconfig;
+mod output;
+mod symbol_table;
+
+const USAGE: &str = "\
+Usage: kconfirm --linux-path PATH [OPTION]...
+
+Statically analyze the Kconfig files of a kernel source tree.
+
+Options:
+  -l, --linux-path PATH          kernel source tree to analyze
+  -e, --enable-check CHECK,...   checks to run on top of the default set
+  -d, --disable-check CHECK,...  checks to drop from the default set
+  -k, --kconfig FILE             entry Kconfig file (default is the root Kconfig)
+  -h, --help                     display this help and exit
+
+See Documentation/dev-tools/kconfirm.rst for the list of checks.
+";
+
+/// Runs the enabled checks on the Kconfig parse tree.
+///
+/// # Panics
+///
+/// Panics if traversing the tree encounters an unsupported node or the
+/// parser fails.
+fn check_kconfig(args: &AnalysisArgs, kconfig: &CStr, arch: &str) -> Vec<Finding> {
+    let mut findings = Vec::new();
+    let mut symbol_table = SymbolTable::new();
+    let entries = parse_kconfig(kconfig);
+    findings.extend(analyze(args, &mut symbol_table, arch, entries));
+
+    for (var_symbol, type_info) in &symbol_table.inner {
+        for (_definition_condition, info) in &type_info.attribute_defs {
+            findings.extend(check_variable_info(args, var_symbol, arch, info));
+        }
+
+        if args.is_enabled(Check::SelectVisible) {
+            findings.extend(check_select_visible(var_symbol, type_info, arch));
+        }
+    }
+
+    findings
+}
+
+fn split_csv_arg(dst: &mut Vec<String>, value: &str) {
+    dst.extend(
+        value
+            .split(',')
+            .filter(|s| !s.is_empty())
+            .map(|s| s.to_string()),
+    );
+}
+
+#[derive(Debug)]
+struct Args {
+    linux_path: PathBuf,
+    kconfig: CString,
+    enable_check: Vec<String>,
+    disable_check: Vec<String>,
+}
+
+fn utf8_argument(argument: OsString) -> Result<String, String> {
+    argument
+        .into_string()
+        .map_err(|argument| format!("argument is not valid UTF-8: {:?}", argument))
+}
+
+/// Returns the value of an option, either the one attached to it with `=` or
+/// packed behind a short name, else the next argument.
+fn option_value(
+    option: &str,
+    attached: Option<String>,
+    arguments: &mut impl Iterator<Item = OsString>,
+) -> Result<String, String> {
+    match attached {
+        Some(value) => Ok(value),
+        None => match arguments.next() {
+            Some(value) => utf8_argument(value),
+            None => Err(format!("{option} requires an argument")),
+        },
+    }
+}
+
+fn parse_args() -> Result<Args, String> {
+    let mut linux_path: Option<PathBuf> = None;
+    let mut kconfig = String::from("Kconfig");
+    let mut enable_check = Vec::new();
+    let mut disable_check = Vec::new();
+
+    let mut arguments = env::args_os().skip(1);
+    while let Some(argument) = arguments.next() {
+        let argument = utf8_argument(argument)?;
+
+        // Accept both `--option value` and `--option=value` for long options,
+        // and both `-o value` and `-ovalue` for short ones.
+        let (option, attached) = if let Some(name) = argument.strip_prefix("--") {
+            match name.split_once('=') {
+                Some((name, value)) => (format!("--{name}"), Some(value.to_string())),
+                None => (argument.clone(), None),
+            }
+        } else if argument.starts_with('-') && argument.len() > 2 {
+            (argument[..2].to_string(), Some(argument[2..].to_string()))
+        } else {
+            (argument.clone(), None)
+        };
+
+        match option.as_str() {
+            "-h" | "--help" => {
+                print!("{USAGE}");
+                std::process::exit(0);
+            }
+            "-l" | "--linux-path" => {
+                let value = option_value(&option, attached, &mut arguments)?;
+                linux_path = Some(PathBuf::from(value));
+            }
+            "-k" | "--kconfig" => {
+                kconfig = option_value(&option, attached, &mut arguments)?;
+            }
+            "-e" | "--enable-check" => {
+                let value = option_value(&option, attached, &mut arguments)?;
+                split_csv_arg(&mut enable_check, &value);
+            }
+            "-d" | "--disable-check" => {
+                let value = option_value(&option, attached, &mut arguments)?;
+                split_csv_arg(&mut disable_check, &value);
+            }
+            _ => return Err(format!("unrecognized option '{option}'")),
+        }
+    }
+
+    let linux_path = linux_path.ok_or("--linux-path is required")?;
+
+    let kconfig = CString::new(kconfig).map_err(|_| "--kconfig contains a NUL byte".to_string())?;
+
+    Ok(Args {
+        linux_path,
+        kconfig,
+        enable_check,
+        disable_check,
+    })
+}
+
+fn source_architecture() -> Result<String, String> {
+    let arch = env::var_os("ARCH").ok_or("ARCH environment variable is required")?;
+    let arch = arch
+        .into_string()
+        .map_err(|arch| format!("ARCH is not valid UTF-8: {arch:?}"))?;
+    if arch.is_empty() {
+        return Err("ARCH environment variable is empty".into());
+    }
+
+    Ok(arch_to_srcarch(&arch).to_owned())
+}
+
+fn main() -> io::Result<()> {
+    let cli_args = parse_args().unwrap_or_else(|e| {
+        eprintln!("error: {e}");
+        eprint!("{USAGE}");
+        std::process::exit(1);
+    });
+    let mut analysis_args = AnalysisArgs::new();
+    for check in [
+        Check::DuplicateDependency,
+        Check::DuplicateRange,
+        Check::DeadRange,
+        Check::DuplicateSelect,
+        Check::DeadSelect,
+        Check::DeadDefault,
+        Check::ConstantCondition,
+        Check::DuplicateDefault,
+        Check::DuplicateImply,
+        Check::DeadImply,
+        Check::ReverseRange,
+    ] {
+        analysis_args.enable_check(check);
+    }
+
+    // `--enable-check`.
+    for name in &cli_args.enable_check {
+        if let Ok(c) = Check::from_str(name) {
+            analysis_args.enable_check(c);
+        } else {
+            eprintln!("Error: check {} does not exist", name);
+            std::process::exit(1);
+        }
+    }
+
+    // `--disable-check`.
+    for name in &cli_args.disable_check {
+        if let Ok(c) = Check::from_str(name) {
+            analysis_args.disable_check(c);
+        } else {
+            eprintln!("Error: check {} does not exist", name);
+            std::process::exit(1);
+        }
+    }
+
+    if analysis_args.is_enabled(Check::DeadLink) {
+        dead_links::check_curl_available().unwrap_or_else(|error| {
+            eprintln!("error: dead_link requires the `curl` command: {error}");
+            std::process::exit(1);
+        });
+    }
+
+    let linux_path = fs::canonicalize(cli_args.linux_path)?;
+    let arch = source_architecture().unwrap_or_else(|error| {
+        eprintln!("error: {error}");
+        std::process::exit(1);
+    });
+    let available_arches = available_architectures(&linux_path)?;
+    if !available_arches.contains(&arch) {
+        eprintln!("Error: unexpected architecture from ARCH, expected one of:");
+        for available_arch in &available_arches {
+            eprint!("{available_arch} ");
+        }
+        eprintln!();
+        std::process::exit(1);
+    }
+
+    env::set_current_dir(&linux_path)?;
+    // SAFETY: kconfirm is single-threaded, so changing its environment cannot
+    // race another environment reader or writer.
+    unsafe {
+        env::set_var("srctree", &linux_path);
+        env::set_var("SRCARCH", &arch);
+        if arch == "um" && env::var_os("HEADER_ARCH").is_none() {
+            env::set_var("HEADER_ARCH", "x86");
+        }
+    }
+    let arch_config = arch_dir_to_config(&arch);
+    let findings = check_kconfig(&analysis_args, &cli_args.kconfig, &arch_config);
+    print_findings(findings);
+    Ok(())
+}
diff --git a/scripts/kconfig/kconfirm/output.rs b/scripts/kconfig/kconfirm/output.rs
new file mode 100644
index 000000000000..dae3c903faca
--- /dev/null
+++ b/scripts/kconfig/kconfirm/output.rs
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Julian Braha <julianbraha@gmail.com>
+ */
+use crate::Check;
+use std::fmt;
+
+/// Diagnostic severity, ordered from most to least severe.
+#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum Severity {
+    Warning,
+    Style,
+}
+
+/// One diagnostic emitted by a Kconfig check.
+#[derive(Debug)]
+pub(crate) struct Finding {
+    pub(crate) severity: Severity,
+    pub(crate) check: Check,
+    pub(crate) symbol: Option<String>,
+    pub(crate) message: String,
+    pub(crate) arch: String,
+}
+
+impl fmt::Display for Finding {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match &self.symbol {
+            Some(s) => write!(
+                f,
+                "{} [{}] [{}] config {}: {}",
+                self.severity,
+                self.check.as_str(),
+                self.arch,
+                s,
+                self.message
+            ),
+            None => write!(
+                f,
+                "{} [{}] [{}] {}",
+                self.severity,
+                self.check.as_str(),
+                self.arch,
+                self.message
+            ),
+        }
+    }
+}
+
+/// Sorts, deduplicates, and prints findings.
+pub(crate) fn print_findings(mut findings: Vec<Finding>) {
+    findings.sort_by(|a, b| {
+        (
+            &a.severity,
+            a.check.as_str(),
+            &a.symbol,
+            &a.message,
+            &a.arch,
+        )
+            .cmp(&(
+                &b.severity,
+                b.check.as_str(),
+                &b.symbol,
+                &b.message,
+                &b.arch,
+            ))
+    });
+    findings.dedup_by(|a, b| {
+        a.severity == b.severity
+            && a.check.as_str() == b.check.as_str()
+            && a.symbol == b.symbol
+            && a.message == b.message
+            && a.arch == b.arch
+    });
+
+    for finding in findings {
+        println!("{finding}");
+    }
+}
+
+impl fmt::Display for Severity {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            Severity::Warning => write!(f, "WARNING"),
+            Severity::Style => write!(f, "STYLE  "),
+        }
+    }
+}
diff --git a/scripts/kconfig/kconfirm/symbol_table.rs b/scripts/kconfig/kconfirm/symbol_table.rs
new file mode 100644
index 000000000000..0b2cc1e296d5
--- /dev/null
+++ b/scripts/kconfig/kconfirm/symbol_table.rs
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Julian Braha <julianbraha@gmail.com>
+ */
+use crate::kconfig::{
+    DefaultAttribute,
+    Expression,
+    Range, //
+};
+use std::collections::{
+    hash_map,
+    HashMap, //
+};
+
+type KconfigSymbol = String;
+type Cond = Option<Expression>;
+
+/// Collected analysis information for one Kconfig symbol.
+#[derive(Debug, Clone)]
+pub(crate) struct SymbolInfo {
+    /// Selectors of this option (and their select-conditions).
+    pub(crate) selected_by: HashMap<KconfigSymbol, Vec<Cond>>,
+    /// Each partial or complete definition and their nesting conditions.
+    pub(crate) attribute_defs: Vec<(Vec<Expression>, AttributeDef)>,
+}
+
+/// The attributes of one partial or complete symbol definition.
+#[derive(Debug, Clone, Default)]
+pub(crate) struct AttributeDef {
+    pub(crate) dependencies: Vec<Expression>,
+    pub(crate) ranges: Vec<Range>,
+    pub(crate) defaults: Vec<DefaultAttribute>,
+    pub(crate) visibility: Vec<Option<Expression>>,
+    pub(crate) selects: Vec<(KconfigSymbol, Cond)>,
+    pub(crate) implies: Vec<(KconfigSymbol, Cond)>,
+}
+
+/// One symbol-table update produced while traversing a Kconfig entry.
+pub(crate) struct SymbolUpdate {
+    pub(crate) symbol: KconfigSymbol,
+    pub(crate) is_definition: bool,
+    pub(crate) attributes: AttributeDef,
+    pub(crate) definition_condition: Vec<Expression>,
+    pub(crate) selected_by: Option<(KconfigSymbol, Cond)>,
+}
+
+impl SymbolInfo {
+    fn new_empty() -> Self {
+        Self {
+            selected_by: HashMap::new(),
+            attribute_defs: Vec::new(),
+        }
+    }
+
+    fn insert(&mut self, update: SymbolUpdate) {
+        let SymbolUpdate {
+            symbol: _,
+            is_definition,
+            attributes,
+            definition_condition,
+            selected_by,
+        } = update;
+
+        if let Some((selector, condition)) = selected_by {
+            self.selected_by
+                .entry(selector)
+                .or_default()
+                .push(condition);
+        }
+
+        if is_definition {
+            self.attribute_defs.push((definition_condition, attributes));
+        }
+    }
+}
+
+/// The symbol table stores the definitions of each encountered config option.
+pub(crate) struct SymbolTable {
+    pub(crate) inner: HashMap<KconfigSymbol, SymbolInfo>,
+}
+
+impl SymbolTable {
+    pub(crate) fn new() -> Self {
+        SymbolTable {
+            inner: HashMap::new(),
+        }
+    }
+
+    pub(crate) fn merge_insert(&mut self, update: SymbolUpdate) {
+        let entry = self.inner.entry(update.symbol.clone());
+
+        match entry {
+            hash_map::Entry::Vacant(v) => {
+                let mut t = SymbolInfo::new_empty();
+                t.insert(update);
+                v.insert(t);
+            }
+
+            hash_map::Entry::Occupied(mut o) => {
+                let t = o.get_mut();
+                t.insert(update);
+            }
+        }
+    }
+}
-- 
2.54.0

