Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416090;
	b=i3GbfjBSyGX94thkyAjpDulmtIlgEHOASDeKz2Bv2yNscBPwKapV9jxnnvzSYvSKgqbR
	 zSq5Sfie7E8ALW7cjAc5cMS0aQsx5ydGiYL5lYCpMGAR/Fj0FkphAvXfo839c/5xAqyl3
	 RGIMUuj/4FcMh/lhK7MNcgeRxi476g1IdDwRUTxZFij8QKLI8cEAIZJjWFFPAYt3T9qxG
	 frAHMRHIHongovrgTT+SXXp+O18kDoJ7oiNd/EtzVyMNDIxiPKt442kih3yg9dXlLo+A0
	 pmHYdkdiF/cizi3IL+2nRd9VUN//6zQfEg+9tDWCdFUrzSgZTW0KxhcTcK3gdvaOJpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
	b=0L4QMRd7oQU1tFrfOkjayP+/e0TpRc57xQXfDoaARWHS5i5OGWhu2wWsIO3OcT6lRg4r
	 zDLbbeciawBktERzIZlQ2KbUuAEy8PzzD9eUGzpX2PvSXZlxuy+8HVSkTOLtEPkjOHjXq
	 eColbAiCjQIOC9tNx0Q3m+l+RqpOSUbTo5qiti4FQdIdYPliMxCnnLDirxbj9V/cTon3H
	 rUz9LXJuC5N/1bedvlwPoNOvXVjzC/svegxmSuWGtp6j01jDZIq4dn7QqRKueUylq62Oj
	 wiH7/F2lDBWQRY41wI+zqd8weEaDoxdf4Bm4yEL71tGG1ygdwlzlMx5FZCB0UoXKK9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PR1nKxpi;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10199606A31E
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 03:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10199606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PR1nKxpi
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so960057b3a.0
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793416089; x=1794020889; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
        b=PR1nKxpik6V79K8q/LNhpRQ378eU2tznOaZY+s3r8sZKIvt8BulNk73ToJPdUdYGXl
         dOk8JZKtI2RgGYfrMH0NE1UstYE+cb8Dp1hlUxXV4rM+NofrDb1Cmnh2W+p6ckEM4Nps
         iXPB29uWC+QqEwQvEYj0C50SdGFtMW2Kerfdu9l9kpYRKiBK6AQNMzGt4n01Op6smPla
         dk/x40lhcjPC6/XjCBqyN6DaDkwbZLJjiZ7Zd5pCFUAMmHBngOzO0NaBvxvRW31zPoIo
         IaQ9Z5wHilqcYGEVS3tUZYYtUpy3wrMEiZ8IVR+FQzDwDqYjTZ9IUaVhEOFOniruPdJP
         yE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416089; x=1794020889;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
        b=b20U6MbyAPAEwABpEnuvKB5RhUgaKqndC6li3+Q9646hoN4jMhCKqr6jTO5susWVus
         ovWeqElJMwH2+Qyy+ew2t7wfctR7HXho7kDWj5tUaUGZ5CzGBIY4BQhw7PX3i+qoDyX8
         6BFY0jijN7oowmcNRQ+5Ly+zY0BB5XvWZ1TuTWa4exNBD2ArcDwZpg+D0eej14zyPQhP
         VYLygr7/mSbEfk5SsXkCT0ilX8esMndjh/eslGZfD02WmGPdtANaEJWROibBcRuVV+yW
         dT3yBby3R8UrWmmK8cFSFYgA2udvFC6B8VL2cusahk42d57dkhdCXUIxDdBXGvAsGHlF
         NqwA==
X-Forwarded-Encrypted: i=1; AKwUvByFqowGQZU1Kd7cHv53idWbPYfYlRu7gLY0Grs1Bpnb+Lc5SEhJ4brCZ+lP1J5uPDwpxQGYAh7RbKpabpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbFpxfbZ5/BP7heaImx0+r2OrEVLdm4awSl+6c4h0ntQSBwgxI
	QTksSs8DDBQf//FRvZ5caFM/WLb4CxkzP5JAelhrLwyDE4A6uk3ZtTxyHCh2N3E6PEp7VUppz6c
	frsBquEghPOLgc3vs0WU5VQ==
