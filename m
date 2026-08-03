Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B89402443
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758984; cv=pass; b=YsSDEvL3qv07OV4Y9UHAntsrYr8JKr92BzzC73zkT0xfOZZSqCWrHLH7pUGfTGVB2muL3tlCMzNoYyj7gkZK54rXIA0DbVCMO0QH3pmy/bPiSXLcgs6U76xqeonibIFXE6iXcU8IV5Lp0cbV2UsfFbBZpG3fzNITSK1ctUsbwvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758984; c=relaxed/simple;
	bh=ep3vF8Mbkzr+lbr3sbVY3QC2FXyStMB2rm6Ia4oojgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FRLVG8dyGGVtx0SZ0W440wnt0+sQBj+jLIYNuw27pSTMA+B5gmZojOJ/wx2dW7uDotVPZsZJlbeDiXwJmaqEPE0S4qCet5UOYlkWVfMgPDjqzwnQOgpkAVcHQggdD8ChBogNAfWqXL3uX1TM1IFI8Dxc40gmvXmM6SMMPbDRdNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCWZABwf; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCWZABwf"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cecc8a3dbfso3463705ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2026 05:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785758978; cv=none;
        d=google.com; s=arc-20260327;
        b=mOytM6KxRAtewy8Fn/OmPA3QV5jUljkUGkLlCucZUzLsglEt+Sc90AXvUwMfor5xHs
         0P7WBpiuCdJ/ljvbQWxv9KyR/+GSWTlZzLFap82XrCL33PyuVuTH56RN1o91gB3frPAW
         cprCp8tGDT5j0C1myST5b+WO0JNQNlNJVdgH8TmBFom1vE8KNucVJVErKi18H1uYizDe
         Zw5n0LLO8aak65s6p7EhgwDa+uZidX8lluglYQNHnRo+W0403QQa+iAIlqCO3wOFcFKI
         JrC2P0NUzsSFS+YOKAIRCnBqxHjMgJAkJyoJgLbQ3LhI4TrUfMHKQZKr/1vNb2kRrZ1S
         UYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KYvlSgun/krf0XEv53304y0w7MM8kxAVccYbDVtczSs=;
        fh=19enDKlHhDUoFRuTp/spWiQfwHpJ59fwOs2hAD8xdlM=;
        b=TRtX0QS/L9FGDSeGVhz9LDT+kPIAhZ0MRhgzJUGIpfzpRslbkQcmgAtyYMeIx8W3WR
         BpytlxC9RLRmO2/+PoOWdgZIb8D14RL71KEJckeM5M6wyI6Yfp1DnBTL4nlWhRdvOLAf
         1xflBTJoXJ9h5mgGz907Od5lkxCnUYOgmrzppXPES/Mc8WkuQQdEJWvTHgawYmSrp5j9
         7LF6nEs+ehhJdJ/p5C8DJ9G9ve4diApTA0t6meDlbKyNssvfsCJ8DTkbpGHflZn1c4j8
         wZXg7AXW1uCDYdsB33rkPukAGrRu8JpTr0Z0mi3eRt1I8PRsvx9g3x8T2l3taOqbNhhZ
         Zx/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785758978; x=1786363778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYvlSgun/krf0XEv53304y0w7MM8kxAVccYbDVtczSs=;
        b=oCWZABwfN1vpLmrBHTrEiQZOPnhDw9DCnpXLQXN9RJI36h8XuujJQYg/l9ct+QOkTd
         ScGrbHs9isjBgWacqHwBAKxwnrHnc5Amc1isWl6DPwgomo0Fmbsp/aSysauhGy+bWNJr
         pbc0GQEVjtx3564FnbZr2zmJyX+xShdGqRM3nATP2Fx/q83ZL48IVwyuo85r9zpN+e7M
         BW8orulrT2tZuQPZ6KknnICZtEKhuw5WVEXllRLKK/uR7cwInZ+WiuD4IY2FceU2LnCt
         ashE/qrQ/7vSlpsT8etftFz922QRLa3RqTFyCV3SNjVAsL4SV0w2dUzCHLB3IQfWa1y+
         UY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758978; x=1786363778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYvlSgun/krf0XEv53304y0w7MM8kxAVccYbDVtczSs=;
        b=VYQ9v0s8Cm7fTYUr/bL4w6O05DySMfJHbAEKuy4WIH5MGr0CsTR+7JQOAkVTTSGSNa
         C/uoP/TQGsKqK6d5bdgIYM8SypIpq4sXkq7S2L1qyIkZ6lTET1rRNGUbJtNdsj0FRJvg
         6PGLFWKgks3x+MiBaqzT1dusLH13gu6FJ83wOuB/SfhKJhYGZw5KHX3xI/+c+2Lyankw
         fMCWcWInhoyVBA7WWYsP9ZZ5PcpEZS9tTLpXYCbqg383Kb6YM/KWgyR5TOPS8cQmF1oW
         qLBqVmHoCiBX2dOtE211c9FdooCx1lqGUbothuU5tbr9LHAwwRtsL0/7LOIK3JIkTPCL
         Y7yg==
