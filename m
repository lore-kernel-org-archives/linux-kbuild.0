Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C42F8EB7;
	Tue,  2 Jun 2026 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421433; cv=none; b=PuxK2Ygp6Cw9NOnYbsbd5yLrrn2ut6BdfCNq5IXQ4HD19aj8xlA/IbquUpx+JN0ysoPbb4lt6Br1UxBfVZKgoJKetwYel/91S650a/3gGhL7Idcl8gjwv6gyYz144K/fJmDsYz+/vWNB3+OnRAq3dup2vzVk5w3SmX0NBF2AK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421433; c=relaxed/simple;
	bh=/DeCXnzsBdAajIfGHCv7ryeHKYK4JpSfO1n9y6kHnFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRP4gvDjSMt+4E80xFtleW2Tzw3nJWw3o7WKKoWRWvqDcK/dE0G9MZp4HQqe0aBSZ18W/kXdE5njkq81uXkDwuZm5QB3K2CHL+Dp8W2C0uZRndR0QMlRwSSUj/FWzmJr+KxQerWU9elO1tYj1E59ePcRhOU1VG/n9xGo3ZvRvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bd1AiZsO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bd1AiZsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E16C1F00898;
	Tue,  2 Jun 2026 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421427;
	bh=guz624vMtIhicIznqQB0MsnhiQWz9qy/+XnxVVJ8xeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bd1AiZsO+3x7ICJ7/lJqPuk2bnlJgnfLzI2ZSEUja1PdQY7dLain7dVRxituxrNsq
	 HN75ODr3mzJq8LP8wgBzbMQisiti1jDRek0ZeMXNyEYR4SP7a/G42qgjbJnBKVPOKF
	 4wsUrUkTml7bz2b7xgdidjgZH0/rMDLGvy8a0QEv8mZVoOOgq0sdfG6+sEsQvBVsbO
	 xqmR4/Jz8LYTJ6vTIw6eHK0fy4bi4L4iZrPtGvk18sLzI4/0imAlXmJyc6Mbqur7+K
	 V7f1Ht5YgJNpFjZxU/LLs9MVPymzRhX7Lx1RRg8emAS6Q5b4N1hEZYT5N+JInQLx5Y
	 oVcYn/Yc/eAew==
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
Subject: [PATCH 11/18] rust: zerocopy: add `README.md`
Date: Tue,  2 Jun 2026 19:29:12 +0200
Message-ID: <20260602172920.30342-12-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
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
Cc: Jack Wrenn <jswrenn@amazon.com>
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

