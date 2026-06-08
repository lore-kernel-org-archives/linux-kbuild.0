Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8133C98AE;
	Mon,  8 Jun 2026 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928174; cv=none; b=a+dapmLRWBUzbDQqgwPm8y58Bq5Jsl89ebhApmktvbBvvN+w00DWnFQwjWnrZY6D+PIWB2S3Ewf5zV77/XFQ0Ql0o8AKa6fVTmjO6eE1x79kmlHNbjsYQsf8EiGrAOqvuK8xaTlKZJe26KlEyP0z4nMG46wpWrl07pW/Yg0xdc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928174; c=relaxed/simple;
	bh=L1kTDIzT7Dfh1Vj+k1k6Avq5m33aMOojlNj78e36isQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqd/7/rFpnf/afYy0RO6QlrDJwj/LSb+i7RgdZbEotjULBW6DT03/v2PrmXgzg4jCa+AJ+7YKxlB1AWHDdeVKneIjICSMULBxKXjwUlD3JTep36mpyMRUT/U52NKruKLgx1Vuez9DYmf0B5WFYMecttj/FaYecH4p8aBO8zEKhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qaf3bk6+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qaf3bk6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC091F0089C;
	Mon,  8 Jun 2026 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928173;
	bh=EtNoJetG4uKCY26KFky9CdnJyiwhu5pznsLhq1+NM5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qaf3bk6+yUf19QcLywQ168GIUYMSwxv8qvvV/daYugjCtRWZ/8G3zc/R817KblGLZ
	 dzVXlDWb82mQTqpZe3BWLD/xyx79faVY0TUCvLVV2Vh+vDrmVdGIXkXgD/7yziVezW
	 PVkeXbr/rS5cYqWG4kr9jsntmd3sOpmThMREMaDew/trdPqseOjAfBYVdPTLw4ATOi
	 yPoinWoyZmH1aMt6gdVB44UAt4ZGLcI6JFL5UdMon2btZc+STZEXVR9xlsRNqgHYE9
	 jpEQ2hKmuK0xJ3XlqtD3Nk8jCJ1fi41bchb/Y/XnGPBIJlObfqtaOmcdY04+A5b6cm
	 xtSlj4F5lqPjw==
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
Subject: [PATCH v2 14/19] rust: zerocopy-derive: add SPDX License Identifiers
Date: Mon,  8 Jun 2026 16:14:33 +0200
Message-ID: <20260608141439.182634-15-ojeda@kernel.org>
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
vendored, the SPDX License Identifiers were added to every file so that
the license on those was clear. The same happened with the vendoring of
`proc_macro2`, `quote` and `syn`. Please see:

  commit 057b8d257107 ("rust: adapt `alloc` crate to the kernel")
  commit 69942c0a8965 ("rust: syn: add SPDX License Identifiers")
  commit ddfa1b279d08 ("rust: quote: add SPDX License Identifiers")
  commit a9acfceb9614 ("rust: proc-macro2: add SPDX License Identifiers")

Thus do the same for the `zerocopy-derive` crate.

This makes `scripts/spdxcheck.py` pass: use parentheses like commit
06e9bfc1e57d ("ionic: make spdxcheck.py happy") did since we have two
`OR` operators in the expression (three licenses).

Finally, as requested, I filed an issue [1] with upstream about it.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@google.com>
Link: https://github.com/google/zerocopy/issues/3428 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy-derive/derive/from_bytes.rs     | 2 ++
 rust/zerocopy-derive/derive/into_bytes.rs     | 2 ++
 rust/zerocopy-derive/derive/known_layout.rs   | 2 ++
 rust/zerocopy-derive/derive/mod.rs            | 2 ++
 rust/zerocopy-derive/derive/try_from_bytes.rs | 2 ++
 rust/zerocopy-derive/derive/unaligned.rs      | 2 ++
 rust/zerocopy-derive/lib.rs                   | 2 ++
 rust/zerocopy-derive/repr.rs                  | 2 ++
 rust/zerocopy-derive/util.rs                  | 2 ++
 9 files changed, 18 insertions(+)

diff --git a/rust/zerocopy-derive/derive/from_bytes.rs b/rust/zerocopy-derive/derive/from_bytes.rs
index ad8b6233fe54..d693a63b7645 100644
--- a/rust/zerocopy-derive/derive/from_bytes.rs
+++ b/rust/zerocopy-derive/derive/from_bytes.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::{Span, TokenStream};
 use syn::{
     parse_quote, Data, DataEnum, DataStruct, DataUnion, Error, Expr, ExprLit, ExprUnary, Lit, UnOp,
diff --git a/rust/zerocopy-derive/derive/into_bytes.rs b/rust/zerocopy-derive/derive/into_bytes.rs
index 8c1e1009dd91..ad52a6b45d28 100644
--- a/rust/zerocopy-derive/derive/into_bytes.rs
+++ b/rust/zerocopy-derive/derive/into_bytes.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::{Span, TokenStream};
 use quote::quote;
 use syn::{Data, DataEnum, DataStruct, DataUnion, Error, Type};
diff --git a/rust/zerocopy-derive/derive/known_layout.rs b/rust/zerocopy-derive/derive/known_layout.rs
index b91b4de0098c..fddffd167c82 100644
--- a/rust/zerocopy-derive/derive/known_layout.rs
+++ b/rust/zerocopy-derive/derive/known_layout.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::TokenStream;
 use quote::quote;
 use syn::{parse_quote, Data, Error, Type};
diff --git a/rust/zerocopy-derive/derive/mod.rs b/rust/zerocopy-derive/derive/mod.rs
index a3d066ed2b4d..665ba7da55a8 100644
--- a/rust/zerocopy-derive/derive/mod.rs
+++ b/rust/zerocopy-derive/derive/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 pub mod from_bytes;
 pub mod into_bytes;
 pub mod known_layout;
diff --git a/rust/zerocopy-derive/derive/try_from_bytes.rs b/rust/zerocopy-derive/derive/try_from_bytes.rs
index 4e36ab40bcf8..ce9c926d5b8e 100644
--- a/rust/zerocopy-derive/derive/try_from_bytes.rs
+++ b/rust/zerocopy-derive/derive/try_from_bytes.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::TokenStream;
 use quote::quote;
 use syn::{
diff --git a/rust/zerocopy-derive/derive/unaligned.rs b/rust/zerocopy-derive/derive/unaligned.rs
index 819d84984a03..d6dea0a11f1e 100644
--- a/rust/zerocopy-derive/derive/unaligned.rs
+++ b/rust/zerocopy-derive/derive/unaligned.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::{Span, TokenStream};
 use syn::{Data, DataEnum, DataStruct, DataUnion, Error};
 
diff --git a/rust/zerocopy-derive/lib.rs b/rust/zerocopy-derive/lib.rs
index a1d10a2ada27..c517ea7db1eb 100644
--- a/rust/zerocopy-derive/lib.rs
+++ b/rust/zerocopy-derive/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy-derive/repr.rs b/rust/zerocopy-derive/repr.rs
index 57014b38b2da..74fd376d9fda 100644
--- a/rust/zerocopy-derive/repr.rs
+++ b/rust/zerocopy-derive/repr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy-derive/util.rs b/rust/zerocopy-derive/util.rs
index 4ec28bf95758..5ba5228e2a44 100644
--- a/rust/zerocopy-derive/util.rs
+++ b/rust/zerocopy-derive/util.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
-- 
2.54.0

