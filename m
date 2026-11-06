Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993934;
	b=lZqUYHfH1cZ/kabKw48pqKVeS7xDps2NshpMHtryDRkiRj/p1gxXFpqD81vjN3EmWYrj
	 INRSfMR/z2T+sqPGEJ+7XT9xk6M9iNaPq/kJn7FpjN3Hd9dAshBt1XDIwr+hfdaB9u1Qj
	 Fby55DxeR5ed68KKTn4CdoKT4wopMHridj8dlC6ChsEORCvqzxlN0NYryP8BvTAAVHSj4
	 g5wHqQ6tB0ZITWQKo959AUhlBxuUUrI2jGEGWnZBvAy/d00utgFRgI2U2Bcb9LzfKR4lA
	 6N55RbFWdt6sPdXwqePvedlM6dudg9UOuoBLBbU4TWicRDSbq+2r+WOwaY8spCo+nAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
	b=K7wA4tKcybUpEFRXnsq9d2fL/nZBB0ZoQOPYHeqk79eHqCjpm9j8aXwZBC/spwjVK2OR
	 YSvr9RV4ayS6Lb0do3QvSkxTWkB95dTdzIiudumVUR6nhhx/e9a1tlNvaiglbW4H1rjF5
	 D2b66zvKrNW6BU04jM1vjMq3A0fQV14LYb7JlPCuAEdzRXt8Cw3EWfvTB+mDAGZWFGnHO
	 02TiS2FvhK9kpztTcCRLS1MOJxiGNvoKXpU9lnoTEZbgNIbAOq2o9Lr+taAwSVPbJpATD
	 HlqXw/vFdAPKlI9OB78ZcgLyJQJdFFi7+wdA6nXaP9bGr7lVYvyTaJLBpvBd6qc4d4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kAB6s67+;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B0606A326
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 19:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10B0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kAB6s67+
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso1075370eec.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 11:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793993933; x=1794598733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
        b=kAB6s67+ZWFGloz0/fsmsPCRV4nic5sD+Uf2lhfDSYSNL4SzzLMrHSy6EpEaldojVF
         wIYmFjeJZeVlq/dNwymHGYiQw8MkfGpYYCmnvLIIWBxYCLk5mIoX7g00DDNgOJVmMa3b
         PmhHCiNB1kITt/GvsFzYXKMzWBgLZxuIvWUYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993933; x=1794598733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQl8YGiFsFcU441hb/5cUGvukVssclT4Jhbsc8PIwH8=;
        b=an6r7Mx4bp5haqbLGh11foPsomxx0h2m6RYg+0QebpNQtCS5YDOAAk1cxl3qnU4k6o
         YiBJPC8LZLoCrP1YaOoHzPC5yYBF0O+b8ccEWtokZ3EeQuMsaAeOYRByImLCbljYr8xP
         oysU0fzNcmXcpxcugh0szNI3dJcK3e/r8/GFpiTGxvCAFrfK3i5FK3Z1SEvr5niwPV5G
         MbSzKPgFz5NdXKVt80bU8pkUGBNDP4YaXEEqo63bd2Qi9YhoeRB3m/a2216Z0pTknfGR
         MCLkBdPI5nU2+8OD9jbP55CQC4JzEHPUfI8PNTgngaqXbMBiQGVp0y1KKQZk27ZMc6wT
         6Q9g==
X-Forwarded-Encrypted: i=1; AL+hErEhfn+PeOH0rROq87501cCCBc7w1eM1aCiq25dZlnstGkMKye5Klhl8qF2+6gWaM31AMsNf29sVhF4EExg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wZV+WNHBQLTLaP6kIRgO901phk5vu4DtJ0RjweV88mD+YFRt7
	eXnDiYM23+DIht8iR0Jp+Oj1vhErOMxyHfQn1b5scfFvLRyMFdaPqxG/mV20SDZ5rQ==
