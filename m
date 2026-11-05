Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843187;
	b=ck69wz5o8NcYXnUu0AvXBhKEPlzh9xRxJXYBU0tryj4x+diSqYi3SNmS5meLgwcgIkao
	 lWK2Szs00N+pdwHCb/6O52O4cPxDkUJnYv3YciDHxNq5NdepOT9Y6i45AIxjuNTUS8QVj
	 djoC93aPtKj0lDu+L8cmUOaNLirJiLWdunoGwlS9t2tYAPRJq7YQv3UXWJ8BJDvuexYGB
	 Cs/PX8IdX+sBuqWWsTO9vSUno8fiZ305JIUZQL5WXvmJqvDIQmqd6b4TKb0IE4J62vnML
	 gIV5Q3vOfuT7HQQhsz4gPUFsfIbFmW8PBN+CIsMfJKyRlX1lTbdj0bXpb3Z7oTpPGvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
	b=bsGl/6r+5z2bKSqkuKwDlogmHZRoCVmwOmQ+qBTaOT1tshVFsHlWK1+BlLCQ5fsEoG0L
	 u/O1RjzIf0/g4zY5ceaWL7E18nYeTLDWGWBGmzldUgFg7RBI57OHSPZbtSnLjw76FtJXg
	 X4Rp1TlKZHmz8eqNYZXdnRKO470LZ+OGsdZMlfsRQ+vR5a2UnFrAHxRS1c12bMU3u4HV6
	 MfcZ/25XvV2VC/d63a56nQ50B6Hn+RQW/fqK5EUYEPINlCVP+htE11/k3bHhLUZu0Q/h2
	 lQV4ZAG8HqWT7KpM3PrfWIlKowu6IVVDx/zSQgQ9MPO/EjUo1jtugqgEf6zeEBO+ZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bfrd9fgZ;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A233606A329
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 01:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A233606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bfrd9fgZ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2542755eec.1
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 17:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793843186; x=1794447986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
        b=bfrd9fgZy4LBHnQAHVc71JMJV8ryNmcC6xNxLsVu2wHE0ba8GqSQtLm0q54nSOVx3E
         ncXjltEpYpKSRWfzD4dqMhc3ymm3M1xmg4vSJl3JlnCha5HbYwJTZ+c5I2MHvBwHvAiz
         u7HPa3+NeD7ZluSt2XsmJ1VNALNHtZLRE6jGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793843186; x=1794447986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATA0RCqsuqMmSXCAjjT1HB7LWYQ+QvBN0eEjjs3jy80=;
        b=s13RD3+9QBVWqJb9aborZNKshAIWevOOIMnl+/70ObYDVOu0cH0d3nyu0Lvt2d01UK
         Ubeen0DJq3Uy8ArOZpItSklcEoVs0r7N+NNLIh4Si1el6Q5NmcDrBLk4jvWU7L2E7q9N
         k8Xw3zk/e6eMByDTDZ5LGpIC3lr+r9kLeAdLhYUl+0Oo5tHzWieO+N0rg65MCVLEq7zb
         zcGKZSUPEsS8v5xJuvfdV5cFoYOY38Suj4TyN0peO8zuEqbbM2Moo8988S+zXyJztyAo
         aHriiiuN7bxTqYkfAY/oSCqk9YINZmSfW13G59EpqNhHUn/y4W4CCtlgFG+/Iv7kr+V3
         RE5g==
X-Forwarded-Encrypted: i=1; AKwUvBws1+5cNTnr9USBssQ1Bj9DXJ5edIXa9aZ37YL/vArFqtjYTwc+KRlP6/6BX5/D3NK29FW26yIOG1ISSkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/acGaqM5v+h9tWi4cF2NcVZfSMdBnXGgcTq/+5GrV8d+kvtOtq
	c3d4UrSWjohs8hXTVISiobix+fIa3PBo2A0FgBdqy3AI7Eg81GJqb7/pGdwyS4mIrA==
