Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1893839A1
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 06:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453938; cv=pass; b=t4VRDvCfci2NG0ImZ0K84GgfOiRacMIOnKyqnX5rIvWM+Hp2c/xgwb+ne7sILcoWyVW0LRg9CWlohXXDOLXewXzD/kQBR9By4ydyihODz5KgxfkWkCnvWO7WUCL8t+424MOjtPm+9cX+qPg/s0uJeonY9aWqS+6FSMuozfAeZQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453938; c=relaxed/simple;
	bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hixPeLJxXhCslZwtWLeiv1zJRtLxmOxTv5cPG3SUXM4LK4hDDDpICWGQZW6Jg88na4huwjTxYkVWWHPz0Y2uLEx14Ap6EOz9tA32iGhTcOaqhKPCnfcgViakzyCUX3PJ9yw+ZFUPdD6lFHZVGp0FfJfttBj0P5s3fQ7LiuCYt6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5CRJ9r3; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5CRJ9r3"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso520063a91.3
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 23:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789453936; cv=none;
        d=google.com; s=arc-20260327;
        b=pqODi/t1JLjJ0TrKnNtGrQsOEKvyyq4dCpysclHFsxoG+jbufFD0XpDOdegrOLCSb5
         5UZRaIU1RaJt3Pbes+kwoM0h2sxQHG6Kan2tGnit1RcbayyRXk53Locpw2deiG7WWPQH
         H1ISIZj7bZwvB0QQ4pPEyZSmdpeCn/raBds9PeOnh3iI2ym7Znwf993ZLewr5ki1MQMa
         MNwkih4gl0O1Mr/YHwPwjMoGlwsVluBZS3QOwSgyTcS/XQwo6eFnoDhirSah711jtSUf
         AQe5jykeWBawtVxCHzkUHrVKD4VbhHISCRJ3O7YD1+gKdOKBNNSLOfApcTb2oQnJTTiU
         dtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        fh=g3UlNhIN4ncxhR03DA1a3L+wOypI0qs9hkQM1TIftQs=;
        b=KHgTa0/lQ96U0cLROM6BHJYhzewNAWJ3xjZn7LcY+aVwrsMi+N8reh41TrsjyUlan5
         2fDD2WCKVxcHSSjhpOd2RG5px2KqF7euzE99o9s3OMxU/0COEzndi6gsk/nP7QmmzkHn
         27WSLAPN0wXwd/6PIr5B62Vlw3QIz7tv3bu1OKTnLvXTr0cwM8rbq66YpA99RJThhDed
         9nvOKwV55CFFVL3Yhx+OwQBm+36NSQb8gZrYksXIJKQvklig9EIMK+rTileUbcw2jUJR
         vj/IPGOooTxwqcSK3+Tg5foTx4mqRNIIvozgTclJXUU7YW5STFwIN9CHu5vyrw3KyBEr
         eWVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453936; x=1790058736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        b=G5CRJ9r3yU+mY0l+N74B7S/Mjb6TnQqtFCT50TddgkDTFjmeAX7LKtouzxIblxQu7Z
         h7Z4cg9OQsXlODWiJ4sgVavpB9ZRE2A1fqvhWaI1/oMaUm3ZJIy6GIsgazv3vqM5McEt
         xGkXdE0pqihCwZshnRy0aSMMIslo+uYXDX7ueQ3LEQJU48Z96j4JVTpAVHnxfBhXKjop
         mbYpAvHUDnqE3aI2WoyhirXJaLKHJWQBpEM8NK0EDDeCtbvcdTvgNOOCPFFavZBqhcMf
         Bups1FuNo0+Wrg5gZmFapMkMsrAxt8m5jDvfLJ8SCIT13V3atN0IADBmd6R01ATsyRkn
         s+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453936; x=1790058736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        b=Jj7GmdwYeH9M27j9gPUnalQMRqm16JcJA+XbJUBkiTOkrgN2gF/2OE4ZWUnaA3udNF
         6NEK6dzkuo2MZaCO64RS/hiD6biJReIiyJH2lk96ZQe+h8+gEMS7nkaz2V6sDu6o/UYe
         vtXZdy06rv6uofdetO+lOF1eDkfhqEJiLwGbCwBuLsIzSES7mKnmwXzQMIuBoBk5K2M1
         wT3/T/Bkp4FbHINWUJUXcxeVZMr6xR+48nhfQrK4mTStOCx7fUciJk4xngfM5FYD95Bf
         YGBD+o+QjXMRG/+Kpzsp6aFaBShsbyVzDG9jgbQgbq8ffZq//xDZAx0AwkZM5vGjlUvY
         SgbQ==
