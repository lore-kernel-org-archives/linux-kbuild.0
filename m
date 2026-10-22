Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792709898;
	b=ouZuofu+a7DH+rPj9vmg9yPAwVp5KGbBsWlq0tdUqI/jIyOfPC5z8p0JtgNUKP3L7gi+
	 fSsWHXXe1xLKck58znOlfLsgHFgrCPJ67NqWjBHGIrG0EtonL2D0zR3OFSgCG/SGk5oP4
	 JnVKqTCDopeZVQhLYXDiF7EBxrv1qrv/zMnU2ECQNzMKSVMFHLSy/q+LIGhHaTlYEzhkY
	 xfDsCBp+WX7zzRLiDEtupPlR1Bk+cqoVZYPTxfVd94m0Xvy8TlWEAn2KOCWa4pO7AGk+d
	 iqskb52BiPnFWKPjOZbKativYSlswv7wn44D/rjuevoMbeXuq0sJnVslUNRTcRiuzxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
	b=zfsStlm9+PdYKne6CXSUc/n0eS+ewzXf6yonFc9vn5Tb7NrXtcJFK34NNUe80nNZAlDS
	 jb4o7C9Cn0YH0Rn5HFWG2PhH9VN8OB1GjEU329tRhUKz39NGz16s6d5zSB4hg2TMXcRDN
	 TNR59sC0MeE9HKf8F/GXnOUrdtCzZE2kJ347b6zd1ewvP/fLv5QHQfoSjzh3E4Pmkp3U3
	 EXhGSODE5bs4pvGWYfYS86BkO0dCWmaeltlh3SBckfHO/httqjTMsgEVRY7ADb8nakV2A
	 gl+4aEtCh4xr9qQm8TN/7KUnd9pNczRtvFTpSmKjlJvhRrFkXi2GEzS9Y2a+wvlVc3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kAWpkhn1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28455606A31B
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Oct 2026 22:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28455606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kAWpkhn1
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso4851a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Oct 2026 15:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792709896; cv=none;
        d=google.com; s=arc-20260327;
        b=IfM6jXYXjxvJay+gJ7lnSBuy8Ee2MPT8VrQ1YTrrCOKXWnUE3bzRaTcntCCOFGGM31
         ToXPixU8n2JQM7iGaXn/KaF4tcOhWqstRG02dH0oOeos21s5mgj+EWomMQUM/T0S7YjD
         2oozajs47lh2SChrL8Sq6fD7DaCWFJvmvT+HCX+nv4TLNy3veJA1e7f8D3R4ohkn0/Rq
         OgD/WszMVmsTHyjGT9JHuXKudanTu3uxeCyBB9ENWWVHKIqg5+w+vwjDAmg/qZsZs1z1
         HWZguSIhAHKSpdfDBr67ORx8ldbbGN6I0z/6/h17d+iZEgFmIrBnGshMO7G1rmYyOeWa
         a+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        fh=3kACQs0ePPrSoexpZ4KL2fkvvoiNYODhKJb8mziFekM=;
        b=Tu8GppSHOiVgT2eK8wS87R6fE/ZtQQI8XbN2XcJ5Fyv7KvGT7a2JlUk3xTUB/O77aU
         3GxYuPAITAWeDIlJ2ikJDCs126kLyEMMurDueyZH6OdH3g+mufydMkPVuJFpFZrrA/uc
         GDNNPz/em+5uhh2P6JH1M4VeGMcrDKtYtq4qVTL8x1ob3B6V5n1+M19NnXKOsoiV2O/8
         QWVPhDOjApouFVDTD3a7GCh6GfDixKvzucFO0xH96AVOQShwSWQ/nAH04+Vt+c3cBdSG
         opnCgTCZIlW7w4OPhMNzuD9dek+kxaqQpwO5SWKCW0sN75eOnZvZMiTbQGP3NWKPnFOf
         +13w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709896; x=1793314696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        b=kAWpkhn1xJIsRNb3kWf753Jo/W1Z9mqUGTtDto8RAWIddAkJgZn+T1ZScI238Xw36Q
         qWKFhPYd264ScQPYkDRL13eNkyduAvBpqsczVv+z8utITIo9zymG135SeAU5POJKGS8M
         MWSba+2TyycipFlrHFl1R0vsellMcEGh+TldPzF3vnmlAFVZJ2N/YpqjKn8WhPDv96F7
         l3w6V7quxAIbR+/O3fb4BSTp69DGSEnKM8xhqiEko9P+wxOFHIeh5XOSxUob0m95Pk9F
         NWbF9E1eyxYhOl6MSHmpr/655ZHRbGYikxJsxmxfnGr8SLx7G2GKAcaZY/9jOOVVgdpV
         53jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709896; x=1793314696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        b=o4K+7BImCZE/NhOzUQ9s+FE91Cv3nCMrxr4pEVBxlL3Gx++B0b1sh/qDlBVc04dDym
         F5V3ydcwzWJnsL0N60wC3LgrRVekKF1+/Aw195cU+IrPDzvOYrecz3kMGvmNrblOD7gX
         haEL8DwkCUjT0OPB47601jc6B1acGnjwO6ltRat068ZR+EewMA+trAbLPWkHv3fsVIpW
         cSrUPDki3DQ4yo1hUB5tw9o6OSS+5Jz7zo4LjZ1xUIW3CpBgnFWgf5Mw4PCxcfpS1sOe
         3neY2FyvauGS1XwQZlpqF2d3EIRWtmlXYaRkY+BdsgbuiNSSRu00dF2R/uyeWeTvYO+5
         RvGw==
