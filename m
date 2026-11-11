Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794415879;
	b=mYKrbVc5pWWqP8XQ3dH4OzNEfIcbDk0Ylhb88qStzyVTCNePkL0BNbwEVAxgAMps/S9Z
	 vOVUP+9N12h1u/MOx5ZwRhQvJABImbvIsAbdp51oWJLmwpSe9cCrPVODvJuQZ8XMrTLdU
	 vMOKxmY2HAR9hgohpwuwFu1A3C4in6gOqay5weJPEoUxiA+arHWVLep7paULF/zHSpMQM
	 f5lhJJnMbYCS60QIuVE31B7Su1rruSpjvXAn6eSH/5MEoxG5bT6ZKuqHTgkaWauoOkCGs
	 DPeWH+SYdiFWBuB5UggCATgBSUmWGDxO9yGqvLh5EOuLIS4M9nsHQKrySVq2dBHsziA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
	b=LIQgxHMmHpbX1FZlesWKnrsc6R8Too+llkMss5Gk+leoVo0cry0fdazAP2ATA4WuN/hh
	 f1TcaccSUYAfuhuZIvPZdhZA1JXJ/kUWUbfwhcQ/P70kx5MJbM6qUTTRtU2YOK5xiZmhS
	 Lsjofy+cTrM6UvRCBa4M+6CE9IM5Qbh8XWUKQLD9moovv9RKhWbKGmVl+3ts9fTKUWAnl
	 15CNs4USj/KXJ5DCnWWlQvS38SCO8mkGqIh1u1PpYDd75xc3hb7Rr/KAnEjRmCtDYGJOB
	 ZWXAqHNBK7QUtL3+TIhdjmcJ1Z/4Xlsfq6XfMPPq3HVLA+5N9F9Nf0acYn+x7DXKgjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cNcy4ztK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97D606A330
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 16:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE97D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cNcy4ztK
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso15655f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 08:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794415877; cv=none;
        d=google.com; s=arc-20260327;
        b=nElRbuNGkuSSHi61Mxv56EMHpVN8vb3lFUiiwGIT74SAUR/Rn4UQckaeOIsvnM1zx0
         Za50mkA85oeP5fWcn60wVveHi0vOkz85nwqKHAiXKGRaZ5E3kaqyrpAdEu+wegdKu26i
         /dXi2IzgFj9lJ8rvUorz76D54TDuJ/1iL00eWiOKlhod/jcWHzpzdC372Tm3c7OM8A9P
         74N8cKspY1Dm3+hemmkZm436D5qPHaxevSXwZzfkLEpn05NfnjK0/CKRXVex/H9P9AsT
         U3XUczfycybbAhlbQ4oHenSNX3VDDomaU0OCQIHOB52KdenHL1HFJ/lsOdfzUUhkuQlN
         6hsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        fh=K+1gEx8CW5RJ7GrgfHPulJcTaqRGVo/dfg0OBfkzu3w=;
        b=OddZL6V0RlsTKbuG4rt5xrGvuQR3EjF6DFe5PEzBgDS42w69ahKYV8zxwON4qv5WqJ
         Vv/ceKw+RDe+Cn3vsonmgTaShiYJjs00seYjK07yfo03asHKeQIJvdD6JGqi0WGrR0M7
         Y80C0yv9F8WE/IzMAzgWvqZDvRw7L9rNkptd9Rxxz/PWhd86sLZ2deDaJofwvTF5B2nu
         Cd9cYIr6NEh/lLd7RkwtQl7vu6z7Apy6I3VfXDQrxU2FQz86wTQqx1eWXA5nMpxb36Da
         AYBER3MAx0GWMS+CwQE7hyWPTW5meFucTvlF/T9dx07IiD8D96X+qrMqhchq2Mkv6Exz
         y4iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415877; x=1795020677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        b=cNcy4ztKBBCUP4HFE1W66/wJVb/byaYeDzPGmQXPqeKDWSiq2ysIkoZqhwEi/WMKEh
         U4IJbdbK+FPBZV5Bp+0ExleKbkGD274FcBQNx4ablD5DGTFeh9wxe1vyNraKYUmfycl4
         9j58gMzjadYeuEVrQTyhAeY1nMOLcWo+MxaSTsK6ZRd6/IaTWlOoCJhmaF71X8N+Ft3s
         mtpf84Oo0QrSBWUPrNSkeg2SL6+ZzZyBg56Cy8ylvtLnezp9yFlY+7f08x7nz0EGFFmm
         i6C4yaAoUPUU3lAohEp7pixrq/3bN/oYRHeiYeuGpxYw37iccNIDVOBGxKsZVHnw7jpV
         /SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415877; x=1795020677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        b=mUpuV9A575WXPvdX2/v+SspY1yJFCmWbPqD3nH7ZA/F6SWMquqjho6VXYie+2F2Y8n
         BP/Gvcu3Icn8sKkViSGSkNkbT81RZG0fKzuxMUMG4Vj6cwOaFAqbkFEr6Bn8d1ElWQDk
         iyRtvoqonMq6pyMjuSCdoJWD30olDXNWUxQnwKITqb2/QuSAkkjVF+V9GPZIbBsttP5O
         +UonlklPNPsb5y/vvbJ1cctGgHkpa9WmEPxCwuymEalN4ofdSSi1YeK0swCgMGGKlc7r
         4Sj60X0JfVSDru3yPCbEHT/gz6GfNcEeZvo8JVciYz1JOfeiYczSqbscwlUfTQsPizqs
         FDRQ==
