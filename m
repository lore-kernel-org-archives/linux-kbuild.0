Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793901807;
	b=T2ie2eKjFHSGLTroSA2OBCOugBCdwuJwk0k5BB0WUcAzHSR+cCdbl3MzmpQlnpJTz7sZ
	 /uyDCv5KYPv3IRmoBrDN59/S3oH/c4fii2hK6095/mXV3EHeVUMPHDDMJ+0IY06jEbLy+
	 zuyYSEEnPj1Dr7aSOPMdITLoeHYrKDUfIt3QXC0MLA1eU04hHIYCUOZLqQ0QIGsgAyjn3
	 1kiF6oKxpfOfSf9rzp9ONw4nDtpOsjwoVH+3KT+n93YyU2cwhp1v+l7VJglY6XbA/63Ba
	 boliy0Yii4MGD3Zn/B3JmS0yA69iOtH/lwTfkLfghXrUou0qB9bAccxyEW0PmjKXRaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
	b=2z/ZcMNLE4l1L1vY6FPU0jN3+HFLCocCeWIoDL+Cnd8mAaOMMgVf9R9Qd/RzCPbj0Z1h
	 7u4i4BDxDwAF50RPE4op0ioOBhqtXLXRt8mcnVF4Z3BgnpU+uDIO0nqZTL/pinLtj3wIP
	 aiLHvAmKhj1MBLnbb+H4SqPc03/WDq+uLtdLkXmcidS+y+3eTLUZFTo3N4+LfosE8cRe3
	 RcNo5APun5ewo99Jk6QfBMXiVWE7D663zR+eblMxsn5Rgpmev6PlENzGtBOFyoBBtx0Ec
	 F+NCTUybqF8g+6Lfdf4RDNnQW8qL3xGrgAzr8x5pBxsvqYDTMJdcmW/h0OqJAJxw94Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QAncIksR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521B606A328
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 18:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7521B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QAncIksR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so21044775e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 10:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793901806; cv=none;
        d=google.com; s=arc-20260327;
        b=iuf+DCYov+c4UjHJf4Z9ziMXzAIz8IF3MjoqR3wZaL95nzHDy39Zr5qoOZ2CRs5Il+
         yKSIZJJEP7B9vJHrurKB7DjhJAvgEs4Ux+5O5b6O6yCnsywTXTECnjURZKbxoEMBnJ+A
         uTVtp5lsvIqhqyGrXHibPtWIxnjIx5/N+SL7JAegvqW6o9RPXm9+f83j3Q88gzU/snW0
         M+6rF1RqQhh1suJr5EHdoQzL4mNPhaxb5dPWBEx6dx3HTH5EpQ4Q2GRSDwOUxZlB2xmn
         LHinEAi/3xzhTRUkNtdg8g/rEAoX88qC03S7OP8QxJ7S/pZ3yprbmLY3LTYcRoalwE/F
         lsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        fh=92kTwRNEUtzbi4L6O6QsSFpdstJH3Iu06bZ/GRP+4/g=;
        b=UpSz7v1phdJLDZWYt9w1K7a/UVDrJQpGr96ZPUxI/mWqIqe0UT4/YDHpWIXTH0/Wss
         K+rIt1rJUzejSIX3syVAOn+xNGPZTq6mtQDMzAUbf/z4dn05Ml8DN2YEc2qtikPlbIRS
         4bMvK7gtz5szrrWd63BRxm6gPa5B3hhdmCG7SPhQfaMPGX0w9GlazxnQ4QToRcuSi+uV
         2Inq04Xr62La8cJtwewDReFbtBhCgtYUCLKAlj9Nu3YbURD5hsEKpHjDQKIqEHNr0S0O
         iWyq8JwpkxyeHZzCQnPCP0gjgo3JvVJvJzlC1F/n6yMCQiSj9Eqs3obC7f92rQorOrl3
         Ud1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793901806; x=1794506606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        b=QAncIksR2vXXpHGSwp7bjc2MZCXx7lACZXYR3qgMBTiBVW9C3H0WxAQEkqEgmgTqjt
         o6T5+jdsKyRYC1NUBBYhDORQg8F4qY13FWe5RJeVpkUIBisGcChkyja+Q01su18yserf
         7Ee58NIaAKXbHUuFvUtiNbQ98IEwtlXdmbn6AV0IJlLiMKBjeuKmLN+bzEzDQqg5HD1C
         E7qCCkR2GoEdeGJMw756pGx3z4FSac7/GpYaahTF4imYJTUuG/6uqtRg6kpQGiaDGzD4
         N7hfou/hKVQQyX878YI5Ar4W17V/bYzMLviR3vBfj/DY6H3L6sNaRwtF221e6lgGylUe
         u11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901806; x=1794506606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        b=DPt/VEoSkT290tmu78ArtVQvnaNnR8qKaNbhKlNzQTI5HKI+Il/tHFpddnxHe9kbcQ
         +ewNJWQ1Gq/UOe/GZOw1PgvbY0IyK1rdyhz6QF20vE75VLVJ5/bCijznoFLbDSTI59N3
         TMi1mpHTqlU2oB0TqggaWJhVFx+5+85e3gUJ7lpY/0Cye/EJGdaU7hKWfCWDcMNS6K9H
         lCTOyhdkPBtmSSwbZO4mDlUxbqebGFIZL/QQ4mHJobc5C+UheVlANzlha1zPqQZqU0em
         +AgZXAxmi+A0GWJzJKgINdXmCcr+/sF2fwh9Owg9MrC2iih2LYSbPICp3/4kIkRrLrVR
         ZxTg==
