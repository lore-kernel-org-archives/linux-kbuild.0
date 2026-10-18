Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526DD3168EE
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346223; cv=pass; b=cuZK6r4hQI56/Uw9ECopzvLVDpormVD9aYRVkwk4Z+R0RZnEdf3AHeT0M3ZBEKa4lUq/XbBw3WLPR1FHJ7DI8ic/ehaCu4aU8SxP7HCAN/iEB4guombPtJKtpWnk0AX6mx4jEXb+sYojI8reuvTm4yE2cyO1TnomiIK1Cmkt4os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346223; c=relaxed/simple;
	bh=ein2Kxm/7ddUQW+oHSZ4NEDEcr868l3pq4onBaj8gos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOzkEZw673R4nYBHXkS1DsKy8n7kt57NWAn9EqW94/uGtS4V8hkdCAXWQ4HyXwCnOSAk0Jgx6Kzh70GQ0gC8psZeeQCfPuzENOIoVDWbL3Vt0G9+IJoKGJu+livPeOb2luXBTcvnWwLkgqcTiZSxMvmRWKIrLe2wvWHdRugIyao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuKSafKM; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuKSafKM"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33e623bd651so111951eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 10:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792346221; cv=none;
        d=google.com; s=arc-20260327;
        b=Ls3PYI30hpyxSvVL2gfWGbaKdp+pVMWwnhcsFJoOQ4oNnbRzMKVFnkfYDmozwpbx9f
         DXIRgSJAsTk3xu2AO/OTCecotdGGri5uhV6ExPzNEHUW+z4K4qkMdxTFHNsGKakxJsSn
         t2ji0ff9z1OH8QRIah0lcUdAtdU7nzHCci4EadnMxG51qA/wFKywPGOhAyKt7L3Wdvmq
         6PIsWIMqul9Cs3/aWiakamgRDnljnkf2IhBlXg0K9/1EA0F00EQC9roDVXr/yp6lT262
         qwvQkEuO5JTgxU1jtpBdhihmIjAiycxXhB9rWAd3pNc4Jqtc8XxzncED60K9kDfIwEtS
         58Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        fh=JO7cJZhpuBbHqJyUDuRuYVQx9BIwwh6FcDsXQTRfLAE=;
        b=EU0EifnFOThJkRn3oKE7J3G82Vm0d3+i+SPumvgMBKzjLRoiVc4ugm6kr4NUr6oNvM
         Ucfm/qQ/upT6/m0PPnCfethobE7X507fn4Owi5UHxkmz+glxtqrHt0Vsm3YiXRCgUNeD
         gGJbqhMgKDt5LSEJKTIeXeSLG0FGHeLftJQQn4EPSa7bvqugYqZED5AZD/nnHqsW1yZY
         0DTIiqRxTtR0jyE3nJhH6ZN3LOU1AnZ8q47RVjKrFw5PWoNQ9t0GKpr4sKGmb2nMcilc
         cHurFrj2XduGS94Pj5U1WcSe2AQL2Ts8z9EC/78C2+Ha3yOkwlYVH/9ur5bn3CxOCc8r
         9jgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792346221; x=1792951021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        b=VuKSafKMez6dANuC4OAkzaUUQ0QhKEUmnTCCRXY4qkh4XjBrgEaJSjU/L2iDnU4m5y
         DMldodLQGCaWyFU5wwiBqhm/xz04Q33b9tQQdfJ6yaShtJHWsB0wSfRWAe/8JQlxBktl
         9AhfCJAfXgNboCcf1hsPkAX4UKanipQNy+CfyO0V14l+njp3hSgnLAzXFWoFcUO+yFGe
         MVIgDXmRsr4ln7ilDaYNIoaVRZKFV1w5JMyCE4PGi7jUIRkJxqLlOoV5sGiedMZ2+/Hd
         7sOd2ty1ExwXoKZdUSAzWD1TZIIKDxx3jP124qr6ZK2Pw57KWCDBE4G5PbF7q6Gxblcs
         cDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792346221; x=1792951021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        b=xQUbuSLf4gn1LnEhycB7RiI+dUWlaPrrCIozZsGd4KeWuMjoW8QepKpHfhxFcivU1m
         fdFipKMJFDVmGz6ob/Vn3Ug2xYHLemXaOX0dCRdyNZpTcsrnAA55P0UgOjt8gfE9wd9h
         pqqybobvNZ5aT+Wf8EsK+J+Y+4D/BIvqHNkkdzJ1bUCVoTPbA4+IPuq+CcvHJAHru/RB
         o3p3+zksoCQNFg8GIB9b9xYQEicd4Y6MMdZqX5v80G/iNqkCWABBsGZSxgNxj0dOVJ3M
         QhYpXaLyBf3lFlrjbXZbNXHN2ym35iGZEKJjk351lRVkMCx0uyUXzif6YvRM3psC/EbZ
         Ed+A==
X-Forwarded-Encrypted: i=1; AKwUvByeIhzoIC4d2ObXo3RmWSqKVd+gKZ7e4+MmuYxDmlj54nEUp5f2f+cUdNGjoL5ZjFKLCS+HOMZHMw7U8zw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6R4y/7ckcxQEclxDjMFc3s651g6GNUVbuWOKK07+FQqUkAHFY
	oUT6nACvCbI+OBB76TpxhimyV8+hCLvCUyYmRxzdprSiJTL12+U4DvGMqZ3sMOUls68e6Dg7XyE
	43WNwCKCHLDKrgKEoULBaW+lxWoLNGrA=
X-Gm-Gg: AYBFou3aFl1SL1+m/+WYKUT4S2UrvEPG1hvoPoEQ9HnCQleUcTBDHafc68Zl4G+LA3h
	iGcQ3wlGDKoFFb0v3AeNdi0f4OjKmNwm0CO8ws1+/E83tI1M44MnbfvrvvFwQRFsqG9T+o+GYns
	J3p85KrzxT1nmGcYwBm2Lu/zLTeIYR67NHcxekTDBm5WcTmhGBhA+iabXxn0CZ0C/syAzuxnh20
	ZZW7uoo7XylCRPMxRZEOcLKn3tRsJQPluf5P/3xbLSOc7Gqxcbj7TuwQGoqQ0NccdQ5B6WPN8xb
	gevSVQ3F4S0MU3DJFs1cN5qtmDv1O+CTPwTyGSFVfmpCK2JnvB4DC+L3coA071pC2JfvyBD92g6
	nRUFTSPcMuc1uF80eneR8c3HyLhIM2rq/P1YJjTQWZ9Cj7RIKcJ1MdnZrIxdKKT4VTcmqlhjXjW
	gj7CANxlFSr3UOsaWvk1FHME3lR22pzIpysBD5G0woQet0uKaNHdzeaHOgpbPrKw==
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr13057373eec.0.1792346221395; Sun, 18 Oct 2026
 10:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Oct 2026 19:56:48 +0200
X-Gm-Features: AclHuK_3ymV6Lp1a_ivM4oJdQMCp7Ooe_ysoxuTMLzooZXb3XPtxZZvpcBg_tIc
Message-ID: <CANiq72=zv6uDRu+x=BpSLWsZnB2XCnPduQ1PXPPQNzxDgtm54w@mail.gmail.com>
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

Not sure if `Fixes:` tags may be wanted here, since this was simply a
matter of not having added the support after we got it into the
upstream compiler, but two candidates are:

  Fixes: 97e59672a9d2 ("x86/ibt: Add paranoid FineIBT mode")
  Fixes: 4a1e02b15ac1 ("x86,retpoline: Optimize patch_retpoline()")

I hope this helps.

Cheers,
Miguel
