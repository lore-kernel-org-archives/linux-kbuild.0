Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994273;
	b=BOO7UImRajQ/wT2sFTjhB1uik2mxg2b18enWxF4egAvbdlwwnV9LhhjGfjb+dcIOpQNb
	 PazHVf+MuK+juIRdzzGzoWmD4kAFD0Zf1N0L76AFRuU/UOfkAHK/gjPyA4YrxlYGdvobi
	 bCry7PfTqfHIXKvWyhSbvUSVIApRXgQrVmWQwezC+wwPm7HvV3KArUXdlk0YVTWYsvanM
	 gtiCDJ8g7AGKsyVprGVkQJ7le1g2YdoJfMrZzVuPoC1cG6lbLe053m145brhbIsfLWGfO
	 phuseJhg3z0HBinEnj5IthplROXiXNbQCzA7mJ+AhfwB3DiD+6APeQIoZiGascegpDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
	b=pzZheSbqL8fwDfquQVagtORnNyfVJAqN4aKewv/JwV+1OoJyrl2ppObYfqmbRuJ+i7SX
	 A+XQFlOCYFrLOntfCi/VAkvjqlnfSQ/RM1OM8fO0VMv0e7ZuuKrPqOX9k0LnGEYZszmNc
	 CfgHufeox4d2sMP2wRdRf1dEMJqpV6Eugf2ady+jk+9+AfO1WbITrlb/z42nZ8aaMIgek
	 WMxiREvKT2Z2R009K6GUMQc7+64RsA5BY3niQaL/3D9eGaU3wqWLiJjY0E0XHlRHYiK3+
	 7hG/idPcikPCUwwmDx4mlgpd4mcDM7TSC/OG2Jg+VXJUMosCA6o0WC37ByUmK/jyjGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gvGiICTn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CCB606A32E
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 19:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CCB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gvGiICTn
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49134c8509fso905676f8f.1
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 11:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994271; cv=none;
        d=google.com; s=arc-20260327;
        b=d2nwCdh9YdxwYro7ToSQp+IceOeO0e6D6F1blxzJPKqOLcMRipfOkwc57Ny7GTl3X0
         oF3V3/tcKDgfK7vP49rD69WI9Bj72E/20bfyMPv5XeBsMVyfMRNvDRH4cYOgfO/oV/rR
         LUWpgFw79HeexPlaqd0CBR4TWckTav/O4KkVLCYlj8qzptGggBAwppHFPuxNl7vfiFZQ
         9XBusyzFfDmYfsYY7jWqkjp9iBfiR8peT04Kt8NclkZAlEe3mJeS6ts5pFyAaVwQhJCw
         LFbRd6lWZfNNJDjAPFSw3y8vkIP72/bbckU6zu27Mn8h8BHJef2HTEfauJz9bzalPrTt
         NcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        fh=oN1s4sUgky+hWBBOrhi+2FobkUywBiZl8SRMOCa8Z2o=;
        b=COM00N3ljyIG8Xdki6NdPHB7FFUYwIi6AcOAG9iRMX9nCbPQ2z+xFoPJBbyuuldNLI
         ODRni/AszPEmlbJoFsj5MjITr58iVzm3Icg8cJwZC9splEs49Ip9GaJnMFj1M05/FhjY
         ky72hd7o+qoH8sbDS3ex0yZg0YJQq+6wWTHX/RbCZEmR8iDahnUJue6ggmwLH3S+8qjH
         XyToa/VOkTmO+KUrI6+ZD7WFG85PmeFQnM2iwlb0SSmFrt56Q8UKlUkLaU/Rc101N3E7
         XKVAFoddMKUdU+WjYfBeTpQgReKTFuyO++KobnM45XTB5z2UsGkU057P51iWwSa4Dz7l
         zmEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793994271; x=1794599071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        b=gvGiICTnzCxuHUkMAvPjSTuWZIiFk8Swusu09/AmeTF8ZvFuXrcJhRLIcY+x3exYoW
         F8yUkxYY+efm/EEK1BYsyPJ8L9glXj9FOSUpKm6oIgqo96gg2B/tprxf7Zo+1nuwhQPJ
         6ijZt289CT0AhkP1KSZvtHAyYuLOHjwMjMzs8+ueD8xOqWSBMa5UKbQa8iANDPRMBhpP
         wKRy68tVmylxxmXKurkJkSeJUoYdTEE+gS5K04l3rvighmiI1bQyPSntaJhmORJBJysp
         +4rchM83WXR83dhu4E6bcHxEb4rCuQE23qiFaf6WcTXAmLpRJAsHpZkRzfGuHtlYZw8K
         6MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994271; x=1794599071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        b=piOc0nZkX7S2QdKaVZjVnoNwXNTlmB+ttYFZBkAFJ6bC/Ta5I8mFggF4J99n+epeL/
         lSGcBsNK3JOVC+91IQShKjvC+iycn/AWM4AsWIdxEHwUiEAMbuwBnNSr3s19gBzmOty3
         kdedlX0nikiwq0SEzTgeqUin3P8knZfv/kzsz7RPgDfNBL74DdfjeQJNbJYDo44b70hT
         TkIU8lrAEaGS4/p5/a4CESY6id+0wsAeXDtQL05dwBoD5mnBAxsDuUjz1z7gfV+dwZwl
         tBE6jypT1wxqfpa6ea1x5PdI4AduLOswq5JPxqGe/DV4DTZX4VwzX21VOPjaWUTxHSR0
         8hPg==
