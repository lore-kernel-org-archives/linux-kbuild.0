Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002775;
	b=2JbO+F0K1qsvEkN3vHshnVj70z8XfsJaDhEjb5gnsTOPgHvh8dWV8H80OA6+g0IWPzIn
	 BIF/PkA6sBYEhit8NKIvlUn8t6Vh8ji15yeynRk3okCaimINvHx8hoAuCEJlOEFcjszsT
	 xK9ff1F42S3ydHAKcb+t7TFcPJkoV9JdTLr0afCHK3cAW8X4T+OoWeEMJwtQkWaKPdyrQ
	 8vZEDhR6CR4se7MomL7yGp2sJ5TDC6abT9W/tzVYtmMMK5/2kt301xyGV+sl0VHxg2Lkt
	 zgGKtF9cp0XYM9AK+RfUB792QZLjR65yni1t+6svzdgmwrCyvgZYNktTOruny4TqfPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
	b=0QEr+ypISqhjMuMrTzXW+kR3z/pDVutEyV6L69tp4lLSrpr/SM/ZPFPRu71aNCewnKvS
	 JhUikU2culfIuU5hDRM2CsRHBrq+L4BSu7NiL/leftY19iM4rXYZuSMLHtVPIeY55STXh
	 jD3JgcuOprW3Rq8DjKwzxpMQkEsJwx/2krDEC84z2bOhAGVFCgFtsT/WVtagM58ZewO4h
	 3igNUGQkwSeqv6UIIqjNzmxfwuBbAOElD7spmfV2J5t5/6Y/AQpaUtmTQZekp4R8PhF56
	 Ax1n6y5DkGLBlYwr+rRT+VlkNfpRsgCbqZfHl/c1WRoJPnNtsp5FViVTYQx7x5Z/fzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5O1YFgV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6264C606A32C
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 11:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6264C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5O1YFgV
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e09aa5264so447252f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 03:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002773; cv=none;
        d=google.com; s=arc-20260327;
        b=pTekun5p25pVVmm075iRAYYDEwbIKq6nxNJ1mieHl7dRl0jI1BBzK8pRSbBrvGbCio
         Uakd63/L52JJZa8mO4SQ348nRPxIwyAHTRPXvxUtbBP6ykX/g800GBxjKL9CmAiq2Slg
         jpfLGUqfZgkqMGUeVs0QL6P9DRgYuGdYSsU+WA7oGGgLSRbGBtCz4YClFagSFN5fE7GE
         dOmnnkJKCZb3M0xacGF0Ql7385BWqw3IAvHdIwnK+UDh8lGXcIijt1Cy5YXMDvVHU0HS
         A2MyMeFOtz+KRGwr6fKhO2by6WxgAks5UhSU1NURAWe12fTVDWsOZdiiQowbXK+rxaU/
         qk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        fh=4Jq42j8/vqhVy2J5ahY/WRhdrItS/4lbfjYEal6J9ss=;
        b=Aobo1+k8yIZoG4Rhgs2b2ZDAhBosN8F5Vuta7TrnhMhKNF3AXete4jWtDuyc1N8jTw
         vHUcEpNmgv6OVoqR8pmc4XuVM2qGLXGKj/UIDfCBdhKO+gk9CF+j6mhsghCLAircGmHX
         dtTzFzX3+tqb3JO8hDlIJoKc7Xn/NrsTg+c1WkGp4bni2Kr2yiEWl62XZtN+rQCv7yLI
         RBxFBNPXrvRqW7OpB/L212HiUrTqKpCEk2jhbKTs3UJ2v7PHqJP3UqQuEw4yJmDSp6/c
         Y2aETNjjxGiRs7Ng4uccubEXt8H08UJ8EvlRV6ZxPHGj5yR5yn3HdIop4myIxlxlbseU
         c1+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002773; x=1795607573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        b=e5O1YFgVRV5ukFJdMUpqscp7b4nWgoG1SlTnydT8WNraL5M24baxJfaf1SsX4Jnppx
         7hjVczj49PUmm+DKVG37TuG3QKDMrBLoaR/ZWk0Nvmo6V7XpXLLONKz9hgUOGmjdkedg
         kr9f9PizDYLmDSGTi2uAPBf5G2zixwONqa5bdcYfUJ6DiNcOGkJ2BIQ1KpxNrQDYewkH
         zY6I8/KKfpViBPfn3WPnzdzLxfFuUatkDgdcFcVPDCNwCaTAd5dTxwkiY5pafpWyT4+q
         UPPTSDk05TSOtR3J9lyYNYsuSjH+3+hCyY3YmqpWvxkBtWcY5IN6h2ZECTs/aondEb+E
         MvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002773; x=1795607573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuiSGVlrKGpkb2IYU7v/zhYyv1xq0dvV6f+0akTmk4E=;
        b=b5QPWi1ptzIa/tu05l1bRsamdPecehmLMZrFA7odkTMEs/yE+Fod+8lLzwlRhZFAcp
         mGhfR9+KbJiH0NDOyVzE2ISv86Rark3gS0XWwh/ifntV67XLC8tEHEt99Ho9bSsx9Xv1
         aFYZNoMg9vfV9yMQSH6Dys8dk+0Fi7hlSZbbs3I3RPVnaKMBGMlghC2BQJvaOfJem6Cm
         aIHx9ylWTrJgctFI4ei1aqpaVhzjNqd/pOARfsm2M6lE7C9r1FAVkSDpU68v/D0SBqag
         pk7jGE2v3+B51LjAAA++EJVFhxabrNy2umBjBwnUWP/2v1QI+n70w4F3VAY3xHM38u0/
         nI2Q==
