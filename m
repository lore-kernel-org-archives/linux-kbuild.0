Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986745;
	b=RQtpeuEQS/C7zeB8jB5R/tL1W8ImX+eeT8sdoi8H+CqomvtOQ+rrYzFqcTkrDNb9DC4X
	 BUPeEyGcVAw3zISzwYIVb00cnUistiKv6BY/nO2FJ8UEVXXo0brNjFnOQr7utru0RGgys
	 Ou4XJYhVjFbI9Y+LlfJoSfKKkAnoaTGMQERCoI19OrFwkqhJFFde4b9aLIgAdk8+MpO/f
	 qtag4raF0vpRjS09jtExRBw3D4XtNVvLMMF9J/rot1dA+w5WclOBc9LjV9ntbKXcdXkRV
	 R3Hd74ZJWNcZoGo0xkzMGMA8+hQ7B1Df9X7DD14p2TXC6hMnp7W7Mu6WzJkQ3AX5W2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
	b=bd71voStuKWxzSlhmmeAyO86AunQP12lJ2KZLbleI7pl3CGXjk/tE0VFIkpg45cwj/yC
	 0s2OPeob5g4vFyU+2CTn8MtzTeUB74EfGGnw7D2qNmvoL7sdLt7NJOr6wSVYZWPSI3mGN
	 69qtmLABvRvfS8TVVnOgGr7azOtGww03slFG/hKkd+bCtuVnl5FaMtJEx7hIDm5Cwx3i5
	 7fhi13+Y0qgyfGbF3kXZ5jztYliWIRoSj7rEfHfIIAS653g0/iWk0bKX3mRlxLQKWC6Z8
	 R76H9/8O+ksZ/M166Ns6br0da8iIeOvd+X4CsZJqEh4yKUjq3xh8NZwOgoFavntaJuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M7CeSLUn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB9B606EEAF
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 17:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB9B606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M7CeSLUn
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so567a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 09:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986742; cv=none;
        d=google.com; s=arc-20260327;
        b=LgGqhq6lqQ5FmGMjxihFX5bee5cmKIN/R45iLVoc7aQLwdD8EXKTVhs/5WDoUwiFOl
         bUTlWuWJlGn/GxwZ62OYWQRoPL6EvNnr9RBNN7ohbq3zWdfd2kXs/ziEazKQmxRVSQ/1
         NxQehGdsYeit7U28xEbM/w2ed2YnxXyj/bUpVGx/EgOxFVQHwI00NuOEC/UIpctsDRs0
         hj8X89yz1LlRDtu9pvj/xMdrvkkwnzXRiH8DxOAI8X32tTMgmmpQpgUGIQ5u5/UpY5EP
         Zhk63CoS6gx6jDJM3TZTpCFms2MhmhRlCiPHFJPJH1SM3M73Haeprf7mIGKzSVuJZgk6
         c4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        fh=TMf7Jeh+vWkl4JroZWZQjH4hq7yaoQvtSRDdNFU7UYY=;
        b=ryqSH2TJ1QG1MlmC3vKK3J4/1BeZ+4/7zofq+Woagw2/AFDxwkFgMArmVJftRNaPOV
         2zc9G3tZiY/ifoLYl7niXAgRlSyAIpqJGnhWZwh3QktknM+k6wM8SaW6VpmgD6UZzSOu
         jZhRP4PpPX8HTrmrKb7iBGIC9YKBX/qeuFOrXmd4yfiCwlrVik7InhCbMdnODMAh9sX3
         UjmVCBB5FAa0fSIo+C75cGLF/1HzfwKkiOF7FtNxYcuYvsse4BL2XnLANDFU4xqAfp7F
         +vWE39ht8t6sWpJiWDch6kPFtWnpQl1r/XGjlmJErrY8SsnyGrEGodPv+PAvSxUDf045
         Xd2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986742; x=1794591542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        b=M7CeSLUnVxKXHq3kGnMleixotglsAYU0MiEuDhK7fsOjczEHbXTiKqJrfSGezu7e46
         ggPtTI1Xcu1odtYXH4SKP9WaZWktV2qIO6zMGm+ZLwGacmNcYBjSCJ+Z4BvSLjmsHiSh
         cLaAxzY2clUlwKsEJaU1gDoAuVR5YtNggNmVoLOadS+vVCK0RfNM/xzGagX26B70McbH
         OZbtACuWry1k7zu7QSWqfTyKzrhkuWG9u4kIM9/Ehu9AC6M5pzXqspMlwAWO+cFl2+Kl
         hoYlxUsus5SYVc6oVZQN4g3xXo9zkyEDFzFor3ASRDWe4LkSIxvWOavhR5OemRFAxYO+
         i3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986742; x=1794591542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        b=r4gztGC6+C3FYIJ5t2UbMPBlIHLmm4nK27yIPFIQLUJOSg/wNQippSgBqXzJpl087p
         U7yABjTWo5nB9z9iLfQo0P0uT8wfAsYXpMzNK4wpLna/y8yl21kamhUgp4XyTN+ABPxZ
         Z8Mxat6dZ2GtcuxERpdHDGJaij0RedzW2OlnAoP9zmfv7vQVh+g7RF7kAqeuv68wV6WX
         qi8+KpW5YQ6QXgftk2kz+AAMlQMvkJopk/kLajsciZW7sOo7j+2+F4bh0cdU4gX779Ll
         S93DisCzZlxFC0O21HoXYBrTycKEh3+t0s0V5Z/lY5OywSHgd7QNQ75ceF+2SLoGFIKp
         JhVw==
