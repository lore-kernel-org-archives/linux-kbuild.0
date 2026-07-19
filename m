Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54C392824;
	Sun, 19 Jul 2026 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784462742; cv=none; b=mb5C8Kb3Jq3vAMQ7EfYXGunrQjUOfdE1unXIdtWT8EnIrAOI+K+brBEu9J0kB0O1j7fEUDrzY8UCCtmNJyQq1x6OwJ1qJUK8OzoiGjVkvfjGjtnaPdaOwzDw5a/V6ZNUVZbmB/gaqooL7ekjjltkzTKNm2BRd9Y/9TRyD3QyFys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784462742; c=relaxed/simple;
	bh=/F515Mggx/LfPwvCWJhHNDaxr8uq2KwLMOLCbYae0cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AIEAVhv8t8ISlS5G9VmjKvzpEaDUkOXkgXNuNR2VNDkEkrkgYEn4QnUpRhsMn4+XUKfNwA+V+lpTm/GBnmI6zsPQoObDBmUOMtX+gbKABd6Wvc+V+FOWe7kPx77VsZD85G4oTezxbrn0q1W2DA9By45kjtY0Ic6KagmMRnz+FAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZR0RyfD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZR0RyfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D481F00A3A;
	Sun, 19 Jul 2026 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784462741;
	bh=JMGd2uoPB7NsKyb94n7h+QsK/jkUxl/G3pG+G3sr+Rg=;
	h=From:To:Cc:Subject:Date;
	b=RZR0RyfDoAkuFSxusYk3tvLzrspRkRJBqd7YC98PsWhMrgDKvhz/DH49BIsSZXJwm
	 QJF+p2kKddvR723wUdn5nqA9LI6ktYrAyoYyaIYxUBlBv/mrSAdV7v3TWHXGuwBtRs
	 EEXA5U8LjUH+8AicvVsFH1DnucP9wbItQ821n0PJqcgSODrNEK8LV1FoKGarhcr2+4
	 DFmgqJmGZzu2b9ClysKUc9DHoiCpWuXeOOKrDM2eq+zUwq4Z95iNpLipko8mOEpJC5
	 SketreBRo3yE9qw+8p6YHBCoSD0YCMTKpqo+OFFgivIN/1puY1s6qW4jJvirty/ebg
	 +PB4PcQO5dqXA==
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Burak Emir <burak.emir@gmail.com>
Subject: [PATCH] rust: rust_is_available: warn for `bindgen` < 0.72.1 && libclang >= 22
Date: Sun, 19 Jul 2026 14:05:14 +0200
Message-ID: <20260719120514.159914-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with LLVM 22, `clang_getTypeDeclaration()` may return a forward
declaration instead of the type definition. This made `bindgen` generate
opaque types [1][2], which in turn made us fail with e.g.

    error[E0609]: no field `__bindgen_anon_1` on type `bindings::kernel_param`
      --> rust/kernel/module_param.rs:78:46
       |
    78 |         let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
       |                                              ^^^^^^^^^^^^^^^^ unknown field
       |
       = note: available field is: `_address`

This was fixed in `bindgen` 0.72.1 [3].

In order to clarify what is going on and avoid confusion [4][5], add
a warning to `rust_is_available.sh` about it when the versions match,
similar to past warnings like the one removed in:

  commit ae64324ad5c1 ("rust: rust_is_available: remove warning for `bindgen` < 0.69.5 && libclang >= 19.1")

In addition, even if the versions match, check if the issue appears to
not reproduce with the given binaries, to avoid a warning in such a case.

Finally, include tests.

Link: https://github.com/rust-lang/rust-bindgen/issues/3264 [1]
Link: https://github.com/Rust-for-Linux/linux/issues/353 [2] # "Missing fields in nested class with LLVM 22."
Link: https://github.com/rust-lang/rust-bindgen/pull/3278 [3]
Reported-by: Burak Emir <burak.emir@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1247 [4]
Link: https://lore.kernel.org/rust-for-linux/CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com/ [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
While it was known, I added Reported-by anyway -- please let me know if
you prefer otherwise.

Would you mind confirming you get the warning?

Thanks!

 scripts/rust_is_available.sh                  | 14 +++++++++
 .../rust_is_available_bindgen_libclang_22.h   |  5 ++++
 scripts/rust_is_available_test.py             | 30 ++++++++++++++++++-
 3 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 scripts/rust_is_available_bindgen_libclang_22.h

diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index 551f1ebd0dcb..c30983562a2f 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -208,6 +208,20 @@ if [ "$bindgen_libclang_cversion" -lt "$bindgen_libclang_min_cversion" ]; then
 	exit 1
 fi

