Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749AB43F089
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 19:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363882; cv=pass; b=k9HoOwJ5ek3QjAiJobdZmbEODIrMUD8aoJGQIF3D3dFBitUDInSC+8TjaXhHC5TSCSum1s2fV76VNgB+WDD0grm4l15sOcOwXqmw44Dn6qzmCnAvihJKLGCEOyTv48GMoklQkeg9K18V9SEpsYjjodpuKej/SsIFbbED6K++mhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363882; c=relaxed/simple;
	bh=0YXk1p2g+BspsukgpRLeUnT1mCwteMBiEo6KobR3WE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/cfttH3B5Dh5WplVkp80t3puESv+Cf7FDIFrCwLFxHfwYaIMSAzqC4K84SrpP0aYn7w9I+u+/0MQt1iGIPD7XsCk03RTLeczX2yZhCCEgoR7SeFdsvhBZWchvoyI0lmztE6NnHWghMLMDiOERjhkUXo1yzdIFMRgG8Aij2UAOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N4+TN+qe; arc=pass smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N4+TN+qe"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso851257241.3
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 12:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790363878; cv=none;
        d=google.com; s=arc-20260327;
        b=aH8hNL3hVORlPNuxjZFptmWk6RitZQWg3KMC7doss8zY/sjrIsRO9pGDxCqm/dsSrq
         kX3fXc1MdHYEvFKhEnZ8smqdM6qWbbOD9888cG2sPS//7kGr+Y7X8aBg5ti/9MBswTpf
         yLpS2OaLGzBraUMD482/v/UWfk47846oUDhFU/sFiX/5ORKfMXGH4ubbLbGXKO9kOLSU
         XX8JRLmebULShP14exeZ49pEjANTe1BB4rWcZagNFarhDsTNuaKAiBrofBJWYFkKCqWZ
         XVQ7/bR/k5vXvVawobsrxzEuc4De9w7hku6JAEmTuzSGbECiEGkAq9JpJomo3eGYNhso
         TBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=68/mkRd1a6DliLdoLvTqX92EpyDhdssnV15ZSAj23lc=;
        fh=+SLZFY1RavGi6st+CDpwUtIMqsMuJvG1kbQXHwrFaWE=;
        b=XZ+yVUgjFU98x0CFyhvPXX6mgH24ePfgokCrPIYrVvk6u3nJtTYfQb9QMT9uzJEawH
         +24gYnYzzkDMTZsFK9aHTY8W5ExW4yYNVlJ8FYOdWvbZV1GiIAYSkpiQI+vl5zt8MT2c
         7ziFpsnbn8GI6FHUS46bGXnIl6z6QJmZTHM1s3DYjaVd+36QVGGATqXI0iQxqr8U4e70
         hFmMbfbxWfYXC7zTA9MBGUlwSc6xE5AWj8V9H0pBUnQiiaWdUzmMPEMPElLcwrMlYP1d
         OhV1zsY+YHqQkQc0izJAvKLBmX947CczofiB97x/oBtnG9HTRJgWKeNPs74yFD0jSjh6
         9zug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790363878; x=1790968678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=68/mkRd1a6DliLdoLvTqX92EpyDhdssnV15ZSAj23lc=;
        b=N4+TN+qePb/0u5ajv38dlgbED0FFOtVewN/faWBmtfYDhcOb/0hSadfEwGcwTaDjBb
         bII9vSXU7k4YttNcFjPW+Dg9C4YV2S7UibqHmUKdtKLRfzapSmCSVQyXbJYaAqnDTgFY
         H+Zaaq322+v4udwDq1ObyFU8NEPx+CSmQW7+uc0n6yG+Ra7DKQV6ZFKgAJ8PP71GaY7c
         QqsJjY6bedzj7A6qGM+vx8QeYT6/aPRVI3tOsbx/GXFX0yqNcnk2zWA8386ou1gC8C1T
         9WT3GQh4u/+LD2+HLi6iup0oJbzYgTFLTdS0yRoIOkGAWTPpQtWFZLhoD6LpEycz3IkL
         4y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363878; x=1790968678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68/mkRd1a6DliLdoLvTqX92EpyDhdssnV15ZSAj23lc=;
        b=i/7zfcnnizYD4CmVyQ1H+XkNzVBfL2sNVAQOu2hHEbC62T8gLJTQH2l7A1FTw/KzJW
         6fnxR/xbJzVFQe8o/PKY8A5mPpDBrbnfq42qEAoIftu1Zsj42un1z35gz/d2pDvRGMf/
         nsKRHNbTsPpSzj2q1WkvBMi4cdv3o0/VqZPXIUb9xJkQlWDDVU9nkjiRFHYQ3iwz0A5R
         wwo3tdm2Jppr9m1y+4Be34ao1JuczKgXds8LmA3N09yP38kHSXKKUyqx9NsBdMyb+KeO
         6lfXc8BPHik9cYOA5K08YvxDd9Q3uc/VQnh4IuoYMAITEPfhFQTLpeVt5bSc/ygzXxW/
         qwXw==
X-Forwarded-Encrypted: i=1; AKwUvBzT0ftApL9OI9qSrCbfWidniP9/a1LmD6LZgcqZLvijPONFU1OY/4YG1FVMeTDb3aXHhRNoVD4DXHDV/RY=@vger.kernel.org
X-Gm-Message-State: AFuF++lrLO/oEjpEadkjmRWbzdS4eNIhJeMBKMfbGmpJU0fS/yXstqtt
	QZQ80dX/oRQ7+VuaOdvMY8x/luNlKf2HXwqGspz0k1tPrEFIkRxV6eC+rO+R9VEZruMOJYXWJke
	XxgL1iliQgYE+tjefLfmyGz8CqPj6bC7ux0DreXM=
