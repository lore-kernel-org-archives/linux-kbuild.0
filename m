Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558521;
	b=b7HNpWa1KYrCyxRwQ6JHNwa9k6TCJYtWKEtSl7Y4dKjjxTKXq/jdzSn8r3hs2B2JC5Jc
	 cfqV0CPY0wQ58ODEVG7vQKFGCSHN0xQnjTwbbLDkROPzFcssFaaOWw0pYiAEbV08CBO8Z
	 sBeDqpl8PSF6v2SNWtoVg44bYpBm+JWkDIMIlJugJ7eBJoKsb/uYl15tliUTfHjwt64Uj
	 v2lzaOzSpQou+tF8ZH2tf2jD704LYTV4Imgo8BMz0Btlf1xt+1onxc1shkIsFVfEPzZ6Y
	 g7rBFCUa0hUcaMxACZfDUTAeRVvTiD4xArUe6Uh7qPBvXyJhp6c2i/hQhx0mRHa6lwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
	b=TYgC5s3WTzC9r6gsuE8CXwD/jHF5wy6HuWCV6VvW+qh0WofYPGI1r5JIWs7gXJ2NRxBt
	 TUo3RYbWAZ5zulxIUrtWyXebzXWkXb3CO7J4JrTX5Lqpn/pJXBjMvmN/yz62G3HtCjDBK
	 e22w43NFbgfKcOGxGyDRe/6WCitigDmzpA6ptGtLWwn7bHWjOYKp1gcPVnT0jpxOe4/tN
	 ihEH17oZxLl3+7QOAKQN0zgJ3H+IKvRegkBAmTjO9v9cGWuklNOb1FO4Z9zDQCUDvAxg3
	 f2uH8lY7A1rwY0BC0L55TVXAPQ5AK2tVU68O93TKKTx3D5rwjKSRNSymuk/UC0WF+Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hOulv2aG;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C4606C997
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 08:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124C4606C997
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hOulv2aG
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0f667a666so999660a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 00:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794558520; x=1795163320; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
        b=hOulv2aGaS9ZeYnKvdMh6U1l4N+M1moW7Kq+ZGF+AV8yNfLpmz1l/YjkfZD+2q1O3W
         vOzcRXS090dMSTIT6ABgDWNRiQNm2rE2Nt15iV1NZr7LyEZ3Si02OiNVzVyNdbANYNWS
         jwweszeCZfe+J6GH7eD/5rQBCOzgueHigErCyhFdE48sdajr2sDn0KhDPYP9ls9Isvk0
         n1lnuFKtsZumrpxUeYPLR/TScqxjbzGJ8oMycyJReOI8ALgf1cGSLMcspEcWGk7i3SRW
         3MvDpqdZwGMumpG0XjIyKcDBS5eIjfL2CLMvQkSay6LsuQcH9Qk/R1HFRs6gf2bBNR0X
         GMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558520; x=1795163320;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
        b=F40ZOrYv2rdQ218ZiiKnD+kBPXq4xHFqKXzmSF31oIrANmAq5jHtqextHNxlf113y8
         MMel7t/jU3e4e67eUkCD+ShvUDhUWz3Jjeje/+BnhBHrh0kgzFg9uj7aeIu9c3dpKkxl
         HevJKVeYC9tTvp+FxRYbPR4YJ+5dXqc7cBuu6SjukUfT0PdT6n++l0lCOkA4Tkw2MZof
         c1OSRUqEiPY1tjw5n/tPCNjOGg6iUKMv/Zncr7qwRMsGZZBdQjHuyWTH+HJWdvv//oTd
         P2jSQDgrGEPYy/sdbUBtBFtI5PjZMIQgbGL78G6ch0wSCHSiN5h+gE1dfVZ7tMBewJ62
         H/vg==
X-Forwarded-Encrypted: i=1; AL+hErGFsEt0rml00gxJe7jvZUxty5Il83df+JTafrD4QaSa+/O3kqb/ZiX1zLO/ufal6olSc4agD2G7rUd2/Zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OXxoCHE/gDq32o4f2DhNz8xO3wwalF7k0yJnQk4TUqI3ucPCJ
	Cm5jwY3WQTCzPlIw10+vTeqiqVSdul9fT4VlHFgnuWjGZ8fcIfEL1GKGiQ+zoRf/F2yrC2f0+1d
	eGNe/udleODL+DOpWm0WEfQ==
