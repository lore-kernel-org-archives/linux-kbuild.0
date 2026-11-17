Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897477;
	b=esSoagv8ux7BohNbDi2mzx8vVaKb75l6z0pepSnA/WrXIJE+ryK4OKshnVppAuMqkIL+
	 f679BV1RO/62chQju97OofTdsTO72rwQclzfylMy/q0U8G+frp63ayfkdrI+2fG3gw7kR
	 iZbhuuUc6yI/trZF9o52EwgXEsEvDR7vHVa1XWoBoZUWGj64rwtSiemZbwzXVoiDZJMXP
	 x0hPQ6rHr287pSJI/7QO1QmOLdwOJ18zYXy1OjpVWTIXml7qxDRUWH6a3T7kIv3Xu7HDH
	 7Ilh1EURQ+gJuRMYsS52TyiF4POWzewTue5++7SB5SwQk0HZhhiG+KhcAMTj/HkfAbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
	b=4dP8kf+dJbM4jdtuW9kcvBM4gc7BOeUiHAo+AfExfB0M68CLJ8/veCfLOcNIrbedT9Et
	 GZCXXtbbmVy9yXihZrNOXep8bUcgQX2fFLQblMkmvDmu9Hylr6+koY66ihuV/lhr2Tg1m
	 AOApSAgKfOgvUcsuAWUep8TyUJOaGSt3VB4ynJdTwHRF7TQu1tcLlZfnUYplFJINH+5FT
	 JAXgn63GJegaVSous8T8bPMuVJwmqwoP/xlB319Uq3Jl+GXe5tUI8ACo6fWeh4EqoIRi5
	 zKmNiMTMT997HIJm/b5kf/JWsWyujd6HjpLffoBO6RlK+tDS/cPo13oWV5Qtu2+BkmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZw3HLQ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08F0606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 06:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZw3HLQ0
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4372781fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 22:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897475; cv=none;
        d=google.com; s=arc-20260327;
        b=qhoxZr4lXF5vyM1R87Xipe61HUxq5YkcjqPBTYZQ4mc5ME1VrC/Z+/a9Yy0DEQb35J
         OGaG5h1T1g5pqiVMYldfJl2wOyme4k/mcABeFE5aCPm8e11/UM9Yez1+eg+YNEXH06Ub
         XmQfRPSPQwqfPoxjZSD4zBshqncCuSotoIKdJuTFwaJv8oiNSATVL0zGzxKoWgEAj0sR
         epGlPv9gjHrOtqhQacF0+nW+Iv5Oaef+4j8X/teoe9k8Hq2NqrlMqBA17xE64kSxreXI
         uzFHWVDpzWuYqeZRg0K3HAi8cm1orSUjpt5EXrqB0iq6dsBWaH74n/d/hPlLKcwMNiqg
         sVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        fh=z1yGkr4BXSFlHUOuw2v7w2AoL3cn48oyMJ/s69hI1J0=;
        b=ltNLyvI024AiH7GN6dHW4krerYvt7IvJwGBUtu53wp9y9H9zU/dwf0SPCGmOXMEcLp
         tSA1JgxIX5T9njYNLa/FyJX5eFgeJld/LGEJkSmWGTR+M/wQIIW5aO+2/iGCB6g1Cx/Q
         94wnyNXfeL+hNQJ1TnUX7/dr6wiRDc8GujhNfgFHqYAquIILlSfy7R1uH7AUPYWZ7x7H
         uyed3QMQeK2KMshCqj2YVoN/TTUCJ4B+Y6+agv+iYbkdwJxy3dzEJfheEvWFxXDLPVU0
         vpvA3X7r6Yd1+qD22cy53UH4SM3gvqPXWklsnU7vOgZNaerpV3ohRm9PPaZco5VyLiTY
         sO+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897475; x=1795502275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        b=fZw3HLQ0nzuknu6xZZPoDZvl/L7k7TrZwsx5O6x0BB261gDfe1j2et0Foeg5z5mrdz
         pdov38qEG4e1cj1Xgv+BF7QG8EpS3uTPToJ/cPxM2P3pBo1pKt88mp1j6l8Lr9opRwrT
         UQol3T/ikaaqCg/kx4o+Pd7HKYdjzlhzq7ad2AaU1FYx4ATArJAAzvoJ61gTlvmuHGY0
         O6JvkVZ1OeI8Wuw/z/I9wPty9+oUFsd5ZIVwdZbnK2TVy5pfasGtQ3u+l7nglYvngY15
         oFQLd6ZP6sSDU4BH7A31BLLxMC5vw8UQ7K+BTZZJadCh3+IJ+RKhSEbeZVDIcTdJoU7H
         innQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897475; x=1795502275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        b=tv4fxZx1KwikthecEzD5XYB2ydGtmi4Wi3AprgbVUByDMEN0vfjBcJMoH6vDRN7UZ5
         x1S7J7y81NdJJ5+m2Oe+24I3LSjCfqalt7EYdfnZo6izhxRRGMZEvQluZKxAUJ/V1ntF
         UqJvOFNrjdLip79ZsUOyCJn6j/+MizkNHxTr9UHF6Q2PotCTAA009wYguvjat1fEtey/
         lk7vtWZ0RhRmdETLhoGilBuXlz8Rg2W2GaMMboS3xQx5GdZUQ2QsLiZuEH/8gVBnF0rh
         2FopU2t/zBgcrDnklG8a1aj7AcDmD2C7uLT2FSuG4emlJ7CC0WnkKlyEFluZ7iSx7Dms
         pUVQ==
