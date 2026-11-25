Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602732;
	b=BVvAIqCTvTVUYF+wEQvRflWFJWONzWDS/NE0/4cK8iibl8b+S8ndNHbAg7Hx10csdNgN
	 QhdAABbyBMqSyOMS+RksIBdYDoZ1H3vYFZaAvEXJcTIaGCSqxwmBFZFzfNTXVZ8zHXjNl
	 3uD3GAiWnpHKCn38XRMA6WY4auHp55+cUEBfXCtwcQHFbePE5m9TN5/Xpid7755dn9VDy
	 OjT5JsdXWCpasESmlQnXKI83c2HSpPM6dePNzngb6hZ1renDTA1aQXTsaVMBkz3NGbHww
	 r7l9EhZy5KH3JnL8rcf8dFK6ZZhAxC7qK32RvVyW3qcxpq1qVtz/NOVnP1cAWfSXxVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602732;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=25CjG1kgSLZtFjDXa9X/ClPqsTh1zui3GyTeKcR1+GM=;
	b=pzIhOmt6VsNEJPvTLMmJG/GacWF6qOWQ8rEKNhtbwB7ERhT5mbU0B6KaQ48Jg1iMuKxL
	 xxskK1pwUqz2p8RuFwGSPy/DOZva61tXVgYcHiGpdOaxG41X3KxHoLS6Ox/hyHV47b7cR
	 HsvwvZyIS8FeaaTpBF9rQBhWDf2lhsCXtZqF16Lnki+WLnK4Io5GakCGkxx9HlcmEDvWc
	 mQvhajRqSPrxo1ivEmdOqY27mH0PsXAqa/0k/QeT3n0IFQekszWfp8y+D+4URddl5MjyG
	 bU7kbXRvItGTuKXckUi2KVXKmr096GH0utPMQfRV1Olg2RdaEemjVBA4DD7g8NckGHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MD8oec3H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5213C606A327;
	Wed, 25 Nov 2026 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MD8oec3H
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602732;
	b=WSkOGV8rwV/w3eKF1PozOoQXRjPQ23OT1bWlDRKaftFLEdy7a/E212Q04BNpQkdg0uv8
	 wR/5BSInTnCA18yVCbr2HM/ScctDiXCerm66/oj1Q4w1opucmITuTEr6VC5qdTy7uQzUF
	 kXbK2C+WFBb6ZG0bm36kqUYin5bLKqL2YgJ/8bZngDBHHnkqIXd/m7my0rSyB7VZCUsNp
	 tvKofsM5H3F4H2XegAReL5OxMSzLp9E1UWb8WK4W2NLO4l9XQ2dGd2DkfsmniAiNwBGIh
	 +ckLP0pIgVj7Y4jGuVFpkF8mDVha4oEHklvAVHkNy8uBv5JlYBlpOdFiTNo5qjfafxw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602732;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=25CjG1kgSLZtFjDXa9X/ClPqsTh1zui3GyTeKcR1+GM=;
	b=IAJSfJ9qkQMqfrbMgEIDUX2YDLrLJRzkp8x7qOHDUHoTkL6+TG6TPU/9vnOk/vEKqiJK
	 5ngKELTkbqENU+3wHg7yIY+NQGG52mYBQrfqev1lxNX2Atvn/WXgnAlaT4Rj+u3aWOjFs
	 UBwKUZr2PKjAb2722W0deU0LsaqUDGX3ps79i7k0ePWttzrK6vhEIgP6OnFo0PBSBLwZ3
	 nBA5ee1l2cR+FVSUVK7kLRJ2XeFHZfteX/I4OF4wQDNjXo2TUB3AOZPYkzeQ9w/9Rs8fm
	 E2pw5vX04cQ8L9MkpuBXeiuP9ov4gY3eZbrtov+t8gAV+SAwtfRUVm5ZinTf/zF/Vnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45BEF1F000C4;
	Wed, 25 Nov 2026 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602732;
	bh=25CjG1kgSLZtFjDXa9X/ClPqsTh1zui3GyTeKcR1+GM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=MD8oec3HrXR4kpGJPoQSA1lcPdoDu1c99uLECRRxrDkSo2QHZrM3TkHl729wXbZrs
	 CT7UKFwOykAs4xmCLO7KhCAIB8rDBhK07TooLoz1Zzv7ChAPG/VvCnQx32f63myG79
	 uJmGPBN7S0olL8hp0ZdBwIofGLQG3fOwxsHzeKPDof8S7NqOb6BdDjfBRbZuNLi2lQ
	 2w1vT8kesVPusv1vH0ZoZAFEgw1Y4zw38aKGoAXP405xngTFC6ZAoJx9GkDbH4SGlb
	 8Gi3qIUIGQOyC7rieIz60iRvEipV7q2bJUEtRMz4mI+JfwpYW6Yi2yQ1k0O63RjqK6
	 BhBkCRoUqXtgA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C74A44CE3B;
	Wed, 25 Nov 2026 10:32:06 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 11:32:02 +0100