X-Forwarded-Encrypted: i=1; AL+hErH/1Kc/MW1uJyWGTaplYtFWZ5o2ui1869ONUMMkc7KQl1AqvELIqEGuL2tRnZvDJUuLFDvPMkhqD687jfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uV79C5gA9sydbNvAusFQspsms6VeSoE+GiF4zmaMwK752G8pH
	puAorDjUCpEdEI+Psvw9PGQ83a4kYFMObfazUuGzT0C3i2Lmu0NNZegzHYQGD10GkhUKSUO+rv2
	UO8LRWwiBfkin/J+QmMVkUt61zajxWdbD1SdLaB9+
X-Gm-Gg: AYBFou1v9OigjmZDj27eNwzTse4j9eZUt9OICCdVKNN5EI5VPnfRbLUE3ChNATetako
	OIaEDmN0pe52lgZ2Yig0zD/pf5CL0x3Sqk2WYpHSbtJSL6giv6mG4vwelVEZzubydIz4EZUqZ7d
	v1U+VD1GnAH6y7oU+xL5xzKuWrZwnXeqdEPZH3VuRtDHyRiohxmpNzfw0S2f30ltLv8+rgFu5pA
	hV/ALNcfZ2X/AzUGLu5oW4dQp8GtYTWaD1YNLNq/5WY1FvmUO3RY3sbcilT41ENYBKbldU7pzW+
	r5M9z7E5abE4K/DPQcTwUQ/DyfGscVLGVM28cR1NaM/PTiuBd/qSNrPxX3ZTeKxpCFZaJngWF3i
	qIofc8O8do/ltIlAFUmM9iBaYQQcm7dUpJNT3Nzu7lIQpCo3WQSV4sTQ30l4xlKkO5FTe8q48Tv
	lJrXeamt3BDbTwcdFdk6Su99bNYxgtq0I6f7LtmzxCIBKzHTcTnbTrw7npYHQ+1FI5VtCGllNxT
	j+tfyVOn+r2LI3jjIdUjVGcOjEg+2v2VyVtgg==
X-Received: by 2002:a05:6000:18a6:b0:492:8dd4:baf8 with SMTP id
 ffacd0b85a97d-4928dd4bbe5mr7282358f8f.6.1793994270567; Fri, 06 Nov 2026
 11:44:30 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
In-Reply-To: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Nov 2026 11:44:18 -0800
X-Gm-Features: AclHuK9lc1j_hydZKjHRaIqC6GPhtItrfzxvxTIux1kraqJqkaT_i4EQKE6q_vU
Message-ID: <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Yabin Cui <yabinc@google.com>, 
	Han Wang <nesthanwang@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Snehasish Kumar <snehasishk@google.com>, stable@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:38=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
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
> Although SampleProfileUseProfi currently defaults to false in the LLVM
> backend and is only enabled by the Clang driver, explicitly pass
> -Cllvm-args=3D-sample-profile-use-profi=3Dfalse in RUSTFLAGS_AUTOFDO_CLAN=
G
> and --mllvm=3D-sample-profile-use-profi=3Dfalse in KBUILD_LDFLAGS as well=
 so
> that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
> defaults change in the future. Unlike the Clang driver flag
> -fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
> -sample-profile-use-profi option was introduced in LLVM 14, which
> predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no version
> checks are needed for the Rust or linker flags.
>
> Cc: stable@vger.kernel.org
> Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> Suggested-by: Rong Xu <xur@google.com>
> Reviewed-by: Rong Xu <xur@google.com>
> Reviewed-by: Snehasish Kumar <snehasishk@google.com>
> Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef=
25522aa17c2a71003 [1]
> Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMAoW=
h-dqLHii3Nig@mail.gmail.com [2]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Maybe we can credit a few folks with reported by tags, to encourage to
report issues upstream more in the future?

Reported-by: Han Wang <nesthanwang@google.com>
Reported-by: Yabin Cui <yabinc@google.com>

> ---
> v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65=
fea2e1bafce6370@changeid
>
> Changes in v2:
> - Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS
>   as well (Rong Xu, Nick Desaulniers)
>
>  scripts/Makefile.autofdo | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..55fda66ad960 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,13 +13,16 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno-s=
ample-profile-use-profi)
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PR=
OFILE) -Zfunction-sections=3Dy
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-sample-profile-use-profi=
=3Dfalse
>  endif
>
>  ifdef CONFIG_LTO_CLANG_THIN
>    ifdef CLANG_AUTOFDO_PROFILE
>      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE)
> +    KBUILD_LDFLAGS +=3D --mllvm=3D-sample-profile-use-profi=3Dfalse
>    endif
>    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllvm=
=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
>    KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitting=
=3Dall,-plugin-opt=3D-split-machine-functions)
> --
> 2.56.0.455.g6c5a503b38-goog
>


--
Thanks,
~Nick Desaulniers