X-Forwarded-Encrypted: i=1; AL+hErE+XC+MxIYe8fbygKyvY2s3H0UwtDZTOo870k97WDmR6Gjp9YnYtjobedjNTutx7/8ilYORX+U/33C3YEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WklTjvT9pI3t4srLPdKzzenlnbdiC8kt0qFpAl0tqcFR868Vc
	HqpC/tdC43udzRrYGfATya1+FyS9IP5XIbayR1ysexipp/AU2qnyFGgQhkfbRxB+/3o/GsuajG6
	QJn97OCmfU4DbOvjtUIb7PvU0vib3H6ykA2+fkKU7
X-Gm-Gg: AYBFou2bOfEozIEWorMIclFmGiozepj4IHe9sWDgWHKxf5MHppmN11mHNqEcyUDuPIt
	jevD0eAyuQWhC6r0KXEpcgEW9mMuSX5WhyKRIsrq0DEFJRSjXKUAgnVmSL+w78yfO40S/76ZTxB
	RrRbZu8CXuHZQKx5Me5z/cpTr9Iuu8JV/lf+PA+0fwmHUmPvq53zpZvgtIcgk4nc/GXfM+GKjVs
	01e10kMoNh3D8MCaF7AGN2qiQRSqq9KNxF8Q6WQSkJrVnP9wxtBZjHmCEZ87A22ZW1ZwCurirbA
	cnSeVjQ+weqYWzhMV/HQta2P6H5WikHgVld7XZhk2dnJ8iDAFmmW+PNHg0fU1gLFX73jiMF7xbA
	N327Q0FRiaOqFfhFwcw1OmjakmEABgSOkhNwKTcwUor8XCIO15mX0khljLmNjWXzKbWGv3+2x4a
	KyraCDFUNz7Fe4NZBAoi9cTyKLWdae/epDy3RZdQvwWnGY+pQWmSrl8HShAMq8mzQt+sw8Z9xmT
	biHq+07+5pGXxxHQvHom2Er+Qm1xmvhuOycMg==
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id
 ffacd0b85a97d-49b01cf341fmr22869f8f.13.1794415876621; Wed, 11 Nov 2026
 08:51:16 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org> <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 08:51:05 -0800
X-Gm-Features: AclHuK8l5K2eY2r26mTBewSe8bSK1J1SDnVW3Q9OiGp7cZxgZU2dOMsZVOmiB-k
Message-ID: <CAKwvOdnFG1ACEvGPXGW1XK_3QN+5UaR_9EumhmrsyKOs0aYCPQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
To: Nathan Chancellor <nathan@kernel.org>, Jordan Abrahams-Whitehead <ajordanr@google.com>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> '-fno-addrsig' avoids generating the LLVM specific .llvm_addrsig
> section. This flag is supported by all supported versions of clang, so
> convert CONFIG_CC_OPT_NO_ADDRSIG into a simple string symbol that
> depends on CC_IS_CLANG to clean up a dynamic probe that is unnecessary.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Jordan, I know you were playing with -Wl,--icf=3Dall recently.  Looks
like the kernel does not use it; AFAIK, no one has ever tried.  Even
-Wl,--icf=3Dsafe.  Worth a shot to see if it boots.  If we did, we'd
have to update this kconfig check (the linker flag is only supported
by LLD).  Even if the result doesn't boot, it's perhaps worth doing
builds with BOTH to see what kind of savings are possible at the
limit.

> ---
>  scripts/Kconfig.toolchain | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 666d44cc6ba8..570c5a31016c 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -164,7 +164,8 @@ config CC_OPT_ZERO_INIT_PADDING_BITS
>         def_string "$(cc-option-str,-fzero-init-padding-bits=3Dall)"
>
>  config CC_OPT_NO_ADDRSIG
> -       def_string "$(cc-option-str,-fno-addrsig)"
> +       # supported in clang, not needed for gcc
> +       def_string "-fno-addrsig" if CC_IS_CLANG
>
>  config CC_OPT_DIAGNOSTICS_SHOW_CONTEXT
>         def_string "$(cc-option-str,-fdiagnostics-show-context=3D2)"
>
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
