Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027737;
	b=SoC8qXFkGpZ9bGsAXkIugANElfUY4YSdcqRDrVQO9QjR85GkusQ4g84FR39ClKGOFMjU
	 r9hz7ptNTBh2n704SH4q57lX+dY6oirQKinrmTE4Sl5vctrBfTTk8EhF+9W7sT0PQrSH8
	 vZ5fWnqvtReJsRjox0ycjf1ojkZ3Ygg2Z0fRXMg1dvjvNa7T/FuWfLDTikK3fk8izcGHA
	 jxbkHjQQ0dHrP3/X4JTCxVVIzOf9aVE5iI+l/4NzSlMdjBN4Uwj/z1IAMI6KdMYk2k4bv
	 YxhMH91zApY0DoDmtPgPFRw3iahzN3GRRiLb/RsXoGK0425uOxNxDKzGKY4spbU3Vdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
	b=4bxRwRmaE/p89JGrHLRKbhTFLSCbQ2Xyc4QsvOO4BQZ1AY45QWqmsRbWZjVx+kTTNxUs
	 Kvu/jYod+Mthbq5D4TorUG11rviJJPLFZfrGkYU7CwOeyHFqhwU+ooLvjzDQGz/l924X8
	 AhBWtFOCLZuVi/3QXMkE0fOpKtxO9pvqlvrmHSziM83pWMPUAQC+rrv1cYtqIZ98pFQPQ
	 DvJVK+oJuroHCh+q9uFg9vh9C03ChrO5U/kIf8aBAGOefiaknE8MaIFj8cqWFqx+z5Bz3
	 jMtgYsR2JNzO9gcbNr45+FHSb3f0qczeX/1flenqtEQQg+Nqes2TjVtBHp0abbkOrDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SaVd11am;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2170606A33E
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 18:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2170606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SaVd11am
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso901780f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 10:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027735; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/FF0bp2SHTRb2n0nJZUoZJg9t+15kZt0dZVRbYjzuHVpT9ha2zzldqt9aemNh52GX
         Paip4LcYIYO15fa8xJXNJE4hhdUxLXpKPfaV/C9/5Hg+qazw35ru6qrjXWM1UKuHxYvR
         JRgS807f/6Zxpi94Ly22nlwePwdoAq40D5G6ID6LuUP/EZsPqR/5E+1P1grbzWnFTzO7
         bYBM01cDJwRxPHla2axmfnFkBNPpWQtjJKIDgqe9S0d71jliQSZYOvwRtsKsMA55yMoB
         Wm2h7guHgRaBPwO76h3V2RNh7Njg48Ai0J09DNvmtLHEvHITJA/z5N6ojIPrM0ilb0p2
         UAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        fh=84TC+2Gwl0HdSJqJSU9gjaiENNUxrVB3DB1vMOyz07g=;
        b=i8FAgaG9iyiLbN9RBp8IRbgl/c/iknld/c445T8V5iU9LTfFri94ySlbxINBhyxLKs
         22NKypdDy45xbe5PRkeJc6lfGKiaXP+2VIYJv1tx7WngBdhntck1k8s14cGTU8ujGCMb
         tDT536gG2em4JsHjhM9Xl9gib5jhnqd0c9L84djjoF+t5/3ze4Bw8u6o6hjEZNkV3iFc
         h6+v3WOgeQYmR6siC7JYZjucxiKcIfbEdUmorddIYqbeUYtPt3yIllPqyHGNGbwqPh8D
         V90HmS3x9xFPO4GVXdxkM087MBLdgHMfGOuw7rsEaFjRNo4iTtE/sH/ZKCypsvC9TGhm
         URIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027735; x=1795632535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        b=SaVd11amMVaZjfemF+IdOLWVydW/v6XL9frGvxx7ZZp1u9OrILJarL+fMcOGS6mqbn
         4XimgGUBm/a3LFYWlv8NYnjom6o+ODA/WyR9X2xnj66H2kqVJmMsLfGdxahANKjAJHf9
         Q/QFhpIbAzEpAT96XnIOLyaKEmEI9Epx7m3YwFzfcCLse8tXhiHbaGE+ZKABhULiU+nu
         poO3h0MjuGBJNbPsJU5sRMaRaFXdz+PirVzKqMfDizt0/KZr1EJfII/mQuNKyXqm0g7L
         CtU9N82CiGKDKZDWmQY6sIpf0FzltFzZL8MF5O/B2XN1KEdDCkY1QRB6PuKvy7B0897k
         d6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027735; x=1795632535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        b=FUMic7veVgwTpKt3TJNNkYOU+pzkHUnqRpMc4qcB3qsUA0o+AZfrjWrApQRjoEATWC
         KhbwAc3Vn/4TEaeHpHaOxbq+4Qe0O/LGLkaC7t/11kHSYAgIocMV9Z+4dabqiSBQGZEf
         30RtmNy98HBGAYNn2dYIuWTtxZSVsfMB/8P02vTcIA4aE7muwq8GJARNvzDYC1cyCvb4
         13nunP6A7xhPWuXjUyJhEP/SXfZinFC8LZFYyU7kkrZkaDugj/pg1m42XfHgmcgcxtwL
         WH+AkBGRRnhW30U77ncB/6Kear15/5WlD66ZI2lmu6sQ56Ka2srQwuj2IHQS5FUmqY0f
         h23Q==