X-Forwarded-Encrypted: i=1; AL+hErHtKqR3paO6j+7NNCl+KJbMDDxDfo63sJRdl0AzMXUp9nSyzbO01GossUumt45/M6Uv6UToqac1ljYfpsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cF9cOFsKzkqWaCLOfVouuE1t7apXzHE4A7UN43jWyzI0uEiog
	kxX+wDTZkxiP7YDhOFbjVr53j7kyGjDWnzaCVbeUQYJfdiihYBNnvl1W2DOIR69U1X6dfdMEBmQ
	Xw78WZlzw1sGzfQcrrOVRnV9VBuxuOH0quK9fb7L3
X-Gm-Gg: AYBFou2UEdhQJDnbg+7n/BoVdw8OGtH2SviAeXynC5bpID0So7yw0NcVS8nBGfhJ4w+
	gjUdOdhmtU1HrfnC0NrPNYlfTRsT88KFsY/67/A5+cEfZyHehekgSP1DF3IN7/ZaVZblB9NLzZs
	cCm5lucFHFUJRwGu2CJpPOi8UtWfP5IQpYJORdreNPmgqbY6pecCtJebf4oa0saLJK1YBmDsPHI
	E2RLnTyu4x0qYopRNWWIvLGeBPMr1pfuVJ/LYaou8uznscSqrjoOumLXndM2F6G7IiD08mx/dxm
	+X9MDKYRPR8ZeALo4iquImvIfKLZrihVHsSChn/r3OmRg9TahZsyLDC8jJp8YbHjlGhaCH8Hyie
	rClfhnQSnGR82xTDpm/m35ktZ0DdvDCboP4V6PSybQK6fbyskfesi+gbYd4pgRc29b6WNfUzrhz
	KeIsODi1XXzHoe
X-Received: by 2002:a05:6402:a594:10b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6b6f843548cmr6213a12.11.1793986741181; Fri, 06 Nov 2026
 09:39:01 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
In-Reply-To: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 09:38:48 -0800
X-Gm-Features: AclHuK9krDICcHvY12_TQOAPQOmYyqI_XtzGscWcqlFs1PTf4lzGC_gvkF1otP4
Message-ID: <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good to me. Thanks!

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> automatically passes -mllvm -sample-profile-use-profi whenever
> -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> inference algorithm (Profi) by default.
>
> However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
> FS-AFDO that degrade runtime performance compared to LLVM's original
> profile propagation algorithm. In addition, Profi's min-cost max-flow
> solver (applyFlowInference) can hit pathological compile times (30+
> minutes or hangs) on certain kernel control-flow graphs when profiles
> drift slightly or when combined with GCOV [3].
>
> Pass -fno-sample-profile-use-profi to disable Profi and restore the
> original profile propagation behavior that kernel AutoFDO was tested
> with. Guard the flag with clang-min-version 210000 since it was
> introduced in Clang 21 alongside the default change, whereas
> CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> used to probe for the flag because cc-option invokes Clang with -Werror
> but without -fprofile-sample-use, causing Clang to fail the probe with
> -Werror,-Wunused-command-line-argument.
>
> RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> SampleProfileUseProfi remains false by default in the LLVM backend and
> is only enabled by the Clang driver.
>
> Cc: stable@vger.kernel.org
> Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> Suggested-by: Rong Xu <xur@google.com>
> Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef=
25522aa17c2a71003 [1]
> Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMAoW=
h-dqLHii3Nig@mail.gmail.com [2]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  scripts/Makefile.autofdo | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..8754b60ad2ab 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,6 +13,7 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno-s=
ample-profile-use-profi)
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PR=
OFILE) -Zfunction-sections=3Dy
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
>  endif
> --
> 2.56.0.455.g6c5a503b38-goog
>
