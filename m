Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9649892A
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2026 21:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903333; cv=pass; b=HAkWxjvS6Kuc1sFekcN3UDH3htW3W2RPnCRJ9TVVF10MdJ4+3ig1WVE539uxSp1UGBglhpokqpSALReT1bSm0euzVaVYV4aKtKDkaRuEH3s13TKrDvc3DMqlieLBeJ66PnC5QhbVdGElf0wp8YaPEJDX9LWkPx3/Qen5ePZedps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903333; c=relaxed/simple;
	bh=Ih9aNAHPmb3atmae8ogQ3aGNGlgXNmwTkwSV+CuwpQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvzTjO9qleHPaKQxr/RnXU31dyPFAUwDkdZeWQFkXxCZytNEBlAHs9kB8BGt2maLW8cC3cKodOYehZK0XifMVVUvTDmqYqaeu271sw3vSmzwIc010ppVCy/0mw8S0D3TZb6WNHazYBptItzh89hEnuBuMfWqAKowHH+A760WR1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNIOo14D; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNIOo14D"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-399026951a2so729082a91.2
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2026 14:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903332; cv=none;
        d=google.com; s=arc-20260327;
        b=E/6lZaMVxHz+djuC5GlGfuYzch19xH1/zBc2zhFAWkxxK23O8RxZs4QqGe1NzvDPK+
         /BKmHgq9mCi+VCRfajzAanrb4eau8WZwCx4FDoFvcrb+3ikRXMvto7rYTf+DkLA5WCe+
         LvWU1xtaYZz1HdMImSNaI7bT6aVntZ/YO5y0dPWAFxSmYestsf0CF4ZWszlUOV0CNrqE
         3hxZsX2UxEyhEjHLjZwu9is/o5PJw6iKD8uyXMxCxtHdk+zHAHANXBxbSqa9PBFi8Izl
         UbNk/EYeHSHwP0X7Pt8I9elaTRFSFh3lA5/bFcKPVEYdQ+T1rFZ76kw7FYWIe5hfIu/E
         OZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7pAMbndvfBt65mnzcKTzmmfGUDejmm01Bt7ape8n2o=;
        fh=0ZkA6a0mviK2arP+W+urDIM70nGsoJqFhOX6hTGcCC0=;
        b=GxUPtBPJccuFmztvBwkOHV9TMl/0unEqpZHX7/8yaUon6Oy84rAI0iGtQbCHhyK6t2
         sIxF0srhOUXooZjkddmpwd9Fe/6cYFS936SAnaPASaBWEwcmamr/XNCcLhYPXw2wa+s5
         L/37D1HZb4eOklXd2Pvhqwn2wy4xZO5T0LjGN6PEuMiRuldnatPbNPG7KLKfRl+Mhc7D
         6oYa/Zh1MLwydVKHKmLjwaNsnpvNe9PQMm5ECSDiTkiPUnqhsfu+CXUEXmFXxLgdY6TM
         ZrmwGmgJmgZfjyvORN7fDG/l4AZjuHAuRKEGNAVK1Yxiv3SqlFyZSMUBbWrgEnCgATwg
         1cvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903332; x=1789508132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7pAMbndvfBt65mnzcKTzmmfGUDejmm01Bt7ape8n2o=;
        b=PNIOo14D6ouU51DNkiTt5srlB7XYE/62PPRqqou5MG/6n+e6EtZkCIHfExIlKwFrel
         7RORbFMZaVA6IT1kDpimhA2GeufN2VQM67l3HKCuAqsZ6ZoaZStPClnyjgl1XNUmnE8e
         JclOW08sO22tZx1gBn25K9D+BIsPSLI0HCDwt/Dw31drB+04OE9dqNGb1NXEMVKmYvkx
         Nd4THEAOE5lSBHpnw1TYNtx3Ny9DQE8oA8BWmuifldRNeYYz7t5LXYioMqlwiQAWfeAK
         MUjdi36mbH7/dqrES7lxFwtIAhb2NfQXMMZRuvOAczLXnfr2LTL8dVQNustofgoxjfVh
         YvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903332; x=1789508132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7pAMbndvfBt65mnzcKTzmmfGUDejmm01Bt7ape8n2o=;
        b=OKPfuZ4DVYEAzJAxEapmxu0MuJFYK8tAH2+LZEWoruJLIfqLgq4pEZK+STGzgz5rVw
         nf/HV5LnpjM2GCGSMxHktIOVEPQ2Zifw12AECrcwe1TAIsx2LjObidyCvdnVXUbRQRCk
         jd5J0q65limzqRtq2D5KocI/dO+XeQHQejacBYWfC1GY8c10+pvMsPw/6CPeIT9sh17V
         6baPIjqDB8+sYh7iPFXU8s6h/ypgvArZFb4P9aDo4W9Iw83RuVY/KMDacblrJHxrlrk5
         L2vV5x3JdDQeEOWVRoHmExndHEe1aBkwJznHwD5fzZ0pV3uj9SNuaoPfRPEDdyCNCBF/
         Wmkg==
