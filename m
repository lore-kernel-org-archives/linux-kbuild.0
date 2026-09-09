Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB6569F3F
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Sep 2026 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966480; cv=none; b=LJx1LrCyt9QP2+yCIqsnyXCIk2pObGrL7RrmQHhk2uB35qyCI5mvJ2ZZ4ghqdlvffVzezppDinEZ2S3LcQawkKwuQQWow4u8PfsEMxj4VvOSCIhh2Yq6rNdwmVpnA3AKLDbCupmGDnCt36rvbMkMdqqP0R+7vkH+1cnGt9fjKMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966480; c=relaxed/simple;
	bh=qF8PC9Ug90yk/PrOmZBC0YqOzOPUdR+ADtjc56MP5mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rt6abPNYKelRitVbY/te1uWsD/d9dPj6G6aMwU4g+ccR+h+qH7o/vCgs/jrmAiFgVM5RghADsUUs1IztwODVDfDALP8nph9vsJq6NTLeFaBlY41M9ODh4swp7DtXKcxb8WOJN+8bBHfdyClg4vQWiCiv6OmIbqBbopZL5EN5C+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ai3Q2C1L; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ai3Q2C1L"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso56765166b.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788966477; x=1789571277; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=Ai3Q2C1L3VnhHe/1nkU3tpTLO7ez1rPOq6IyJYOa0cYM2BDkElzFqile/EefEMwxqU
         AjrVfLcxkoWLeysmCyMmRs/WWIiPmayIJ19wRKLjQCcGdxHxpF488+upcjDwM2qVhyz8
         9qzPrlfdoH3JvGiXRaK2/2JAskLt5vM+sib/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966477; x=1789571277;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=Btq2ISdvRYRXLQvz8ra8lolJerllJNWF8PQ6Fw9N2pSg8dGnqCbaAOaEv3nN1uE96y
         4i9Cv5tBbh9RCSNh/hWeBVfDxk0vX2xtB9JzxIGm9xme5wF6zycPXZhUlUcv0DH95nmK
         SngZ9bcbS8xEXYtSHfWJwrqQRECHX5H10RnqCdQ2iHS7iOoGjyYCE9U/xi3kPtIUbale
         F9wSluxk19GSgURdOwow8HEggG/cNx7ZiXvVQsK58SBjrw3Qhxkj/OnQ6/AxB9ND6AYJ
         prj+qDBAFg/bNfLvdSUGm+2i3TyvgNU++dd4Nvlwzyt+dwJj8aaTv8F2FQR5S6uSsx/H
         YPWA==
X-Forwarded-Encrypted: i=1; AKwUvBzVCZwbeqVsJcl35T53fGGP0k+Ut0iyeN0KcS3ovDZ4+UX/iv57Gx7Lub6jfVua3khMLp0LTwH8fnx+fNY=@vger.kernel.org
X-Gm-Message-State: AFuF++lVQN5sqo3uupkRh3Khinkr7FEbaMOz/gMbRWkGAuUFzCZY5I63
	EsmoEyAheuB/7038XwTy7l6v5Ay2Ni7iWd5cBcszDx+SMi7sRQzTbY+h8R5cijZa904cjvSTUuC
	3oI0gUDEK0SBj
X-Gm-Gg: AYBFou1kYbA9oU7BHReKJbf2rAomf4YMesd4a+C59BdJCN4cPU8xHTiT6n1vVnac96y
	L6oW8zYFjlD3QkL9Z0dMXqDX4H6sirIwa3yC1/c6Cmret2AKtpGO/5uffs1ByaV/zW/8X0aTh89
	iiLpcPH8MZ/2QS4MkltswGqPEYShMlebPajjcl2V+n2VInUFtaxkBSSwm529CSXMuhkSqkVzeDd
	z25aEbm9VMaSGgg8dqxCHZLFBxumXeXBEKRLx6BLup8E60zQp+cmR5KJ7NezCiCugJpd1oqKkyL
	2GFYmDRPWFvMZ9bXuwc0qfVF4CI3W2rIl5IJeKZJ/fOWRgR/XoiHNRxpsfIIU/fqe0Tziw/TIRk
	gVIACIwc9bKwcloJF0cD/owT0AmMXvFJRLocvDrGUftJrsFtEHle3iVeBfOGjInJq1lg/xQnhsI
	3Ena8w6pyyyyCiDQ7Re9pp5naXO1Zdl7yLdrIQhbL0D6IOAu915cwNPt/mBNYAfV3qm4M0lgFgx
	hNv5VcT1M5wSYD3EudjuD99Y23DtA==
X-Received: by 2002:a17:907:d20:b0:c28:599b:7782 with SMTP id a640c23a62f3a-c29419f8fe4mr67543766b.21.1788966477083;
        Wed, 09 Sep 2026 08:07:57 -0700 (PDT)
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com. [2a00:1450:4864:33::10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03644bsm796137666b.6.2026.09.09.08.07.56
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:07:56 -0700 (PDT)
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so523509a12.2
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 08:07:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2Sv7hN/FyZ5iUuz90TXC1M+CSCGyJbk+0G2reYitreWf4xm5Pzupv0WG3bfa2PMeaMVxp62wHyu+NJ/8=@vger.kernel.org
X-Received: by 2002:a17:907:728f:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2941868b12mr66185066b.2.1788966011712; Wed, 09 Sep 2026
 08:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:59:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
X-Gm-Features: AcwNN1XmVo334b1UP-lcj3CPx7zvteJ2HddEJqKkfbem-zQh2qUu9HycJHabLtk
Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
Subject: Re: [PATCH 15/23] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 13:58, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
>
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.

This kind of triggers the same reaction as the kallsyms code: I think
not including <linux/module.h> is probably the biggest win in this
all, and precomputing the offsets of the (few) structures that modpost
uses then makes the whole end result fairly trivial in raw asm.

Fine.

BUT.

You end up with things like this instead:

> diff --git a/scripts/mod/module-offsets.c b/scripts/mod/module-offsets.c

where it generates a header file for those asm scripts so that the asm
generation can do things like

        buf_printf(buf, "\t.size __this_module, %d\n",
MOD_SIZEOF_struct_module);

etc.

But I - again - get the feeling that this is all going through AS as a
silly way to generate an object file, and that there really isn't any
obvious advantage to that side quest.

Becuase no human ever wants to see that asm file, and it's no more
legible than generating the object file directly would have been.

So I get the feeling that it would again be more natural to just
generate the object file directly when all those files really end up
being are a few symbol definitions and a couple of fixed structures
(is there anything but the magic "__this_module" thing and the modinfo
unique ID thing?)

And again - I feel like nobody sane would want to write that code. I
certainly don't. But if this was at least partly automated anyway,
going that extra step might not be all that horrific.

I'll also be honest: part of why I do these suggestions is that I do
think it would be faster to skip the intermediate assembler step, but
a big part of it is that I don't love the random turds our build
creates. Getting rid of the *.mod.c files would be a cleanup of our
strange build.

             Linus
