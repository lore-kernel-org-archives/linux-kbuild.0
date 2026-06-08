Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56F23B7769;
	Mon,  8 Jun 2026 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928145; cv=none; b=ZXlHUOrhzoK5sEbovT+KGR5/2EIRL0RyodKsIAalpuq2/O7iMhN02n79kxSnopXZ4GLWTzbwrBza4/SGfApRbYIFYa3p07vtbm3jxw+Qjm+zXW1X9KwFONDUIrZwrkM1FvjkfGzUUSIFjHtZoVtTfb6pMufV9Kh93RcBJOGifw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928145; c=relaxed/simple;
	bh=/BSLR2OY5cJFOPuNI5O4EeTj69rk3DEazMqm5RkV/80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMLaudH/usdL4tzRdcGeEiGmezjd0gUjpH50/v+Mt5OW9I3zzDQVRscqZejVVEPwypP2PmUu4EB9tiMabosK048yg/Vvwm4BmmMGcLmLwxd4tO4x3CqD4qU/+iYNuj5MRjbFNDLbp57LyDYe/LRy8dcMIaTWgvgJDrGFqW7Dl18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YETZNVv+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YETZNVv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8121F00898;
	Mon,  8 Jun 2026 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928144;
	bh=PkjTxMXjw+1YPhMhh8oGSQ57Ksfyi6jKE/LPu029tT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YETZNVv+GLmbXtqUYxGvwXWz6jObcA+lQE4hSMjb3RU99gj7HDoLfUVdmII/52OMf
	 jCVDwp7t5s6mp2CsutosWqUtuFpkVommN1pTHyGykPDabgcRV5q4Hc1323bielOxQD
	 PXQ7hAeB3Zgu5K3D0ZqePdTkXiUmxZ4n/IMYkKp5TIYTaP+YQ9khzg/bCIpRGwA/OV
	 2g0drE/JhGa+X3oBM2lQX5fLFWUz3G8VqYvBSCbNPPPQ9RtoWaH/QF50FRBei8UzYA
	 ABd8JlbF4lqvxZ/liQ0vixhZPm56utqKDAJSDcsAuhH8qKX51PzwHfH0a0jOhm5Hxv
	 ZpMrlD+8jzFgQ==
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
Subject: [PATCH v2 07/19] rust: kbuild: support `skip_clippy` for `rustc_procmacro`
Date: Mon,  8 Jun 2026 16:14:26 +0200
Message-ID: <20260608141439.182634-8-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
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
index 9b5a3f9dd934..7b1db0d5d423 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -547,10 +547,10 @@ $(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
 $(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
+quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) P $@
       cmd_rustc_procmacro = \
 	$(rustc_target_envs) \
-	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
+	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) $(rust_common_flags) $(rustc_target_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-- 
2.54.0

