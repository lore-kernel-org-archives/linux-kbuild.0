Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914593;
	b=N9SweUEK4QToNR7q7i/OyMSnDTYlvWj5hSaswck3hLrpLXsYztPMd2P4DIM9LJd/coSB
	 7+kD0kLlbrHll8klVQIJiBxp4A02nJ0rXzM2WmDpyZuuMz5xvunQ6u5dztMX2c85gcjKS
	 r3SPLnjzXI77qdAiaP730WagtyFWW+BofBsq3Z8X4Af1fLRhYqiXmwJPDMawNmBodS7kZ
	 lmWGJDjmlLCb+D07beST606tOG48ThddNPGAsgabZGJtp1JcYKy/jSzeEdlBNCZl3/K0R
	 kmu3/97YdFDjoWe2YPtfNjlDmaOriIwtZrc1UURX1FVloDhdhoAvlJTqCd2bxmAL5Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
	b=LTIQ3RAI4pnNnx084wYvsGU2dHWj25vUUFQIzkNchADSEoUlteBcckdE1/hKGNoFVBA6
	 8GdlJCvFlT6JrET1VayyPv6IHtI8V7JvW4JaSnw3L0EtiY2igF8T2XFKrXXeX/r+JMY9z
	 pjX3EO2eBkXxiG4m8DtRweYo7xQGLR6m49YJBxeU+5mZZ1jIjDIlY9IK6p7BZCzVyQ9bn
	 XCTWX3q1CTL+muj20SqwIUflNkuRZymPbIAhvQu02nUfjn8EAbMUPxwslo+TGMw1QwFiK
	 1wNHaJLeCS7WNYIhPJS+CvFvIio6SgzirFLttY3IWbjRbASqcCbFXBMXkT1CMXu+Wsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ek2jy3ku;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACFE606A31B
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 21:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ek2jy3ku
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3583040a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 13:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793914592; x=1794519392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
        b=ek2jy3kuxQm0zM2mcOgiSOQea91lUIvS4Uwajx4yySotER6+0xdrYqSUcsAK3dvuS1
         f1nQ62Hpe+h8FI/+KuWk3WhskS79mm3yKyYQCn5DhmUDoD0Kbl5R2l5SeHvgfwcBUB+h
         t9TtRlQzxqGVWNlW1B/x93Ff4y+TZ+ePogN4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914592; x=1794519392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
        b=FVx0n6QBmbKtor3sohZdGJFL1N7YEhkr75UgkvsB1IS8/IApofvFwoBhm53eMNxkag
         6h8Ll3WPCe1yDx7XrPzX6KaRXDSzWWzRy04W3CQrTgJz6+UoubSEkYG87Wd++FuKIC2L
         8iMnK+WY8aHxiN/zpUb0ZOcKmOZxpBHGiD8rLZeGP5xyMYviLxN/T/d6480ATVBae0Jg
         5i+9gilt+xCVSii9lngYi8mscc3hxLSmdOVPf2n40ijm7QaIXjDQovHcbpUx/wB0AqtL
         nYKIXnG8R7kMotPdVE4LUbppl0O1c9ed266HWpwQ97/iwtl2hE4RCu70386+C9wq1Vg8
         yPRA==
X-Forwarded-Encrypted: i=1; AKwUvByx3pDUDKCk5cyyYIGlipLzgurhzubtrJSWxkItLUNthrN9GeJZqdZjcfIu9O90kCbK6HLnvbQk+GS3O6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MOPkQ75q4BMcjN5OTy1Uo7D3tMY8kv4mXnthbmshDVcUO+k8u
	IX45sDEj6AneskdEXoHWvgvdL3hE1SJ74QD3yaNAESPY5Z3GTOxKmKrRyDMC4wHeDAjbYEQrWEM
	G1dCGFJaC
X-Gm-Gg: AYBFou3R5gp9gpBd2XM3j//v8Oy2+TKnsfoLaZs9nG3S/vh8XN9Pioe4DHIOZ1jxwQB
	I8/BxznBzF/I8MKtK4bLxO0UvK7UHt2+cIyJcSp6LBiIkwcADftMJo5rPo96Uv7fAbojSVug7gg
	9+8JgjvPz6wvCqMhXT8UP8V4Mqc9wlmn6I0H07F8lTAcu+4DrDJhnIoyfIsLZk0pC7NdOz7bw0H
	01pz/l9Ro2GU7lpqEDofIlMVW9TvQ/G7wHgPNCGXFW35GLD4emQVA3KzmuALl7UEZO4b37zxMnx
	/5BpkdgLrdoYrUCpPPyv26MkbO9rrLoytSEYge7u1YbXGDnYCxHvDOC7SwwVxnOPvXuS5083mV4
	SSorgb79c3k/0K0Vkn1ed2bDn1z15t/mugmGeJGuwU7B5tV7UfFxM74xtkFnpdJSoA/Mom67Rte
	ckNlmILfoFfuMdf4g63oPvMP/ZEqQocTxyA9JboIdw9B7vdmps5aCa6KTLjFiUFoOB+Di7Hxp/B
	etg9PbURyBCcQgtAjHLJfedYnZ+PD5kQ16vklMiczEigbMpp8eEF9Ed4RIECuWfJLsjHr0wXkIJ
	6Y4ZSaJjKTHorg1QDUE7jYwiolus00X52KMXsJumqn/6iMEu9dKtTUKV8md7OZ+PSDRq
X-Received: by 2002:a05:6402:3888:b0:6b1:c355:c7c0 with SMTP id 4fb4d7f45d1cf-6b5977d7840mr357639a12.26.1793914591710;
        Thu, 05 Nov 2026 13:36:31 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd3da7sm2228122a12.1.2026.11.05.13.36.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:36:30 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso14555f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 13:36:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByDy7j/k+ynW1Ec43zbUpxh08YpwtXCFPItyPIQpYWP3xX01xhwOUhyAadofds96QtB5JlWA0EFghotWrU=@vger.kernel.org
X-Received: by 2002:a05:6000:385:b0:492:b1c5:6db4 with SMTP id
 ffacd0b85a97d-492b1c56de6mr417579f8f.26.1793914590008; Thu, 05 Nov 2026
 13:36:30 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
In-Reply-To: <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 13:36:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbBPOmuHZBuQVPQeA876CA7y79rGc4SL43e+At2+nMMw@mail.gmail.com>
X-Gm-Features: AclHuK_BAv4LnN1aXcM3KqfNxo3MqIMIcKw4DlHvuup3PEDMGIp0DVrOUgx1RpA
Message-ID: <CAD=FV=XbBPOmuHZBuQVPQeA876CA7y79rGc4SL43e+At2+nMMw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 11:47=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 5, 2026 at 2:46=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> >
> > Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> > since LLVM 17) for C, Rust, and ThinLTO builds when
>
> > +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-salvage-stale-profile
>
> I double-checked that the flag was introduced in LLVM 17 as the cover
> letter mentions, and so it is likely fine given the Rust 1.85.0
> compiler (i.e. our minimum) supports LLVM 18 as the minimum major
> version, but if the patch goes ahead in the end, then we should make
> sure it works well with that one (or probably you already did, in
> which case, please ignore this!).

I haven't extensively tested the behavior across many versions of
rust. If you are worried, I guess we could remove the rustflags part
of the change? ...or, of course, we could just fully drop this patch
(and maybe add `-fno-sample-profile-use-profi` instead) ?

-Doug
