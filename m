Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC2233722
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Sep 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968623; cv=none; b=J3WTPapiINGPyL2grjzNMXkxpdhLZSgDjIGqLVYr3gs6Rn6doo7Q28JIdKaKNhN5MgvaJLmsr+POwLS621EIenZ/c2+cJgY0z9fspcusJxSsOcfAPQ0DHvpB+ZXvW8lHrtHp7OuwHCEvXxQiPlt4z1mhB8Lryy7hZDDCkNa07S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968623; c=relaxed/simple;
	bh=tlXMq73KJhLbqOa3sBQb6U+eAptv38yQqOaGm+TCraA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYavmIBrvmJArSBYALGaqloq/Y3Gx1vjzX6K9tJHYm+BUYXgQj21uwy0QUbGhPQyAbLhBofGzjcUKCz1fE0msbKJrgFvdo5lP3KPZ2QZH1QPXGShwcriXPqQIoWwR35m0jJH/EtBttOTYSbkuyKZfv8Zl6KOKmvPCS1T85TAOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T/qGRyjM; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T/qGRyjM"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso221960166b.1
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968619; x=1789573419; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=T/qGRyjMPsQ1AmAJ4myZm0/H4qeS5OCQ1gp70GDro3PoC5c53QtISUhVlwtgDHT9SQ
         LBnmEu7P6siRHFdmZ2IsT/RoNvFAS6xrGxgFv1SIDwQMUph8Z3pMJDNn+7X/a5BcUfeL
         pksrs52FRSXWuMWGUUj8UqvbmJlgnNWOccPZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968619; x=1789573419;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=H7TDS8PD3q4x5iHXSDbR0tK7ASmJyfJJh/CXHfi7DSA7tPc6BTH3//Js70QwdBpMIV
         NOZqAobHJSkr1Gv2O8odfkWdvitYW5cxOOxzWKWtWYHKUSSreBRPkKphn9Q5nR5SIJsi
         L4E5NaM8SmMP8k0l1tS6ZuPfEZC0DUp/D0mbsBDw+wnqF7/GaKcoZ5f5/vUzlDcfDgvA
         LBqUVaeSZJb8tMwL62mzYhNVohxDQTAYRGF5ZjAR6cY3FzgxhMqSj5Fq0w7AE0DuKrqc
         UTPr93H0ZA7gnm5zK1MpF7bp8TYxzsGRpUGMKAHXQx/0UplvxgPuvGp4Uw11MJxm0oRE
         i6OA==
X-Forwarded-Encrypted: i=1; AKwUvBzEmRDJdFXG0rdBqZ4Ha8RjCBiSRz5aqYmwvMaCMWn4XBDE28DhoEFaa4ORgckHWR7exK5Uqekbm2DHjck=@vger.kernel.org
X-Gm-Message-State: AFuF++laRK5T4WH/jLdcqQGS/fGiFfIPf8mViPOA4Hk9l1kk2cm0+7xd
	PVUcBhJfhfBEx97BRMxd0ILiKiRMQrLPPPNdDE1eqKQMyyqjzxpKw6TkMZnB11QuPLRls/dh4O5
	b7BOTQ50ZFE/w
X-Gm-Gg: AYBFou3qNgUA7+f3/qcmL/0T3M7M6aIWrYHeLEVW3vfZiDp4hdcZwD5aXMMFsdhyLxI
	6lYqD4t5/Yq3liS9Gl325NEILI8YlMy8l6tZEGATsIZ4WwwZhP+g8vgllQ87LZXWnGPfTzxKo7C
	rWUq8YavuK5fKvIEdXIdqno10dbm64k03SSanzOOx1LoRTJFGrS6TDxrsrDGCrCD/h1eGbDg3vK
	wYEtgBZPVnFwrsv2Wcyt8ZmE53VjqaXGEW+qra0TmUwHKHT2McbA16q6sBv4JyFv7Y2+brXw0lj
	nJu7K7Erghr5dc+InFd0N7/phcwm+CXz+BZOi1LKKYek11WrvsRS1Py2lLtQ0pzmjEJmLspita9
	8eaS0pQ3pHo9GMsj1f/onzvy6282IEYKj6S7oiMWeIEltjNWH0PGVNvCFtu2AUuCbhbSfSbR4TR
	d7vA+Tp5zfh+fwkVXM4zFuKiRpjUB9x9Y4pmZkHUuY9YY/ORvs2bxvPc8McsgWYviuk1HOWcUB6
	/kiQAVmGxdAkDQ8OqGyCzEMyc3PQpgb3Zy/Bj8TVWZr+dOa0Q==
X-Received: by 2002:a17:907:c653:20b0:c29:4147:f4e2 with SMTP id a640c23a62f3a-c29414802c6mr130006066b.15.1788968619370;
        Wed, 09 Sep 2026 08:43:39 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c292c14c6a8sm163726566b.47.2026.09.09.08.43.39
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:43:39 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b23so234804666b.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 08:43:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykQ7gl6EpPvK/05YAJBAuZI1MKGP4iI7kPx8uJ5ETN+g9qb9+pPIlZmhSO4IFzW8XQKZD5qHYfJCzsP0U=@vger.kernel.org
X-Received: by 2002:a05:6402:3817:b0:6a6:58e:f84b with SMTP id
 4fb4d7f45d1cf-6a98dfd77b1mr5256449a12.9.1788968246832; Wed, 09 Sep 2026
 08:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:37:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
X-Gm-Features: AcwNN1XKEJS_S8eITIntw19v_mcHyut1QfPlZfjowWaI1qZq5Mivgkqwhzm7f_s
Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
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

On Tue, 8 Sept 2026 at 13:55, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time

.. you're preaching to the choir.

>                 == allmodconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)

Well, that's certainly very encouraging. We should do this. I sent out
some emails as just reactions to individual patches, but I have no
numbers to back any of those emails up, and I never actually applied
this series to my tree - they were all based on reading the patches
themselves.

That said:

> An LLM was used to first determine where the bottlenecks were then to
> figure out how to improve them.
>
> It generated a lot of code, much of it hideous.

This made me scared to look at the patches originally, and I held off
in fear that the patches would be horrible and this build time
improvement would be hugely controversial garbage code.

But:

> I extensively audited and rewrote a lot of it, and heavily edited commit
> messages, the cover letter and comments.

None of the patches look at all horrible to me. You clearly excised
the hideous parts. All of my reactions were of the type "this could
probably be taken _further_" rather than me throwing my hands up in
disgust.

So the Rust parallelism thing clearly isn't ready based on feedback
from that quarter, but the rest looked safe and innocuous. I'm all for
merging this, although it should obviously go in through the right
channels. Mostly the kbuild tree, although some of it clearly would be
other cases - the objtool change in particular is fairly substantial
and needsobjtool people to approve. It didn't look all that
contentious, but still..

Anyway, I'd love for this all to go in. Build times are a pet peeve of mine.

              Linus
