Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6923FADE9;
	Tue,  2 Jun 2026 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421412; cv=none; b=b962T3lxbTMJNiBGmf37I83qDssA44BwU+QebZ/1GAf0sDTnSOAy94PUA/8oRPbCHI7zNlY1A8vjtYXMMR84zRO/mpYOyQWA8cjMtWmAGaE/y8p6TbBFnW99af08JNePEBerPttatP3/kfTERgpQAUdJ0+xjxoRL6VXdolHSGM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421412; c=relaxed/simple;
	bh=VKWeIlilx8Hjdc8d7oGM3f9Fk0wQo4iOK5gAVJKsEuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOmNUUhBRFGVGtY+rPrpqqzrvAcJx4eL9fgI66Qwng8HwfjbZGw3Y5uG4ZPC0bVOhYMEjldDBNNX4bRxdYYFVjzvmMPUdHxdNB9FiBo3J49Y9tYApk5K+YBHjNz6rDO4tHs+6zIuTrCkQWsiUbzLXQm98yBofPFI6v/iJz2hUbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLWgW98v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLWgW98v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039B71F00898;
	Tue,  2 Jun 2026 17:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421411;
	bh=jcoqkp35kMn/myQ8G/VTXOSWFKdPEXBbCgmhn69Y/Vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SLWgW98vg7ZmDWbkVTG9I0HltGSbUnLVLZpW+V5JbN/YHXWCgehe2bTXQC0rqoQoA
	 +tixVM+Jw+4oOQm3npd6jERgGylWFZdqPQ8rDv6WJrozG/2UFv6Qrjnf+zMt1L3tMe
	 vstyZfBI2auCKtY4dci08MVhjaF79gMmELrG35PhA2MeCpjk9EKm1y31h1h1n+Jacz
	 xKWr6y4RBYLUUJfVgBXKSoViOYCxLQrB6CEApkW16APowVyiuQn6J63UcsrinKbZtI
	 7xK1IXdm28mlMA6rUXA1I52EK0e0N8KFRzn+fTUMJlr5fupJ1ytaZv/ipGCVHBoYJg
	 j9DB1zIx/A+Rg==
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
Subject: [PATCH 07/18] rust: kbuild: support `skip_clippy` for `rustc_procmacro`
Date: Tue,  2 Jun 2026 19:29:08 +0200
Message-ID: <20260602172920.30342-8-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain vendored crates, like the upcoming `zerocopy-derive`, do not
need to be built with Clippy since we `--cap-lints=allow` them anyway.

Thus add support to skip Clippy for proc macro crates.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 61f07b1303ce..b790afc0d371 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -543,9 +543,9 @@ $(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
 $(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
+quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) P $@
       cmd_rustc_procmacro = \
-	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
+	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) $(rust_common_flags) $(rustc_target_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-- 
2.54.0

