Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1AF298CC4
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2026 01:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787101596; cv=pass; b=hqjSOM+CyYEM8Hv6tsDODz2eGdKCSLkUeSQieP+Cr6W/xkiUxDQHN8G+p36KdfVWkCUw5rER9vgBQilkXumyWDhTYHtoRdAF4LRdW07bqe/PmdOgO0oFc9TDj96Y5GZE4j+msaGF7G+fGaJEtYhvwyUN6+fHGxuchQwdi3lZ4d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787101596; c=relaxed/simple;
	bh=TbvLGp9aD+2RDPniO6Wahe9IFHIFUfO6pxWOXLfdioM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3Kn3+8ygZbDYZSlImJWFaRQpfB3Z06QbWRt6RNusg/fuGOU5UsYLuAKwe0Gw2NDWOkJQcW0r7H3+5O+KtYBWCls43Y1vTRAtDUF4yftzlcwMy2RDPAe3MCN9UGDSIpnNcXi6CugMFo1zckn5dlcwtWK3vS3okjT5rSspYnxu44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVzneyMw; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVzneyMw"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so1945257e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2026 18:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787101593; cv=none;
        d=google.com; s=arc-20260327;
        b=gh99HQZrGGxcSmSHh+6wXZKvs/G8BnBNygfu3FOkYV9lBtCJqbbt7wi7qYZ8oTx3vR
         rVUebl3wtPE8n2xYToAJaLDUJx3fcGsIZxlPB+ITWktwfEK3jZC9kwHS4DsVfQ0IUQbR
         wpLNQcYqp84I0OFkSiuazaDhO03j/sQ//OektykRIpy6yPiRpulLrGg+i5AEfCOnfkxY
         t5SBYjvN0fdmKTXnEQRVuEDE4aRVix06MoltZjYF4j+RQr/n3pw59B9alM8XpAxT0Da/
         nc0KAs+83XvDa7hx69PZZ3zsPv4kzJ4YO9lzmhEkwploF9erprC2GZ0Sxoau/OifCwuN
         /B3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        fh=2WN5jDuhefBoslU/7e5ZxLgQAQXdOg3P3IW0L4KuVko=;
        b=jjgqci0P3igCcf67wwkdhsVax3v4GHkLiZ2zBAvgr2FztRRTfip8nZG3X/AOJaF1ot
         ni6aInybdolpBMI9Sf71QN+WG9OxenrpvkrVySBzND5ClmN43cXnv5pkt8uoDTjw4ZDT
         rUDt87X8OWFo6919zK01qPI//ZfALe1f82YUTMFMG3g3jwaDFaeNcxF+br7U3oFqOrM9
         3rTh0NBpH9YZC4xW+c77oNFIW3H04S8cXTb3i+ESQZJ5Stx/Po9JSpeTDn3zRS1W95EH
         0KP5IqBvVltLoCDzByZikO2hKxo3CuOCP+n/6eyrjbECsCrEoyjYyaGOku8WbLiWdnKf
         rq8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787101593; x=1787706393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        b=eVzneyMwHPG5RtZ9ypw4RJO5S8YGkcHAnWDBfIsQVZqLMt+IeSp1k/axd36xDna35X
         uNv0nyJCWcyoeHwrkvXBjlnuOANsS250hdxWUXGJbBJaaeWAkR5yC39DECEPTt2+Y1dd
         SKhX+TAndtWidYs8LjKO++Yf0/DI7p3aoVF43NGhM6hRRLvgXZLjwDPV+OOwc/4m/4tX
         5aJ/CoF2NZpd6BEns4KSYExQQ0T8kozGqQGz7sj2qDAAi3AfpBKotvkcPqUjA8Zb1TRT
         3lt2jsknmG8P+kfLsX8Qegln5r4WFjIEqXtqscMEdWYorjR9uNGRe5y0ZPIIqb15uMRl
         oibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787101593; x=1787706393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        b=JkKfKmYD237PG6FWZhpGuLyKMiIpBvWGr0oG1k3zTLXP70MLT9o2hTtc+E4UBtEKHC
         /cUKVO/kwf3C6istR56hePP9eY2a37Qz1oEM0VZyxan7hD/G6d23FUVm2hAvEvzJLoXI
         9FHVicmstzmbtIugzz0r2AKByOmCWmmJjpD8IxHOfXkDdQjrBztqBMhnSVy1IwPGkqOg
         KadgJpRH+hSodMFhjqDmgV94mSogpWrV1vJOlWAqXhqDM5aNJBCmpljRC4vEMOZ0Syli
         VJRM5evfmmwJYtVak1OjfXNmliJ+71sWGKc7n+YO9EacIlXUlAUuv3HXEK2/cCV3cyQD
         YIvA==
