Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E03B47F5;
	Mon,  8 Jun 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928155; cv=none; b=UmU2xFM9thZ/WcXMDmmcT1CQmoW1Mx3kPQvUupFshjTgphu/GAehqlsagBj2lpTx8/RsX/0PbCJaD4GplkM1WHPDkpPXHN/DhIgpQXzlDGlrr5vFlWlUGAQtvsLVA8wRiiCu3E05hg8PO5d2Jd5YbBSgftmVlfZgSYGHD0AUAIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928155; c=relaxed/simple;
	bh=bsVdjUme0BJiWTXHlG8O5iVDlW6YVWcmQixEGyUobac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TA+gp6YBrF+mwjm9wlXox3DoXVV8IUVJWLu+3rFYFKF9CJ+FQ4DORFIPhMxkGUg+SpWqinn/rP3CQXfQPBJPegfm1RPjjgKyILYxqRyqOTmAOimY4M4YOVDTX0gEjZky7ACh/bl5R5D0QQigqSUSUAuesMxLjpdx0EVz2HWdEh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rf7jjoSc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rf7jjoSc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FAA1F0089A;
	Mon,  8 Jun 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928153;
	bh=cAkcU9dF8TD3BD4jvOVeWWtqLIO1TYi7RrFLfQZ87OE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rf7jjoScjPZUc765yPQ0HANKf2tN7JHa/+n2BmgFtWTKxIh8hm3SK7kwVH45ysw6b
	 wVIzQ6BqifuToRbf1aJZq6tqBtLSENOAhcCsmgqrqqK9Ery89T5LrUm5a9JoxN7rLI
	 TuzkHC2IV9K7h3GFN4LDPLJ9zLKf64zyfpgYAoKBM+95vMAIadBFx580FmmQhBKfUg
	 GAcj7MqEF8J8SVyDNjFxUeu/BMYC/QorJsUbv+s+IWNHP3Zpwl2UOGaLiDCpuieJza
	 3B25fwYF7AVD+C6zcMhTt+8DD9wIe3hT2tEdb3kpHl23GRDo6ZNcXOTdLymrCEnmEx
	 fUNgO1R0OgFkw==
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
Subject: [PATCH v2 09/19] rust: zerocopy: add SPDX License Identifiers
Date: Mon,  8 Jun 2026 16:14:28 +0200
Message-ID: <20260608141439.182634-10-ojeda@kernel.org>
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

Thus do the same for the `zerocopy` crate.

This makes `scripts/spdxcheck.py` pass: use parentheses like commit
06e9bfc1e57d ("ionic: make spdxcheck.py happy") did since we have two
`OR` operators in the expression (three licenses).

SPDX identifiers are not added to the `benches` files because they are
included in rendered documentation. Nevertheless, the `README.md` to be
added by a later commit mentions the license.

Finally, as requested, I filed an issue [1] with upstream about it.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@google.com>
Link: https://github.com/google/zerocopy/issues/3428 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy/rustdoc/style.css        | 2 ++
 rust/zerocopy/src/byte_slice.rs        | 2 ++
 rust/zerocopy/src/byteorder.rs         | 2 ++
 rust/zerocopy/src/deprecated.rs        | 2 ++
 rust/zerocopy/src/error.rs             | 2 ++
 rust/zerocopy/src/impls.rs             | 2 ++
 rust/zerocopy/src/layout.rs            | 2 ++
 rust/zerocopy/src/lib.rs               | 2 ++
 rust/zerocopy/src/macros.rs            | 2 ++
 rust/zerocopy/src/pointer/inner.rs     | 2 ++
 rust/zerocopy/src/pointer/invariant.rs | 2 ++
 rust/zerocopy/src/pointer/mod.rs       | 2 ++
 rust/zerocopy/src/pointer/ptr.rs       | 2 ++
 rust/zerocopy/src/pointer/transmute.rs | 2 ++
 rust/zerocopy/src/ref.rs               | 2 ++
 rust/zerocopy/src/split_at.rs          | 2 ++
 rust/zerocopy/src/util/macro_util.rs   | 2 ++
 rust/zerocopy/src/util/macros.rs       | 2 ++
 rust/zerocopy/src/util/mod.rs          | 2 ++
 rust/zerocopy/src/wrappers.rs          | 2 ++
 20 files changed, 40 insertions(+)