X-Forwarded-Encrypted: i=1; AL+hErGpJx7vLO4XMsTmQMooqPptTnvo4/9t+JzAmISDArp9g8PWm4Ggfz9jpy+FdbdJ34vsPqqc7VZDRNEGpP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tx0zBBcziIYbcMoudmRJ9KymbmQ2JGipvsQaKmtRuUAvdjDzb
	sc5mRmgpU2hZl9RcG5f9d5X+Twx6dcx2CWhAaA1kuNtZYqY7Cc/E2vg7SAJeovdQIeI5342VUTB
	d7tsd5wA+abF6/ABEPFu7Q9B+xTX5Sx0=
X-Gm-Gg: AYBFou2L1gEvM7Wfks7kQail5wSJBVFYM6/06b83jIwK3zGIJyD+iy3OSQH/Y2D7cxl
	U4/gYyGTnR7k5g+iaHyMdx53A323j9rVkaEqRG6zHU7g89/FjYtFvwRcqI28JCxYlheEw3eK5fy
	oNuRlXf2+0J56anXD1KUV4sVxg+FXyau+IghGu6FdeH+zWa/u+1pnnrSuV34ZdtfmEfaPfnKlJl
	PTwhSbOj/WlTi8z3uU6ZllGabV9DlKaQdFvE5Tz0j224C792wVwziG3wEaSiz3hN+JBKFpXHIUz
	7iovVEv+W1MCZdgHXH91uJzeMzFLWHFs3Gbl6r0a9sgdOW7+EC5o7IbfvRhYnxqWlc7no479VX8
	ymTSUMZkjVNyk2ohA738xFRVNPLV8SXWM4gPfEu8sGRNITy+0lc1+YfZhVtPtVpsa8vgyHm8xuA
	l/HInNXgYqHenQdyBfJbtbsby5CjzRfM6v34DJi49MLHNfBTdTa8obmbff201YUUuTdD4jlnCiD
	KOnUjAmCYNrcolFr6KJ+E9iUT35X6Q3Dq+S/NQVLkizxQKSbtkJikIX0jurw7Ugmazp2/ASBw==
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr5667796e87.0.1794897475024; Mon, 16 Nov 2026
 22:37:55 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Nov 2026 07:37:43 +0100
