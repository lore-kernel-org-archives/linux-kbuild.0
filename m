Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5BC3B0AC3
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2026 23:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787008583; cv=pass; b=BB3D/Ai3taI0u3NEMACi3o/nzVRaRgYIEVbdPc9YbeOoq8FywowI57xCXkqDh6VrIBuWNOhJAGSAE5q9rCNY8nKu2k87ycBAcJ7Rj8k5PWAvb5hXMxfvMZvLQdn7y8KQKBGgymHs87QyTr+sblLxP+yFQVpgrwJkjHmH7ertlDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787008583; c=relaxed/simple;
	bh=aC4iUKA2UpUMbgOXb/TlUUJCtfx4w9IP1Z/GJ35LDvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nyOFJVK/T69yYy88yE2ND1U++RGO3XkD5QZTKWCq0cyO0Cr/pNpHsy0PutdDcEbzNlqLE6+r/Ixg5IsAm+gHcqn59e6QyBH5RX0GpXIOWNrRV2Ox977oWH1vrOPdj64A486kR8fYFcP/5yYRUzBcpkS+JUgYYFzaP9vY9ec39eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZt90Un9; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZt90Un9"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5661566a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2026 16:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787008579; cv=none;
        d=google.com; s=arc-20260327;
        b=SZz3jO3nH8H4dlEyxD996qth5oYK6qeiPM/zwJ0IwlLaBhH7gRWPvJ4Wf2MrANa9SI
         XDW0R4jB1nlUWTSqdgos8VRmTscj2DrZgxFCg7lpQHEgDVFNt+q3YUdkeTWXN98dR7hG
         JIWQjYukV66fDVGRB54PmlWjPe/dH+SaD860xz3Df8wLfxf83WItO9DT7WjsGGkmqMHX
         nTJcDfPdcWcyyNym76tQQ0ZiS+u8l9HjoQPmt3RZAeD9KyoKK0g9PxAzINjNkhdLCD6e
         i3/PCmv9ksVO2dkY5zfj98Hzu5MyHabSwoXTCmie/3UEkLpoDcYBof2RMRQgJJwxb9KM
         mdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        fh=PsxY/6dXYegu/JxFs1DkLxFauvqXG2nTar7WagQJm5M=;
        b=S550x8rDu8EldL4OYTx/1GaWko7obsZcQjnWzzuxb51dXJIkw5T7moadZaU1k7RzWK
         rt5Pz0JyBhFjEm17XFr74VxdparRviDRIfE5eDN/GnsYKY2jWbV08T/RnkSRkSQDffgy
         H3wnOAkBeddYmx6KjcZu5hD9CS+AW90Bmq7L4ljYGLUexxFsgwkamisyYgZQL+/938Ju
         NfAOBC8E44QxC+tKvVTl1Bm7DxX2np+SzjIDYmdNZAPtLVXMcthYJH3ixP/3x/Yc+GQr
         aMJTOhQYGg4hasAyW6rm3qoVO21orV2vpIxV1BNVEhXNGPK+WwE4DQ5ORHk9bCeH+s48
         bXoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787008579; x=1787613379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        b=UZt90Un9+qDE5TwSXRPCgyFdI5DQAtAsUObWKdSBT0tYcu7vy4ey9KBl8EcQzLhc3x
         L0SCfiNjaGqNSp9mhRZS6HveV4dsU0X2f8cBbDYcSjAPYK6moXrwTyQLi/cp+4AqwmD/
         UTqRoj0Lcm15n3T+q9SGsalY4SwEEDBa0dulYl8WARFqx3W5SoAP98jUIVG6el4nQvLC
         xFbZ8/aExnNWokghR/8QOzbyWnNY/eMHDV4dBCx21bZUDiS6ZwiG2ecY3ujysGQoEbhl
         LEGUnzSNQItDeWDQd+iYgCY4m+AQXyz7PNYF6XyRmZ114QX78h8W9g/+V+4FGi0KYQZT
         qoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787008579; x=1787613379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        b=UOaoQdpE6XJVnB9SOhnvZstw2NkYF5iBS9hYUU47fgJOFuQlfXVBrR4T5obcWg7ByO
         M3H8fIrDPQ73dQCivMSJYAb25aH+brToLULqTgFxEP3VMeFYOe0LJDP2LXcKxftn4zh/
         Rd/zJmVeIIxo47n6wZuYjyHPIAWOQeP3n9SAkgy6RHp6HJVGXax6MWzbm/lSGXSkfam3
         TeJNfkOqRw0m3gxq5LpnqEwBtkI3fP1+IAPozynF4T/ECI5ht7Q/HvXSKacIQDLCHbQ/
         WSnqGvoGsXALGupo3qv+QULJ4VVuJzpJ94+kT7XX5ImQ7kqHQ93p+u6vR6xtqbM8jGDA
         8zww==