diff --git a/rust/zerocopy/rustdoc/style.css b/rust/zerocopy/rustdoc/style.css
index c5c8aeb743a1..414348964af2 100644
--- a/rust/zerocopy/rustdoc/style.css
+++ b/rust/zerocopy/rustdoc/style.css
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT */
+
 /*
 Copyright 2026 The Fuchsia Authors
 
diff --git a/rust/zerocopy/src/byte_slice.rs b/rust/zerocopy/src/byte_slice.rs
index 6f9ee9ac3336..a5ded4a18b39 100644
--- a/rust/zerocopy/src/byte_slice.rs
+++ b/rust/zerocopy/src/byte_slice.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/byteorder.rs b/rust/zerocopy/src/byteorder.rs
index 257505203415..36ca4c0c88b0 100644
--- a/rust/zerocopy/src/byteorder.rs
+++ b/rust/zerocopy/src/byteorder.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/deprecated.rs b/rust/zerocopy/src/deprecated.rs
index 61b29aa5f485..24bafbf9adeb 100644
--- a/rust/zerocopy/src/deprecated.rs
+++ b/rust/zerocopy/src/deprecated.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/error.rs b/rust/zerocopy/src/error.rs
index 05fdfe3b91f8..7cb08c31d452 100644
--- a/rust/zerocopy/src/error.rs
+++ b/rust/zerocopy/src/error.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/impls.rs b/rust/zerocopy/src/impls.rs
index 80538bfc8a26..22fd6c3d5d94 100644
--- a/rust/zerocopy/src/impls.rs
+++ b/rust/zerocopy/src/impls.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/layout.rs b/rust/zerocopy/src/layout.rs
index 19ad5ca85f74..6015d0f2de52 100644
--- a/rust/zerocopy/src/layout.rs
+++ b/rust/zerocopy/src/layout.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/lib.rs b/rust/zerocopy/src/lib.rs
index 89a696f732b8..3302d67602ab 100644
--- a/rust/zerocopy/src/lib.rs
+++ b/rust/zerocopy/src/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2018 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/macros.rs b/rust/zerocopy/src/macros.rs
index 948f8f912bb7..b801d86a8fa6 100644
--- a/rust/zerocopy/src/macros.rs
+++ b/rust/zerocopy/src/macros.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/pointer/inner.rs b/rust/zerocopy/src/pointer/inner.rs
index c8dd9f01f456..5db08080141f 100644
--- a/rust/zerocopy/src/pointer/inner.rs
+++ b/rust/zerocopy/src/pointer/inner.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/invariant.rs b/rust/zerocopy/src/pointer/invariant.rs
index 2af211dd9fdd..1802d23563db 100644
--- a/rust/zerocopy/src/pointer/invariant.rs
+++ b/rust/zerocopy/src/pointer/invariant.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/mod.rs b/rust/zerocopy/src/pointer/mod.rs
index 4c3658679d46..3461f7f5ca80 100644
--- a/rust/zerocopy/src/pointer/mod.rs
+++ b/rust/zerocopy/src/pointer/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/ptr.rs b/rust/zerocopy/src/pointer/ptr.rs
index 307b2aee63ca..b7c4ea56d2b2 100644
--- a/rust/zerocopy/src/pointer/ptr.rs
+++ b/rust/zerocopy/src/pointer/ptr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/transmute.rs b/rust/zerocopy/src/pointer/transmute.rs
index 45b4f727fd0d..a534984b70d3 100644
--- a/rust/zerocopy/src/pointer/transmute.rs
+++ b/rust/zerocopy/src/pointer/transmute.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2025 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/ref.rs b/rust/zerocopy/src/ref.rs
index 496afc435c61..860066d75196 100644
--- a/rust/zerocopy/src/ref.rs
+++ b/rust/zerocopy/src/ref.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/split_at.rs b/rust/zerocopy/src/split_at.rs
index 1d7b2c7d6032..9a67d5acbb0d 100644
--- a/rust/zerocopy/src/split_at.rs
+++ b/rust/zerocopy/src/split_at.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2025 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/util/macro_util.rs b/rust/zerocopy/src/util/macro_util.rs
index 2235d0b8b49a..1abb0fbeb46e 100644
--- a/rust/zerocopy/src/util/macro_util.rs
+++ b/rust/zerocopy/src/util/macro_util.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2022 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/util/macros.rs b/rust/zerocopy/src/util/macros.rs
index 7dca5410c84f..43e4fd64ee15 100644
--- a/rust/zerocopy/src/util/macros.rs
+++ b/rust/zerocopy/src/util/macros.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/util/mod.rs b/rust/zerocopy/src/util/mod.rs
index 1a6c0b22a47b..d6d4c6c2fcd9 100644
--- a/rust/zerocopy/src/util/mod.rs
+++ b/rust/zerocopy/src/util/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/wrappers.rs b/rust/zerocopy/src/wrappers.rs
index f3930eb7ebc0..266aec25fa58 100644
--- a/rust/zerocopy/src/wrappers.rs
+++ b/rust/zerocopy/src/wrappers.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
-- 
2.54.0

