Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743332142B
	for <linux-kbuild@vger.kernel.org>; Sun, 11 Oct 2026 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735647; cv=pass; b=bINYfLpxULzqbmmP5ZLc9p3vw4UKeuc0AqVpL0BAX9IyofVQcl9lL7Zfq2drTDZ5gONIkG06wteigpvD+4Y2HieFsLfz/ESITXxNTc7ARcmBcqqnTjodDZQ/JKOZ8gXTHAZ3AcST/OQDxGU9Upd6TZD+++R3yVnv60FqnsuSq7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735647; c=relaxed/simple;
	bh=QUiNdW6VFdxYMeVAMHDcIzKBwB4DCuWygXNIK8VM5JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L488onrK2NdFYWDMVQcWn8Z45IZhkCmog57zTzaLVc7vRkSv2cRXUh+HD1U5KCH5HxbgfbBEiFc+1uMLfCTMQXWPjHa/Xib1We45xHRmnkhRhFJiXNhaFIewJJ2KlG4/2J5+Q0pQBWeo9Ucff4Vxt7XUtgY0zK/3fVPB0uRE0P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG2kYRMS; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG2kYRMS"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33e623bd651so135312eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Oct 2026 09:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791735645; cv=none;
        d=google.com; s=arc-20260327;
        b=KJ8wWtLMIBe3crgHHPguFPzPC2SaBGDpRWAQ6t4HHowRCCP9sXhfDli1qTTRWpfSR4
         pFiGGZaV54Wpl523T1fHZVEryqMmqsRPZIvf89Ad8Gkh7oa8Jlhz7KrkeII7iPGONA/S
         p6pAMVoOmsPEfLLXm0CKZgLRZvrD2iWyi2tXF7mTLxevg2Wo/IuhuTHFaD5+qaI4QVoy
         fFZzf65dU9UdRTwgtMwAh5p6dHj0Kr7eRITGXMdrTLpZM0wGlH8e17GK8lxqCWZyxWAD
         5AKpAbIDl28B/XkRuKZOHHV0KQzF9sxCVYPzcwRKntITGgPzccbCSdEMXvsERi8+uyeN
         xPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        fh=lCicRdtkroGDIWqd1u3YWw4bLxujPiQCLyk2RuKIhGw=;
        b=FbX+D31MJjPBBGK5Bw7J1rm3FzLQFGNLykJtkaNXwBkmmew8cCP1qeB8DfSE4vpCpC
         Zz8NZNuC0uGqW7TYzUKr2CfFcywcWsQ2DC0ELjZBZMSt5G8EBQkIrP66YTUI1ThG7/Ee
         OLhXsb11Nu3Gf0b14WuV2Eyx5OkYmMFy4w+cfw06G7Y1vKzs9prVeawiEo8fkWRkr8Vd
         o02dK/2SQ0ZNb1bY77Pmsr5aEjLQl2d4D5eSCdKKIrllxeW1d528BHgiP++4IsV5AI2W
         NHx+QMbokLd+g/dMbxHKZPZzM04kNxaRTuP3yZ/e1Sgt0miJfZGaTzBY29jwfscaR9M6
         fkSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791735645; x=1792340445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        b=QG2kYRMS4i3OrV5onbdj0jIQ20na/j6Qt9IiEoEby1sFgEnD2dpq/Z+amNR3LqlipD
         uAuxNIYHEQJDS0LE2J9ufc6Bm5F/fHUgMCalizWPwfKBDtCO2pix7DLxGXT+B1K8gAB0
         XguEpKW7LydITFy+Gl1/Rhsw+xwlCEF7C7dvrzDc5aRvxH11L0XJUOJ/9uGpndmyvmHM
         gCzI+D3QKPYzlQ03C3fIhwV5s4nFh0EYLDYQy8aTl1qJtOBuOMNvOBfp9jHP/GKdmKyV
         H3OGVf5fS88hl+tBZC58suSWgN5tKmdzLZcoBK9Wsry0JMrmmEPYHfP9rE3t9GMeHQTD
         qBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735645; x=1792340445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        b=Quq4wiTm4o1DViCfpGFLt8ky3c9Dbgiiee3iNKQOjiCuOm3Tt1mHL2RitpwzIfUNmn
         NXj3J8O8evxRnnwBCS+wTc49Cw3tDHkawgn+l7yOMzORE/wvP64PXcmaSlpyHbO+oxWE
         0+z5s17mIk8hepJ6vDHlHlAnAs2rp+r/FqKkkuy5F+CMDcfi/cW9E1rX4WRr0JgPsiwe
         UdNzB3kPqMNk9vh3+c3uX+nptJWsvZS4IdPBjqq1BuwbL/SZlSQDG54W6jfkF6EG1f8d
         Qy2KPqOT9/2OE8sRkz29uwvvs9AHPQeM9qjubFxf2G8FcD7NC77OAck8aSBuQOhwt3Cn
         sJXA==
