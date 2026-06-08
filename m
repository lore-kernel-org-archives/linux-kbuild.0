Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295E63C4557;
	Mon,  8 Jun 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928142; cv=none; b=oDgcMZRfIqzglrm+ypYSBZgA9+AUxufunnwSnOHaX5hRh8wNU8Ya0iaizuplx0TBnBHFJkugBRTZBRh34iMo5ySsk3g4VtKndvk9ncGM+xDmVNvujpFZSvzOa8T+xnu444Vw1cCixopS6cHPRt0v6vzg9lm7ab/xgeAhST47N8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928142; c=relaxed/simple;
	bh=PsWrefwJbK4Ez8QKCj4L00JlaEsu1dVAINrV6pe7O4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6tHh3Yi1Evjrod2WfLrzTOD0DY2j6ZNxGRvwkXExjMKE6o/T9iReEz0VD9b9Un85in4goZK4wmOtjO1XKgIGbxkTSKrCaZ1d9RUk+X7Zd0zMEAl4KDPh5yazt3tDk12lrsUcYShBkaSy6GOo0VF+qvBtwvaJY/teqdwvowhd/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyxYidto; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyxYidto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746481F00893;
	Mon,  8 Jun 2026 14:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928140;
	bh=yTRdyV4febHTt/Y6d9TsH0kgXS0uu7+kEY3Tbta6nmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dyxYidtoLP0jdbwpKpKpKcS3iwXoQuVZEfCls8VZ0pXJZjjZoIhSklI9I/CCTLN9E
	 qNyeJoZ2fhtKLM+SSCpsmqzIrks+D4qT1aMcka/yJizs8zxsBDMPwPT88VjjlkLL4A
	 pROA2ubFhEuIY0x1YZSeKVf9M8OY1SBwJOPN7IR0x2hUyaEmfC/B7qnoyH4RV3o5dE
	 hUTJ4k3VVjRYLs9s2eGKyaQAlFSVwq1xZ9zTb0/+p9Ur+qwD9s5k3TsmVyw/DZ+209
	 6yUjmt1VM2ZkjFrmBEMx7KaodbnboJp9skLOKH1qkLB+mmk9kO61YKNPYnrePz4p65
	 3XMo/eWIvJsAQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>
Subject: [PATCH v2 06/19] rust: kbuild: support per-target environment variables
Date: Mon,  8 Jun 2026 16:14:25 +0200
Message-ID: <20260608141439.182634-7-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain vendored crates, like the upcoming `zerocopy`, use extra
environment variables (e.g. via `env!`).

Thus add support to easily specify those.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index df90fabefb70..9b5a3f9dd934 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -144,6 +144,7 @@ doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rust
 
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
+	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
 		$(rustc_target_flags) -L$(objtree)/$(obj) \
@@ -250,6 +251,7 @@ rustdoc-clean: FORCE
 
 quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
       cmd_rustc_test_library = \
+	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTC_OR_CLIPPY) $(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		@$(objtree)/include/generated/rustc_cfg \
@@ -314,6 +316,7 @@ rusttestlib-uapi: $(src)/uapi/lib.rs rusttestlib-ffi rusttestlib-pin_init FORCE
 
 quiet_cmd_rustdoc_test = RUSTDOC T $<
       cmd_rustdoc_test = \
+	$(rustc_target_envs) \
 	RUST_MODFILE=test.rs \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) --test $(rust_common_flags) \
@@ -328,6 +331,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
       cmd_rustdoc_test_kernel = \
 	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
 	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
+	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) --test $(filter-out --remap-path-scope=%,$(rust_flags)) \
 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
@@ -350,6 +354,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 # so for the moment we skip `-Cpanic=abort`.
 quiet_cmd_rustc_test = $(RUSTC_OR_CLIPPY_QUIET) T  $<
       cmd_rustc_test = \
+	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTC_OR_CLIPPY) --test $(rust_common_flags) \
 		@$(objtree)/include/generated/rustc_cfg \
@@ -519,6 +524,7 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 
 quiet_cmd_rustc_procmacrolibrary = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) PL $@
       cmd_rustc_procmacrolibrary = \
+	$(rustc_target_envs) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
@@ -543,6 +549,7 @@ $(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
 
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
+	$(rustc_target_envs) \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
@@ -567,6 +574,7 @@ $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
 # since Rust 1.95.0 (https://github.com/rust-lang/rust/pull/151534).
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
       cmd_rustc_library = \
+	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_flags) \
-- 
2.54.0

