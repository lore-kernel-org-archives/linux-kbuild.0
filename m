Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08C3E00BC
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Aug 2026 21:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965253; cv=pass; b=gtj94zWIR9bs60PXdSoAitnT09GQfmIl4kbzj3rNnvb1A/PaLAdZ0F948vSS7idL6+x8qn1Uh9OBcvwes+Ikyh0OLg8UUiNAxzl7kvU8j/GOY/iO4JUSAJPyw17HaK1QcjGa5RDJLqKvNxSrICXZn+B939dYsG0cPPT0xfXtwB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965253; c=relaxed/simple;
	bh=CRFBAY+HVM5zLw5Wlht8AEmJgsCvF8cPSHZXyZDpiFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCRZb+Yn6ikaVPOk4RAT0qlqh2kzFQ9x5lT7mFuNDlMQhtf/vCW6J1Hri38l4Wu+61I95/U3bj55Xt5TXI94Pw7voMzLmTwGVjEJSqxfzt35+lqkNwKrGjzz3+isMbnSkS8DYQeg5Sgm5G+v32G6+0KPaQpaVZykkiLQtH7rv5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtQkbLeJ; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtQkbLeJ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2055573c8cso86402866b.3
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Aug 2026 14:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785965249; cv=none;
        d=google.com; s=arc-20260327;
        b=rHq9b9jJ/1i2tDpyVFRh6hKyB5GLrsQ4dPLTyeWqe2/FvFDFbJ8YT4sHRRhWVUa/Sd
         UcksLxbj0eKZsHE00w4eEzPv8KG/v4d6h2rMxL7BRfVbeKHEZAZ7YiQwlI41/gEIuOXM
         v1FnQcP0RIFvMQuVss4XvZX+UQ/PruO7t7Ye//APIZ92lsGEU6vWZW/5u1bVe2lBab+7
         e0BA3jlVSI+7EMLks0sanw6imiFfmlVfSkURiRryaOehAuXsQroEfQeoXL21Q8A+78E1
         cs44FYO8Z52nTKLrQWECwPtNQ8049VYSxf3/Ur+usHyiMc0lb4YX2pNgIkdPwm/NFGqx
         Zbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        fh=eUfI4aAxr/GCak7Olnxkr04dICSgAr/nwlfThbgFHew=;
        b=QcDnx3xj9glcVnOBzaW8lL46D3HRw3rEBPNDCrH1xhF5MpeCGNeVr7QIdDbsThuon1
         kS/oqp/7nFP1SBfufhx5ub9yQxgcbgHFNzDUg577af1TVkE0Is2x8QvviIvJKHF5A4bC
         ff4mNy+wPNCwCyUjBOOoc+3Q8GdYwP5BJAPwULjOTpsSEsoN3qrSz/t192Add31Vujbk
         ciZlqIP85U0TIBK9WbQ/jGW4O+G7zB6YumJdtlN+Xl+KWOd7fO1O6DsGX9lQv9aRF2Vj
         xM+bn9nY1dliutjAQPPNYyHnbnYpuKl/1M/EiAg2+JbtOvdctzq2d2sj9FZ5ERVhmUsi
         9kiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965249; x=1786570049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        b=HtQkbLeJe6G/jD9t8OsAh+hijYU8IpwyLGrwwDRUmi8awu4Mj8WnHMMScGwZz+RX5K
         aOVIHaUmjZhercpSRkv0gU6sbALUwILlGaLLD+Hz7ms+Vjdi86326+IVLL4pJyApvLlH
         N1lUGG/fsyyFh5zFYvO0vxoOB3ol5U2iYK8I45LOEJDxkt7HGdEPflIsx5Z1WyAVZMzf
         Q6e+5rmnQeaC1XdFAFfHr+yigOMO958PvMXq3Z8qbu++Tr8dUlNadRrce4SwYWbosJeH
         R33emAiSfRx//MD53DWeW1bRGE2339dD6yhe1uDi0ePc0UUdxoTF2H/GgOYiQwqwy04L
         Ovjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965249; x=1786570049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOdQ3KJo0a8j9UIgNBxKoFYFjfq0XRlteuFhE33+c6E=;
        b=DsL9mBcU/XiDcz5m8jhDXLHlhUbvtDQhtPXf8cUQePRHxkRISXjHaMUgm4bpXaRjAJ
         cu6hyG7kMiQDqUbXtZC1aYVCqp+RAfRp182+MOIjoA9vJQDy1Rx6UiOvI0ClNYIi5JXG
         HSonfF93cWC5+sDPAh/grB6BZEWprrm2g4gbkTQ2FBub/x2lxlC2utv5SIo1XJ2lg3CN
         t7PIMfsQaMbKCRUI7DlOOJ4/N6S34Eqv43JvTccBJkI6VWpBNAhv/3GoMlphlXkOozfV
         o47Bo/js4p8rzqQDXVHpAd+fWrV46CHvZTHWKFpU5ZXvLmVGWqzqZX870kdPHGu0uuQ4
         624A==
