Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A23B47F5;
	Mon,  8 Jun 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928134; cv=none; b=kl3pNjrRz47lFWmuauGQZ8BXn2tMNRKIvtNmSz18SRcjkQ2CfOD1bFNqFyIFgdZJMAbjEcnPkzo6gzXERXeOUwF4b+QbVV+twopwr+PGmurBtvALDLLBpfmIA+4n6OoMAv3oYXLcSlfVifg+DR5TkZg2luq1e8fjjldRPG7KhBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928134; c=relaxed/simple;
	bh=FmbNu6MvuM2r8ZR2TjKNbwoI6YDijBRwrWaQmb5OmEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5A8tKUkyw7W8boQ/Fs9DR6KqExIYljIzexmzyzs2cYC/iXYJyRA+H+unphM8dPqnoHDnSJAu9uGxtUsHTRCqfPcQEay8w5tkggpcRiSckcXAvs+oJowaGN2j3igPNaGk2E1CpDAp39Wi6Dkd1wU1JQ9Zk7bf6yWPj+5vooB8uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv7S4MJv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv7S4MJv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99071F00893;
	Mon,  8 Jun 2026 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928133;
	bh=u1oX+1ZZ1kaVjVIAORP4nw7V0HqG2cEXq1IWi72B6ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zv7S4MJvD/SnU1G8w11y0zk2bd3tdFuzpTY7mlv60q08lXgIJ4aXhAJCD8PNEJ8py
	 QmLtN2LQl3+Mc5wZy4iMr+tU35sf/Pg8g+0RCM7jGqg/FMfR6pB6RZ4s0rN+e2J42n
	 kUa9Ef9K7Ud2V9rmcLvI6B0ijWPWkDM7Dm2HzWUk1kL0Nyz/B7GMyx6C23d1YUYvsw
	 becki8lurE6k2qS04WXyCKpDIg0zcbaWfZBjmKMmANPNTUkRhy4mntNqXHtgRMe3rD
	 +oN5JM3i5V5NqDy06otIUUQUuM9cntgDfZ1uZPhGrHbtHP+Ro6MbvL2rPkldrvVnqw
	 IyX/mOlSTvw1w==
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
Subject: [PATCH v2 04/19] rust: kbuild: define `procmacro-name` function
Date: Mon,  8 Jun 2026 16:14:23 +0200
Message-ID: <20260608141439.182634-5-ojeda@kernel.org>
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

Thus define a `procmacro-name` function and use it to fill the existing
variables' values.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 2b4a3983bb1e..8dfccf7399d9 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -47,10 +47,12 @@ endif
 # Avoids running `$(RUSTC)` when it may not be available.
 ifdef CONFIG_RUST
 
-libmacros_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name macros --crate-type proc-macro - </dev/null)
+procmacro-name = $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name $(1) --crate-type proc-macro - </dev/null)
+
+libmacros_name := $(call procmacro-name,macros)
 libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
 
-libpin_init_internal_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name pin_init_internal --crate-type proc-macro - </dev/null)
+libpin_init_internal_name := $(call procmacro-name,pin_init_internal)
 
 always-$(CONFIG_RUST) += $(libmacros_name) $(libpin_init_internal_name)
 
-- 
2.54.0

