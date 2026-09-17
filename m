Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FBD4E5359
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Sep 2026 20:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675384; cv=pass; b=JWRNqkFWDBvDf+xPjxUCujki1jK48lJdSAoJGEItQXZZqUu2yYOpvHsgwJeemK4vHNF89YEkZkbFjhvHP44zCUM+iGtwID+g6IhcPxW1yrsg8hved+SXl4lpg5Pbkqpo/p3aEd7TnwYxT7cGqei7gL+nreSfRq4LirhYhZQkETY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675384; c=relaxed/simple;
	bh=GpHjDtqu+AzW6bYVn14IR7601Ha7EtaAYwvYSeYG9jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHgHd/T8RsCf7Vr2JiLFM2wfNHOkwgc7oCkGQHFGIzJJbQSRui0h5TKLMVAp0B7za+03PJG9TY/oVK5hbDIIMH4pSpws5DF4kNsHRRLizKDzU6cJPG+XJAacqhcWub46W2Q1Tai27NzHvF/looCwWylli1m0agzhhiraMmxiFDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RfRoG1si; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RfRoG1si"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so254235e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Sep 2026 13:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789675380; cv=none;
        d=google.com; s=arc-20260327;
        b=sxvlZmY95UNF0ADXpNzeFGOvqq6ipSvOC6GTWwRk6qZukYJI4pZLwGeR332GrUfU2n
         WS5eL8GE51jWam8SFzcdW9+CjoFlzH10EkbERy3b1dgbXZfJboaa2Qn6q4zDf8nms84/
         aLhO71SkYIovkkF8pw62wzst+yG0Ohg4FSHs66HSRGASqfxlJ6+o4P5MbhmJuQyliEm8
         Oi6yCEjbmv2c8nQ0d2XKdrB7om+Ztb7gdBSmVKWTyoG7lZB+oapkX8AsI/ZJSVmMtfss
         t12u0GbcRJRV9iI8u2DQf9MmfxQsqkUcQ4fJtCMyf7ZiZjaIPcg95R9MZm8kS8+jmAt7
         Q/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        fh=zTOn28zaj1ogatxbIiMdj/79jyFVCHUZKqy6qX8gHWk=;
        b=qRGlmF6ABzridEsmPQgHbTy4ulU45/cbKfJs1N9jIWAxd/BmD7JzggkMb7Gi9afVsY
         poD5U9uFmgczFYM0bnixtWOEy7828nFkzhHHchbFka9er7ghKFxCn5yh6W0+L/UJxqgx
         hwzRWOa0uJyK31hcxQ/qgtQ3Z/wZEUCX5XEoA1s7lUJ4RZ+rC2OGfRoy0NRgFDCrLpwl
         otirnUau1y8rAROP5di2/6y8+XBUAOu30vUz2c7fTZuFmixXpBV3iz5HNMMLXI/7wko8
         4pSQTJx08hlZlzqBRowAB9UBaJV2nD3Kt8cGqAqGVLoKSNsapZ13AQiFyxjC0HOxOUq5
         E5EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789675380; x=1790280180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        b=RfRoG1sioHwQsGYSkcve3ZDGfErdmSWrgCWHA2JlCBaobnXxnBfdr0TKVq27LK2zIZ
         UOvE17R6vYGLa6zQAttig93toa0GDEpwxIgGBTum0FIhjWQ2ZvB9dyNYwvdV/otOI5vm
         A3ZFMmlVd6uq3DhAGMGK/mu80sINzK4rP2D3RMyU2gORKLRV1tGre9kz1kts6W1QAYaT
         9XuABFIURZMRzl1KZihvHVFw9CQ9VbWSNQiQyhE/Rv/Yb9DXy8oRagR/6b1gegQS3v8y
         YYEboH4Y45Pq3GkmJCdeXvha1ezGt4n7sH0US7ujlIUX6kFFOMpc2oolhcFXbjqXk/zG
         N+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675380; x=1790280180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        b=I6cLjsrd+kb5F24QjcMyoOnxgb7ap4IrsmDTOTedokmz/uMlBELa0KowucXWMfmpM6
         2WBmMV9IYJswiGwuTCY+SNOz35+uGRe1torh02m+UsOS4g7Dfy7R/WgPEe7GRE+KpWwS
         O+QkZ6r7LX7S5kk6sxTdLxqYbxcLf/gyaos3r2K9mIG9W9INj6kaeMD631dqhA8B7Mt6
         D5IWXmqbytlzIvMCD3lxDmuwbnsGB8LLZNlBmWenMyZ5IyJUu7KIMhbgZlfMBa9RutEW
         txkodXJvqL0BwIceXp66lt5nZg/XHbUiu92fV9ZAu9UhTh0z/igFNHL/9JRZtWEfzB8m
         Xz3A==
