Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902996;
	b=a4cZony0rurbm+zXyA/Omh+IzCTPtd7T70tDOwpw1AZcRLxa3G9UjfxGYDCM51nz/kNF
	 WfYG5y/onhDatF6t/CBivD8Xqfo3zBuUnZofiS9tGAXHpD97OC6AlocYbWCFrGfHrayAQ
	 49xpMHGrQjh3qiF3LO3dkITpDzwZHiw95aXXvo70zi3zWyP7x6vyvR4rfw9mxeMy2r0or
	 9kTi5uMWx0y6JL8CPdM1sUJ7QTb2wULJ/repU/P8lINA3VW4XDA39X1DnPgn9uSqyi8Tk
	 KUiA0Ci+eXgEUBSj5aIU/w7lkoLH/88AlS0w7ca7CVSG0iVQBDRo5CDheB/OGWhWA0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
	b=E52wGIuXLH4TRjWklLNSz3ze9bECBdOdrmhljyal2QVpb3EhKonnuypZXfklYuI22aDu
	 4vElZKIiTjBcBFumKndwvu/oY4MaR3uN8CckJpq6vM43GGAKKob5gcw3iaCS0rLt0NlRc
	 RsUhm4vEaWdPJvN2XE2/q8sv388Bl6Wlx6wZbF4YWrEXe2S1Rl5oNVlEUaudXPBh9OthS
	 cR2W3XiQy2L9EvwEWVXYxfnTktmLQl0Pymp7rPmcmXrNnYHxuRrvV7xHOYw+e52bhSaRT
	 oqODSbUftrYJbbjmXfUBnshN9In9QrQHe9kEbog8w9hkKHvM+y4H1dGEL08hWm9FceQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jT/ohXYh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E57A606A329
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 18:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E57A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jT/ohXYh
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso689a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 10:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902994; cv=none;
        d=google.com; s=arc-20260327;
        b=D50LOu4yKy4jIO/G9QMorKpj1WNktjvPZbvhRVHUShcd5ianqyInfsK+rnNJdaQ4Aa
         ZORhxZApZd26qDwdvBA4/8WOXyNlv8/f+tENRb/jxeyRg/mjB0mGkHH43nR6q9xwDXXk
         VeounGjhavVP6KEzSkyt5v9tev13BVwy/5GRK+/wNwEW9GaNwnEryOjAbMSN6UHk74uu
         W5fJNEKV82f0G30ZfAdHCplkHq0S0jetXSs0lyD8DCjg4UNDdlB38R+8hSznSsdM+AZu
         1s5egzvPXJ6wzJy+hajZ58+gjg3XUgENiPdb9kVVFM1GhJOSRC3djsMtsoGQEMvX2oGb
         x+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        fh=yAq629W1WjLZqE5mlT7F4UUjm0ffgHMhEMwMhXQPg5c=;
        b=ppkHfj3RWO+W8IM5Fd4a7B6qB6uJf6DrJarD8BkxBy67hWJImkVGJ1jbBS62/KoMH7
         TWI3THKOYw3868KnzHGrPhePd7pKyJ45/Ip+9D1KXJBjdCC9btatCUiiNAB0iVIbn9+d
         qUAYVSeMq9SROsaVU84hK6oktfxDdsQjj01KmtqzzogqkPiFsHg+VvA8s47nUkVjIesf
         /eO7xkm6bfBOidnx9cj4vWnbVW2MLtCS93HMaXlJatI71KgJSK9WCaQQfHl0bZ1gDRem
         1d2HBTzj6P+iAHcFHZzaEugQy9hZMI4mUwDLb83uuJGemcnpFO5wAsCeEtB6c4yex+80
         49Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793902994; x=1794507794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        b=jT/ohXYhKPurLENgTWdqxeeQP7cstoC8e2GlkuKhpyjND/Mncp4runY2rcEIOPnNj8
         4O/hjV1tEE670ku4p8Jh1u6TQThxTZgrUkcbdyYoiROeKgBO38FcfJV9ZLkQ9sWsqS9h
         i01ljRplTBBKdaLnMoCF4tswKbz/Gn8vqORJq+BW8APdADU8AOgiYmKPSb51nJmXakK7
         OCBlM/roy05nY3GglWvrhafWi7C7uAlGK6uWVUqKTpMqJPBlndF4leG4QpkhxE6kkNq4
         VF+NEO+LZqhwOCi0g77/HbsCi6nIvblKlrJkCSFDchgKFkHcCRCd8dFDCAhoSDYMmhL4
         LJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902994; x=1794507794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        b=L7uubU0k4fGbqi2T6hE5dadUY/AZZ9gEbnmGi0lbxU0tj4Gos1VdV5a8gQR4wvxvFQ
         6J7Ekvyl69/rhzpfpC5Ktk1zuDkRD7zuB15NuGslMx8yL8A2W7IKNFCoNYpjqHS7ji+I
         t+vhSukkEL7RAH9VSiPT201sSBwojc2w+wOzjdwiT7MRsIDCHYvG/ww96rOn2UpwIOgO
         J/GgM9EfyOlkHo7V32DqjzmPZQna3mHPxNGR5BO4jGk4lHBCPfuU1T3bUEsGBpEysQyb
         Ar8hL9U0EOXgJ8DuUOZUcHdD/mrB1e8WLDsCorH2xLKQ96+XiF7Sr5U0kCeYAJTtfNMA
         doHA==
