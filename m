Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24167363C53
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416800; cv=none; b=u0jOCiRv8M7ikXPRKqxoYC8LCKK3GSCZtWM9/hBeZ2xO04JLZ3e8LdNbHjf2B9hfWetZ/WpweXATYDGk3YdgBKiTR5wpvsFdIkrieioQMFKFI1psMGxtmyamweME9JbN6uERAT7YfLl+011+GvfXw9Sngktp8plR+NHAvtf+IKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416800; c=relaxed/simple;
	bh=g8JbSv2uB9OVHPX6mK0/xKaLA1R5JXVM4OnU1gOEgUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KyzNF0+GI7S0RRWktRWVW6tB2mI/6cQqPgR5dBazE72WtVUQdzXdbGtIVEbg0eCg1kutrIw7MXOhZRjWSePZDRk7C3Rn4nqmoEw4p7a531w/pK0oxOlQf43ewTCAlizZ9ETsRVrLwyLJ0zw3CRl4C62v9e63L4biO7LPZR4C/3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UBH0ODQz; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UBH0ODQz"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6a9dfe4dfc0so2430231a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 13:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789416796; x=1790021596; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=UBH0ODQzibhOU/DB7Gi1mW715LcAbSGI5Hll7DQC5/kpegfjNpmEVvUxIx1FeO74qK
         NGPPmHM+WBxTjfSPEW09w/d7Kgt0mfQ6XW2rSQHD4t0cWKIqXnJCawaH/dnamR91q/o3
         1k00qDIdmE+U51XR+iEc9nDj0JFrApNjRAkos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416796; x=1790021596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=sOosiUj4FI1WeaiX1J44K5ehzf2h5svc+c/MxASuxQJd9cQEzCOu1LOirBxPg4HXHK
         Qo5WYE1ERbF00PLPCmRsEs8VxqB9+Qp6xA4Y21tRX4XCjC4Mh2boyKBqKMOSmih9q9Hc
         +UvV/oPGvfOloI/npy3INP/tJsrItp1l1SeQqDOlTPzC1k4ADq00Zg3J4s0CztaihsKA
         +2A2yEapvpjp+jyaVTxoeqEDjXv+MyZJtzCCuZlDJ79tKjEG+evWaS8cYjMgIFaCRPC6
         a+x7b6rZHIko7yu1uKPpKalAf2AnLO9qaWIZv4VSOXkuDO3CqeMHT9np91603xpTRm+U
         XRLw==
X-Forwarded-Encrypted: i=1; AKwUvBwjgKhEePh2Fcgd7uHVsiXrJGm5dTsk4n/pxP8gGWvSWOCsa3wH02p0vWMCq3CSA2WTh60v2SETx0HCngk=@vger.kernel.org
X-Gm-Message-State: AFuF++ksKD9N14txmqX6hFvQkKhL4cK7jlqZiDfLut9ZSoCcA+3kYUF/
	ArJY+DEkfsXcHLJQVJPb/3N+0TQX30+qJ5wGNflm4uIyEG8Urwu6dajS+xMJQTjCJnSfm0zn8fB
	J1gPUTHQKKw==
X-Gm-Gg: AYBFou3+RMbvRlqJ8/RaUtXcqegDHJt1HhmT06c/zDNDMvr3thpt6txehblm3SgNG/j
	lg5g7tK5TqrPqzKv4U5NDZ3Xkbo0r0ssl2xHmrDlACYRmNvMYaAk2zMKcHFljPyqo705GHXinPQ
	8WEJ6QneVC7xku0g4boUy6a6fCloh97EcmPHaxGKmvSd7yv3AWABPVaBjMxY/+MEENVCSSXB79Z
	x2UB39a3KGYAAU0SOX4AluRysPx0gbDlRvQPGoP4bw8pFjc62dawkEIiqx7ULgcVcqaa1JTu0mV
	3jUbCi2iwnVCGLjOXzSCHkXNEJ9BT146zjdBUl5E7ELmD8Acy1OaD7rvoKtoB5KBziJNg7nDSua
	F8bcvoY/HEPEudJVidryGOMC+mG3JlGqWFPVaMRgxG3/ifvT/DX/9Fl5cB/NrsYlv6mcAz9l3wl
	YT+teOHwMavb111wgh6hgT9NgMjpzZWJLmW9X8SgOUD+NBQjS7vYmnSVca4pGD8kSpGAHhtgQEV
	i6t7ilPLWhs9aOcJpZIA6jdn9WINGwgLv3st+AVrunmGiXi1g==
X-Received: by 2002:a05:6402:4147:b0:6a5:dfb6:3618 with SMTP id 4fb4d7f45d1cf-6a9f61e7f73mr3098438a12.5.1789416796211;
        Mon, 14 Sep 2026 13:13:16 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5920f4asm4616262a12.16.2026.09.14.13.13.16
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:13:16 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso3749503a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 13:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwmSQtvDc6zN6V8MB9W4yPP1OwjfWGWnDRqAABA55wCL3FMh2DrQp9/CTb86PKbQVAnqTtf1qj4FSztZVU=@vger.kernel.org
X-Received: by 2002:a17:907:6d1f:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c29b84c9a48mr280688866b.3.1789416413732; Mon, 14 Sep 2026
 13:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
In-Reply-To: <aqhLhVMkNzf_4oJw@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 13:06:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
X-Gm-Features: AcwNN1XwkDuRyfqGBvPSv1hGEYJIl2TPFZFoOf2g9mdtKKeoU1aAJmlE5veL8PE
Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Mon, 14 Sept 2026 at 12:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I found another initialization bug: klp-post-link.c uses
> elf_create_section() to create a reloc section, so it missing the
> initialization of rsec->hashed in elf_create_rela_section().  But that's
> moot if we just get rid of the hashing.

Talking about "getting rid of the hashing": the instruction hashing is
obviously a big deal judging by the hash size expansion in that other
patch.

Do we actually look up all instructions by hash in the first place?
From a quick glance, it looks like almost every user of "find_insn()"
is looking for just certain *kinds* of instructions: calls, branches,
returns, endbr.  And branch targets.

Maybe stack updates? I didn't check.

Yet we seem to hash them all - even if they are just some random
ALU-only instruction that is in the middle of a function and never a
target of anything and has no impact on any code flow.

So the question becomes: do we actually need to hash those
instructions at all? Are they ever actually looked up?

I don't know this codebase at all, so maybe that's just a really
stupid question. Feel free to look at me condescendinly, shake your
head and say "Poor Linus has lost the plot".

[ And yes, I see that whole "next_insn_same_sec()" thing, which
obviously *does* look up all the instructions when you iterate over
that function, but it strikes me that using a hash table for that is a
bit strange when the natural way to do it would be with juyst a
"struct instruction *next" field instead.. ]

So if hashing was such a big deal that it showed up clearly on
profiles, maybe the answer isn't just a "make the hash table larger".
If a "next" field were to not only make the hash table much smaller,
but also mean that next_insn_same_{func,sec}() would become a "follow
one pointer", mayeb hashing would become rather cheaper?

Stupid? Or maybe "not completely stupid, but too painful to change"?

         Linus