X-Forwarded-Encrypted: i=1; AL+hErEOY1czgoRBC1T1CIJeFktlSpMwhM0YNZyJhaxusK8DAQA4Xf4XUdF7y7VpoS4s6t0PfE6+woyYDO1yYkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z93FFaQJ7eY9ipDxSXVvsDDKaXeILZfOiXydwsRouU7Y6WLBQhj
	EA3WQIaOdLtz6Y5Ly2x5h7EdyDFgQlb+rx51wAuVrZqowHPC4M/wxi2Fjx+tdshl/X7YuWJPsox
	CWKqJRLWfXK7cnqH3wXwraM+FLDYQ91rjnPzvykTV
X-Gm-Gg: AZFdTZckBK9JcAip4P5ivls1jAhcYjiuFaL0IQnaZ5t4adzwecIOtuR/DF3HJUl/gdO
	N0lNm77kuNzV1KuIYCRKgsFXxpUefMSg/HZKw8ND0ukjM/441U06unuNudldZWPy4hy6FqfMFtC
	7Xnq0lkmmpRW0Dkta+c7+EKVf9uL3F5lSB7Rhh9Z7hoklHoRxNmoqr4CtLYxR6ra9rz+z8b5LuJ
	B36srixBqJ0L8icKEIRsLYXKurLBW5nvSXEpqDGcNhrwJ021rXIWKERMptsX/5Ybc/4KAvuW/6a
	IuoWH3LdcfzWOIOeuk5+tV9kPYqV9f+KZnQt+noex8aqKtq0TpmH76TqYsxEMZFaZbQ1U+TF6L7
	WZ+bBwQe6MRAFMmFfA8BDFwQkoaIryhy16ejkjbf8wvoGyMygu8QeZ0XfX88+Of/C8R+/Ukh8HI
	pD72AoQ5hu0dFqTacrnX60QHPEvSDjdOjc7HpwOEcJGzEaRvO9cx+KS58AO8zKJEcO87qkUEyAI
	PBEBwqhmnMg/l+qkV9zlHVi8nNNXSvmbEW37A==
X-Received: by 2002:a05:6000:41c9:b0:4a3:777a:a964 with SMTP id
 ffacd0b85a97d-4a62d6d4875mr7842462f8f.0.1795027734320; Wed, 18 Nov 2026
 10:48:54 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Nov 2026 10:48:43 -0800
X-Gm-Features: Aa3M54qO-h-RtjaPnh7QVBF5Y0JJtJj8eYAtLacwVWO8_kUzOdD5vosJqDSsgHo
Message-ID: <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.

Do you have a link to a bug filed against llvm?

> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,

I've never heard of function merging (in clang). I've heard of
-Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
default, implicitly?
https://github.com/ClangBuiltLinux/linux/issues/1598

> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5aac6f1b011e..17b7ac3afbc4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -622,6 +622,7 @@ KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
>                     -Csymbol-mangling-version=3Dv0 \
>                     -Crelocation-model=3Dstatic \
>                     -Zfunction-sections=3Dn \
> +                   -Zmerge-functions=3Ddisabled \
>                     -Wclippy::float_arithmetic
>  KBUILD_RUSTFLAGS_OPTION_CHKS :=3D
>
> @@ -1136,8 +1137,7 @@ endif
>  ifdef CONFIG_RUST
>         # Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST s=
elects
>         # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
> -       # Disable function merging as LLVM incorrectly merges functions w=
ith different KCFI types.
> -       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normali=
ze-integers -Zmerge-functions=3Ddisabled
> +       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normali=
ze-integers
>         KBUILD_RUSTFLAGS +=3D $(RUSTC_FLAGS_CFI)
>         export RUSTC_FLAGS_CFI
>  endif
>
> ---
> base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
> change-id: 20261117-rust-merge-functions-9ccbc0516df5
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>


--=20
Thanks,
~Nick Desaulniers