Subject: [PATCH] kbuild: rust: drop the obsolete libclang stack-init probe
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-perf-rust-bindgen-drop-legacy-clang-v1-1-dafbf8d4d3df@gmail.com>
X-B4-Tracking: v=1; b=H4sIACG5BmsC/1WNQQ6CMBBFr0Jm7URKRINXMSzaYYAaUpppMRjC3
 W3Fjcs3mf/eBoHFcoB7sYHwywY7uwTqVACN2g2MtksMVVldlapq9Cw9yhIiGuu6gR12MnuceND
 0RprSBtWl0WVNdFO6gWTywr1dv5VHe3BYzJMpZnX+MDowGtGOxnzKeP6L/PxeZsNH3vEaYd8/s
 C3uwMIAAAA=
X-Change-ID: 20261125-perf-rust-bindgen-drop-legacy-clang-149a05cc71a9
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602725; l=2276;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=4ZJGRNrE7feOv/GCMj7ydDys1bv5wRP0IitEqJ8w6Fk=;
 b=1fizUnF/HOhdMP16188n+b1IbPvGMzuRgl4VjsgdEjCnNLU3DSwpJZ1ZiwljBjFWbqoZ+Kloo
 Z2BN0qrh7NrBFAjysQZwbT0SKkU3ZCvvEN6Ynf3xD9b5+tfJwU+4f4s
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

For Rust-enabled GCC builds with CONFIG_INIT_STACK_ALL_ZERO, the Rust
Makefile runs bindgen to check whether libclang needs the old enabler
for -ftrivial-auto-var-init=zero. LLVM 16 made the flag usable on its own,
and the Rust toolchain check already requires libclang 17.0.1 or newer
(18.0.0 on LoongArch).

Drop the obsolete enabler and the bindgen invocation that selects it.
On this rust-next base, median warm make prepare time fell from 0.72 s
to 0.49 s over ten runs per version on x86-64 with GCC 16.2.1, libclang
23.1.5 and bindgen 0.73.2. For both GCC and Clang, the generated kernel,
helper and UAPI bindings matched byte for byte before and after the
change.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
OpenAI Codex assisted with coding and testing.
---
 rust/Makefile | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 6dceabbf02c87..66b06ad6f11df 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -483,20 +483,6 @@ BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 # some configurations, with new GCC versions, etc.
 bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
 
-# Auto variable zero-initialization requires an additional special option with
-# clang that is going to be removed sometime in the future (likely in
-# clang-18), so make sure to pass this option only if clang supports it
-# (libclang major version < 16).
-#
-# https://github.com/llvm/llvm-project/issues/44842
-# https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0-rc2/clang/docs/ReleaseNotes.rst#deprecated-compiler-flags
-ifdef CONFIG_INIT_STACK_ALL_ZERO
-libclang_maj_ver=$(shell $(BINDGEN) $(srctree)/scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -ne 's/.*clang version \([0-9]*\).*/\1/p')
-ifeq ($(shell expr $(libclang_maj_ver) \< 16), 1)
-bindgen_extra_c_flags += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
-endif
-endif
-
 bindgen_c_flags = $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
 	$(bindgen_extra_c_flags)
 endif

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261125-perf-rust-bindgen-drop-legacy-clang-149a05cc71a9

Best regards,
--  
Peder Bergan <peder.bergan@gmail.com>


