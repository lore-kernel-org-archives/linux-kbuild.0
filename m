Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F1424D6D
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070292; cv=pass; b=jRUSoeiRDnziqh2R/G/MZg65j651ii82T4iKakcPfrTVWS1uIMpp67hRPn6JURgxYq+JdOfr2hE1gdluV5fUB8MPqjM5E6grWmhs0jOIwKY1uRRbNMqvVJdCg0DtlEhzDJen23AjgHoviJi9At8eYjA0umkVFnRG9vs3qCxkJ7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070292; c=relaxed/simple;
	bh=33DXvXlll0HyJTxrb78h3DqOrjFtADo0DfT3EHT2Gmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dF92WHaW6RiM+LfLRzCSVaA+a2NRXC4ebFzPrGZFGPaf2PIJCwz1Xh2WVulPJVsA2JXK4Qv3U7krjTaWSD/715nZB83VOA0s6FRJRHOifGGRkiFUFOra/xJWBNHaZJHcJTnuxL/dOzRwJ12S4mAKveNqnVQqbg3Aobi+kOEcwJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cIqE5isQ; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cIqE5isQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472326ca506so3408542f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2026 09:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787070289; cv=none;
        d=google.com; s=arc-20260327;
        b=CiQRu4zd9l3TnKXB6TUktKH96+OB46n5pgQBb7Vp726ylqN+8KN0W5qmkqQG7JwVGB
         qzow1EJ2Jphd03XoDt9mAlz8bHjqXGKrg6x/U726FAPfwUcNSd4mRWGF19QP5aY4ezfY
         DZn0PEPyyjtBKUU1MweOq6rEUuxFOnsxy4of8QD3sWgKKDmnjW0fJz2c4x8TrYDI3LRd
         G3pP3pIouA3a8kwEwHAtbvu55pnRv7gUrwF8BjXdhV0VP8fnlv4ZSOAfyHXHEKHYlKUI
         nn/WGIsk/vve9YVpXYEanZpt+81a16/u1rRDygozJFF84+u2FpJ01A503MybKuExYHac
         K8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        fh=IQFfPFEWobUZFjH1mokR2QLWaRwzWqtGv9N0X9xEYPw=;
        b=SIxvrqfc0ynQepRItB2eg1HUAsB0hgFQbCDViHlEIU4jmCXS+0ETPJ6Ybd5FuFjZP4
         Cup65AwGzRviHhwzsCgJb4yo/ijBsz2wH7KusjCcPiZhcxb14wVV6tkVgIp2SRIfLe5U
         Xg3+oJMViXWpnrelJMlj1VNKdS5UdeDsr8+gTx+4/bIRTrkFdtIyyX+Ib6Fsmtez7lTm
         /ECt7Ij/YcyPpUCyLN6wR5LvyXb8AVJBOs6YPQduek4yhIKCIHnKQsJEmjWoE0hrCPqy
         P5nHN+NvUWcx9u2cKS7em9Pan1XXvzPBDdXaZALb+vISXTfw06r+KIczOxCV8hxTtQKc
         j4Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787070289; x=1787675089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        b=cIqE5isQJPGBK+qXyELGekaBjHsALGqLd9iVC6Ql6H6ATzgtPIS+pqduCFx7XlqJIr
         Lj7QBvRw82+Jeu44MsPvyQ9wt00l+BNTg7Xv/9+SVaoCmKY2fteIV1xec1DdDJ/c9f1U
         2u+yznVbXeyTq22je5CCwhgzkeZxyBqtWC8wylEA8wbtE01qLZGOnskHztNjFBO6nQFW
         LOu5NAEzrr5flBam7y57e0H2BBThhBJUYXbBRooO42PXrd+TKudYqRr4wmbymzyX0vWQ
         /ygNTD4P/RqC64Dors9zeMVQwTRoJpiziCDVIPlxhPC1cnLRkY3y75MqXG7iAE4RPVXn
         m6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787070289; x=1787675089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig4ZJ5ec863N27eKcdbfitdKOwnVM6xhItPYCP368+k=;
        b=DWPfFIj0x7E7N+0lEu5SoZI7LfFclBjz/ivaxYT/Aqt4jxqREmSg8flRnU+yToLefc
         6buC13HWVpoJDBr9Njz8zXwbPSCfZn2igAl3PdgJEp7HDGL1cmFDqvzWfF2IfTEeFCIh
         OxboYqRH7Ip3hpzTjZjXVnMsRXfQVHnu1b6hajsCgOarYlAkNyHIwkfCniYs2GFT3ZaN
         VpYypjzosbDuoiEwrG//JpQUP6/m62zHdy+UpxinIsfx6QXVW2N2If9/zfZoMyWBaH1g
         9kaWDI70dcvlI01LC4yR9d6d9PmSclqhfW8dB4RJ15p9xI3emcM/C3Ay0qKG8aXbZFZV
         HFiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoCCa2KidwEI+RoIItakwAptEEcxo5H91rTBpc2eYGyg8hYjzr6vAm747tG8+dk20z+/jgjg54fvgcNIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgHCUGsQgN5d7UlsSkhhRucf5QT2JSrcT5nZNWnNUSIm1CqGUX
	dkdtZi9cRTjFOgv2AR9hUe/UAaVqHT3lnkGtpZ6dYusv7uXIv1Vntm1ybuv+wMP4yMd3X5jYLKn
	7AlchBKjkqT4UY7YaSztio7XpzqYoxCO1jE4oI4Lx
