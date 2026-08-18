Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CAA35F5E7
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2026 03:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023723; cv=pass; b=UPohM/hlPHJLe4M55ndPw1je+Ua3AQSxEFbgSEUWTkdj4VDuEe52CJy3nNRUo+ner9fL+5hpwqjotZkbUKWDdHTNGvRQE3NNTpmeJkjeR7Fzmm/Ep0k1tXOVN0Ae/9t5gTUVPmTRxfbszaYNFPd8Y6aDIaDGsyYXy4gbhYSlP9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023723; c=relaxed/simple;
	bh=r5Zdltp6LAiYTHO3zsA88inj2HBXb4iZZpW73+FezSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAX+YNnNI3l3k3qW4rb0aN1CsQSBc/9JyW9KFcQY6Ia3bVMLx3ydcjwzJetpJN1q/prRCQ5hXxzQy3I37j0YUBMpW8eUAdM7uSZW8+L2tKPmEkkHqoVyK5q5UIx4U2ZqgUDGYxPpaBNdcm1q7qioR9OseAiqMzJJyub+VlYSZ6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1iMLsUw; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1iMLsUw"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso4795502e87.2
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2026 20:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787023720; cv=none;
        d=google.com; s=arc-20260327;
        b=Oo3gPZ/A+fyTLVkGjBCek103+8p9zauAVceN8kxdg7KAl2pzlMmMcdKXY26ANmc9/0
         UUPDpxRyDnup2w03E0C/uJvXae/sp+ddWQ6PFF2PiLNVC6kuuQbo9Dt2idoWIqML/66/
         Y4FWpJ4kW62IhE48ktMTw2Iqavcbm5IlpuYZa7oNPd9CC0GxXgnqJTbKUd1l0KOIm0I9
         iwQLimeQrnfX2phEPxHF6WBo33AWDzfAKtJ02nWYL8Mj7ggqp6GDtjbDaiZZm/Zk6NfW
         dm9FFTddQ6G+3zIp+VrzylwNSqSEiK/jQ36lrVHBKIKB9qud3f/9w1+hP6BQxYGa9oKR
         fZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6z3l6JiM3xD5bZ85VYSBuxGVuvcg5CMcHjaAX+UkSSo=;
        fh=joymvIAk2Zq2S+56gbFrWaJpujMuyZq4bluWEKRvWn4=;
        b=ZQ1apLB9O1Krwo49IbnYvCIcCPM3eUobURVy3PxF/x+CNUQ48ccqKN5PhYOMthwSzO
         Pz51T4fsGc5brP+vtNrEvu21Ery1Edovh6n/G9dSYLWsTIHMoibDqcgv1AZAP8XAL7zg
         aSNw+GFGgbe5jTAqTww4jmml9fYN43cQICa3SPTJafYXbw+pMFKxCfzHill+iZ9MfY2+
         4RSLIQBEKWOYKTNwScebIr3Rs9vuuAU6DIepxx0nw+J/vaRuMP1ScJSx3Nps+78mL9ze
         JUuUVZfwMea+NAqwF/QfCxHBtOSQhD2OnwSEprS9/LoH5GZXQmdKLCUH0YmSua83C0pG
         fYxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787023720; x=1787628520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6z3l6JiM3xD5bZ85VYSBuxGVuvcg5CMcHjaAX+UkSSo=;
        b=d1iMLsUwDR/E2ZNEn90G81ig1mscXxQ/ozaUy167uiKb5jsUeva5+QM8q/bnRmVR72
         palPthg2rF81vx+WOsDedp7DkmAc0KwdSYZGqmLQcw5jmEze/qcSUOPXR3xxy9ONO7y9
         VXCxk+Ts4FbuPVbdy2R7fbC6N/733o5BFOcuRQHJjjdIvQVa4ORdWF/YAw55cZSXl7fa
         8/kLK4INrjUkgjFjx9rz5Oh63o+wuuvvUIBgI24zblPT4ijRTfI35Zc6KKpk3eZiCMrQ
         GANbBJGUJbd/Gg4p9wka3973IolQXvRENJ9g3T7hjphooL7VGHhYQTPbjTVvGvju6OXC
         At3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023720; x=1787628520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6z3l6JiM3xD5bZ85VYSBuxGVuvcg5CMcHjaAX+UkSSo=;
        b=MyciX6wOJeORgm1PYyv4G0uJPOJToncv+3MborzuU7o7UJhe/5AVqOh9tPtTLcEWL7
         sCBEd76PWShj3Dob13Cu8Q+deqH7afrf9CHkVWr8joqFhKjPDfV9qQ2tm0qySf1uZr/2
         l7ZbAoTd8NjycKFRo9jt2D+aeUgv8COiDnVKzt6f3uXbFJ5MmbnF5idqTpCsKt2KQ+kB
         BtphIOShqBcnG14LlnLF5DLGbu3ncqA2WPEgAmfjXKqW0lxv3tuyktvShRyMXCsJXMRN
         o2jEmn6M/fBG3JxktimGUQOEJ/mlWbG5aHAKf3QsFeLEYJR3ql+VEe48vMXLdllrU+p8
         7dxA==
