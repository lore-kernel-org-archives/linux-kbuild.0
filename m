Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57F31F986
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567973; cv=pass; b=Nvs1jhJhuD20ym88iqtoj37t8qh/3Dxy7PCAjDf42MZYkTE6zW2NC3zOXIQM5JU7SwofpFU60Mei4QZf+KZUz6xYyAQc2eYA7FdZuN0FQA1+5UDLt2DQFd2mLqw/H8XK8jk7AP1tIbh5/7znVOhamW6ixz3ipHUJNfJq58Rcp6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567973; c=relaxed/simple;
	bh=hgryzcWBh81J+fqav+2BlfgO1BmbWhuhmWVgVs11gQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ui3QUB8laRd2Wris7pgZlRKJsoJNWWfT1i7JGbyqpjFx1vEon7b7ssQMe8kCQUlsVHWgW05JARqj7CnDmJgtn/2P44lWyqA2/5oR78KPzJjmEilH3NDtZI+Qn7baWuGAj3R6IMDM+ccCCIwttBKJPh3E5VhNQhHOPNvvKvy0y0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmBc/UZ0; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmBc/UZ0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d5862bc921so6877275ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 03:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787567972; cv=none;
        d=google.com; s=arc-20260327;
        b=VotbESkPTJt7T54BVPIk5NGP+Y5ESkMtd21yVny3ocqv6lwVr54l92bmkVgFOyjYol
         qLsJJPZ6iWtXEyiqol6dr7R/NLApnsdb3mN6uY863ciZUHmBYeHmxna0hY07P1TUPFPF
         mYdPyZoh5g4pNvVZZc0v7C6QyiDaGhA7xJrYI2+YX5cBc3G6aOucmmdDBUXFc9oVP/dm
         l3SsAiyYs1D3Cj2aYrLgG2v05GQfibwMrLdUac2pHgiKeMljMj7g8sjBD+jc9Luh6sbT
         FtScgynvmRV8SoS2uFkWQtwn0HPF4vlX1loJL9noCRnW7eM7utJqh5eO5nFL5UMUeBRY
         +VAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dm+SxIlEY/yR4zyZCKc0UXwl4nlxVLA5fi42KRK5dYw=;
        fh=slLnKGFH5Ae6XvDM8VZAu6kM12+ZLDZw7AUe7xRZK0s=;
        b=Z+Ou2YmDIfIma4wNoqjQLtwzP5vVK4wgKFml/4G48wt3/l/uBcxQ+977LJGHm6ebKq
         3CJ/EWJExuqP9Z4YGZkfQreq0wQRmQ5myRwcmnvtWKcN4vbTRl3P9feYG9ikIko7U/vo
         5zsZQzPHlm1rNUV2QW68Gsa5rR6zZJjGHzXl4geMxi3wTaaBaEdJXobD3dnbYGoPX2j2
         2MPL2tX4LAbOGK+8tzD9h6FrcsWdnQaIL03jKJm8t/TW4i1I1lRT0u3Tg37gVkPp73nZ
         APKtx9aGzlwn881I2fHwnJdlGFWDcqoaeRF58THhGUnAXoatZsVZEkA7EpceGZlwsbhN
         qjiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567972; x=1788172772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dm+SxIlEY/yR4zyZCKc0UXwl4nlxVLA5fi42KRK5dYw=;
        b=BmBc/UZ01fjCpGXrD5VaGU5g6PyvEsT+EoLVXxUJHydR8l0vT+LAtRR+8zhQgZtuw0
         I397lelTLyOYJpxfO3te6aVPtPY6wiZKPak4/zwmuDQLt1M3L7XW9sXtDhLrOm24GZkD
         hWxohSbC1GqPfocKIrpouJP21ss6AIsJUGMhAruWaqdnZK9oNWF9fvK4LjFR8+RtXaVc
         KIxlKgWDPs2aoCTYXEDIMFFXT99hFpPo8bwrRFNJ5wpfbewTh5iLIitzA0Dkz57FA2sY
         BX1auQ11LfyNa5WZsA646pIcZ8EV/EcZHy7ijYByeTADvrssIJtWZkKwp6F/d+HoG8Gr
         RQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567972; x=1788172772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dm+SxIlEY/yR4zyZCKc0UXwl4nlxVLA5fi42KRK5dYw=;
        b=eaASwu7fQU02US927D++Ir+nVvdyiKXrQfSQVbCwMSj5feapuol4AwrQ4ESLKGjXXN
         85FU8lKwvtTcWMqCabQ27C4qiOqHeKK7vrtSr0fFQeZoD15AmTT8AySOlfxXsqihH4Ag
         v3HZj0oIQfvBQW4VM2o11+mAj5bOuELPXoTHSc0HF09BEczuwrRi49eYEbXzvBcoSXan
         TosZAL5aRjaliS98ZNxQQrRxhtz6Mi4MmtekuOjL/Csc+fpgtzD9I0XpuoJ8WQaN8EZu
         p9PV02qKS14ORPQ6DRlfCVarmzx8zqID/adQZ/eyvirEmt0tABkcBkIyDgcYdijGmAmo
         wkAQ==
