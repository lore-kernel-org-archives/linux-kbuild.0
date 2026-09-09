Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662CC48F855
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Sep 2026 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968124; cv=none; b=jQBIF2LfVKregtrARk2dQYl+ID48ZA7jWUZEdP2NWJMObWBiIzIEGoj1V2zi40IaVld3Oel9qjWSYenEK3bNBxs/jHq3fHVsBkLUiAs8BOCklJwuRhTWSN2mg1wsnIFbwhUUFxfRA6uMybFLDtijsgBED6U5/eToOrPvNKFHXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968124; c=relaxed/simple;
	bh=t3yqbvSqtFoLUHow+WwPXXOfeaEh7bClm80fMM9rQTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mo0GpzFyUtBdMLMQNhMHUFi47smGyKXKpby9JSlmFYX5MzBxQJELfvNNMxV+qurvqO+zFWO80y11gvDw65X34yVVTH3UP8U5s6YTVQSd7Igtu56zxbtGcIlLjIHWMzXuw9AjWv799XMhHLn/t9yycXJq2tjMOJIGjxUKdnRtQX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V0/3E8Sk; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V0/3E8Sk"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a58f2ce443so2073681fa.2
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968120; x=1789572920; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=V0/3E8Ske5Y8xZmblnelfMjLRxcvm7e4UlVY8hzVtbwz5/VXGSrdTzW3oRYhHKaDUU
         57Cxc2M+9k+jJGjjiCvX6XUS29CVHsDXFPAsecObHvivghI6qWCldok1qm2zAXQ/9kk6
         MiN14seBuRuY85Z9ss+5lx0LonazztSodLJlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968120; x=1789572920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=ftBVuXZphux2tF5XDhKGtK5n6duowvXaXwcsKzGxG3SKmmijOC9umIAohv6hLXe9eR
         unmOE5bFWEkbjUqfKa1ltLUxR3786Otc1bv1tmVhILPQsVpEcqEYMdZM3ClE7eoKHKir
         SGW6HNSd/YJhUQCyceqaqNnIsOQdkkAp+NNcAmlouyU32j75Qdraw40+d9al4yZQLnps
         OQjkbMTUZUYOAUMeVBSMGtYkaQ8m62Oy7gBd+wYr1HednzRrKd5/XIA1A3vBplZePFhU
         wVU7QcLZbvnYcJy34h2QAmA8wRiYklFyLYpmTO1GRNQFXcVjssuCjXR/2/OZ5yi9LfP/
         WOow==
X-Forwarded-Encrypted: i=1; AKwUvBw8pfzKcy174ZpN/Es41To5iN2u2dhwvdHylcMvbybVHe5KiAS4ib6DufIZ0twwsRixghQXsCAZpdAvAy0=@vger.kernel.org
X-Gm-Message-State: AFuF++kjBla6dmaVumCVqk0OQ8olh6mu68IBvGdGiuHLV+1Sd7emkPOu
	MVNGLD7p6zAbhmKEdXZhhbmISedUOSEUV3mWgsPgEJq1V0fkwrAoLRetPBGGlmzjz3sDOA9nZv+
	c/7U/7UTQRw==
X-Gm-Gg: AYBFou1vDDjx+d1d36ElQRJo1KdzOryVgH81ieSorFC97eFeNF/eZ7DrhbHWHHGZkxU
	ddC9Dm0AC30xz95woDYm5/ajH7vdkvA9I8fKUunZ7CFV7/3mgpUWdfivNusLP+Uks8lI/0U9nzx
	IsUzvUejhSjaWYZ7qsXBfyVoeXbYUD9Y6Bpe1z47Y6HdXnUF2J7S7BPcafhGen3BYtGoPacVJ8y
	u24PnyqG2z3iBnIWEHZ1BiWo6XriP01v+CUELFjIQOOK68ir5dFHJn7fVo8DeQriLn63SLps53Z
	eJ0mdC/BC2ifft0EPLUhIJ8MGNGMo7DmurPZuPLD/EA+rXRkHQ7oOjKJjIFUWDzL2M6J63y8I4t
	vEEQYbepBfDhiZOuKpGEcDB22yeiRJqj24G6lh/lPHZDwuqODnlrL6uB30/neCeIe1lpCeqzL1l
	b0ZPmmZOS0DRS8Hkr4LV7lopm/pvJtdkg8AIyCotY0Q/1AxfYvUjWpFNWtL8X1weC7gfZAzLwjI
	FvS6xSVhuLMW1PKzzbvBAY41rgLX5Nwv/WRgKedq4MkKNXr
X-Received: by 2002:a2e:be2b:0:b0:3a3:749e:31a0 with SMTP id 38308e7fff4ca-3a3749e330amr37417001fa.20.1788968120083;
        Wed, 09 Sep 2026 08:35:20 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37048ddc3sm44201021fa.3.2026.09.09.08.35.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:35:19 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48589798dbbso4955204f8f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 08:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByMRVVWEsAmmzOCZtUEFKhGND8dd5qUV+DohWe0Up8R13aC2uhruiWEYc8v8ZYOxw4wmEeTU7unBDx5vkg=@vger.kernel.org
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr1368813666b.37.1788967618809; Wed, 09 Sep 2026
 08:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:26:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
X-Gm-Features: AcwNN1UWYYtk4z7iDc5cI-l9BNT1_XTZBZ1EzZVT-QGEk4RrzSdK76DVFXE4iKE
Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
Subject: Re: [PATCH 11/23] kbuild: implement and use depcheck to check
 dependency timestamps
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

On Tue, 8 Sept 2026 at 13:57, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Each object's .cmd file lists its header dependencies, which often
> consists of over a thousand dependencies.
>
> When little has changed in the tree, this is what make spends most of its
> time doing, spending over a second, single-threaded when parsing larger
> directory trees.

Side note: from some kernel build profiles I did long ago, I have this
memory of it being made much worse by the fact that we use

    "$(wildcard xyzzy)"

for all our config header files in those .cmd.o files. That then
causes extra work for 'make' for all of this.

And we do that 'wildcard' thing not because we want to actually match
a pattern, but because that was the only way to have 'make' not
complain about missing config headers.

I'm not even sure the original reason for it is relevant any more -
this is all a very dim memory from years and years ago when I actually
tried to look at profiles of 'make' itself (normally when I do kernel
build profiles I only look at the what the kernel part of the build
is, not user mode).

I just tried removing the 'wildcard' generation from
scripts/basic/fixdep.c and the kernel build didn't care about it at
all. The whole 'wildcard' trick goes all the way back to the original
commit that added that whole 'fixdep.c' phase.

Maybe the whole thing is entirely stale now and should be removed. I
probably just didn't trigger the situation where those extra
'wildcard' things matter. That whole thing is from a quarter century
ago, and nobody has dared look at that code since..

Or maybe 'make' is better at those wildcards these days - or other
things have shifted.

From those dim memories, make spent a lot of time doing filesystem
lookups (directory reading  and 'stat()' calls - the wildcard thing
triggered more getdents calls), but even more time just in string
handling.

               Linus