X-Forwarded-Encrypted: i=1; AL+hErF9aHydfCAx6uE2dBa3oP4RRUMSgLx0Nd6+CLLVFOUV9iReH78HoWWeHcVXMW69v66KbY21ugxvKbJZ+GY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P8xPJmCertsoC/WQchVbAPA/RXSJlM1+9o+11ADIRZNm8B26g
	vDySFmNywWBrApHUxKxU8QAIg0mzIJHWt8SStiTNSIypLULFc905x0CNhYzKklTp5N7UKrpB073
	hpfYrDkuv2Yl04CttePUBSY2Upo/+y2ug9MVUKb33
X-Gm-Gg: AYBFou3CgxHZZaq7BZYFm/YHWGpmAr/zSuIeatcqTdkb8yb7a6QhzaqiIngogUyWce2
	qzK8olCUW9viFOUTxqenw/7Atua97+EB5YIpVi92EJmErAMkzSiEhV2nWE/yH68mBsHbg9mcT39
	rvMqvwd70sCbK1xIGGdoloyBkuqgqhDjmBD80hVlMxpdblPsvnmNfq4LgLWFluJWa2lfMWrW4dc
	AwTkySyRWgfQfM/Eba/MA5BBHvTG2RyMG6tCYArkteG+CFSAwL7bhEuoh4/b2FimNm7RQ1viuhH
	fu/lp2aQbcmrmZzjE7UX2IuhceuMjx65Uo5ocGwF1mBWZaGq+HK9n4xwOtKKSwZ5+HilRTQs39R
	UtOW/+gaoOrp0W5RxyeR7BzsXCUymmnljrrX5ckwr69R3cwFBuWh7Zy9jhkwflh3NEDprQUIC4I
	6l8MDfGHNiV7EYqXoc0VcOwgO3r9bBTZoEcZvt0xvf7sqWJSx2tUpyKA5Z+Z5cDLbfVQ==
X-Received: by 2002:a05:600c:a303:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4bb7da13acdmr37565995e9.6.1795002772260; Wed, 18 Nov 2026
 03:52:52 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
 <avy_9SPRaPSKD8b4@google.com> <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
In-Reply-To: <DMYASURCURHG.2Z417FHDGBR5F@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 12:52:39 +0100
X-Gm-Features: Aa3M54rk28vpmTCa3HDqQLECd8XwI0zPt6LHL51Y7EEk1gBPhG59tDP6nvzdrww
Message-ID: <CAH5fLggQ=N5D3DyCHJyLMB11XEyJF2eVBndYwwktLVeVfyOJpA@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Nov 17, 2026 at 8:58 PM GMT, Alice Ryhl wrote:
> > On Fri, Aug 21, 2026 at 11:20:18AM +0200, Miguel Ojeda wrote:
> >> On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@go=
ogle.com> wrote:
> >> >
> >> > The LLVM fix itself is trivial, and it looks like a pull request for
> >> > it already exists. I assume we'll want to drop this flag for fixed
> >> > LLVM versions when they're available.
> >>
> >> I will link it in the commit message when I pick it up soon -- already
> >> did in https://github.com/Rust-for-Linux/linux/issues/1132.
> >>
> >> I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/=
issues/2.
> >>
> >> The `-Zmerge-functions` flag is internal but has been there since Rust
> >> 1.34.0 in upstream commit:
> >>
> >>   b91d211b4030 ("Add a target option "merge-functions" taking values
> >> in ("disabled", "trampolines", or "aliases (the default)) to allow
> >> targets to opt out of the MergeFunctions LLVM pass. Also add a
> >> corresponding -Z option with the same name and values.")
> >>
> >> so that should be fine, but I will ping upstream Rust so that they are
> >> aware we are using it.
> >>
> >> And, yeah, agreed, we probably should remove the flag conditionally
> >> later on, to confirm the bug is gone etc.
> >
> > Function merging should also be disabled with gendwarfksyms. It causes
> > faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> > incorrectly causes the former to get the CRC of the latter.
>
> Do we not want merging at all, or only when the types are not going to ma=
tch up?
> If somehow the KCFI type metadata is always emitted, will two functions w=
ith the
> same KCFI type metadata be mergeable for gendwarfksyms purpose?

In principle merging would be ok if the gendwarfksyms CRCs are the
same. I think that if KCFI hashes match, then the gendwarfksyms CRCs
are quite likely to be the same too, but I don't think it's a hard
guarantee.

After all, for a pointer to struct argument, the KCFI hash depends
only on the struct name, whereas gendwarfksym CRC also looks at its
fields.


Alice
