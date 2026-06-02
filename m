Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232183F54AD;
	Tue,  2 Jun 2026 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421448; cv=none; b=WOmySiAphyC9lIksKnVN5XqV5H6aIaq5wfAFqi5DCI0yXqZp9CF/60VUWnHmpoGz99O5mQkoqs3cboYbtGDZQcAsTHihoA6syYHCAsFE8ntp/McwNWWX7Vinb1051vmTyNeJ7GVYCY7k9mx16+gKlOj0QBG+OOWEC+EquS7FBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421448; c=relaxed/simple;
	bh=QwekvpZm6oTmPT/1kWTAqW9r7MSVKMJQhY1CEW53Zt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVhPxVx4iCSBmWr9ODD/kBFhEKNgGSSVE0r30/doHpebKliDx2YAXpkbf8eHntUVJIzHtJXv1Lzz5UbG5p1NSjUmXiVzh90YROtrj+0SRPlfBX2oPblbK8ZesTBmAnX4UsoREelD2RNJx8pGqbgtGDBDL4QRAlc+Hc2JBtBLZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ly1YHzBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ly1YHzBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42E01F00898;
	Tue,  2 Jun 2026 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421447;
	bh=pRNU9rIWop1B1l0mz/Maer2Jv2/JYps5u3f72AL+xwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ly1YHzBoCyv76DFGFlps78U0BB8aNzjLtJbqtmjEBQHvtIU3yGJHZUKB2lW8BZ/LU
	 kFwEdM658CSB5y5gXX+c6ZXqP3/vX+r2Vgbcd5VVQoY6K/P7NQEM7LE+70uiVQu4Zu
	 fTuDD9xk7mIn9UfKlVHq52PCW7+A4oR7a6XobMjjpAuLz7Xlpu4zAWqNzq+lj3GFA8
	 8YLSxBmjcOtvnIA2bH4JaDtsy6cOHHZYujUzrdnRHc2j1tXk5+SffhcM5lVIepGEUj
	 hPkKyn1Qiee7oQIYN+/FDhw2G5XHIJgX5Zc85Lfdn45kEf4aklnuZYQvSEDcahAWw8
	 jA7UOKOxjbP+w==
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
Subject: [PATCH 16/18] rust: zerocopy-derive: add `README.md`
Date: Tue,  2 Jun 2026 19:29:17 +0200
Message-ID: <20260602172920.30342-17-ojeda@kernel.org>
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

Thus do the same for the `zerocopy-derive` crate.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@amazon.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy-derive/README.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 rust/zerocopy-derive/README.md

diff --git a/rust/zerocopy-derive/README.md b/rust/zerocopy-derive/README.md
new file mode 100644
index 000000000000..110f4a401778
--- /dev/null
+++ b/rust/zerocopy-derive/README.md
@@ -0,0 +1,14 @@
+# `zerocopy-derive`
+
+These source files come from the Rust `zerocopy-derive` crate, version v0.8.50
+(released 2026-05-31), hosted in the <https://github.com/google/zerocopy>
+repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
+modified to add the SPDX license identifiers and to remove the generation of
+non-ASCII identifiers.
+
+For copyright details, please see:
+
+    https://github.com/google/zerocopy/blob/v0.8.50/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-MIT
-- 
2.54.0

