Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B193733438F
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790631; cv=pass; b=DkVHYs9daBeCWEIM5nQIro7+kAu/Vu9ZSfgUwx+h4cPUae6mqpyOnKQeDka4T40jbIq5rONRO4OOK2ZOVyS7kfulllw9JBFaDOkPebFlFKLmQOTlPOVpuHdnn0hxFnlFAEdsJAmSA0JF1xH7H9EEQM6W9kOEIF1gQtQ4EEczP40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790631; c=relaxed/simple;
	bh=WPvWk5jQOFsRIWCA6Ydfa4nFq0ilXTV7ToIHXjwOqHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9WRw3w5SXF4Pd0D1ybWQC0BD9KlO1u8+gQi1TGrYc4lpFSEQri9Q1LdPjjN08sbRw5ndPktkYGkfl9o+t7sHCmmXmzapMzqZO97ig+89ByChmHBhZjaUatnEuhU+f31+cmDBWMKgZxn5MpCmpvXtWgGfF/s1fMdjqM+/bpzGmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7ytidaj; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7ytidaj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0cb6e96dcso3301081a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2026 13:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785790627; cv=none;
        d=google.com; s=arc-20260327;
        b=gIoc9N2bKtJ40TrC+x6CJN9oYWvLzercyqUAAx0Stq/cIW1fW8AP9uJ5y7e8WNhyYO
         4+k3k1rsyp2NnhcQxtK0VhN+8sc0QK1mIV8eg51d2RQUuRgXqeUFdLcAa6szfu9JtKBv
         BCwIJoLfmQMmEOA6ViktUQDZ/3GyZ3a41lxTmCvQpBnxUOVdQNGplTrP+PTk7RmjamCU
         75cDJ25TR+0beRO9gutKNif4KfWGkgVRJa5WIj9XMBPwMU3Ftu56XEJnu6qXnykWgrRo
         FJd0Gp1hGTWBlL0IBkcFGM/50q/6UiCqFd5+T5FWFE4pYSbIpkCyFtFbewYPpCw7Z9p3
         iyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        fh=NhdasHxjgLmrM89Xdio/G+H1xMevXC2EFoVn112xHO8=;
        b=AEWZ+bhBaaQgGrD9XQhxZQ3G03N714FR6r23BzcgrwSSjI8aqGYBIUdloMoGAizdgk
         Ow9351fwGJRyGQsIJxXg3olKmxNdxTRHyZfhQF4jpaps8720uXcs+rguzgPqzw7MeKY1
         YsJowKAt2nkFkdlxAGLOoGBLMAqMbKnDHWnrqwaL/FczcFyWsPQQgM5V23qiepw/nd7N
         wtYtNfVTy29CX/Vw4254EXEx2CszxcLxtmA4suVjUuYTDAGPV34OvYv1fgUrHBqWEYaW
         dd5NCWh1doXm9JWe+HgQr1wAEk0KFlEZZmARaX069J7k19KeV/y9teo5xnbhN8Mun1am
         U8bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790627; x=1786395427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        b=I7ytidaj222vFUoGVQfTEFwT5vYpVLJrasRdTWdAY01vKJ6inRV4VDP2Gwa/G1ej7Q
         ugDEblWJXxR55/eYKIIB43ZSQ+v096GUusO8sioWSdgwDRWrzrhsW0Vp0qXsO2RpGW8U
         zsIgu3ZfoaF+k9lfzS99MUq17g8hXA0udHSaAhv7Kl9CHTFCSC7w0oOpCaifJAc/Khx0
         gbm9D5+W/cKah0eNCmJznmiyb4d4M8LX3RPY8eSWu+qKH+YTyfNMUNdgQJK29+LBz0gb
         hr9eWHYJcfXt+zq/Em4Ve3xOk96jmmfzh4BvMTAkjxG+C1g/dGn7a7eYdjThR3/jdBjW
         HynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790627; x=1786395427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fxx0B02wBdJaS2C/b2hy+gR8nRXboJM13XF37xgcRs=;
        b=Z+SmvmPYL192mIRBy23kFbl0OxPhyKuMjUY9PSx7uztfgDG/Bb5S/tJBx3ZiDQAHkF
         ujfyi3aIDOXPRV3xocuK3MzqoEfy/piCrhxQHUQQ1CeQep2c3+i5+cB+nXsYMYxyf8PR
         /ctJ5cBT6yhl+QqlqtGF7Ox7hScw4Mu5ZTTBFW7kWdHRzlopb7TzDg2Qe/vI42hpcNt8
         LthAZjVrrl77t4LWcCk8ST+5CEGI3sYO5TzRhbwHBzRyr9W2OC2nHczY1u/o4b4f4qv6
         FCQP3vBgUMq+5W9oavfgmh0aqNG8cWgavENFTcm3+WHqZwPwBMLC8oX0kclONc+WPyIw
         Y1mw==