X-Gm-Gg: AYBFou1P4N1NRG8BwTDA6BlMaKF965uM8XycBGaZLq3yDg/I/xcTIMSeICh/VW3KGf9
	JhL9tNL6bstcskpQ7Vknu6OM0IbQomH5LyOpwCt8Z3GP+ziGLZVoYvUttQr9Sugp9fmSTuEPUH8
	FdNgVgyfEp0/Bw21tkZF/stt357nTUm0mgW626msZzMpXjQgYS7a3zVIjwxrLIxSzY+2oWb/EDK
	xIX4xpT4r793y3vw1CrMtXZdnbLW+2kinwfvAJSGjzAgxI7YleI2l/CKCeDJ3MjxTbVFtiMS4nB
	YWLWwxUYDARAgtxm2KzF09nR4aMBkEnhmrzIrzd0UmwbbykFaHj2QDG/623eb4auqm29QuJ9NgF
	lYUS0JGpT6QoIeRRx5sph54aAAGYQR81A/5r0+51UUt+QcK3oKoqjLVtNsx/7RHinHoG32KDdTU
	vIS9N6kiRy8HopcWJc5UYh/OWrsvCJgpInRsw1DOztlgS6VT10/dO3zev7Ra8pMVfYFiArhvi/T
	doZi9CS+ebkybzY+BiDEIZq0HfkNimqIB7/Mz1fpOk+e0AQfJ0qSSQlNwHNtjZBghgZAzKJaKQH
	M5v+0dPCI+3CKxnr32Cd1fC6Lzs5JjAXUSMdel/oa7fwGO8qBFtvxuntwvs0YGjrwfConyJJbPD
	X7gcslHXwjOZqew==
X-Received: by 2002:a05:7300:ae18:b0:369:f035:661 with SMTP id 5a478bee46e88-36a42389027mr22926230eec.15.1793843186083;
        Wed, 04 Nov 2026 17:46:26 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:e268:adf5:686b:4655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm15294011eec.27.2026.11.04.17.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:46:24 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Han Wang <nesthanwang@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Bill Wendling <morbo@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
Date: Wed,  4 Nov 2026 17:45:55 -0800
Message-ID: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Han Wang <nesthanwang@google.com>

AutoFDO profiles are commonly collected on one kernel revision and
reused across subsequent commits or stable merges before a fresh
profile is generated. While AutoFDO uses function-relative line
numbers to tolerate edits above a function, adding or removing lines
inside a function (or an inlined helper) shifts all subsequent
relative line offsets within that function. Without stale profile
salvaging, shifted callsites fail to match their nested inlinee
profiles in SampleProfileLoader (dropping profile-guided inlining for
those callees) and basic block sample counts are misattributed to the
wrong instructions, degrading branch probability estimation and
machine function splitting.

Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
since LLVM 17) for C, Rust, and ThinLTO builds when
CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatcher
to use lexical callsite anchors within functions to fuzzy-match and
remap shifted line offsets when querying the profile.

While -salvage-stale-profile is not enabled by default in LLVM due to
the minor compile-time/memory cost of sequence-matching callsite
anchors (which is unnecessary when profiles are freshly generated on
the exact commit being built) and the heuristic nature of fuzzy
matching on heavily rewritten functions, enabling it makes sense for
the kernel: hardware PMU profiles are rarely regenerated on every
commit, and anchoring on callsite names is strictly more resilient
than blind line-offset lookup when functions are edited.

As a side benefit, remapping shifted line offsets also avoids feeding
mismatched weights from stale profiles into MIRProfileLoader's flow
inference solver (applyFlowInference), working around a compiler bug
[1] where a small intra-function line shift (such as in
__vm_normal_page() in mm/memory.c) can cause applyFlowInference to
spend 30+ minutes compiling unmap_page_range().

Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
Signed-off-by: Han Wang <nesthanwang@google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Much of the commit-message justification here is AI-generated. Sorry!
:( Folks who know better, feel free to call bullshit.

Honestly, this patch came about because of AI analysis compiles taking
30 minutes to run (see the clang bug [1]). It seems to work around the
problem. Obviously, we should fix the compiler. That being said, upon
further analysis it seemed like adding this flag was beneficial
anyway, so I'm posting it upstream. If folks disagree, we can simply
drop this patch.

 scripts/Makefile.autofdo | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..3b1e65a13ffa 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,13 +13,16 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += -mllvm -salvage-stale-profile
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
+  RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-salvage-stale-profile
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_AUTOFDO_PROFILE
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
+    KBUILD_LDFLAGS += --mllvm=-salvage-stale-profile
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
   KBUILD_LDFLAGS += $(call ld-option,-plugin-opt=-function-splitting=all,-plugin-opt=-split-machine-functions)
-- 
2.56.0.455.g6c5a503b38-goog