X-Forwarded-Encrypted: i=1; AHgh+RpZaCv4mbFLT0NpbRzOgPnzu7c/HKBN4dPHFfnNVCSJhQkgxUKnuNCdlJroxl8i1JWltnnRK5HP6AAET4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1bHnmgoY9QSNUoWAXzXvSa3jtsLfkaTTW31Bk+x/iJcjwOAW
	6IgWVfddiXaMvVXjHKqRL2VkWdO/plwAz5c2t7tTCBPkECCwt3bmkPEY1rZ6wvjOby5hsZttlua
	td4l7mfd8/C3uslsIg+zIoGIX8x0Ya7KNsBYBA0I=
X-Gm-Gg: AR+sD11CxcdjSkJXtbfXsWa+NT0qBCHNjnxVyfNuSnVw1OAsMFR0GbisrGIT11nc29g
	aw6Fkw4nRtVOKygixpr7F7PMmCN+PCCLsGNbo2BqETWSFMi4nHhslzJqdWbX++rj/6j05UMgvU9
	TYwF3PR4fAX+UrOSU3bxF1ijmTfHwutAtX0/Sy8fTPV/6w8Ai9ZKLPI8ic2ExbTo/We2lMNwe6o
	HqFxbNN2re4hPFxtsxRKgHPnublSaAzHtyQjl4NEYooO3fSiSQkuFayjLoGAtYmAmFKibNE49PB
	cRF2KMRGktVh2UlJshJI1rXVny38n7V/Fvnd4TD4GCweWdCAWlt7I5mzeGQ5XsdPC6OmQx59XRT
	cGGjx2EbWNCYAkZGqPWc8pv60rOx5soFFqoUUBabYbQ==
X-Received: by 2002:a17:906:ee8b:b0:c16:2f5d:6153 with SMTP id
 a640c23a62f3a-c2039c4a94emr567212566b.20.1785965249055; Wed, 05 Aug 2026
 14:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260805185557.3283233-1-mattst88@gmail.com>
In-Reply-To: <20260805185557.3283233-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 5 Aug 2026 23:27:17 +0200
X-Gm-Features: AUfX_mwhW36EMELKBgfQ1098UaTRK9ltJYMKUq2mejLmJKQ4TTnz3ZPoJGmZ6UM
Message-ID: <CA+=Fv5T-+awQU1R5cKXdEwUdtCTTw4T29DomYEFBTNakBKjOAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] alpha: pass -Wa,-mev6 only when using GNU as
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Aug 5, 2026 at 8:56=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> That flag exists to stop gas emulating instructions the assembler thinks
> the target lacks.  It is a gas-only option, and LLVM's integrated
> assembler does not emulate instructions in the first place, so nothing
> is needed there.
>
> Condition it on CONFIG_AS_IS_GNU rather than the compiler, so it is
> still passed for clang builds using GNU as (LLVM_IAS=3D0) and omitted onl=
y
> for the integrated assembler.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> Only this patch changed; patch 2/2 ("alpha: read $gp and $sp explicitly
> for clang") is unchanged from v1 and is not resent.
>
> Changes in v2:
> - Drop the scripts/Makefile.clang CLANG_TARGET_FLAGS_alpha entry.  It
>   will be sent separately when the alpha backend is upstreamed to LLVM.
> - Condition -Wa,-mev6 on CONFIG_AS_IS_GNU rather than CONFIG_CC_IS_GCC,
>   so it is still passed for clang builds using GNU as (LLVM_IAS=3D0).
> - Reword the subject and commit message for the reduced scope.
> - Link to v1: https://lore.kernel.org/r/20260803-alpha-clang-v1-0-1c4ba5b=
a7a64@gmail.com
>
>  arch/alpha/Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..7074602dca94 100644
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
> +# understands -mev6.  LLVM's integrated assembler never emulates.
> +ifdef CONFIG_AS_IS_GNU
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>>
>  arch/alpha/Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 35445ff2e489..7074602dca94 100644
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
> +# understands -mev6.  LLVM's integrated assembler never emulates.
> +ifdef CONFIG_AS_IS_GNU
> +KBUILD_CFLAGS +=3D -Wa,-mev6
> +endif
>
>  libs-y                         +=3D arch/alpha/lib/
>

Thanks for the update. This looks good to me.

Reviewed-by: Magnus Lindholm linmag7@gmail.com

Thanks,
Magnus