X-Forwarded-Encrypted: i=1; AKwUvBzrCWdxORJj/AbLkUYNj4VYbUovrLZluEpkDquIOWfg9sIWWKZA/B8Ni/eMaXdaZ0/OigkqJ8vr9WXGhis=@vger.kernel.org
X-Gm-Message-State: AFuF++n24bbNWZ+4aGKWN2vtP6JpdakC8PziXgXW11EkDoTaCu52SuBH
	JiLVnheVtW9UU4PtlS1/WwjUJhZML0WIyOjUjWOJd+Nf7bHoeH4pTFA5Lxzw3BGbSlr/Uyvv3RS
	fXL8rLr7/sizD1eOO9gaWJw7QXfabuOA=
X-Gm-Gg: AYBFou3eC0Rn88Mqq5AeLaYMa8sKDAbB2R2Ma1ffmXPEV2UBQL70YGs1uoK7g9g1RgM
	gvNFs/Ye8Es4zPZ9ksSZEDNKoQOqrkxcCE9lctIzmHo8Ua/tGF0jbU9PACt7PXmQPkZUjQgNM3u
	xn5y4sw4Of7PecDTJ9uZqOXF0TPVXXn/YmS2/z73qaHBCP7nnIH1hLvMc6j4nzYW6vCfZT4uCC2
	TsgHtgA5i8xPI9MytRKR2dFlk8H3wlX+dtkMEbz0vsLXxyMh9lXZgztdnTmYsdTjuS5RUvWlw0e
	n8Z07+bzNlONxNDmvAvh+5n9g1hO/oXSfBXb9ds85Ogw7pIN6B822JpVADBDKBNJgzfB472eKe0
	yrPauhxwPyYHfqstnTKwy/ctu3vKFXEL8g8Fy1kVuycbFon5ENYhrS/OR4qfZ7+Nr5m0H+733FN
	zUXw3/A+3G3Gmf1RqVuAban5R3Js7gxorR8uiIO5RxQZhLY+J7RRE=
X-Received: by 2002:a17:90b:3ccf:b0:39b:34ef:3b24 with SMTP id
 98e67ed59e1d1-39b3d5aaa70mr22748600a91.1.1788903331609; Tue, 08 Sep 2026
 14:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908170539.345207-1-ojeda@kernel.org>
In-Reply-To: <20260908170539.345207-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:35:18 +0200
X-Gm-Features: AcwNN1UgNfvavHHRk8c1vcqAAwrO6dRloNQXkFX7IxIu_0dbYHQkxC2fQ8lYnuk
Message-ID: <CANiq72=fEYa1PygH-XJHONQKqf53dZFuGc-Z7wd4M7yeREq8Vw@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `unknown_lints` in generated bindings for
 Rust < 1.88
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 7:06=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Starting with bindgen 0.73.2 [1], `#[allow(unnecessary_transmutes)]`
> are used, even when `--rust-target 1.85` is passed.
>
> However, the lint was introduced in Rust 1.88.0. Thus building with
> older Rust versions warns like:
>
>     error: unknown lint: `unnecessary_transmutes`
>          --> rust/uapi/uapi_generated.rs:26294:13
>           |
>     26294 |     #[allow(unnecessary_transmutes)]
>           |             ^^^^^^^^^^^^^^^^^^^^^^
>           |
>           =3D note: `-D unknown-lints` implied by `-D warnings`
>           =3D help: to override `-D warnings` add `#[allow(unknown_lints)=
]`
>
> Thus allow `unknown_lints` in the generated bindings -- only when buildin=
g
> with older Rust versions.
>
> I have asked upstream if this is intentional [1], i.e. if we are supposed
> to always allow unknown lints in case `bindgen` uses such attributes,
> or whether it is an oversight.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Cc: Emilio Cobos =C3=81lvarez <emilio@crisal.io>
> Link: https://github.com/rust-lang/rust-bindgen/pull/3455 [1]
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied early to `rust-fixes`, but tags still welcome for a day or so -- th=
anks!

    [ Emilio said it wasn't intentional -- we will work around it for now
      on the kernel side. - Miguel ]

    [ Removed the `cfg` for `allow(unnecessary_transmutes)` as suggested by
      Gary. - Miguel ]

Cheers,
Miguel