X-Forwarded-Encrypted: i=1; AKwUvBydAIzDURpc6DxG0uDmn3SzwOuTUsV3ctIRza6u2oPwN9Q7ssBy5C+uyPEk61WzJBQVXJa7MYJJY6OKl3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2XIvNgbD9wmf17jF8YtVDUAQt0Yez3MTqagE2f84xb423cxcd
	4bcQEbANFJHNjKmuDocFeAW9POkTYDWXIabeDboRSdUQKrvopFXG4uXE57e5c7GVcmY6MICvdRR
	PefOmJnZxtDXZI7yS3Wep8xr/UrQg5+xDLvHl8ul3
X-Gm-Gg: AYBFou2/OwePmk7oOjpEXwKSpMvQPTYWcgcBr/1BenUjFgaqPZPVqD87d1VMKeN/0ZO
	wlq72LW+PwLnwlGseF2KlJ2A7KICeFBxSE+mA/dgG8aUr9TDSpw54GfAC2Q2z7L38TAP+p5n8vR
	mZGrswWjrS5mclvrl3PXoqyboLtgUTODQBXKCeZQnIZV7WOZXNTX84qIzTt215EAJgC/VmpyIT6
	6Lc3JVbVzJe3bNDro8ng/F9APTMG4KCKrAYttl9z2tLvbt4ybnKYZmB4hKz+3gmDXDFiNs5cGqj
	mZw0jT7iqDmdVzjCMZv0TGzkKb33MXBqpXG+UJ1s6vDFYgTRQ0vo2YER7pfTdlWvBBhMdkUOBAW
	lViEH6Ng+YXl/YTb0GYopS0qpdoCUeIKacEegoqe0i46RHxcbjhtgG8hA517juFjU
X-Received: by 2002:aa7:d0cb:0:b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b5974977bfmr2576a12.0.1793902993423; Thu, 05 Nov 2026 10:23:13
 -0800 (PST)
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
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Thu, 5 Nov 2026 10:23:00 -0800
X-Gm-Features: AclHuK-iL3nM88J_jGCMxHWL2RXDHV3lXy-Du5jSeqmhM1AWFtXv6dHLUOOJdWg
Message-ID: <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
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

The issue you mentioned regarding excessive time in applyFlowInference
comes from Profi.

The AutoFDO implementation used in the kernel is FS-AFDO (which uses
FS discriminators). There are known issues when using Profi with
FS-AFDO; enabling Profi actually degrades performance compared to
original profile propagation. When we tested and worked on AutoFDO for
the kernel, we did not enable Profi.

