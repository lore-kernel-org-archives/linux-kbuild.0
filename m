Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F583B47F5;
	Mon,  8 Jun 2026 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928181; cv=none; b=Q11Nd122SGDsJKZTuOUUwUZQFNbnEjtXlL647iHW7jpodjlpRTH3YGXmGIFdbswvSHsROCFkQUHeRMAiW3WrRxEEO015POn+zcwfNy3gjnay8Pv3lt7CKHMNlJKrGyuN2rI2lc3CaounXgyYK0WgSjDH/yDmkkI6Y0pnNhvNMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928181; c=relaxed/simple;
	bh=B3DXNokpV8+35mD5FqaIDNhKFGqFor0133NOOKmj9Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FK803OAAFcPWUs1pw54S1Tqhcra3g3wLw8AEZrbA5F2PGIKKmdLhMPTJySHhEL2IY48rFnOWqz3b+zrxnECddaFX/a5cp2mblxiODEUKw2PorM4vop3EOjA7OJ0yM6PP4KRnd3xbzVf9+ZH5QiJ4sSxCUfQbwOg/Llo11JSC/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBzrQeMU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBzrQeMU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A41F1F0089A;
	Mon,  8 Jun 2026 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928180;
	bh=AooR9kWwPrCpN1Cxumc8PAI0ZmNIlnzIjd8wq9UGMvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bBzrQeMUHsRe7+0py/OoQBg2BSxl/ZG6kwpVeZwWYeMce1zorj4/Gol+5fGuM/dEH
	 IFe3/hd+N7gRcpDx8ve5GAbWErWPvjk98B1TN9pnrg9SMj/7Rq4QpYkIMCXl1wJRT1
	 xpbiNISeoB/bxLoK7W+BUmImK9d+yryl6kLqy9+3lHUJq+YQOOcL7yO+Te020E3HPI
	 O1ZpvwPBXCcT98VSMMyLAUyfYYRGpB6MtnH4BwSlFly9KUMUKXzS+j/5exUld73c+k
	 7M0WMByN5jRwHoPyznUjdTKQ3CFSm2b1v+qpMnkGiw4/m3ErKYb/uXgZRUKpiHEZWe
	 OBWIFr2sK4H8A==
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
Subject: [PATCH v2 16/19] rust: zerocopy-derive: add `README.md`
Date: Mon,  8 Jun 2026 16:14:35 +0200
Message-ID: <20260608141439.182634-17-ojeda@kernel.org>
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

Thus do the same for the `zerocopy-derive` crate.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@google.com>
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