X-Gm-Features: Aa3M54p7eBlg9yL8nKjCRYF_cKn6fvAcKLXbakSS16n9mf6XS8H5ekFNr6S-Wr4
Message-ID: <CANiq72mrpgxyb4d9C5p1KS0n87GmYTXcyUX+dhZ39T2vRtOQwA@mail.gmail.com>
Subject: Re: [PATCH] x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The C compiler is asked to add a `cs` prefix to the `call` and `jmp`
> instructions that go through the indirect thunks for the `r8`-`r15`
> registers, which makes them 6 bytes long instead of 5. That gives
> `patch_retpoline()` enough room to inline them, e.g. as `lfence; call
> *%r11` for `spectre_v2=3Dretpoline,lfence`.
>
> However, Rust code does not get the prefix, e.g. for a
> `CONFIG_MITIGATION_RETPOLINE=3Dy` build:
>
>     $ objdump -dr rust/kernel.o
>     ...
>       e2b: e8 00 00 00 00        call   e30 <...>
>                 e2c: R_X86_64_PLT32  __x86_indirect_thunk_r11-0x4
>
> Moreover, since commit 4a1e02b15ac1 ("x86,retpoline: Optimize
> patch_retpoline()"), `emit_indirect()` assumes there is enough room
> for the inlined sequence -- e.g. with `spectre_v2=3Dretpoline,lfence`,
> the kernel warns and dies while patching a site inside `core`:
>
>     WARNING: arch/x86/kernel/alternative.c:736 at apply_retpolines+0x2ee/=
0x400, CPU#0: swapper/0/0
>     ...
>     Call Trace:
>      <TASK>
>      ? _RNvMs6_NtNtCshS2CUL9MEDn_4core3fmt8buildersNtB5_9DebugList21finis=
h_non_exhaustive+0x5b/0xd0
>      ...
>      alternative_instructions+0x1d/0x60
>      arch_cpu_finalize_init+0x5a/0xb0
>      start_kernel+0x1f4/0x280
>
> Similarly, paranoid FineIBT rewrites each kCFI call site into a fixed
> 20-byte sequence, i.e. the 14 bytes of the kCFI check plus a 6-byte
> call. For a 5-byte call, that overwrites the first byte of the next
> instruction, corrupting Rust code:
>
>     SMP alternatives: Using paranoid FineIBT CFI
>     ...
>     Oops: double fault: 0000 [#1]
>     ...
>     RIP: 0010:_RNvNtCsdVypMZsLRAh_4core3fmt5write+0x1e9/0x210
>     Code: ... b8 68 81 16 9f 41 3b 43 f5 2e 4d 8d 5b f0 75 fd 41 ff e3 <c=
c> c0 eb 02 b0 01 ...
>     ...
>     Kernel panic - not syncing: Fatal exception in interrupt
>
> Non-paranoid FineIBT is not affected, since it only rewrites the kCFI
> check and leaves the call itself to `apply_retpolines()`.
>
> We added support for `-Zindirect-branch-cs-prefix` [1][2] in Rust 1.91.0
> [3]. Thus pass it for `RETPOLINE` builds when possible, which makes all
> sites indeed get the prefix:
>
>       e3c: 2e e8 00 00 00 00     cs call e42 <...>
>                 e3e: R_X86_64_PLT32  __x86_indirect_thunk_r11-0x4
>
> The kernel above boots fine with `spectre_v2=3Dretpoline,lfence`, inlinin=
g
> the Rust sites as well.
>
> For older Rust compilers, set the LLVM module flag instead, which
> has the same code-generation effect. This means that every Rust version
> that the kernel supports gets the prefix, that the kernel boots fine with
> `spectre_v2=3Dretpoline,lfence`, and that paranoid FineIBT no longer
> corrupts.
>
> In addition, add it to our target modifier workaround for `rustdoc`.
>
> Cc: stable@vger.kernel.org # 6.18.y+
> Link: https://github.com/rust-lang/rust/issues/116852 [1]
> Link: https://github.com/rust-lang/compiler-team/issues/899 [2]
> Link: https://github.com/rust-lang/rust/pull/140740 [3]
> Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