While I haven't looked into this specific bug yet and am unsure if it
is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
to disable Profi for now.

Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
reservations about adding it for the following reasons:
1.  It is heuristic-based and not enabled by default. I am unsure how
thoroughly it has been tested, so we should assess it further before
enabling it.
2.  The recommended usage model for kernel AutoFDO (as documented) is
to use the same source. While it might help in an iterative build
model, I don't see a strong reason to use it if there is no source
drift.

Best regards,

Rong

On Thu, Nov 5, 2026 at 8:24=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi Nathan,
>
> On Wed, Nov 4, 2026 at 9:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
> >
> > On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> > > From: Han Wang <nesthanwang@google.com>
> > >
> > > AutoFDO profiles are commonly collected on one kernel revision and
> > > reused across subsequent commits or stable merges before a fresh
> > > profile is generated. While AutoFDO uses function-relative line
> > > numbers to tolerate edits above a function, adding or removing lines
> > > inside a function (or an inlined helper) shifts all subsequent
> > > relative line offsets within that function. Without stale profile
> > > salvaging, shifted callsites fail to match their nested inlinee
> > > profiles in SampleProfileLoader (dropping profile-guided inlining for
> > > those callees) and basic block sample counts are misattributed to the
> > > wrong instructions, degrading branch probability estimation and
> > > machine function splitting.
> > >
> > > Enable LLVM stale profile salvaging (-salvage-stale-profile, supporte=
d
> > > since LLVM 17) for C, Rust, and ThinLTO builds when
> > > CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatch=
er
> > > to use lexical callsite anchors within functions to fuzzy-match and
> > > remap shifted line offsets when querying the profile.
> > >
> > > While -salvage-stale-profile is not enabled by default in LLVM due to
> > > the minor compile-time/memory cost of sequence-matching callsite
> > > anchors (which is unnecessary when profiles are freshly generated on
> > > the exact commit being built) and the heuristic nature of fuzzy
> > > matching on heavily rewritten functions, enabling it makes sense for
> > > the kernel: hardware PMU profiles are rarely regenerated on every
> > > commit, and anchoring on callsite names is strictly more resilient
> > > than blind line-offset lookup when functions are edited.
> > >
> > > As a side benefit, remapping shifted line offsets also avoids feeding
> > > mismatched weights from stale profiles into MIRProfileLoader's flow
> > > inference solver (applyFlowInference), working around a compiler bug
> > > [1] where a small intra-function line shift (such as in
> > > __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> > > spend 30+ minutes compiling unmap_page_range().
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> > > Signed-off-by: Han Wang <nesthanwang@google.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > Much of the commit-message justification here is AI-generated. Sorry!
> > > :( Folks who know better, feel free to call bullshit.
> >
> > The justification does not seem wrong to me on initial read but it
> > definitely feels like the first and third paragraphs could be reduced i=
n
> > verbosity since this can basically be summarized by "AutoFDO profiles
> > are often reused, which can be problematic without profile salvaging
> > enabled, which is designed for this exact situation".
>
> Happy to reword or happy for upstream maintainers to reword themselves
> when landing. If you want a v2 sent with shorter wording, let me know.
>
> FWIW, I actually asked the AI to add some of this text. Specifically,
> I felt it was important to explain why LLVM would not make this the
> default behavior but why it was still the correct behavior for the
> kernel. ;-)
>
>
> > > Honestly, this patch came about because of AI analysis compiles takin=
g
> > > 30 minutes to run (see the clang bug [1]). It seems to work around th=
e
> > > problem. Obviously, we should fix the compiler. That being said, upon
> > > further analysis it seemed like adding this flag was beneficial
> > > anyway, so I'm posting it upstream. If folks disagree, we can simply
> > > drop this patch.
> >
> > I would definitely like to see that issue triaged but like you say, it
> > probably does not need to done before this is merged since it has
> > reasonable justification on its own. I would love to get thoughts from
> > other folks though.
>
> Sounds good. Thanks for looking. Let's see what others say. :-)
>
> -Doug
