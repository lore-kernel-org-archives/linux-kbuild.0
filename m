Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954083FC5C6;
	Tue,  2 Jun 2026 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421408; cv=none; b=Aec687VU7q28o8jZcolJirtTmeMDwK9f8RKqpbuzfQ6npDCTyIfyEEZ6CT5FMj1VJuTRmeNZOCWuOZm98pIKZZaeB7sewGDZlZQg4QcMr/Ln0LFAK+XxYYKWOCK5LB43f88TkMYRq+DFBKYHy4C6+/SSTHeHQ94nuoa3a2qR66Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421408; c=relaxed/simple;
	bh=QWKNmlcXmd8bksVMALW2+Pkn6Ik/tZKZZxPnL6TC3gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P74dbkY6Gs4IEbiTJxAXSx8G8/5W26EDR1Q26t6dCkyQ1iJ67+sVJ2kLRuaWTmlmZNB9vcNugupmJGSjowlsGIV0cuml1mgoPxg7vjIGNFWaoLMMiDmHdim2RrC269lDyj7g+2L33qAgIY/gtCcfz9Sx1wAHchH/UQqd+opMobA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCI/Fe1C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCI/Fe1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208CF1F00893;
	Tue,  2 Jun 2026 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421407;
	bh=a6Q6paeXCHqIdE2CqjfDFH1/QNPLzwnI/+N6DZqqx4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VCI/Fe1CrQLI56Jd0lWC31JHVnQRwzbRHslwhm/aS/RqZOISJpYXl6EwrbOW3Nqe/
	 RQhzHDh8FJGRGqJhFVqzUdVXRXDmsFBadFeeUkYAY2XIOysgHPkabmVWd4a86iw9UW
	 EHC31JuX3bKThR53HltmfF6FtPdJizo2khPSHzAGd2+oAykMTrQjmV5nRsPxk1O/HA
	 seVcwzcm4zXPmblJuLaSOR3g0yYzmlHAQI+JPlwTZD2jY2yeGG00RhxxzEa0n3mvM/
	 4qThPEzOTQ1kRXqiUHPqRpE/4wCuGp1zPybh6BNoXkWpkYG13ctr1AXC1EblFajgJg
	 cOuxvpryp7Ouw==
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
	Jack Wrenn <jswrenn@amazon.com>
Subject: [PATCH 06/18] rust: kbuild: support per-target environment variables
Date: Tue,  2 Jun 2026 19:29:07 +0200
Message-ID: <20260602172920.30342-7-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
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
 rust/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index df90fabefb70..61f07b1303ce 100644
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
@@ -567,6 +569,7 @@ $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
 # since Rust 1.95.0 (https://github.com/rust-lang/rust/pull/151534).
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
       cmd_rustc_library = \
+	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_flags) \
-- 
2.54.0