X-Forwarded-Encrypted: i=1; AHgh+RrZqcQ6WMOQDqGsqSocjvJFRUPShJlo10teEUDsg3ZGL3vPXvNGPfOiaoeH2azQrOZ2H49DhwhfCBorfd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr3uT/QDxq36PaVecAB2vAZrVUpjPKO5NT7tAvPqTRLLXn6jQ6
	cmG6xgtt4FEDBh3u62oIgkcS4i6GS0i6iRMLz4iCb+zfP9geiZrfrQoJaaCMDRqznPsHzC5bt+9
	FNyIERMiAfjZnTThtor7xj0k/ca1HZ+8=
X-Gm-Gg: AR+sD10VSPHqGJzxAd4GsW43GoCSuJCouuJTKsvCEgKQPYNt8gUxkViFE1fWS7ALioa
	UCekzl+JL1wszf/dD1tMjXOrTTzzCSgyYUFG4GWlmAyr0b7UsP26NUVLtPrYsohFOp5iZN1C/ND
	Jr3V+0/EQAVayCtXRlNb6TATKR7cRo8YhWI27y82i0hQeipDlsffywrFPDg7WRLgLlDiSp0DirU
	xqymVJEeGEwQoV+JPZreO9H0GPkQ0auao6ehxa2AvOU2yGYmM3BjJWUcKdZSJmAIB+yxmWpxz4G
	NvL6duZwUrbFb0oAr8BRamM+rjcVyaSymEcR2RT/JfyLy81CDrKoZ8oWo1jWJVMgAZAHIJp1hvm
	sT1wmFgDpkps2PrluhFfpEO/u5EW2+C4=
X-Received: by 2002:a05:6402:538e:b0:698:6620:d988 with SMTP id
 4fb4d7f45d1cf-6a0a7ca9786mr9097514a12.15.1785790626968; Mon, 03 Aug 2026
 13:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 3 Aug 2026 22:56:54 +0200
X-Gm-Features: AUfX_mzrOfpDet5WZmR5E0-xCU3tYZzg7dOpIC85BfviGV_cxmbzrWshM8wU5MY
Message-ID: <CA+=Fv5SBitGj+c08Ymy3_JdeErKrRS_s5_RYgABjMraQUFg=Ww@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha: enable building with clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:08=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Register the clang target triple for alpha, and pass -Wa,-mev6 only when
> building with gcc.  That flag exists to stop gas emulating instructions
> the assembler thinks the target lacks; it is a gas-only option, and
> clang's integrated assembler does not emulate instructions in the first
> place, so nothing is needed there.
>
> With this, LLVM=3D1 (and LLVM_IAS=3D1) builds work.  Note that the alpha
> backend is not in upstream LLVM yet; it lives in
>
>   https://github.com/alphalinux-org/llvm-project
>
> and is a work in progress.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Makefile    | 8 +++++++-
>  scripts/Makefile.clang | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..54283705911f 100644
> --- a/arch/alpha/Makefile
> +++ b/arch/alpha/Makefile
> @@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)    :=3D -mcpu=3Dev56=
 -mtune=3Dev6
>  cflags-y                               +=3D $(cpuflags-y)
>
>
> +KBUILD_CFLAGS +=3D $(cflags-y)
> +
>  # For TSUNAMI, we must have the assembler not emulate our instructions.
>  # The same is true for IRONGATE, POLARIS, PYXIS.
>  # BWX is most important, but we don't really want any emulation ever.
> -KBUILD_CFLAGS +=3D $(cflags-y) -Wa,-mev6
> +# Only gas emulates instructions the target does not implement, and only=
 gas
> +# understands -mev6; clang's integrated assembler never emulates.
> +ifdef CONFIG_CC_IS_GCC
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>

Hi Matt,

I agree with Nathan's suggestion to leave the
CLANG_TARGET_FLAGS_alpha entry out for now and add it separately when
the Alpha backend is being upstreamed to LLVM.

Could you send a v2 containing just the arch/alpha/Makefile change?

Since -Wa,-mev6 is an assembler-specific option, I think maybe the conditio=
n
should also test the assembler rather than the compiler?

ifdef CONFIG_AS_IS_GNU
KBUILD_CFLAGS +=3D -Wa,-mev6
endif

That preserves the option for both GCC and clang builds using GNU as,
including clang with LLVM_IAS=3D0, while omitting it for LLVM's integrated
assembler.

The revised Alpha Makefile patch can then go through the Alpha tree,
while the scripts/Makefile.clang change can wait until the backend is
available upstream.

Thanks,
Magnus