X-Received: from pfbft2.prod.google.com ([2002:a05:6a00:81c2:b0:8a2:dc6e:fcd0])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c9:b0:878:34d7:699e with SMTP id d2e1a72fcca58-8a9bfa0326bmr3697231b3a.46.1793416089082;
 Fri, 30 Oct 2026 20:08:09 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:08:07 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031030807.4101384-1-jenhaochen@google.com>
Subject: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
From: Jenhao Chen <jenhaochen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, Rong Xu <xur@google.com>, 
	Han Shen <shenhan@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

When CONFIG_RUST_INLINE_HELPERS=y, cmd_rustc_o_rs and cmd_rustc_library
compile Rust sources to LLVM bitcode (.bc), link rust/helpers/helpers.bc
via llvm-link, and then invoke $(CC) to compile the combined bitcode
into the final ELF object (.o).

When commit a960c2cdb19e ("kbuild: rust: add AutoFDO support") was
tested with CONFIG_RUST_INLINE_HELPERS=y and CONFIG_LTO_CLANG_THIN=y,
cmd_rustc_o_rs skipped the post-llvm-link $(CC) step under
CONFIG_LTO_CLANG and handed the linked bitcode directly to ld.lld, where
the ThinLTO backend applied --lto-sample-profile,
-plugin-opt=-split-machine-functions, and LLD's default function
sections. Non-LTO builds (!CONFIG_LTO_CLANG), however, ran the
post-llvm-link $(CC) step without $(CFLAGS_AUTOFDO_CLANG) ever since
commit 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

Subsequently, commit 5febf432df1c ("kbuild: rust: keep Rust objects out
of Clang LTO with inline helpers") updated cmd_rustc_o_rs and
rust/Makefile to always invoke $(CC) on the linked bitcode even when
CONFIG_LTO_CLANG=y. Because that $(CC) invocation only passes
$(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) and does not include
$(CFLAGS_AUTOFDO_CLANG) (which is normally appended to _c_flags in
scripts/Makefile.lib), the final code generation step for Rust objects
is compiled without -ffunction-sections, -fsplit-machine-functions,
-fprofile-sample-use, or flow-sensitive discriminator flags whenever
CONFIG_RUST_INLINE_HELPERS=y.

As a result, Rust crates built with both CONFIG_RUST_INLINE_HELPERS=y
and CONFIG_AUTOFDO_CLANG=y emit all functions into a single monolithic
.text section (0 .text.<func> sections instead of 417 in
rust_binder_main.o and 424 in rust/kernel.o on arm64 with
CLANG_AUTOFDO_PROFILE set), preventing the linker from performing
AutoFDO hot/cold function clustering and discarding SamplePGO weights on
the inlined C helpers during final code generation.

Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
post-llvm-link $(CC) invocation in scripts/Makefile.build and
rust/Makefile.

Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
Fixes: 5febf432df1c ("kbuild: rust: keep Rust objects out of Clang LTO with inline helpers")
Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
 rust/Makefile          | 2 +-
 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..f2d9b4411720 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -658,7 +658,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(obj)/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
-		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
+		$(_autofdo_c_flags) $(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
 	$(cmd_objtool)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..bd7bd05e9fe9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -369,7 +369,7 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(objtree)/rust/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
-		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
+		$(_autofdo_c_flags) $(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(cmd_objtool)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122..e72efa5c6c05 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -120,9 +120,10 @@ endif
 # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE).
 #
 ifeq ($(CONFIG_AUTOFDO_CLANG),y)
-_c_flags += $(if $(patsubst n%,, \
+_autofdo_c_flags = $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(CFLAGS_AUTOFDO_CLANG))
+_c_flags += $(_autofdo_c_flags)
 _rust_flags += $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(RUSTFLAGS_AUTOFDO_CLANG))
-- 
2.56.0.317.g454f8302e1-goog

