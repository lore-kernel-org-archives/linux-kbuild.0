Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317B13FBB7D;
	Tue,  2 Jun 2026 17:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421393; cv=none; b=ejIL2oD5riVxa07ce/BhZ1XrC+JCypIvroym8vzsxfZmsT4YnVIp8HSGA+KwDV3uG/5MTwzQ/M4lCi+LQ9y4HUGSPNUZVULDaiuf+Nur23HqHseXjRwlMiajOY/VCyDN9aQHXre9E6BTiok+ruY/m3wfLsTpwqzF6KelyK8vFyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421393; c=relaxed/simple;
	bh=gZ3fHfA1zzON52FG6o42/Q8+wMPRGLsUjolNCzwR+Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/GEisOf069gNdNmZpyBCJ2gPu08wPIgr3zU5dLQZRlY+5eWhulKzO9euL/ffsKV2Z7fwgr3KyKsMoWy7uaszZUiYoiFYBvB4F/i+1r/3Xx+TjHi8ORtS36XIE9QF+v7mO4R7Md4UMepIwZabF3RrAJWBuw7HwVSBS0bZNdpzXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpaeX3OB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpaeX3OB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8556E1F00893;
	Tue,  2 Jun 2026 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421391;
	bh=2uG3FKb0s6ezwWXghk4oUFjVKybtZr6VwEdUksNei7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NpaeX3OBiBpevZy95MpCsIoa9izT9afvvRJ9Zf2xuPXqA+eNdnusRHqUKdV3G1ME8
	 U6v6IVABI97/1to9yiK6RZ1gXEUfS77+UKXIj8DRENDWz55LXpViksfdJozhmbWE19
	 f7QGZFb53+PMCymR1Y+C0Pf2EsASRi1U7vBNMYhIhnHplsjYcIzB8FdLoO0xfFdlj6
	 OZQICJ/hnZWueVyY6e4NlcHMcEN+H2ktYJ3KGVzvfc1XdUNk+89PcLEmYfUMvTx0VM
	 HlXTJ5UG9bM6tqr23NcHM0q1ZfNscNvujE42B5kL/qEpPX6seOBaMqkV7i0aoaihON
	 niewvoaqU2AEQ==
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
Subject: [PATCH 02/18] rust: kbuild: show the right `quiet_cmd_rustc_procmacrolibrary`
Date: Tue,  2 Jun 2026 19:29:03 +0200
Message-ID: <20260602172920.30342-3-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Clippy is skipped, `RUSTC` should be shown in `quiet` instead of
`CLIPPY` to be accurate and to avoid confusion.

Thus do so, matching what we do in `quiet_cmd_rustc_library`.

Fixes: 7dbe46c0b11d ("rust: kbuild: add proc macro library support")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index b9e9f512cec3..bec9726f256c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -517,7 +517,7 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.o FORCE
 $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 	$(call if_changed,exports)
 
-quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
+quiet_cmd_rustc_procmacrolibrary = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) PL $@
       cmd_rustc_procmacrolibrary = \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
-- 
2.54.0

