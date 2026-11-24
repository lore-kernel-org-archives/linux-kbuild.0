Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506111;
	b=sB6RvarpTdvyDKwN/CiVFNDjcYG3vJOT45C0g3OEcGbLYfCYw8UrITRTJ/TVTk9rkm+k
	 lbQ7psp8VAOCK/xGRwtGIotsUzAFQcx19k5XFJnrAdjCxjrJPPuH6nHw0acPfRQUgjgfp
	 QoReQHnqCkXxCkmPuSyivA2tlm3pqDXDovSTaYFq168/Do26DWcVIBYcPLczcowg+fxID
	 LIBttnzjpBCbiNUcjLa0sKzU8HPgH1eK6ztrA4WYygIxBt43EBgAWnhpwAQZfv1h0x/aV
	 N1C+icir7VfK74RVbO29cLFyFSa4o8x39Ym5VwY8kzqYrrOwwv50dQ1TYeZwK6bEQFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Developer-Key:
	 X-Developer-Signature:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ynYM9+Qap+tlYRlfmOG6w4Tj1+4gfNqhSqD8Yw1/wNg=;
	b=NuDWfioSRyYU2CTocdAUtpabNPrrZHeAk4jcbOzUKdCQRPA3DfJhkAkYuPIAxLIA/APm
	 vNZ1dzxmAfuIKf7O+kosEwSzQyvpGpGqTOv18vKp1p1JfKNwJpaT5hlPd8u8QF5oUkHAA
	 YjdrZL7I/jyygYCVUxEaUGqABki6a7CL2Ixlnr/keBGhbzoqLQUXBzTNNmNgN1hY3Ex1s
	 LOPX+gUYo28v37timJjRURpVA+1jrSUEbLMfw4gvYroX20+HZZsIfzh9e89H0iDXBDO4D
	 +TknRZkRm/5mujbnyhcFUuLQ6ejAfcSbGuDpfLXmLZrCJHGM2tjXfbBjuHK7WIlSD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Okr2dcTu;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008E606A321
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2026 07:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6008E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Okr2dcTu
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so34578065e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2026 23:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795506109; x=1796110909; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynYM9+Qap+tlYRlfmOG6w4Tj1+4gfNqhSqD8Yw1/wNg=;
        b=Okr2dcTuPTk6IeAbq2zF+KqbXJ/8knWkvc+FPfiEAzuQ+bOxHtdLOYZys0X4TXwDqh
         FiWRX5HZe4OVgPf3BFbmpgKvc6SzWpK4cbI7qCLF3bS3S4CCd40waMs/yd7qPPKWyz6l
         XonBvqwD6TeSxu14Ii93FwHtT8gDe6HNGpa+1W30W2H11GqpzxGc8Pn2IOorGDVFlnou
         WOdEJUPHP1oH9mztmrr3aDrJvnZgL9kTeKyj8pk9AWw7b61xb6nUUlEmxMnGPYHfLogj
         LhUcRyohYwEkALp1q6e6JzImB9hegnoj2CaKeiLRjtN5Lol5krfj2YXzfGkvZmtMekHY
         LimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506109; x=1796110909;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynYM9+Qap+tlYRlfmOG6w4Tj1+4gfNqhSqD8Yw1/wNg=;
        b=JZxbJ2hkZ5NrovfU92j9P1b5IRGQWYpHiRAQKNNkts+0jFBe+eZ3b9FvM0/UUQunQL
         gtDwpfw7fwvRGnhAE/qjc9XFMksNMKZf81X0n357WGdnaqb9DOHUNESG9xJeCe/1Z0sN
         khSu1oMp78fUx+V5WnAkV+XEREVYiAxfz/I2fwXvlKdcIu8C9pkH52zfAaBvkXuKIDOz
         L57YdSTv74tShyR6Iv0Y9gyHUDLJ2caGSPlY/OcLQEGRpuN+HPzwEcAvrg9e+JBymsAh
         kM3vVzO/WRVEjkdj3pNpsMsaTljD517y+Qrbnw8NKoh+XX7UysM0Zb/WlLUxlhKIphQz
         hO1g==
X-Gm-Message-State: APuU4Z8Tw4gL5HcBLDewpJqrxLzWpGGgXwROyi6f8KR1qzr6uqXbQQu+
	xB9d06Gf8vJ4YoIByI0z4NNLldm7D9UdlOmZG9bSXxEr2Nd91uTOew1xDtIwkojiQKeaIIPJPPP
	B+Ogp3UdFsWyh/xWif6ck3OaGQoledKLXAi4RJsVMHC8KUxsH8fzS3+Yo2ZqLGGz2Ky0IWGmFyx
	GDktZnvJj7UEvqVH5CTstdU80JFc0CSPFWlg==
X-Received: from wmmu7.prod.google.com ([2002:a05:600c:c7:b0:4bb:51ec:41e0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e87:b0:4a3:59c9:a758
 with SMTP id 5b1f17b1804b1-4bb88922c81mr282055355e9.32.1795506108368; Mon, 23
 Nov 2026 23:41:48 -0800 (PST)
Date: Tue, 24 Nov 2026 08:41:39 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3281; i=ardb@kernel.org;
 h=from:subject; bh=VKxpYpmeXmmfqFoZsK4/R6FwAHNhn1NqRuPhJkwFzw8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZvVfnNM2U5OwYaCVXtfn7rT8jem4QH7LKW3t1N/MQSb9
 LaI/lzRUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZizcXIMK/Mb5d8QUagYYbN
 EtZw+69VRv9YmKIuua5hstj76MiFH4wMr8oOh2zjiPul0nt6zpTDO1wPcV4LPCuju/XZiqUxTw/ UsQAA
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124074138.450793-2-ardb+git@google.com>
Subject: [PATCH] kbuild: rust: Pass $(modkern_cflags) when compiling
 inline-helper bitcode
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When CONFIG_RUST_INLINE_HELPERS=y, rustc emits LLVM bitcode instead of
an object file, llvm-link merges the C helpers bitcode, and Clang
compiles the combined bitcode into the final object file.

While rustc receives $(modkern_rustflags) via $(rust_flags) and the
helper bitcode files are compiled with $(modkern_cflags) via $(c_flags),
the Clang invocation that performs final code generation in both
cmd_rustc_library and cmd_rustc_o_rs only passes $(KBUILD_CFLAGS) and
omits $(modkern_cflags).

As a result, target-specific built-in and module codegen flags in
KBUILD_CFLAGS_KERNEL / CFLAGS_KERNEL and KBUILD_CFLAGS_MODULE /
CFLAGS_MODULE (such as -ffunction-sections and -fdata-sections under
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION, or architecture-specific code
model and relocation flags that override defaults in KBUILD_CFLAGS) are
lost during final code generation.

Pass $(modkern_cflags) alongside $(KBUILD_CFLAGS) when compiling the
merged bitcode in both cmd_rustc_library and cmd_rustc_o_rs.

Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Cc: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>

 rust/Makefile          | 2 +-
 scripts/Makefile.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..49b139639339 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -657,7 +657,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		-Zunstable-options \
 	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(obj)/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
-		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
+		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS) $(modkern_cflags)) \
 		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..2e03e960387f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -368,7 +368,7 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
       cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_INLINE_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
 	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(objtree)/rust/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
-		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
+		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS) $(modkern_cflags)) \
 		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(cmd_objtool)
-- 
2.56.1.831.g720f3f5937-goog