X-Forwarded-Encrypted: i=1; AHgh+RpK/ewbwly0EMXNEZoUlQegKKJTAFi6wYkdqoCXPeRJrUKJk8CNKv97OhUEWosWbPFoqd4g3DUZkV0Edao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7UouKZnLEdLNJJ9gf1lk2xi7p2KviJkmvQjoaOU5/69kmKvuM
	GuP0IEZQa9voZGT1sHOF7sE8D0mKKO2f672KVZ1oscU/gAjGD4f4NBc025arwFk4mhiSjGF+6ko
	9YMij1JGUu4tIiTlyOEqeoxkbG+YXrKLr/9B/WuvT
X-Gm-Gg: AR+sD10PVP67uq2jq3dizaI1/0naOT6tqhFKWQ7AvbvvVYIaAbf87rPI6/PGfJMnp4E
	UMyX04cnI8bDCszCQwSxwagXH7O1DvYpErfeNxTCKACFU7o5ACNax0zuQtUO66lAHvvWWE5y9ye
	k79xeJYNj5g1KQUNRmUXwFKyl0S/sVOdTQ0Tw6l8cwP8lnkdHvWop8Uychjvo1NX1T69xms/wiz
	69aF8mNl7ds5ZrsMePl8D8LLBPsW1jcbjNlGP3Qi63nVt0Spiy3U2fejbeyt5zb0w1O1GdhbxSn
	ALCDQ9RTetIMYoUzYI3fHvFyip/CxEUtusjhM8vFTlnGmM6DSpn+6Y95xOqTHvZf0S9J4k8w2tI
	/94siF797v3Ikr8YDMO9/o3iYx5zcOMaCxQwcO/nI9+r1qCvm/xLv8WLC
X-Received: by 2002:a17:907:94cb:b0:c20:5121:89c1 with SMTP id
 a640c23a62f3a-c212a10a4f8mr1291313666b.12.1787008578604; Mon, 17 Aug 2026
 16:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803195135.GA1083357@ax162>
In-Reply-To: <20260803195135.GA1083357@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 16:16:07 -0700
X-Gm-Features: AcwNN1W9izkcwuAp6MkFeC5J1f8fYvzE8iJLioZu2VQvTBLrGCuk-8lW7l7-HjI
Message-ID: <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
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

+ John Paul

On Mon, Aug 3, 2026 at 12:51=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Matt,
>
> On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > Two small patches to let the alpha kernel build with clang.
>
> Nice!
>
> > The first registers the clang target triple and stops passing -Wa,-mev6
> > when the compiler is not gcc.  That flag exists to keep gas from emulat=
ing
> > instructions it believes the target lacks; it is a gas-only option and
> > clang's integrated assembler does not emulate instructions, so it is no=
t
> > needed there.
> >
> > The second fixes two uses of local register-asm variables that clang do=
es
> > not honor.  clang treats `register unsigned long x __asm__("$N")` as th=
e
> > named register only where the variable appears as an inline-asm operand=
,
> > so reading one to get the live $gp or $sp yields an undefined value.
> > trap_init() passed that to PAL_wrkgp and load_PCB() stored it into the
> > PCB for swpctx, either of which wedges an early boot.
> >
> > Note that the alpha backend is not in upstream LLVM.  It lives in
> >
> >   https://github.com/alphalinux-org/llvm-project
> >
> > and is a work in progress, so the scripts/Makefile.clang entry has no
> > effect with an upstream clang today.  I am sending this now because the
> > second patch is a real bug in its own right -- the register-asm reads a=
re
> > only guaranteed to work by gcc's implementation, not by anything either
> > compiler documents -- but I understand if the kbuild side would rather
> > wait for the backend to land upstream.
>
> Yeah, I am not sure how I feel taking the target triple part of the
> first patch. On the one hand, I want it to be easy for you to test
> against upstream Linux but on the other, I do not want people to read
> this Makefile and assume that ARCH=3Dalpha will work with an upstream
> clang.

Right. It's cool you have something building. I'm curious if the
resulting image boots? (That's the next major milestone).

I'm curious, since we've yet to have such a case of an out of tree
llvm backend, what's your plan, if any, to upstream your backend in
llvm-project proper? Perhaps as an experimental backend?  We have bugs
filed in our issue track for m68k which is experimental (but upstream)
in LLVM.

>
> We could add a comment that the backend is currently out of tree but
> that would go stale once it is actually upstream and it will be floating
> around for forever. Maybe a better compromise is taking arch/alpha
> changes now then landing the scripts/Makefile.clang change when you
> actually start upstreaming the backend, as being able to use an upstream
> version of clang should be relatively imminent at that point.
>
> --
> Cheers,
> Nathan



--
Thanks,
~Nick Desaulniers
