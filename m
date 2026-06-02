Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAAD3FB7FC;
	Tue,  2 Jun 2026 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421400; cv=none; b=jbyYwkx4vo3IJz+omzdadGgSiH0BmUgBptEpWVgTixDCM1muwLO8OHfBjZ56sFNQ1r/j53Jq2eKwV0OIcaoYphTRXElmxOfA5GYouypWmAuoIlV+75hnT/CcJ0zHaxHEiiHAghljGr0SnHg4i++btSL9wnXd8TBrvWJ9ASqVnww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421400; c=relaxed/simple;
	bh=FmbNu6MvuM2r8ZR2TjKNbwoI6YDijBRwrWaQmb5OmEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7DflR62DpH7Os0dX1DT50v9vtjZdSE9eqcW0T3nIhfvM2DEPfNtDSpBmwCS2Kr5hhlVpHPJ67u3Te89nRUzo8JaOvoi6rqoT0V3mJuqAkOlnxcHADK44pGN1rM+RxRupkeG+tWQEhRuJf46wcW8/xIrHivOypdJ/wmU7FAQc9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIs3+Hgg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIs3+Hgg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F76D1F00893;
	Tue,  2 Jun 2026 17:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421399;
	bh=u1oX+1ZZ1kaVjVIAORP4nw7V0HqG2cEXq1IWi72B6ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dIs3+HggH7HtpXm95korbRxeqWXkO6RGttwFzJzS8J1iB5d6FJ8+qu9HNqp1OPOPe
	 AA52HvvE2WSElrPjAcPF5isf5DqsWxBbyhMwA8gTC2avvqwKq5powtrNIgaSuP6abG
	 y6i+XVuPrIU+G0B2CUN0fgahnzFR5XbjZGjBFxf8rMfkALU1oJJn2B8Gz5+XNnEESh
	 VV3V84UlnT2Akaol5l0BG2c6qSonqqcM0WezLvQX+A7dEZFfRnmdc6cQma7UhsvHds
	 6Cvn8f3K/j+hFZjMKBe/Pk+4TGIKAmR/j3OQ1EbFbIr3UKwfl5hiGZ7TdvgHkMLZ6F
	 17MLQObdFWruw==
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
Subject: [PATCH 04/18] rust: kbuild: define `procmacro-name` function
Date: Tue,  2 Jun 2026 19:29:05 +0200
Message-ID: <20260602172920.30342-5-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
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