X-Forwarded-Encrypted: i=1; AHgh+RowSAC8ReBRNo3KH98Z3tHhppSiPYeru5LsN5Sb7g8PbxH7KKtjTITmJ6FvS3XDSCo3jWqjZZ9fUuiA1F8=@vger.kernel.org
X-Gm-Message-State: AFuF++k/aT8yyCFpUyYsU0HYtKRKrPLwuIjkbrcOKQJEQC8MuWCBO9f4
	3ckw5HxEUcyYwrPuKKGpn/YvUQ0pSHjb8luDGQkFpFdqwO5ZagQJzQ6tTCCNmT+pKpzLl8YtWW1
	KH+NMEWTUgo38wBKVS5YnP1l2n/79PRc=
X-Gm-Gg: AR+sD11xpCWkghM+N27VwMyVGdUB20CYMkKxRebLtN4aR1RUg9MAc2PVFqHRAcwzFZp
	ii5OwP5A1Q2CKCHrnZIG1eon0XPiAm8PkBhmU4WhyTMIUieUeouE+TQFMqwe4phya1BnLuzZYXa
	7WsYaDLayk0+8jcUAeebCHO4PHUsdtZ3x+8fGaRg7TgslHpMu3tLCUtB5fLt01kH2AvRBUG1rnt
	4tFeC0GGdPG5zd7AggBSXBhG5l+weYx68h1f3n+fSm066cR/vjISu98nyDk6qLs4X92V621DNuR
	LAUpNs0TfKRhPvdiOxKn84kY63BtxGcH/sK490UjLGQSG7Y9s+ghEdHiV5yIYjh6x0edOZgNrMK
	/pnm8+yKtb57aaIeRQqnSXjrXpTFwjLvYfRPLFsjvCLrDKzBKsWjlGqoGy0FD
X-Received: by 2002:a17:902:e544:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d64a9ae35dmr206138235ad.0.1787567971710; Mon, 24 Aug 2026
 03:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816133233.197500-1-ojeda@kernel.org>
In-Reply-To: <20260816133233.197500-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 12:39:16 +0200
X-Gm-Features: AcwNN1XqG3kZZP3a32PBSrKWeajLatO9hp7-Kfpxa1ILeXqg5p650B05C8OP7O8
Message-ID: <CANiq72k2A4UCLakuKZ3V=N-FHONk26npA55J+gkFT197XAOMfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: preserve unreachable traps with inline helpers
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 3:33=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> When `CONFIG_RUST_INLINE_HELPERS` is enabled, it is possible to hit
> `objtool` warnings like:
>
>     vmlinux.o: warning: objtool: _R..._4cmdq12CommandToGsp4init()
>     falls through to next function _R..._4core5array4iter8IntoIterRShKj3_=
EEEBa_()
>
> `rustc` normally emits traps for unreachable paths. However, under
> `CONFIG_RUST_INLINE_HELPERS=3Dy`, `rustc` emits LLVM bitcode and Clang
> performs final code generation after the helper bitcode is linked,
> but Clang does not trap unreachable IR by default.
>
> In turn, this means `objtool` follows compiler-generated impossible Rust
> `enum` paths through alignment padding into the next function, resulting
> in fallthrough warnings.
>
> Thus pass the LLVM `trap-unreachable` option to the final Clang invocatio=
n
> and suppress traps immediately after `noreturn` calls, which `objtool`
> already recognizes as dead ends. The combination of both flags makes it
> match `rustc`'s behavior.
>
> Rust 1.85.0 (the minimum supported one) supports LLVM >=3D 18, and both
> flags are available in LLVM 18.
>
> Assisted-by: LLM
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: stable@vger.kernel.org
> Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers=
 into Rust")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied series to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
