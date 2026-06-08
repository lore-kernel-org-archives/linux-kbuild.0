Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD1129D294;
	Mon,  8 Jun 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928130; cv=none; b=PlZlcXSV4enoCijADH+M8RDusxzUNkpfifQ9bYWJVAn7U1k2GLcBrnXGml86PgMeJKUiV7M7/bjbULZa0bpoE4aU2hidAIKyIJFUASMf/wT1/C1bh55NbjC3Iaj1uJeljUNAmDGb99Hd770NpvI36QmUiJX6RbmOkITb9Jtu01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928130; c=relaxed/simple;
	bh=Xy0xOTtc+1RX8y9mj8nFOgnfzNokpWGgTIbU2b9Lmtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fqbs2jPkaKzQaOvct6qVfg9T323q1E8NrTIrOot4B5Oy5pUShxEjMd32tRweJ0miMjZmPH48mQpu4uNSHtTLGi+JU9XMDr/ZEJXZeGZpBu+hCMKczp0pjqcgmJ0evhVDEk81U+VZg7FNvGI/WvvHerOFMPke1Yucbp1+72svV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRJ3AKoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRJ3AKoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35081F00898;
	Mon,  8 Jun 2026 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928129;
	bh=dR7Y70JCFc/8Bb+Uo9FH+FnemFVCaKGZvOzrfjzZnBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gRJ3AKoJGZj6pYt0euRJqIsDF5mRDUFhs3iOzPJsjkB+yiUkLZAbfG2BfIBnaxi0l
	 whaIcJvT4IVYSHg/69sAg96kyhwPT0acjH1Hg5suI+Rdl5elRq+vUV6HHsYVfKPOpM
	 FS8QxcHKY3aafbzy4G0u5wT2nmSdrh/7X9xhtB2uDA5194WqTiHWxqSq16MiIByJpI
	 Vk18vQlk7+XYeCnQ2bC1/Y3Zw/CSKeg8n6BCYPxQbf/rGyK1HHfYspLFGXACR7Fv6K
	 aq8MIkzYzNnlhHszV2OMOmlSla9sgz0TFqUAvxRw/fTvGL2I186b7VwlClSehdOqhx
	 QaoWkiwPqc4Gg==
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
Subject: [PATCH v2 03/19] rust: kbuild: remove unused variable
Date: Mon,  8 Jun 2026 16:14:22 +0200
Message-ID: <20260608141439.182634-4-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we are adding one more proc macro crate (`zerocopy-derive`),
we are refactoring their handling.

`libpin_init_internal_extension` was added to mimic the setup for
`macros`, but it is not used, since the extension is expected to be
the same.

Thus remove it.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index bec9726f256c..2b4a3983bb1e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -51,7 +51,6 @@ libmacros_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name ma
 libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
 
 libpin_init_internal_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name pin_init_internal --crate-type proc-macro - </dev/null)
-libpin_init_internal_extension := $(patsubst libpin_init_internal.%,%,$(libpin_init_internal_name))
 
 always-$(CONFIG_RUST) += $(libmacros_name) $(libpin_init_internal_name)
 
-- 
2.54.0