X-Forwarded-Encrypted: i=1; AHgh+Roj1guCvlgN1gBnsb2kFItc/LDVTjaItrSscAYjzaOHlE2qFuH5uYcNPZAME9haBqNzWlZtfMPZisNYAvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwREIymovoWMCnMpj4Q5B6vLIi74QuzEHX2/0LJKz/PwhVQkaxx
	8/pDaT+FQ/MUOsssaxki2e7OQou7+jeRblSDLPTk6xNEgSJqoXxsqmPaU2qjjKzLPW6iG1+GJg/
	+Ax2pQKNY/54yLVNQdpfQlmw/GNGn2KM=
X-Gm-Gg: AR+sD13BFqS89y5x3EDKUdl1lSPPE9+ti7sGacV6sgRJdnUP0MMDlSIj3G/kmHfEk1L
	9o4wRijUOLQC/HUNr34+azsMTAwFRu9T4Jl06Ugu0goqx57qO7C0+lABVXsq/io0kcnmvJ6dMUs
	lkPuhjMaH1whVZDeFBech6xkz3sqdl59DwEGonVtrhr+JN8q7WckG87IHT+MGe1qXsljKI71HwU
	IyXNNZWAaDskbb027rcI4pBp2wFHDCDWm90b8O/PEMWTq6YamnLCfDQ9dGrXKn++MBwqT/Z7uRb
	U1PIP/V7FeNSVbm8oc4Ylu9oIFK72lS+LnfcehhfDbkvC4iRpPITsqLJc6jTvEtrWvP65Y1rPIm
	I0gUdAqfR
X-Received: by 2002:a05:6512:8384:b0:5b2:a353:e4bb with SMTP id
 2adb3069b0e04-5b45910e12dmr3433140e87.3.1787023719369; Mon, 17 Aug 2026
 20:28:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
In-Reply-To: <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 17 Aug 2026 23:28:27 -0400
X-Gm-Features: AcwNN1VO344mKCA8QMRP88i0pSnKKcGvbPVE5XDaO1o6Xs5HQ_NMVQdUDXtu7kI
Message-ID: <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
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

On Mon, Aug 17, 2026 at 7:16=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + John Paul
>
> On Mon, Aug 3, 2026 at 12:51=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > Hi Matt,
> >
> > On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > > Two small patches to let the alpha kernel build with clang.
> >
> > Nice!
> >
> > > The first registers the clang target triple and stops passing -Wa,-me=
v6
> > > when the compiler is not gcc.  That flag exists to keep gas from emul=
ating
> > > instructions it believes the target lacks; it is a gas-only option an=
d
> > > clang's integrated assembler does not emulate instructions, so it is =
not
> > > needed there.
> > >
> > > The second fixes two uses of local register-asm variables that clang =
does
> > > not honor.  clang treats `register unsigned long x __asm__("$N")` as =
the
> > > named register only where the variable appears as an inline-asm opera=
nd,
> > > so reading one to get the live $gp or $sp yields an undefined value.
> > > trap_init() passed that to PAL_wrkgp and load_PCB() stored it into th=
e
> > > PCB for swpctx, either of which wedges an early boot.
> > >
> > > Note that the alpha backend is not in upstream LLVM.  It lives in
> > >
> > >   https://github.com/alphalinux-org/llvm-project
> > >
> > > and is a work in progress, so the scripts/Makefile.clang entry has no
> > > effect with an upstream clang today.  I am sending this now because t=
he
> > > second patch is a real bug in its own right -- the register-asm reads=
 are
> > > only guaranteed to work by gcc's implementation, not by anything eith=
er
> > > compiler documents -- but I understand if the kbuild side would rathe=
r
> > > wait for the backend to land upstream.
> >
> > Yeah, I am not sure how I feel taking the target triple part of the
> > first patch. On the one hand, I want it to be easy for you to test
> > against upstream Linux but on the other, I do not want people to read
> > this Makefile and assume that ARCH=3Dalpha will work with an upstream
> > clang.
>
> Right. It's cool you have something building. I'm curious if the
> resulting image boots? (That's the next major milestone).
>
> I'm curious, since we've yet to have such a case of an out of tree
> llvm backend, what's your plan, if any, to upstream your backend in
> llvm-project proper? Perhaps as an experimental backend?  We have bugs
> filed in our issue track for m68k which is experimental (but upstream)
> in LLVM.

It builds a kernel that boots in qemu and on real hardware.

As of two days ago, it's capable of building itself and the 373
packages of a Gentoo stage3 + a few other things. These include glibc
and other core components (in a qemu-backend container on a fast
multicore amd64 system).

I would very much prefer to have the backend upstream, and I plan to
start a discussion on discourse.llvm.org this week. I think an
experimental backend is probably the limit of what makes sense for
Alpha?

If you have advice on going about this, I would welcome it (privately
or in reply to this thread).

Current diffstat is

461 files changed, 29735 insertions(+), 88 deletions(-)

of which {llvm,lld,clang}/test is

266 files changed, 9871 insertions(+), 4 deletions(-)

Currently reviewing and cleaning up, so the numbers will change.