X-Forwarded-Encrypted: i=1; AKwUvBxLy/U6pSj9M1cSlaw4mqLwIij6paJBKNWq8iMLgedCh2SrZkgK3BZ3twVnU7r+dGbb25G+bMnAyytxIpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQmApFX3Pq2N17ErYG5s62K5mTvgzoupxSILsLa1IjU4ymvaLT
	waklcocAekCwOkz0LJaBuQOHfGC27NIuJo+oydr2spGaZs5EJzKcGAz/gtL14c2QHdM/JG7Y/14
	i1JYD6dsGBwoBEHtg3x+3YXAyVeEYucip8ALgp8e9
X-Gm-Gg: AYBFou0biWVHuagKtpLG057ak8oJPO8GYIYfaP+h5w3RR2MSmV2bLbgpi2W2vkWv31T
	4RPv8DdT2SZwW1XqDNilJsFC17+cgqDYc+9yQkJbil8n424WUmyNLIVJJOzhZwt/Kqat5YBmuqa
	NQEzKiLTh7IOW5jmYyAhaFNiGCMhFre8p6PK6QKFOTlOP5jgqPIv5bsFlCcL5DlCInGQM+7Oi63
	E21dts1nSKauJYsFq1oiNVcqBX/f0GCoay/h///PFlsvFlEmmC+6Q1cTQvA6WZN1adw6Snhcdmf
	YrlRQGbmrCzjsZScaDsIBU4oITBF42Mvmpb9UB9LWiEEJTKzVFdHfZyJwRCxV8G9zasx5uiOJtz
	HZGHgNwcQRULmwRcMTPyrro9VZ+Rmz+vLC2+GMH2mf2ldWVkVisQMnqeMjzYVOAJ5
X-Received: by 2002:a05:6402:20cc:20b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b43505cab5mr9309a12.16.1792709896086; Thu, 22 Oct 2026
 15:58:16 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-update-autofdo-split-machine-function-option-v1-1-5c71b3005e89@kernel.org>
In-Reply-To: <20261014-update-autofdo-split-machine-function-option-v1-1-5c71b3005e89@kernel.org>
From: Rong Xu <xur@google.com>
Date: Thu, 22 Oct 2026 15:58:04 -0700
X-Gm-Features: AclHuK8dO3MsAmO6cAa68r7ozQ6JK-D1flEqoU6M1Xnqf0FQ7RSBHTS-OpOYYkM
Message-ID: <CAF1bQ=SN8wZ1hKDTtGspBiZ8VQBoUtQP6uNioO-ZOOvS2tLZAg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Update split machine function argument
 for upstream rename
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Han Shen <shenhan@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good to me. Thanks for fixing this.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Wed, Oct 14, 2026 at 4:40=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> A recent LLVM commit [1] renamed the internal LLVM plugin option
> '-split-machine-functions' to '-function-splitting=3Dall', breaking the
> AutoFDO + ThinLTO build with:
>
>   ld.lld: error: -plugin-opt=3D-: ld.lld: Unknown command line argument '=
-split-machine-functions'.  Try: 'ld.lld --help'
>
> The plugin option is needed for in-process ThinLTO, so handle the rename
> accordingly using ld-option.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2186
> Fixes: 2fd65f7afd5a ("AutoFDO: Enable machine function split optimization=
 for AutoFDO")
> Link: https://github.com/llvm/llvm-project/commit/3e6acc87c58843e551d6e8e=
4bf06c26712b04622 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Makefile.autofdo | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 1442043da139..57a3aba6ffc2 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -22,7 +22,7 @@ ifdef CONFIG_LTO_CLANG_THIN
>      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE)
>    endif
>    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllvm=
=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
> -  KBUILD_LDFLAGS +=3D -plugin-opt=3D-split-machine-functions
> +  KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitting=
=3Dall,-plugin-opt=3D-split-machine-functions)
>  endif
>
>  export CFLAGS_AUTOFDO_CLANG RUSTFLAGS_AUTOFDO_CLANG
>
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> change-id: 20261014-update-autofdo-split-machine-function-option-d4edb03d=
370c
>
> Best regards,
> --
> Cheers,
> Nathan
>