X-Gm-Gg: AYBFou2ELqlghb3+2YnDSaj3ACPWEhIupNeGB8aCAH843xwpQNcLfEg2BxAZKFxAJYT
	axgEDp5aRzDB7zTauTPy4f1VOO7cGLmmxL8U3t8aXbRrO1Pj7kvCcos6qTPsf3FEFCjymlLNeny
	SIDnGZXJgVoLQtWkZpVBkl/VPEKjsOp17ijwYX8H5O3clAzMExK4Mkq1xL2iJvxQpa1d49uorXh
	p3sgCmHkMol5C7vIY2+EgatflSnCvz+5j8q6y6IbSeFU66NfuUcXhEEkvoBjYnmPep0orV8i+C8
	lsn+9Jt+kjem/s9Z+Dczn5D8jbP3UtOqb6jwo0l7xSU51IQbtVLgu5rtMScVj66WH8flRZtSODe
	XTzVYqsUkukyXSXsl3nEC5MANuAm4w7u4GCIR9Kepx4boO+icWrli
X-Received: by 2002:a05:6102:3f06:b0:7a7:3485:33e4 with SMTP id
 ada2fe7eead31-7af1f2fce8cmr3602978137.33.1790363877295; Fri, 25 Sep 2026
 12:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-b4-arm64-callops-kcfi-v2-0-587865b6d991@linux.dev> <20260924-b4-arm64-callops-kcfi-v2-6-587865b6d991@linux.dev>
In-Reply-To: <20260924-b4-arm64-callops-kcfi-v2-6-587865b6d991@linux.dev>
From: Bill Wendling <morbo@google.com>
Date: Fri, 25 Sep 2026 12:17:41 -0700
X-Gm-Features: AclHuK-u3uiT0pgSiQWlUPghLSJFY3GErd8b-v10N2yzXEaY6_RjJUbwQB3czv0
Message-ID: <CAGG=3QVs=e5JtAs-D98vDsj2ax9H0gH-_rPc0oKhx-vNpq_RyQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: cfi: Use CONFIG_ARM64_FUNCTION_PREFIX_NOPS
 for the type hash offset
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:37=E2=80=AFPM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> Make cfi_get_offset(), SYM_TYPED_FUNC_START and the BPF JIT use
> CONFIG_ARM64_FUNCTION_PREFIX_NOPS instead of hardcoding four bytes. kCFI
> kernels with CALL_OPS need three NOPs, or five with ThinLTO and BTI.
>
> CONFIG_ARM64_FUNCTION_PREFIX_NOPS is 0 on every CFI kernel today, so no
> functional change.
>
> Reviewed-by: Ben Cressey <ben@cressey.dev>
> Reviewed-by: Florent Revest (Anthropic) <florent.revest@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
> ---
>  arch/arm64/include/asm/cfi.h     |  8 ++++++++
>  arch/arm64/include/asm/linkage.h | 11 +++++++++++
>  arch/arm64/net/bpf_jit_comp.c    |  8 ++++++--
>  3 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.h
> index ab90f0351b7ae..03f02d4614c23 100644
> --- a/arch/arm64/include/asm/cfi.h
> +++ b/arch/arm64/include/asm/cfi.h
> @@ -4,4 +4,12 @@
>
>  #define __bpfcall
>
> +#ifdef CONFIG_CFI
> +static inline int cfi_get_offset(void)
> +{
> +       return 4 + 4 * CONFIG_ARM64_FUNCTION_PREFIX_NOPS;

*drive by review* Could you explain the two fours in this equation
with a comment? (Feel free to ignore this if it's obvious to
developers.)

-bw

> +}
> +#define cfi_get_offset cfi_get_offset
> +#endif /* CONFIG_CFI */
> +
>  #endif /* _ASM_ARM64_CFI_H */
> diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/li=
nkage.h
> index d1f7a16729d25..14bc3c67c38b3 100644
> --- a/arch/arm64/include/asm/linkage.h
> +++ b/arch/arm64/include/asm/linkage.h
> @@ -39,6 +39,17 @@
>         SYM_START(name, SYM_L_WEAK, SYM_A_NONE)         \
>         bti c ;
>
> +/*
> + * The compiler emits CONFIG_ARM64_FUNCTION_PREFIX_NOPS NOPs between a C
> + * function's kCFI type hash and its entry point. Callers check the hash
> + * at that offset.
> + */
> +#define __CFI_TYPE(name)                               \
> +       .4byte __kcfi_typeid_##name ASM_NL              \
> +       .rept CONFIG_ARM64_FUNCTION_PREFIX_NOPS ASM_NL  \
> +       nop ASM_NL                                      \
> +       .endr
> +
>  #define SYM_TYPED_FUNC_START(name)                             \
>         SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)        \
>         bti c ;
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index c18e005a41dbe..7ad14d9847138 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -185,8 +185,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx=
 *ctx)
>
>  static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
>  {
> -       if (IS_ENABLED(CONFIG_CFI))
> -               emit_u32_data(hash, ctx);
> +       if (!IS_ENABLED(CONFIG_CFI))
> +               return;
> +
> +       emit_u32_data(hash, ctx);
> +       for (int i =3D 0; i < CONFIG_ARM64_FUNCTION_PREFIX_NOPS; i++)
> +               emit(A64_NOP, ctx);
>  }
>
>  /*
>
> --
> 2.52.0
>
