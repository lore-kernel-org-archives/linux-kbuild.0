Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57E7262A;
	Sun, 19 Jul 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784466457; cv=none; b=qrWJ95a/g2M3JOFrtFDMIiLwQo/sDYpNUGGHA93szYmQ5J2Mq4jlL/BLED4ly9gHplgx41lBde8hA0CsNaTn7qUrnlpxsbyX5ccR/foh46Mh9xeheCv/md9VBNcJ7mGlH6ee095LP621K4R9N0WCnSF9JKs8f99nC/lhM/EmstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784466457; c=relaxed/simple;
	bh=nOcRA0GYFFgIm9dpWBJhORqRedhN3QR3I2bXhOBkoUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJAFFESbdIIwGqebP63MimMv06BqRGY0iBTiWGyPgnetK6527WBZeh/BAAxKPKQHj+G9bJ0TMLrjCNSez5jgCiZwIrMW6bIZJQ9FkrmFFTm0a3GMWZb9KfB8gbDtMqbqARGjNAhc7UbW+7kw+kjaQN1ciGwlbBODPinDanP0JuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2KVYz00; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2KVYz00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3F41F000E9;
	Sun, 19 Jul 2026 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784466456;
	bh=UXfusYbrbZ3cSwcBT2LQ0zJybi/GuUM0+fTo9FJho8g=;
	h=From:To:Cc:Subject:Date;
	b=X2KVYz00qsTi66rbEhliy0Db9KqlhzeZlISNHAN0qr0w9hMFimefzoCpoDGoyF5N3
	 LQiO+jyDBirBvv1IHEO9YatkdrI5kIya4bGpz44XDUKOfmKPWvQXARzQTgt76PMZwf
	 sELB8O4fPvEN7e4yBp4p497e62s58PSzvHgYxoWSAlh92USbxk0K9/PBwjB1wFDmAg
	 bAOhtWuA7xL0ZWbERabL/qK+VIDdrtPf+Pj1ngVvltgKjRyY80ZDb4CJj32mkEKhet
	 lF+B/XkwtEnXieYyc92mCn9kMe50paUEiUCz+niIP0sxWro6q+LAQORNmFlpznxTFl
	 rFL7v3NkIE/gA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: rust_is_available: support testing with `bash` as `/bin/sh`
Date: Sun, 19 Jul 2026 15:07:23 +0200
Message-ID: <20260719130723.162899-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`command -v` behaves differently on `dash` vs. `bash` when faced with
a file without the execute bit.

Thus, for the non-executable `rustc` and `bindgen` tests, support both
possible outputs that the script currently gives.

This makes the test script clean on distributions like Fedora.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Independently, we could add a custom check for the non-exec case in the
actual shell script, but back then it was decided with Kbuild to avoid
overcomplicating it for rare cases (which anyway give an error).

 scripts/rust_is_available_test.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/rust_is_available_test.py b/scripts/rust_is_available_test.py
index d6d54b7ea42a..752c59d5f55f 100755
--- a/scripts/rust_is_available_test.py
+++ b/scripts/rust_is_available_test.py
@@ -177,7 +177,12 @@ else:

     def test_rustc_nonexecutable(self):
         result = self.run_script(self.Expected.FAILURE, { "RUSTC": self.nonexecutable })
-        self.assertIn(f"Running '{self.nonexecutable}' to check the Rust compiler version failed with", result.stderr)
+        self.assertTrue(
+            # `dash`.
+            f"Running '{self.nonexecutable}' to check the Rust compiler version failed with" in result.stderr or
+            # `bash`.
+            f"Rust compiler '{self.nonexecutable}' could not be found." in result.stderr
+        )

     def test_rustc_unexpected_binary(self):
         result = self.run_script(self.Expected.FAILURE, { "RUSTC": self.unexpected_binary })
@@ -205,7 +210,12 @@ else:

     def test_bindgen_nonexecutable(self):
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": self.nonexecutable })
-        self.assertIn(f"Running '{self.nonexecutable}' to check the Rust bindings generator version failed with", result.stderr)
+        self.assertTrue(
+            # `dash`.
+            f"Running '{self.nonexecutable}' to check the Rust bindings generator version failed with" in result.stderr or
+            # `bash`.
+            f"Rust bindings generator '{self.nonexecutable}' could not be found." in result.stderr
+        )

     def test_bindgen_unexpected_binary(self):
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": self.unexpected_binary })

base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
--
2.55.0