+if [ "$bindgen_libclang_cversion" -ge 2200000 ] &&
+	[ "$rust_bindings_generator_cversion" -lt 7201 ]; then
+	# Distributions may have patched the issue.
+	if ! "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_libclang_22.h | grep -q 'pub foo'; then
+		echo >&2 "***"
+		echo >&2 "*** Rust bindings generator '$BINDGEN' < 0.72.1 together with libclang >= 22"
+		echo >&2 "*** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/3278)."
+		echo >&2 "***   Your bindgen version:  $rust_bindings_generator_version"
+		echo >&2 "***   Your libclang version: $bindgen_libclang_version"
+		echo >&2 "***"
+		warning=1
+	fi
+fi
+
 # If the C compiler is Clang, then we can also check whether its version
 # matches the `libclang` version used by the Rust bindings generator.
 #
diff --git a/scripts/rust_is_available_bindgen_libclang_22.h b/scripts/rust_is_available_bindgen_libclang_22.h
new file mode 100644
index 000000000000..6b33544c14a8
--- /dev/null
+++ b/scripts/rust_is_available_bindgen_libclang_22.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+struct S;
+struct S {
+	int foo;
+};
diff --git a/scripts/rust_is_available_test.py b/scripts/rust_is_available_test.py
index d6d54b7ea42a..e14cf2c5695e 100755
--- a/scripts/rust_is_available_test.py
+++ b/scripts/rust_is_available_test.py
@@ -54,16 +54,23 @@ else:
 """)

     @classmethod
-    def generate_bindgen(cls, version_stdout, libclang_stderr):
+    def generate_bindgen(cls, version_stdout, libclang_stderr, libclang_22_patched=False):
         if libclang_stderr is None:
             libclang_case = f"raise SystemExit({cls.bindgen_default_bindgen_libclang_failure_exit_code})"
         else:
             libclang_case = f"print({repr(libclang_stderr)}, file=sys.stderr)"

+        if libclang_22_patched:
+            libclang_22_case = "print('pub foo: ::std::os::raw::c_int,')"
+        else:
+            libclang_22_case = "pass"
+
         return cls.generate_executable(f"""#!/usr/bin/env python3
 import sys
 if "rust_is_available_bindgen_libclang.h" in " ".join(sys.argv):
     {libclang_case}
+elif "rust_is_available_bindgen_libclang_22.h" in " ".join(sys.argv):
+    {libclang_22_case}
 else:
     print({repr(version_stdout)})
 """)
@@ -248,6 +255,27 @@ else:
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": bindgen })
         self.assertIn(f"libclang (used by the Rust bindings generator '{bindgen}') is too old.", result.stderr)

+    def test_bindgen_bad_libclang_22(self):
+        for (bindgen_version, libclang_version, expected_not_patched) in (
+            ("0.71.1", "21.1.0", self.Expected.SUCCESS),
+            ("0.71.1", "22.0.0", self.Expected.SUCCESS_WITH_WARNINGS),
+            ("0.71.1", "22.1.0", self.Expected.SUCCESS_WITH_WARNINGS),
+
+            ("0.72.0", "22.0.0", self.Expected.SUCCESS_WITH_WARNINGS),
+
+            ("0.72.1", "22.0.0", self.Expected.SUCCESS),
+        ):
+            with self.subTest(bindgen_version=bindgen_version, libclang_version=libclang_version):
+                cc = self.generate_clang(f"clang version {libclang_version}")
+                libclang_stderr = f"scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {libclang_version} [-W#pragma-messages], err: false"
+                bindgen = self.generate_bindgen(f"bindgen {bindgen_version}", libclang_stderr)
+                result = self.run_script(expected_not_patched, { "BINDGEN": bindgen, "CC": cc })
+                if expected_not_patched == self.Expected.SUCCESS_WITH_WARNINGS:
+                    self.assertIn(f"Rust bindings generator '{bindgen}' < 0.72.1 together with libclang >= 22", result.stderr)
+
+                bindgen = self.generate_bindgen(f"bindgen {bindgen_version}", libclang_stderr, libclang_22_patched=True)
+                result = self.run_script(self.Expected.SUCCESS, { "BINDGEN": bindgen, "CC": cc })
+
     def test_clang_matches_bindgen_libclang_different_bindgen(self):
         bindgen = self.generate_bindgen_libclang("scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version 999.0.0 [-W#pragma-messages], err: false")
         result = self.run_script(self.Expected.SUCCESS_WITH_WARNINGS, { "BINDGEN": bindgen })

base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
--
2.55.0