X-Forwarded-Encrypted: i=1; AKwUvBzLKhPrmnIQuIZdCKevMOWLw5ZZj/UBZkaq+6q59jmg1fTN3H+pkfKqaCcy2CM1nmnwxRmegmAFn43gbqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99zfz/C9CM/ti4VySFM/Z6GX4PqG/KQx1ytzzKH3ktibt9F8Te
	ChbPE0xBPRGG/HYUGqn28PceGVWcRSkn09+cxVsuoHuIeAXeOWiN79oOYlzYxG3VgGuCkVWxYrC
	CRtWCDE9kcVZTQI5Zx2Owm5PSFLjuZxz9OJcRZZS6
X-Gm-Gg: AYBFou0pYA8pfIHZXzGs5zYkhOAn0I55HHZsvH01IvS4RHy1/k9rDg8WMSZ0rmRFxBM
	j/KjktsfzWP+L3dj0U2v6h23apvALVvjSH4nONmy4fw7szkF+BGpa4erQqXz9O6F+9gIgMHOFvk
	k8Qjcxfg3FrGEAhFQ/vbpndenH4XRJ+98LbmEwjaEQhvIoaecaLWlMC99XfBoBx/GK6ooVLTpX2
	V1dLM6XVM8/wM8hYEB1bN+HAOSk6w0pHIqStR1r/j3flQCbQ8o8F6bcARvNMCdhBUM9lodTtlm4
	30nA4c+O0sGtqxB1j9+ueE0LCK41VxCHF7+NLIzeNU0pHvcNvBGYv8GGPdPXZ4CZ5V8uoPKxaj9
	KZt8ylKV+9VEp0fU78YyXWIaKJyd+MfFZZW7fvrnXDCv/pr6JnX6b2yBGjvHwVMfGxKWcOfrtEJ
	pl1vFl3B/d/ubCHekAgcQq9swuRQ+zPg1IlbGpVvNzCsuozKS0jjZZRn3y5qb97vJVvKRTNvjfv
	Mf6fyGRZaK+7kKZWpM/kIwvMNNH+jszqAVd2BUoNNkVFPopkStnRDJt7A==
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id
 5b1f17b1804b1-4ac181e759dmr461771285e9.31.1793901804993; Thu, 05 Nov 2026
 10:03:24 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105175748.3057520-1-vineet.gupta@linux.dev>
In-Reply-To: <20261105175748.3057520-1-vineet.gupta@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 10:03:13 -0800
X-Gm-Features: AclHuK8C3o2kc44T55unuXB9fXbsGmvBzidv-Ub4iWxmKhGyxfDi4rGo075tswQ
Message-ID: <CAKwvOd=J8bYO6kzFO=mOfWi0NiHq9Y7u6JwV2WfZiS0VOoMpYg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: move gcc's -Wconstant-logical-operand to W=2
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Jakub Jelinek <jakub@redhat.com>, 
	Julian Braha <julianbraha@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:58=E2=80=AFAM Vineet Gupta <vineet.gupta@linux.dev=
> wrote:
>
> GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
> of && or || folds to a constant other than 0 or 1. Unlike clang's version=
,
> it also checks constant left operands and operators that come from a
> macro expansion. With CONFIG_WERROR=3Dy, an x86 defconfig build fails in
> prepare0:
>
>   arch/x86/include/asm/cpufeature.h:72:36: error: use of logical '&&' wit=
h constant operand '4194304' [-Werror=3Dconstant-logical-operand]
>
> The warning is meant to catch && written for &. Kernel history has no
> such catch. Of the 13 earlier kernel fixes for clang's version, only
> commit dd7fe5d9fd6a ("rtc: max31335: Fix comparison in
> max31335_volatile_reg()") fixed a bug that the warning found. Commit
> 394b52462020 ("drm/i915/gem: fix bitwise and logical AND mixup") fixed a
> & written for &&, which the warning cannot see. The other fixes rewrote
> correct code. In GCC's own tree, the warning found two sites since it
> was added, and both were false positives.
>
> Disable the warning for GCC unless W=3D2 is given. Keep clang's version,
> which skips macros and constant left operands.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Link: https://lore.kernel.org/all/20261104160722.1637541-1-vineet.gupta@l=
inux.dev/
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---
> v1 -> v2:
>  - Replace the four per-site fixes with this one change (Borislav, Peter)
>  - Link to v1: https://lore.kernel.org/all/20261104160722.1637541-1-vinee=
t.gupta@linux.dev/
>
>  scripts/Kconfig.toolchain | 3 +++
>  scripts/Makefile.warn     | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 2acbd40a38f1..1d68075f0469 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -233,6 +233,9 @@ config CC_OPT_WNO_FORMAT_OVERFLOW
>  config CC_OPT_WNO_STRINGOP_TRUNCATION
>         def_string "$(cc-option-str,-Wno-stringop-truncation)"
>
> +config CC_OPT_WNO_CONSTANT_LOGICAL_OPERAND
> +       def_string "$(cc-option-str,-Wno-constant-logical-operand)"
> +
>  config CC_HAS_COUNTED_BY
>         bool
>         # clang needs to be at least 20.1.0 to avoid potential crashes
> diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
> index 556fa249ca07..03b677bdbb0a 100644
> --- a/scripts/Makefile.warn
> +++ b/scripts/Makefile.warn
> @@ -167,6 +167,7 @@ endif
>
>  ifdef CONFIG_CC_IS_GCC
>  KBUILD_CFLAGS +=3D -Wno-maybe-uninitialized
> +KBUILD_CFLAGS +=3D $(CONFIG_CC_OPT_WNO_CONSTANT_LOGICAL_OPERAND)
>  endif
>
>  endif
> --
> 2.53.0-Meta
>


--=20
Thanks,
~Nick Desaulniers