X-Forwarded-Encrypted: i=1; AKwUvByAkYs8em+0ZnezhEDcCnncYXF7PZ6qkeLPJGLTaBFUxlOIUYJA3KjuTPg/zB83h3uUEyZ27rjxQBu+Yhw=@vger.kernel.org
X-Gm-Message-State: AFuF++nnZ/zQkUOclYb16Tv08aG9W2z1VbSi/xnGn4SqSaMIuz1mreYB
	aEkiqj97Ek2Zwwx36/IDQQtsLoJYBo3GEDklYoHjFmpemQ2se96obTLolD6If+Qa+K/sj8iFV+3
	E8uPvPU74vj/NjjQGKaZ1l9tk7B8oFSM=
X-Gm-Gg: AYBFou1tpPA+FcHTgSFHsN8aWLE25yIapeTzq62gaa8Ow07iCdDU6YoHE2gQvWxH9aQ
	hDRLVHnLvwdjryuYWLdcHch+esofYItkcI4FArzlbby3mVt2hoV6vx2E32IrW4sgiIOEDJfkswv
	xY9Uvt2h9osPwMjOgpvmlr8k+v6PbGHQBZqpuXczjMofs8k9ex2rW6ILsFojfpRsNXSoxCgtYy4
	E0/neTxDAelp0vbUQBZlVXwFjKZ4WJAsWJaBnKFNNRzu27j6oPcrLokgYh7Oglp2npQ5OnSRfaG
	T6cEg3437yNFonzq3Ix+u2y0X6ONJpC56e7ov2aS4/kKB8xBqyArQJHUvwyczZEfYfo6Attk+bf
	zytH7OWq4Ihf5FrzviQsu7HzfSeOIkxbMCbiWmhu3lJZzdnNGPw3fZxwdTyC8K5B2i2b1BhDXr1
	EzfsRcVXZkjEJ+1IKKP1VHpwfbdUFs9VMsCQO74RdP7KHa/dX4zg==
X-Received: by 2002:a17:90b:390d:b0:396:d27b:86a4 with SMTP id
 98e67ed59e1d1-39dec02ca06mr8212249a91.2.1789453935885; Mon, 14 Sep 2026
 23:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
In-Reply-To: <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Sep 2026 07:32:02 +0100
X-Gm-Features: AcwNN1XuX4yn0GdoJd77RsJx70W4snllWWAl7hBlEl0V9VQzhH3zC86aEhQjx38
Message-ID: <CANiq72naY0=iBaxfbWQaPv_06X4SjFSix4NybDQdht33+Tcs0g@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] kbuild: rust: optionally parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
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

On Mon, Sep 14, 2026 at 10:24=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> Rust crates are compiled in a serial chain on the critical path - core,
> bindings, kernel crates and then the drivers - each a rustc invocation.

This confused the LWN article... :)

There is a critical path in the graph, indeed, and doing it in
`prepare` is painful, but to clarify: each crate is already built in
parallel with others where possible, and the fact that each crate is
built by one `rustc` is unrelated, plus the flag this patch proposes
is also unrelated to that.

I guess the LLM was trying to add context to the numbers below, but it
looks like it will easily confuse readers.

> Each time a change is made to any of the bindings, it triggers a rebuild.

This seems oddly focused (i.e. not sure why `bindings` is mentioned in
particular). It is also at least independent of this patch, i.e. it
will remain true regardless of the patch.

> rustc has a parallel front end, enabled with -Zthreads, available since
> rust 1.84 [0] and therefore on every rustc the kernel supports.
>
> It is not yet stable and its output is not reproducible, so it cannot be
> used by default - stabilisation is being worked on [1].

Not sure what it means by "by default". In any case, the main issue
with the flag is that it has had issues recently, not so much the fact
that it is unstable.

> Add optional build parameter KBUILD_RUST_THREADS, which when set passes
> that many threads to rustc.
>
> Observed build time changes with KBUILD_RUST_THREADS=3D8 (rustc 1.98, cla=
ng):

I assume the improvements are most notable due to the work being on
`prepare`, i.e. there is no other work available. When that is
relaxed, this should be way less needed. Though it will be still very
nice to have for full Rust rebuilds, like when changing the compiler
versions often, due to `core` mainly (e.g. I have to do that often, so
I would like it :).

In any case, I am not sure about adding a Kbuild variable already for
this at the moment, especially with that name, i.e. it is not really
"threads" but "frontend jobs" and the flag will not be called that in
the future anyway.

And if someone wants to risk their kernel builds, then they can
already pass the flag today...

(We probably also want to know what the flag will finally do before
committing to particular names, e.g. whether it affects
codegen/reproducibility in any way. But perhaps Kbuild doesn't mind
having new variables that may be replaced soon.)

Thanks!

Cheers,
Miguel
