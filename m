Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896322;
	b=CGGUEuhKOsUJbyXnLXJdfLyPTS9g3+L5JpxzgO28RAOMq9p9iPN2vIPJMs6UJ+EzVjEn
	 NMgK2vaOc5NOHJO7KwY7fjw5OXOeHU+c4wgXVBD90t0YDGqWEy3p5bjxLH88uMg1E1U1v
	 ad0TR2bMmLOC0477ZmLn4WlfErCb74TQdsCBBPxt4luCw+nBvlpB6j0HOWDZQEoRzgpsd
	 3AWyGbQZOhANmrSrjGM21CxmIXdeM8oTVRmWPLiyVKNmkkzq2IedFLOI6ao9qn9h8i8Qo
	 WpuZIBz8PlZ4tYXlXGwo85LPZeyms63g3XOketh2+Z9uOEM9phvKwj2VJdQ5opjFgWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
	b=d2cwV/NQlYn8lOEzgxg2GtJC18XflwkDX7IWhpQ3v6Hvm6pEf52TiE73oIT2kuw2YmUS
	 zUqVtfSqW6UkDMNP7q4XKZmmnBxFIFhDJFU8JAr331+wkz7TZP8gny770QRSF8kxgDr0f
	 WvqRjWusC6DrSIPgsHAEVjfm8kbs40bEQ2qW40Waf5ZtAZs/ul0KX2vsW+UCAxKYqW8DG
	 NSkDRXUsyVZfVx3pcFuwqLf85qfUmD1bCC8bblSbNLHzY66cRkDDu0xeXT/qfzLLqAUmR
	 vTtoC2Ze5dUJhyZTOT4ZlmwiuT9MnRJPeCdBCEK8r8ehE104dabmuhGSaA+ytbLiT0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gZvk6KC2;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67C60726CE
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 16:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C67C60726CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gZvk6KC2
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a49a022221so17072501fa.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793896320; x=1794501120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
        b=gZvk6KC2rnZpOIfxKNFcauYUGt4VVht1Tt/Uy7M6JU17l4yjFIm5fGPwFZXu36kSll
         8omj+AiJ7F65AEbWyteTFa4YDHY556jCTfMUAk70Ij6ZvgTD2ZM8F9MsNNpev9jCOG4L
         VWTcwcP5ny0vs3syTRCdm2ufqDq/5JOZizj3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896320; x=1794501120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
        b=k7h7Bh+i+eOydg+EviIEq7uGQzHVQhSKvDr+5UTx/I/Vp0ubKi+l7snPmWV2wQ0uly
         LaPoCkYaVYOZM5npXxBFBJ67Z6IgQH9mBM2N7iUoJEvU5v6EeXQvvM+CXvGB0myD12+M
         2qEGqxepcLf21zu0U3umYLAWSuez5MY1scGDPqqyE0nzwlPfwj8Ldrnzq1rF96hcKvD3
         1wwPKXNcYHat0tqP96A2gx53LOsXb9yAJfKGdJTKwrf33IX5hLS2ZEOr8BLtOFzZaqEQ
         3DZ1j+hjht5iFdRqT5lZ5loEtiznuDq24uOlEtvaYpNU5mXo5Ow5/9w0dbEIm062D1Uw
         MlIA==
X-Forwarded-Encrypted: i=1; AKwUvBw/67y39NQ5jXsqnDo0FxIf+OcbqKEQJh6hCmVJ0HIIq/cuJwY0aJPYHiDgI6V7PxbRG1Nubsd7JMLDRd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ict8S7LU2vWcV/ItJCDbuyQ/cQsMIp6Y+f1nBP2x1UHW8LLi1
	w+Q9bDiEDo+k0i5kumQU5SXJf4W3myhYs9QCUlw9J0zavz9g+ZoZiaUZeCT5vsQ9UkLg/0M2PpK
	aaTn/yOOz
X-Gm-Gg: AYBFou1IqSE3TCezVfc1s+/Ady2XM/PrqeOKhqIFKt40MLXwyCZocb/HEPfm1aUC6oW
	OiPKWvGQOZMy2DIJHQnU5C2wHzeyf3XjMjddEQknJ9aoo0meISB+/JIa9QtV9IP8Rdp7IefvWs4
	F+n3WeMke5vJwMh1Fu4L3ly9o+KeQqhF6AUsVOTQ+sIJ0VSQyfdsKm3oEVBiu8GdX4XstqxbXe5
	HEH/GofF1QppSeRLBbtOzkN4W1A9BSuNOhHVo0ryz1Entw8emRMyidQ+Nujdk/Z5MYG//iPur+k
	0lIKQo080QN11/R2mSMz0ETO9gliOBt24RXxHIhKSSwjF51ssXo7EIP/5+6IZ+R69pjwx8ACZFJ
	wvIOBcw60gG3gMShkaySlQUbXQHNpElsvUHNC/p2uqv9RYvChVUq30G9nRHOLCYIjBTZbgJC96m
	60m5PXMuJDFs9bklwAq95Dv70UmYUoI5QvYEFEYjUdMGOuZL4tY2PUt1lq86OmMUpqwLNcNrOVe
	UlP9xt3xS+oV5ZfuDj1GMDocg64cBMn7ZIQbluJF75flEoMb3DfE3fy+G/l+kVOEB6k3JxSTIOv
	8wtowJov0+R283wyJdFzeGkaitFfjRTJGAQGUf0tRgiIeL/RQRixihpebBrjWViH8UC/H4I=
