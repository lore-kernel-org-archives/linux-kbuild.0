Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5925678E5
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Sep 2026 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965030; cv=none; b=BFs+Z2QypnxPUC4xynsxHd/sWgZgoFzs4L78eBueTf5LnwAYadaBmc/ecX8RYiLJHpB2nP2M7VjC5UKpoy3CRWyxssY7oG8M+xzaUDnle3J0f+vj98V9TJRX0iBcuPr8OxsewEAiw0bRwU0SNpEr6aqyPmr+D0I22FWpW3fb0K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965030; c=relaxed/simple;
	bh=C8wlVunptoThlz2K9sFX5JRkjNXNpZt+isVUJZEm52E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvYMQ0eRQqW6SsPm5nR34O9legt1ExVzT1EsUr/4Y5cfmQ1/OKdpvuja51+Z7pgsG6Vu1dOBbcFoDkmbcjnEAMubrCO4hDXOlDIkqktRXUhcxCmJDa+mDUI4KSA/m+z7CVG9+/1KieCkh0/xF/C8YwBkHxHf1tTsUeuYEhj02MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CMAqWG73; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CMAqWG73"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a49a7f2dcaso7129951fa.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788965026; x=1789569826; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=CMAqWG73h9LV6HS3JkNEGrtTPrhlQaB8DOqHNfRWomz6svdWIJokmvN+CHLRwnqqwG
         jsXIYKhaD7IBLAVZbNxvSXw0o6WHrqpg4BvObtQlhGvMeTIjbvJhjJlV++pEA1Nvrv47
         pAchMce4inPM0oouUJhKRuXpUzFWO4HQ/f49w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965026; x=1789569826;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=Oe5JtkpOOqf6JefUOq5fc/68fpJoWOhNrEIqILGt4n8/0L/WRifmRJwikTWmL7JPLt
         fQhkZNnpoRo6DJaBSf60vwnlDw0PiJzZoKQWU9qPQPiB9UEvFc3Z1O5tcVdKbDC54E6D
         mugpzU8b6hnTLwzMHhXWFGEIf+LGclHtDWP6HhFU+MMeEhj0jeiH2StAnvYyGz0TPEQ8
         NHOknoMghvsCKgz7b2CLCe5qVESTpJ9SdBc/W6fAb7v+MV35TflVTcR2vr2TpO0NEDAn
         TOz2Y1evHiwmFmCN4KrOEznYeeTKAtRb13xafpktvf7woGEDm1gakfl9RY3jYNFkPwGi
         s9pg==
X-Forwarded-Encrypted: i=1; AKwUvBz5GB0JtkkPSpZcXQXMBtXAaS4HW2vR2SL1HUYm23xP4KBrkVmzBnevFV6tToL4ej2ZUKReNyG8cIRQ9so=@vger.kernel.org
X-Gm-Message-State: AFuF++myOPAKpszyMnGvqXZa+wF9YhU7DqztxJDUPvQFv9BQbvJBbTOY
	dQ2Vww7L+GrUZCqsF51KGDVptPFiBidRN/n7tK5570LTQuMI7xdqTVoNZtrKILXh3g1TYZTBpfF
	ON/5QSbU=
X-Gm-Gg: AYBFou2UPSUpnTnNhCvzdz/sPJHVXIq2E3L5pdoCCR4j7bklIx6qhO0bKaFmRJqywFU
	zDjUjHuhJV4oKZLecxQYVCDSrZJeq5dTaiuJGR8hqb7Rhew/PQRE65WN8LZCCu6kTbKgyQa/8SN
	BUasIZxscv68YahMOL8//GW6dIGzm+GBC6FdvKnDM0HuR842Il4LKqaJHZ5CwUjX+xOEPDwuxFH
	zCQg56eLKuLvSnLsrVQSDnuha10NlaBkTpFFgE+g2q1oULjctc8QemhPa/y+gRPBOGZuXO/ohbG
	ZoJeeu2N2NH2ZRI6ZPYuxxgfzud3ga2CWySfHx2k6y3CQgRNrvZtBDR9qcu8eA4wgE3+HcM6Nuu
	to3BthaaQoRObpk4pnbykt51kOg114rcCMNlvgMpB3OvGuUT25Q2DoeS5xxEUfuObjJu1QsEF/g
	BQ5Hd7djI7+5S16k16VPxHW9xHhNtvSCJSAiexmjDtPo34hikPYBTU+OH2vu2dodwjM5JAAhB2F
	2jFJghyFQvBvIUQTBUjIbs4eYdEmL8iaaZEWTKbn/E/RD1sJNLl
X-Received: by 2002:a05:651c:31db:b0:3a3:7681:6d63 with SMTP id 38308e7fff4ca-3a3768175aamr38740211fa.27.1788965026480;
        Wed, 09 Sep 2026 07:43:46 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3d47ab069sm41485961fa.4.2026.09.09.07.43.46
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:43:46 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a4a82aa383so5369881fa.3
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 07:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByC3ZRvkyR2fI47rlXZJGbpzW1qYLkqRzcGiHI1sRc2Hz9SlPKeAvLyitXJ2ZnRkbYzjAuCt9nW/Xgp5p0=@vger.kernel.org
X-Received: by 2002:a05:6402:208a:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6a7ee5662fbmr12667373a12.31.1788964533277; Wed, 09 Sep 2026
 07:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:35:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
X-Gm-Features: AcwNN1VOdEagBQA5D63IF5vfBaLV4II6ehpTsThafIib6q5kHaeURBrIxknkBpc
Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
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

I'm finally going through this series, because I do care about build
speed, so I love the concept.

However, I haven't actually applied it and tried it, I'm just reading
the patches.

And this one triggered something:

On Tue, 8 Sept 2026 at 13:56, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> kallsyms generates an assembly file that consists mostly of .byte entries
> containing compressed names, token strings and name-sorted sequence
> numbers.
>
> For an x86-64 build with 158k symbols that is a 37 MiB .S file which takes
> 0.57s to assemble each of the two to three times it is built over a kernel
> build.

It strikes me that this is clearly a bit faster, but it still seems to
be not really fixing the underlying silliness of that code.

Wouldn't it be much better to actually create an object file directly?
Afaik, the *only* think we ever do with that kallsyms-generated file
is to immediately assemble it into an object file, because the actual
asm file is useless to anybody.

And we already require libelf as part of the build, and we already
kind of do things like that with gendwarfksyms.

Don't get my wrong: I think going through an asm file was very much
the right thing originally: not every architecture used ELF in the
first place, and when scripting things like this the current situation
makes 100% sense.

And no sane human wants to deal with this kind of grotty detail and
spend the effort on writing an ELF file writer.

But when there's a LLM that was used to find these things and help fix
them up, and it's something this mechanical and the result really
isn't ever human-readable and never has been, I feel like the obvious
step would be to just ask the little helper bot to switch the whole
kallsyms to using libelf-devel and writing an object file directly.

I don't think anybody has any deep emotional ties to the current
kallsyms code and that horrific step of the kernel build, do they?

               Linus