X-Forwarded-Encrypted: i=1; AHgh+RqJR1htvJ70eyN7u6IQqoHwmRWTvndMDHzi3W8W6VoRGQSYFPQpXvZpBcjx4SsgkN+hlXlczMKdyq6GJ8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwACvzw+y9TMYJ85Kp6bKM4zCsE2KNIYRagsBODigEkPorys2Gg
	fMqfp6///oMpnVay1n+mj5LpCvDFBugEyAEr+3sjKxolJU51KGw822DFnvvdVQnbfYSChqccLgU
	AHgxi5r0TxHKwliBXjUXu2yp/4iinbQ0=
X-Gm-Gg: AR+sD11oYRiSMzkZUVz3NhDtOQSw6cKKosCCadBRyJhwm4Xb70gJ1cCM1cUkhxymgTn
	WQebEXAsHAurovOnjVWV9GWKaFBQklFw3MquGH0e3ZlFBXGHODrZQWgZ3c2j+xOjFoKT1TDf921
	moeHSsgRwi6MGmJybqvGmk4HNFzN43WIXDLz8Ea5Jm/V3QFijjoDS3hgCuOOQIqsC1IDDKQK2Xg
	T39ACN4q635V+hEgrGomk7/w+kiaR05yb8LQAcW90jnux+lqfCV04RDxAYedjC3wlal0E4sPHCF
	4H6LeuHjWvrEJbMPJeCWz09a0p8Oe1xW7ZcOtiF7eNP3yAWJSYXc9EkR0+nn7lUNzKvw+zBsXUG
	LlA6LBIWFfSoZpjV/3Qf3rrVPWhYYOhPd2KAzIVVTm5PccjBqXaw7IFVxU4F1
X-Received: by 2002:a17:902:f78b:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d05206277emr130951385ad.0.1785758978283; Mon, 03 Aug 2026
 05:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719120514.159914-1-ojeda@kernel.org>
In-Reply-To: <20260719120514.159914-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 14:09:25 +0200
X-Gm-Features: AUfX_mz-OsXg_HyB7KA1Tp5Ta2A0vKekPzs4v9Me9KUIubg4UUzCvsvRYoLNjEw
Message-ID: <CANiq72mKE66OthZ7hEfxqig7+9ePmdv+xSWQ4uMSZDhW-qt8DA@mail.gmail.com>
Subject: Re: [PATCH] rust: rust_is_available: warn for `bindgen` < 0.72.1 &&
 libclang >= 22
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Burak Emir <burak.emir@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 2:05=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with LLVM 22, `clang_getTypeDeclaration()` may return a forward
> declaration instead of the type definition. This made `bindgen` generate
> opaque types [1][2], which in turn made us fail with e.g.
>
>     error[E0609]: no field `__bindgen_anon_1` on type `bindings::kernel_p=
aram`
>       --> rust/kernel/module_param.rs:78:46
>        |
>     78 |         let container =3D unsafe { &*((*param).__bindgen_anon_1.=
arg.cast::<SetOnce<T>>()) };
>        |                                              ^^^^^^^^^^^^^^^^ un=
known field
>        |
>        =3D note: available field is: `_address`
>
> This was fixed in `bindgen` 0.72.1 [3].
>
> In order to clarify what is going on and avoid confusion [4][5], add
> a warning to `rust_is_available.sh` about it when the versions match,
> similar to past warnings like the one removed in:
>
>   commit ae64324ad5c1 ("rust: rust_is_available: remove warning for `bind=
gen` < 0.69.5 && libclang >=3D 19.1")
>
> In addition, even if the versions match, check if the issue appears to
> not reproduce with the given binaries, to avoid a warning in such a case.
>
> Finally, include tests.
>
> Link: https://github.com/rust-lang/rust-bindgen/issues/3264 [1]
> Link: https://github.com/Rust-for-Linux/linux/issues/353 [2] # "Missing f=
ields in nested class with LLVM 22."
> Link: https://github.com/rust-lang/rust-bindgen/pull/3278 [3]
> Reported-by: Burak Emir <burak.emir@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1247 [4]
> Link: https://lore.kernel.org/rust-for-linux/CABwQupNfMAJOGqRM9ke6tj4f53d=
CCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com/ [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Nathan, in parallel, updated the instructions of the LLVM+Rust
      kernel.org toolchains [6] so that `--version` is not passed to
      `cargo` for `bindgen`, and thus the latest `bindgen` is installed
      by default, which should help to avoid some of these situations.

      Thanks!

        - Miguel ]

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).
    Link: https://mirrors.edge.kernel.org/pub/tools/llvm/rust/ [6]

Cheers,
Miguel