X-Gm-Gg: AR+sD11ZuejF5VvFT64VX3whGSk1N/Qs7mQHEoHZpCh/1x8mk5pUrkSLmVvAylj9A7+
	nxJomOp45s2dqK9gGuKNr8KlHasCqOUe4ISjtdjYwhxQ7PpUXFk4Inai6wy8x0RtYdEZeeeXXwv
	OqNkWLr41HtO5586DQC1jVkspi1hgi4H8c3MkxYkcTlc3/g13AYxT4YUCtjnNYtB6fOPUyLBayG
	TdzvEvPMGezWzqSjpo+tFXVpLgEONflErJRAWDFCLYcVfbPBrF1Yx2wLdySqT5ALQ7N20stLb7t
	I78+hUuraySqteCCOpJbmDNPYaeyR7otjfxTUt//xptiSYToVocnNGYF/bmTwvuPDPM7pdA0y1P
	mK84mNbHSh+E/yzn6c2WRXhmcjbykXq/mhr8Up3WqPyedhi6aVGYm061i+RsLT1ctKX/9
X-Received: by 2002:a05:6000:4919:b0:47f:e877:641b with SMTP id
 ffacd0b85a97d-482a8ff751dmr18513986f8f.11.1787070288729; Tue, 18 Aug 2026
 09:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
 <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
In-Reply-To: <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Aug 2026 09:24:37 -0700
X-Gm-Features: AcwNN1U2F_9yv474aYoKrxgqvJJ_fOFHnGq3BGDcA7pmQq1T0vy1kWNlSniCBGI
Message-ID: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 8:28=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Mon, Aug 17, 2026 at 7:16=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > >
> > > On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > > > Two small patches to let the alpha kernel build with clang.
> > >
> > I'm curious, since we've yet to have such a case of an out of tree
> > llvm backend, what's your plan, if any, to upstream your backend in
> > llvm-project proper? Perhaps as an experimental backend?  We have bugs
> > filed in our issue track for m68k which is experimental (but upstream)
> > in LLVM.
>
> It builds a kernel that boots in qemu and on real hardware.

Wild.  Where did you even get real hardware? I know very little about Alpha=
.

>
> As of two days ago, it's capable of building itself and the 373
> packages of a Gentoo stage3 + a few other things. These include glibc
> and other core components (in a qemu-backend container on a fast
> multicore amd64 system).

I haven't kept up with Adhemerval's work on building glibc with clang,
but pretty wild to hear about glibc building with clang period, for
alpha no less.

>
> I would very much prefer to have the backend upstream, and I plan to
> start a discussion on discourse.llvm.org this week. I think an
> experimental backend is probably the limit of what makes sense for
> Alpha?

I agree. An RFC on discourse is the way to go. I'd use m68k as an example.

>
> If you have advice on going about this, I would welcome it (privately
> or in reply to this thread).
>
> Current diffstat is
>
> 461 files changed, 29735 insertions(+), 88 deletions(-)

Only advice is that if any of that was AI generated, please do take
the time to review LLVM's AI policy.  Reviewers have been getting
crunched by low quality AI commits recently, and are a bit salty all
around.

https://llvm.org/docs/AIToolPolicy.html

>
> of which {llvm,lld,clang}/test is
>
> 266 files changed, 9871 insertions(+), 4 deletions(-)
>
> Currently reviewing and cleaning up, so the numbers will change.



--=20
Thanks,
~Nick Desaulniers