X-Gm-Gg: AYBFou2tbb21QAC8G8/Xk0wOt1q9XjLLLw598VyZBSqNMwYdCuNcpRP8f4kdU34OrzP
	X5zagJZf4k91IdCMyD2ZmYmpV9wB0Vz1n6Ki3fhkQyWEsoE/CmLkggomzqEFl2az0m5fK5uLEOX
	A0wOxT4i/ba6NkuH1tr1aWi07hhZhKQYr6nwr+0FytsE3JmzuiuGZMmzcWS+GuBOn/8SJNarmIc
	SYKqMxtfEDn2nu9elshlSHgc+St60CwmqI8iyAmieez98AZTxdFwRP2KjhIVpsMWe0xwNUcm+j5
	VAj2/fIGWBTKZd3Yni2IJlfcxFPXXHecCgcHnpE9VasHEEsFXvThR5JQgwgdwde+fHqe0kdgK6n
	R0eXQP3bamOw7S5csVKXeCBeq3LTMjB+bl9AiWvbMIV0aK07NX16eJevRaOhiq1YVS8p/hTAI1S
	hm++XTGgWuNXuR6eNkazLNY6Lie25npnwVNVnzkUcQ6X+Bnb6I6cdhNeZyRVHQ7Ga8RF8OygP4S
	fv72WwJfw/NoaEdD8F6KbzgLl61Ho3isJu0wubmWoO9p5H7j9L9+7PElNvbhIL8LWHW0nBl1+xD
	5xtaX2Lrh1zbcw+IeX7L7IOwVh6IJo8iNyxrSG1mcvsb0zJQuXWGlCLUiYZYBHoKggi4Ch7ZVJ8
	hcFtlDZqZhxFnqw==
X-Received: by 2002:a05:7301:fc83:b0:36c:b1a9:542 with SMTP id 5a478bee46e88-36f75d21bd8mr4376444eec.29.1793993933018;
        Fri, 06 Nov 2026 11:38:53 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:57b2:a393:143e:afa7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651c57asm9045755eec.2.2026.11.06.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:38:52 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Yabin Cui <yabinc@google.com>,
	Han Wang <nesthanwang@google.com>,
	Nilanjana Basu <nilanjana.basu87@gmail.com>,
	Snehasish Kumar <snehasishk@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
Date: Fri,  6 Nov 2026 11:38:01 -0800
Message-ID: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
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

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
FS-AFDO that degrade runtime performance compared to LLVM's original
profile propagation algorithm. In addition, Profi's min-cost max-flow
solver (applyFlowInference) can hit pathological compile times (30+
minutes or hangs) on certain kernel control-flow graphs when profiles
drift slightly or when combined with GCOV [3].

Pass -fno-sample-profile-use-profi to disable Profi and restore the
original profile propagation behavior that kernel AutoFDO was tested
with. Guard the flag with clang-min-version 210000 since it was
introduced in Clang 21 alongside the default change, whereas
CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
used to probe for the flag because cc-option invokes Clang with -Werror
but without -fprofile-sample-use, causing Clang to fail the probe with
-Werror,-Wunused-command-line-argument.

Although SampleProfileUseProfi currently defaults to false in the LLVM
backend and is only enabled by the Clang driver, explicitly pass
-Cllvm-args=-sample-profile-use-profi=false in RUSTFLAGS_AUTOFDO_CLANG
and --mllvm=-sample-profile-use-profi=false in KBUILD_LDFLAGS as well so
that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
defaults change in the future. Unlike the Clang driver flag
-fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
-sample-profile-use-profi option was introduced in LLVM 14, which
predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no version
checks are needed for the Rust or linker flags.

Cc: stable@vger.kernel.org
Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
Suggested-by: Rong Xu <xur@google.com>
Reviewed-by: Rong Xu <xur@google.com>
Reviewed-by: Snehasish Kumar <snehasishk@google.com>
Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25522aa17c2a71003 [1]
Link: https://lore.kernel.org/r/CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com [2]
Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid

Changes in v2:
- Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS
  as well (Rong Xu, Nick Desaulniers)

 scripts/Makefile.autofdo | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..55fda66ad960 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,13 +13,16 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += $(if $(call clang-min-version,210000),-fno-sample-profile-use-profi)
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
+  RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-sample-profile-use-profi=false
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_AUTOFDO_PROFILE
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
+    KBUILD_LDFLAGS += --mllvm=-sample-profile-use-profi=false
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
   KBUILD_LDFLAGS += $(call ld-option,-plugin-opt=-function-splitting=all,-plugin-opt=-split-machine-functions)
-- 
2.56.0.455.g6c5a503b38-goog