X-Forwarded-Encrypted: i=1; AHgh+Rrmfi8RkORIdysT919HJVoYHejwJ1C4LHx80hPRf252+SXMmA2V9SzfnHcK5DGOAipVkLsMmoth2DS8/mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWSlfAcLGZJVPQQVOfomJjV9xLEQCAf35GTNGsIIzxaEdhYh+J
	xQZWguvGcslp3sC1ZuMQParG/AiQeozsP/UCBsMrWo5F2DZ7BKWXTZwdcFYibaKA4ECqW0P2WYo
	gmucHei57EGF5KLMmFJESksn87oQ1rD1JDYVC9Zg=
X-Gm-Gg: AR+sD119iARk6p7r3HoCnCch9UQcXU9CaOrS9cso1n+PCPJKN/eZiSQZCBX2ajSixim
	maaqqv6gusxUaAcaUxbp8d4qD88G7RWd0FbTS8YCVkGErLSDXatcp2oFk/c9MORiq8nodwSCTCT
	4GrHRyeivplpopFwYWqSUFLJ6PS8w2kL1CP+2un9q7+5pWN7p4Wk7Ic2fVNcAmB/Q/0nM4N2ZNX
	oGCCfRcUrVG/Uo43N/BY7AAgHQQCbThB8Lqi5G9sZLaoVjgWnm7fO1hU3PslrF3m3yFExVuAWx3
	0tgNWk+2tmGMJd9gV9UE2d6TsTfc1fkmHOZzC8fcHoqtvhVo0mkuOhH++ssqDau2F21VEw0f+fv
	g0MM=
X-Received: by 2002:a05:6512:224d:b0:5ae:b5d7:4b99 with SMTP id
 2adb3069b0e04-5b4785e6216mr238239e87.0.1787101593147; Tue, 18 Aug 2026
 18:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
 <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com> <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
In-Reply-To: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 18 Aug 2026 21:06:20 -0400
X-Gm-Features: AcwNN1WcKtw5ENjFpgp0JrUF6Cd7Zxk1ebk8fb_me2vOSumdHXZLIX0XvC6ScbE
Message-ID: <CAEdQ38GFCDQF84ZOvGBeRvsc1TLHsJ6eJ8wMxMpeJGHKUWGXvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 12:24=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Aug 17, 2026 at 8:28=E2=80=AFPM Matt Turner <mattst88@gmail.com> =
wrote:
> >
> > On Mon, Aug 17, 2026 at 7:16=E2=80=AFPM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > >
> > > > On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > > > > Two small patches to let the alpha kernel build with clang.
> > > >
> > > I'm curious, since we've yet to have such a case of an out of tree
> > > llvm backend, what's your plan, if any, to upstream your backend in
> > > llvm-project proper? Perhaps as an experimental backend?  We have bug=
s
> > > filed in our issue track for m68k which is experimental (but upstream=
)
> > > in LLVM.
> >
> > It builds a kernel that boots in qemu and on real hardware.
>
> Wild.  Where did you even get real hardware? I know very little about Alp=
ha.

Mostly eBay :)

... along with most of my other pet computers (https://mattst88.com/compute=
rs/)

> >
> > As of two days ago, it's capable of building itself and the 373
> > packages of a Gentoo stage3 + a few other things. These include glibc
> > and other core components (in a qemu-backend container on a fast
> > multicore amd64 system).
>
> I haven't kept up with Adhemerval's work on building glibc with clang,
> but pretty wild to hear about glibc building with clang period, for
> alpha no less.

What a time to be alive!

> >
> > I would very much prefer to have the backend upstream, and I plan to
> > start a discussion on discourse.llvm.org this week. I think an
> > experimental backend is probably the limit of what makes sense for
> > Alpha?
>
> I agree. An RFC on discourse is the way to go. I'd use m68k as an example=
.

Thank you. I'll find the m68k discussion and model mine on that
(assuming they were successful).

> >
> > If you have advice on going about this, I would welcome it (privately
> > or in reply to this thread).
> >
> > Current diffstat is
> >
> > 461 files changed, 29735 insertions(+), 88 deletions(-)
>
> Only advice is that if any of that was AI generated, please do take
> the time to review LLVM's AI policy.  Reviewers have been getting
> crunched by low quality AI commits recently, and are a bit salty all
> around.
>
> https://llvm.org/docs/AIToolPolicy.html

Indeed, I have been, but my goal is to do enough self-review such that
no one would be able to tell that an LLM was involved. I will of
course disclose that LLMs were used.
