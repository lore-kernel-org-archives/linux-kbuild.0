Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81383B7769;
	Mon,  8 Jun 2026 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928163; cv=none; b=LmnKwTwFS9TaDr9mTu3ay0rVjkcz74X3r8kYZOC9sZB8RoUUPIM2SVQoqE5uJev0voqQAgJ+0ZswkKspR50VwSuQNo3HhUhanzMmttZ1R5zMR8rJcuDgOaxh8LEMuc67bWJBvlXN+1A1ebl3f33hs36redwhtxtenTPhdwAeN2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928163; c=relaxed/simple;
	bh=cJ2JG4l2RzOW5x+nZldVfTGuvEAhKOS6eTL38BjM3as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ut3ZF16NSr3v2Ctoez5+fwtEjcKEFDuQDknlAYEX4Or/OQvv6LeJdUUZFxADS9LTr+Wa7IAZyK5PI5va+BeRk+fk36giC4efC84NGlNO7zTPXrDT1gzFbW9FX8F24w565eEct2/0Wf4FQVphGY+r1YxCpniBCG3brDbIX+m2F/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ip/M/3ps; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ip/M/3ps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D351F00899;
	Mon,  8 Jun 2026 14:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928161;
	bh=me2ZLAtiwkvbzTa/6WD+v59zLxktAzMtxPWp6pMwPdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ip/M/3pskWFDQhzELO8WsAFfCpwCRc2rEbxstGuoEmzbnR7c6gCqYLwTWRMvUX+QG
	 sbyFQoCkgD075+4/l5tZlLroYnuHmF4UfuAgFfZgDeC4qGwVf5VHaaPP+v9Px5Dmoz
	 pDD5OQZZ+VmdPrSP3oDo8ONZeuj31lm4MGy/6mneShUU9oBPWzr6Uy5fYapoTog/Jl
	 Gk86HdOngEyrYHGSUcMJiPCqP+Nhy9itK7lqp1eUb66SWICeSSu3hoIDPMotE+c9O5
	 kMYjt2EaL+YP+o0gUBU40nrG6toTCa9LhxkC8Rpvdb1CDw/X5JIx1/7LuUwfoKRyAs
	 K3gM38OZmplUg==
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
Subject: [PATCH v2 11/19] rust: zerocopy: add `README.md`
Date: Mon,  8 Jun 2026 16:14:30 +0200
Message-ID: <20260608141439.182634-12-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, when the Rust upstream `alloc` standard library crate was
vendored in commit 057b8d257107 ("rust: adapt `alloc` crate to the
kernel"), a `README.md` file was added to explain the provenance and
licensing of the source files.

Thus do the same for the `zerocopy` crate.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy/README.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 rust/zerocopy/README.md

diff --git a/rust/zerocopy/README.md b/rust/zerocopy/README.md
new file mode 100644
index 000000000000..99e6cad0e26c
--- /dev/null
+++ b/rust/zerocopy/README.md
@@ -0,0 +1,14 @@
+# `zerocopy`
+
+These source files come from the Rust `zerocopy` crate, version v0.8.50
+(released 2026-05-31), hosted in the <https://github.com/google/zerocopy>
+repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
+modified to add the SPDX license identifiers and to remove `Display`
+for `f32` and `f64`.
+
+For copyright details, please see:
+
+    https://github.com/google/zerocopy/blob/v0.8.50/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-MIT
-- 
2.54.0