X-Received: by 2002:a05:651c:154c:b0:3a6:4a45:df84 with SMTP id 38308e7fff4ca-3acb79606d1mr50180661fa.1.1793896320317;
        Thu, 05 Nov 2026 08:32:00 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e3872sm11815161fa.30.2026.11.05.08.31.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:31:58 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso25822681fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 08:31:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzRuMxSVmUnkKb64i+jFbcJ7Twd2IASq4QsMWN3MY7PWjZdURbHHBVQQYOhdd5bPcafZ88hhP2kN3dkR6Y=@vger.kernel.org
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id
 5b1f17b1804b1-4acaae665a6mr332973265e9.13.1793895857514; Thu, 05 Nov 2026
 08:24:17 -0800 (PST)
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
 <20261105052401.GA862715@ax162>
In-Reply-To: <20261105052401.GA862715@ax162>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 08:24:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
X-Gm-Features: AclHuK8NKe2Ice8G3ieACvjOY5cRy1bgQZ2ikhne4c6q9f8t2mnwrvferc3g3-I
Message-ID: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
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

Hi Nathan,

On Wed, Nov 4, 2026 at 9:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> > From: Han Wang <nesthanwang@google.com>
> >
> > AutoFDO profiles are commonly collected on one kernel revision and
> > reused across subsequent commits or stable merges before a fresh
> > profile is generated. While AutoFDO uses function-relative line
> > numbers to tolerate edits above a function, adding or removing lines
> > inside a function (or an inlined helper) shifts all subsequent
> > relative line offsets within that function. Without stale profile
> > salvaging, shifted callsites fail to match their nested inlinee
> > profiles in SampleProfileLoader (dropping profile-guided inlining for
> > those callees) and basic block sample counts are misattributed to the
> > wrong instructions, degrading branch probability estimation and
> > machine function splitting.
> >
> > Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> > since LLVM 17) for C, Rust, and ThinLTO builds when
> > CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatcher
> > to use lexical callsite anchors within functions to fuzzy-match and
> > remap shifted line offsets when querying the profile.
> >
> > While -salvage-stale-profile is not enabled by default in LLVM due to
> > the minor compile-time/memory cost of sequence-matching callsite
> > anchors (which is unnecessary when profiles are freshly generated on
> > the exact commit being built) and the heuristic nature of fuzzy
> > matching on heavily rewritten functions, enabling it makes sense for
> > the kernel: hardware PMU profiles are rarely regenerated on every
> > commit, and anchoring on callsite names is strictly more resilient
> > than blind line-offset lookup when functions are edited.
> >
> > As a side benefit, remapping shifted line offsets also avoids feeding
> > mismatched weights from stale profiles into MIRProfileLoader's flow
> > inference solver (applyFlowInference), working around a compiler bug
> > [1] where a small intra-function line shift (such as in
> > __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> > spend 30+ minutes compiling unmap_page_range().
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> > Signed-off-by: Han Wang <nesthanwang@google.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Much of the commit-message justification here is AI-generated. Sorry!
> > :( Folks who know better, feel free to call bullshit.
>
> The justification does not seem wrong to me on initial read but it
> definitely feels like the first and third paragraphs could be reduced in
> verbosity since this can basically be summarized by "AutoFDO profiles
> are often reused, which can be problematic without profile salvaging
> enabled, which is designed for this exact situation".

Happy to reword or happy for upstream maintainers to reword themselves
when landing. If you want a v2 sent with shorter wording, let me know.

FWIW, I actually asked the AI to add some of this text. Specifically,
I felt it was important to explain why LLVM would not make this the
default behavior but why it was still the correct behavior for the
kernel. ;-)


> > Honestly, this patch came about because of AI analysis compiles taking
> > 30 minutes to run (see the clang bug [1]). It seems to work around the
> > problem. Obviously, we should fix the compiler. That being said, upon
> > further analysis it seemed like adding this flag was beneficial
> > anyway, so I'm posting it upstream. If folks disagree, we can simply
> > drop this patch.
>
> I would definitely like to see that issue triaged but like you say, it
> probably does not need to done before this is merged since it has
> reasonable justification on its own. I would love to get thoughts from
> other folks though.

Sounds good. Thanks for looking. Let's see what others say. :-)

-Doug
