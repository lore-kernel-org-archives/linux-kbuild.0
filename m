Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32413FBEC5;
	Tue,  2 Jun 2026 17:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421404; cv=none; b=a8N5ydgZw+Qrxxd8Z51qQ2MPrQz/3otsnnNp6Fpwei9bNO2ZFhAfbFnFUfj9EX1xjGztSwvRk7/3wmDLHNZjGE1Opgyt38eECfaDJVe1wSPqNI8wdbFDKFseM0EuLkGYIja/LYaNkWHAXjGOvYTAc+e1PxyWmySpHFDRCdye1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421404; c=relaxed/simple;
	bh=aSZOhhf3vRUE2phGwbM7KMo2jgdh2KIfQTZ392atU24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eu18GRilLBVMV3vGEvypcKscdCL/MsMSAxWlW8evnBfvUppM4wVIpuaY2YSI8zARdWGfwoC5c4dBXPoxJ6bXbjrYN55BrGC2E4hOYHFdlHQJ3aSZxp8fSEXR84jxaCzO3du/MWAyymvA+BlxGDGhontpjCMhn3HlnZbxoRF+drM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFk8geHh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFk8geHh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3417F1F00898;
	Tue,  2 Jun 2026 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421403;
	bh=w9fLc5LKmMvg2+YhAypjTcFLcL6vS7llS/CAJ/v+X/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GFk8geHhi+cPmyMKGySJr49DcF34ALuXdlxgPvnuiDX9YZq3pB0/cWDi0Lj8lb5J/
	 4jh4bFqA3USpYTvUst+nwbB4zWFCUuxUCNPUCL6gVCOaOfw+eUfFwvzmLzc2Q4Odln
	 wIbNN5BrYgymgBKkg4tGzmTvVAt3qn2jzSndrNwMd5D+jy4HTRowzgNHHRA5y2vjrf
	 uaFxP6mBvnzSZVyfucAcbpiM80ReUZzrYYvjWPTMQIFcBY+v43hr41aAuyPVNQHKGe
	 HZlMZzGFTqOjRWpJZcY0zSUbB+tmtpboNRah5S2jHCgqIz/AWIGAXM7yqNH0vm8pjT
	 ghTl3h+QweukQ==
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
Subject: [PATCH 05/18] rust: kbuild: define `procmacro-extension` variable
Date: Tue,  2 Jun 2026 19:29:06 +0200
Message-ID: <20260602172920.30342-6-ojeda@kernel.org>
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

Thus, instead of using `libmacros_extension` as the common variable to
hold the extension for all of them, use a dedicated variable with a more
generic name (including for its implementation).

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 8dfccf7399d9..df90fabefb70 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -48,10 +48,9 @@ endif
 ifdef CONFIG_RUST
 
 procmacro-name = $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name $(1) --crate-type proc-macro - </dev/null)
+procmacro-extension := $(patsubst libname.%,%,$(call procmacro-name,name))
 
 libmacros_name := $(call procmacro-name,macros)
-libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
-
 libpin_init_internal_name := $(call procmacro-name,pin_init_internal)
 
 always-$(CONFIG_RUST) += $(libmacros_name) $(libpin_init_internal_name)
@@ -549,7 +548,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro -L$(objtree)/$(obj) \
-		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
+		--crate-name $(patsubst lib%.$(procmacro-extension),%,$(notdir $@)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-- 
2.54.0