X-Forwarded-Encrypted: i=1; AKwUvBxTtrjbZQXmnnMJIhoECXA53P3iB9X7wt36VVtQSdaqEyeqDiRqQS/CJA2pFvJAbEkwepsC4vAECUDA/6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbEoQ4lfITbHpHTFTQkI0xwzJEhADD7GNGGHuFvB5KVLfQ6PjF
	8OSFKNWktiwh2phrFrWwShkhh4mdHxt5Cj2oH19rAOI4b/ZalVLckH5FRd4LWZ9C2IjzZeuaAei
	jN8OPqpMdxjcOg1ty8wPqlYW2XFPIxVU=
X-Gm-Gg: AYBFou1H98c84WbdPZ35SvGIUvzn1zOc2SCUDbzxr4foq/M7En8xwalIz9MaGnCSFdQ
	CAtMRCPQfWJjLMaa2eWpMcyfO3QL6SLKTQ8Et8yFM6fuYVnyD/oS8irrpEUq9+/c91TfJleMcb4
	oG/d5HKWEsBrKr3Q7lHNftjOpUUyD1E9IoFbFmmXjhYaJH1Ytw9r+8HOXfJ9O6AME3OAw2kUjdK
	+iKrr1KKSHXjkiZZ0W7ZNtYheP8UT8m81AnjYblWye/ukiJbFhfkpXsty5rxc3DXqDYNwHQV9xm
	j3a64xqJl6fpdEem+BGEoOHBoAfUgAhE00aEcdY/rpuO1gGdBNhvNP8blsXVh1XIeeoj0B2WyTq
	gC7cwzQB+DQ0Dp4b4P2QsTc2K6/pQWgKGnaC8Mob4aHEmuJTZWk5+NSzAMBuH1O5FeSLN7GIZIc
	KfkpYqa4ct5o3xY0+6Nk1iL7J4mg8j6DhJD+VKVbMSEOMxxAUmzC0=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr9244966eec.1.1791735644658; Sun, 11 Oct 2026
 09:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010095001.265759-1-julianbraha@gmail.com>
In-Reply-To: <20261010095001.265759-1-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 18:20:29 +0200
X-Gm-Features: AclHuK_w3Y4kAwcZA7SbeHM9fSvSzVE9w0UyxZwltGRDETa14I43fFQK9NA9AuI
Message-ID: <CANiq72kyZpDa1YfLjPYQbatogvMONM0SOww1iQDQaZ4atcu+9g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org, 
	nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com, 
	jakub.git@horky.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 11:50=E2=80=AFAM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> In an offline conversation, Miguel Ojeda reported that scrolling
> horizontally in menuconfig's search to read RUST's dependencies has been
> slowing down debugging.

Thanks for working on this!

This is definitely useful, because users (and ourselves) have had to
scroll horizontally too much for `CONFIG_RUST` :)

Maybe it could help to clarify here that "debugging" above means
understanding by users (i.e. not developers) why the dependencies are
not satisfied. `menuconfig`'s search is uniquely useful because it
shows the expressions with the current values; i.e. this is useful for
most users dealing with long configs like `RUST`'s.

Is this patch the live one you showed me back in the conference?

By the way, for context and future reference before I forget, I
suggested a few other bits:

  - Wrapping on the top-level `&&` operators.

  - Even better, wrapping on the actual `depends on` lines, rather
than every top-level `&&`, because sometimes they are logically
grouped, even if they may use themselves `&&` for the condition. But
IIRC we discussed that this would require tracking more state and/or
reworking part of the parser.

  - For completeness, I also mentioned potentially considering to show
(a subset of) attached comments, but that is not really needed and it
is really low hanging fruit that is most likely not worth its
complexity: we already have descriptions and most options are not as
complex as `RUST`'s.

Cheers,
Miguel
