Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB3D391827;
	Mon, 16 Mar 2026 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673700; cv=none; b=MWeamG04OI60n/Bc8c3hvcxeohgE6K0gzWxR1ZPke4ZQx2ufwOMjYz7Gsx1UiKm3h86JHiNTnryg/4MgEdhKPffRhp1SmBcAgKlo8a/KnHwj2VXPDqItg8DQNCsMbyER9RDnam/iJ1XAuC8lQy0AlmaAbr4q92kuJbDXlhxIpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673700; c=relaxed/simple;
	bh=sfZiuUuf/1oM1TayPu7gLXaA2ptKtdCnBTLwk4X4dlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asfEB1IlzHvqFWzIAq/Ymh813qsqnJ+dKY5BoJ0/A9xGhzQPZtxogP1boOb9EQjIoSholo+0JUm6tWA3pLU6HXus4AT3XnYQtb4aiHbIY1xhAQZIa/MI2MBtCRhEtWXWAhUMzjuFXy6IO3VUBV19H80tecaNYPDqVTBBIm25Ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqMqBtGh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqMqBtGh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9D8C19421;
	Mon, 16 Mar 2026 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773673700;
	bh=sfZiuUuf/1oM1TayPu7gLXaA2ptKtdCnBTLwk4X4dlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=OqMqBtGh8REn92iOHnaLUVuTNddKjiGsJGgvlqUh/Or1emYKfprrDRQ+sC2Tb9i/W
	 ShJ1iMANQr5tUl2DQtkcbhdKi2QtVZWckm7MTW+fV+VtfZaFvdUusA0Fr6jXSancZP
	 Yrh9bl/Qzm1yn86m1ywxLfDivFa6dGRCnPzGMhM7tuqv1J0UMAtPIG5pRDEqsKZQDo
	 yTZEGHOfK03oV2hFJdaGmmGfadxGf9peT/S2TTRibhZEm0wqIFlAyVNUkjwQL2LAzo
	 /B+H/zEtbQi9XeCd2hZM1MGVL0HPJ44opcjhKfc5V+Bv8ovC2j8Lmu/FfIhT66Qy8V
	 9VcHH6tBti1IA==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 2/4] rust: add `const_assert!` macro
Date: Mon, 16 Mar 2026 15:07:13 +0000
Message-ID: <20260316150720.1646109-3-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260316150720.1646109-1-gary@kernel.org>
References: <20260316150720.1646109-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

The macro is a more powerful version of `static_assert!` for use inside
function contexts. This is powered by inline consts, so enable the feature
for old compiler versions that does not have it stably.

While it is possible already to write `const { assert!(...) }`, this
provides a short hand that is more uniform with other assertions. It also
formats nicer with rustfmt where it will not be formatted into multiple
lines.

Two users that would route via the Rust tree are converted.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/build_assert.rs | 24 ++++++++++++++++++++++++
 rust/kernel/num/bounded.rs  | 24 +++++++++---------------
 rust/kernel/prelude.rs      |  7 ++++++-
 rust/kernel/ptr.rs          | 12 ++++++------
 scripts/Makefile.build      |  5 +++--
 5 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
index d464494d430a..51c0f85a9014 100644
--- a/rust/kernel/build_assert.rs
+++ b/rust/kernel/build_assert.rs
@@ -41,6 +41,30 @@ macro_rules! static_assert {
     };
 }
 
+/// Assertion during constant evaluation.
+///
+/// This is a more powerful version of [`static_assert!`] that can refer to generics inside functions
+/// or implementation blocks. However, it also has a limitation where it can only appear in places
+/// where statements can appear; for example, you cannot use it as an item in the module.
+///
+/// # Examples
+///
+/// ```
+/// fn foo<const N: usize>() {
+///     const_assert!(N > 1);
+/// }
+///
+/// fn bar<T>() {
+///     const_assert!(size_of::<T>() > 0, "T cannot be ZST");
+/// }
+/// ```
+#[macro_export]
+macro_rules! const_assert {
+    ($condition:expr $(,$arg:literal)?) => {
+        const { ::core::assert!($condition $(,$arg)?) };
+    };
+}
+
 /// Fails the build if the code path calling `build_error!` can possibly be executed.
 ///
 /// If the macro is executed in const context, `build_error!` will panic.
diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index fa81acbdc8c2..54d0ce3ba595 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -255,9 +255,7 @@ impl<const N: u32> Bounded<$type, N> {
             /// ```
             pub const fn new<const VALUE: $type>() -> Self {
                 // Statically assert that `VALUE` fits within the set number of bits.
-                const {
-                    assert!(fits_within!(VALUE, $type, N));
-                }
+                const_assert!(fits_within!(VALUE, $type, N));
 
                 // SAFETY: `fits_within` confirmed that `VALUE` can be represented within
                 // `N` bits.
@@ -287,12 +285,10 @@ impl<T, const N: u32> Bounded<T, N>
     /// The caller must ensure that `value` can be represented within `N` bits.
     const unsafe fn __new(value: T) -> Self {
         // Enforce the type invariants.
-        const {
-            // `N` cannot be zero.
-            assert!(N != 0);
-            // The backing type is at least as large as `N` bits.
-            assert!(N <= T::BITS);
-        }
+        // `N` cannot be zero.
+        const_assert!(N != 0);
+        // The backing type is at least as large as `N` bits.
+        const_assert!(N <= T::BITS);
 
         // INVARIANT: The caller ensures `value` fits within `N` bits.
         Self(value)
@@ -406,12 +402,10 @@ pub fn get(self) -> T {
     /// assert_eq!(larger_v, v);
     /// ```
     pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
-        const {
-            assert!(
-                M >= N,
-                "Requested number of bits is less than the current representation."
-            );
-        }
+        const_assert!(
+            M >= N,
+            "Requested number of bits is less than the current representation."
+        );
 
         // SAFETY: The value did fit within `N` bits, so it will all the more fit within
         // the larger `M` bits.
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index c7e91b80d301..6a54597fa0a2 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -29,7 +29,12 @@
 
 pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
 
-pub use super::{build_assert, build_error, static_assert};
+pub use super::{
+    build_assert,
+    build_error,
+    const_assert,
+    static_assert, //
+};
 
 // `super::std_vendor` is hidden, which makes the macro inline for some reason.
 #[doc(no_inline)]
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index bdc2d79ff669..d05e5888e80c 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -11,6 +11,8 @@
 };
 use core::num::NonZero;
 
+use crate::const_assert;
+
 /// Type representing an alignment, which is always a power of two.
 ///
 /// It is used to validate that a given value is a valid alignment, and to perform masking and
@@ -44,12 +46,10 @@ impl Alignment {
     /// ```
     #[inline(always)]
     pub const fn new<const ALIGN: usize>() -> Self {
-        const {
-            assert!(
-                ALIGN.is_power_of_two(),
-                "Provided alignment is not a power of two."
-            );
-        }
+        const_assert!(
+            ALIGN.is_power_of_two(),
+            "Provided alignment is not a power of two."
+        );
 
         // INVARIANT: `align` is a power of two.
         // SAFETY: `align` is a power of two, and thus non-zero.
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3652b85be545..960b4630cb2c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -310,7 +310,8 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
-#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
+#   - Stable since Rust 1.79.0: `feature(inline_const)`,
+#     `feature(slice_ptr_len)`,
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
@@ -321,7 +322,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,inline_const,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.51.2