X-Received: from pjvd14.prod.google.com ([2002:a17:90a:d98e:b0:3b0:9569:4e9a])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d87:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3b1b0a3a2f9mr1460229a91.42.1794558520120;
 Fri, 13 Nov 2026 00:28:40 -0800 (PST)
Date: Fri, 13 Nov 2026 08:28:37 +0000
In-Reply-To: <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261031030807.4101384-1-jenhaochen@google.com> <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113082837.4011638-1-jenhaochen@google.com>
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
From: Jenhao Chen <jenhaochen@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Rong Xu <xur@google.com>, 
	Han Shen <shenhan@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 7:48 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> This sounds reasonable, but my LLM spotted that Clang will run
> `AddDiscriminatorsPass`  again, i.e. on the optimized bitcode that
> `rustc` produced. So the profile ends up indexed by Clang's renumbered
> discriminators, and then the build that uses the profile will not find
> a match for some code (depending on inlining decisions), i.e. that
> part of the profile is silently dropped.
>
> It proposes `-mllvm -no-discriminators` in
> `CC_FLAGS_RUST_INLINE_HELPERS` so that Clang doesn't add them, i.e.
> using the `rustc` ones.
>
> Rong, Han: is that expected?

Hi Miguel,

Nice catch -- I tested this on drivers/android/binder/rust_binder_main.o
(arm64, Clang 22 + rustc 1.91) and confirmed that the duplicate
AddDiscriminatorsPass run is real and that passing
`-mllvm -no-discriminators` to the post-llvm-link $(CC) step improves
profile matching in both stages:

1. Why the second AddDiscriminatorsPass renumbers discriminators:
   In Stage 1, rustc runs AddDiscriminatorsPass on pre-inlining IR and
   then runs its optimization/inlining pipeline before emitting .bc.
   When post-llvm-link $(CC) runs AddDiscriminatorsPass again on the
   already-inlined .m.bc, llvm/lib/Transforms/Utils/AddDiscriminators.cpp
   keys blocks by (filename, line) without checking inlinedAt and
   overwrites existing base discriminators via
   cloneWithBaseDiscriminator(). On rust_binder_main.o, that second pass
   increases non-zero DWARF .debug_line discriminator rows from 6,245 to
   9,313 (+3,068 rows, +49%).

   In the profile-use build, rustc's SampleProfileLoaderPass runs before
   rustc's inliner (against pre-inlining discriminators), while Stage 3
   sees a different post-inlining CFG once Stage 1 has applied the
   profile.

2. Measured round-trip impact (42 sampled functions in
   rust_binder_main.o):
   - Stage 1 (rustc -Zprofile-sample-use): annotated branch_weights
     increase from 454 to 490 (+7.9%) when the profile is generated and
     used with `-mllvm -no-discriminators` in Stage 3.
   - Stage 3 ($(CC) -fprofile-sample-use): SampleProfileLoader record
     coverage increases from 39.3% (2,832 / 7,205) to 54.0%
     (3,707 / 6,860, +14.7 percentage points), and sample coverage
     increases from 42.9% (757.8K / 1,767.6K) to 56.4%
     (989.6K / 1,753.4K, +13.6 percentage points; 969 -> 1,035
     branch_weights). Against a hardware ETM profile, Stage 3 matched
     function entry counts also increase by +33.9%.

3. Side-effect checks:
   - C helpers: rust/helpers/helpers*.bc is compiled separately via
     cmd_rust_helper (without CC_FLAGS_RUST_INLINE_HELPERS), so C
     helpers still get their pre-inlining base discriminators before
     llvm-link.
   - Flow-sensitive discriminators: MIRAddFSDiscriminators in
     llvm/lib/CodeGen/MIRFSDiscriminator.cpp checks
     EnableFSDiscriminator and shouldEmitDebugInfoForProfiling() rather
     than NoDiscriminators, so post-link FS discriminators remain
     enabled.

Rong, Han, Miguel, Nathan: would you prefer adding
`-mllvm -no-discriminators` directly to `CC_FLAGS_RUST_INLINE_HELPERS`
in the top-level Makefile, or appending it in scripts/Makefile.autofdo
under `ifdef CONFIG_RUST_INLINE_HELPERS`? Happy to send v2 once we align
on the preferred spot.

Thanks,
Jenhao