X-Forwarded-Encrypted: i=1; AKwUvBwp8thwawOjkj/4NORHNTnHkcP1l0V+hpPBv6cDLaL5MK7SSdhpvZJjZPBDD0WC8tY+/H1phrTxBlWTq8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kwcsj61NDOOr4gS7CMz6rQf/9A7zPy9bdLIqLycQZCZoM00dn9
	tLahxjGa2W8s9aCaWxEQb9+hHY0cspnNEx48v+d0uCgPaLIGsTx+D2jOfhGc4Loies+1W6NSmhq
	AJjL5fA7ff6RrruEw5A5lUYjxN8WG90sZkHNCogk7
X-Gm-Gg: AYBFou3aDceSe3q+sK6etNFYuiYuq4BsaYsdlOemIou/8t9I/c8r++w5Q/aA4JCPE7o
	m5KOY2vVNS/QQrdo0n1l4YNrdZScJuLpsHZ9/Ts7xxyG5fHhD0+bJFJ4S8cs3zXWKrLlvtnIUvD
	t5v1mzR/gcuxov9RUnDzjdEf7O6FyL8H2IlOAzBa/bxx1vRNv3Fa4Vv2yaAmHHcdYqKdboxAFOK
	ib/2of0bjMeaD1heTCysYQJNDHlVgJVEAU+Gu1j+hlqEJWG8gpnhO7Jn+5IVF9TVbxpWm1S567W
	YmnwvGNJ/9jwYbTBqAZnJUczIUtNjmuM6EO/ixH5uXKZE4G17LbwTsFWmR4NbLq3AFc9HZilCtv
	q6h37pVEC1N31Dyyz3pxqqHDpP0xb8ogEtYHHAs25iagCmtKZ9/1ZFeG8O40KIHj7EEL9pMY=
X-Received: by 2002:a05:600c:a013:b0:49e:6891:27a8 with SMTP id
 5b1f17b1804b1-49fc574a9bcmr72735e9.25.1789675379819; Thu, 17 Sep 2026
 13:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
 <aqwkk7FcQ0XWeqJW@gremlin> <aqxCNyxYRzN2Oher@gremlin>
In-Reply-To: <aqxCNyxYRzN2Oher@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2026 13:02:48 -0700
X-Gm-Features: AcwNN1XUt93HLe1Zu-oZLdknUZyAU05hxj4P7Ko_JzOHOx4U0fnT6yaI1XKYaw4
Message-ID: <CAKwvOd=zbE8MZXCNCBJNpd2WWn7f+AOfxYcmCp7e-8uFSM+D9g@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 12:42=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Thu, Sep 17, 2026 at 06:36:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 17, 2026 at 10:15:26AM -0700, Linus Torvalds wrote:
> > > On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org>=
 wrote:
> > > >
> > > >                 =3D=3D defconfig FULL build =3D=3D
> > > >
> > > >                         before    after     delta
> > > >                       ----------------------------------
> > > > Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> > > > Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> > > > EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> > > > EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> > > > M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> > > > M2, clang               634.5s   569.4s    -65.1s (-10%)
> > >
> > > There's something odd going on with that M2 gcc build. Why is it such
> > > an odd duck?
> >
> > Ugh dear lord I think the LLM somehow corrupted the numbers... Let me
> > re-run those myself locally and come back with the actual times!
>
> OK numbers are in:
>
> M2, gcc                 564.7s   512.1s    -52.6s (-9%)
> M2, clang               615.1s   564.1s    -51.0s (-8%)
>
> From the v1:
>
> M2, gcc                 564.0s   512.4s    -51.6s (-9%)
> M2, clang               616.1s   569.4s    -46.7s (-8%)
>
> (Tested as per the cover letter pre-reqs, i.e. applying dependent series
> first etc.)
>
> Not sure on the -5s delta on the clang build :) that might have been me

Clang is faster on Thursdays.

> being more disciplined this time to not use the laptop at the same time.
>
> But broadly in line with the original numbers.
>
> >
> > >
> > >              Linus
> >
> > --
> > Cheers, Lorenzo
>
> --
> Cheers, Lorenzo



--=20
Thanks,
~Nick Desaulniers
