Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004F92D97B7
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401647; cv=none; b=SZ92S1dbMbgmwfV876iiPMm95WOuOMzdmj+hJHX+faUrkwdV/OAq4QCsb/7kfF417Vq6XjgTgoIixu8gYc2pgCAFdsbVHXeAVMrXQUzW3M0Rog223pBCkPKd4bJUte3u0yDS/PT7DQou5daOvoWClVinFUMJNfMPJpmfObo8RN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401647; c=relaxed/simple;
	bh=xMRNGFwT5MG/tN2Z4rVlgZAaGoxD3wGYA7E+SDFQua8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWrkb38DCdcojHqGewkGNVzKyW4KoGUuPnwfYgB5lESQPDJV87vG/n684jfm7e1VGQqDnU/AsixkBDAb3R2PSj13GKTUjowBqeMQ9Wbkb46ITE9+II2VhHUQ8HFezuv9gU7UB3wtW6c7L5z/piOBSTlDMj0Uf6TKpvJokCs0EhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QymsT120; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QymsT120"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so3982305a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789401643; x=1790006443; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=QymsT120OkG+JFQCibfSCDGPOy63k92/FaAt3ez6K3lEaoXY4VFc5sNgpMl35bCfQ1
         ZnbqQnJbsLidvoqiBsSs7eIOr+3bDP7xXEfG/fE2lc50yENcLr6hgnwfp/drYTLrHdw1
         68zkFBkaLYfubA6uebv9kMZHVo3TvEaSTkwQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401643; x=1790006443;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lW3GLwaZtw2SQDM2dpduYrEemaWK0EaPlBH9/B8yf6k=;
        b=fl/wfFL+uT46654jnFtlmwc5dj7jVov4CIVz7gY5poPJkcys0XzOO9qw8Tg4m5uFiy
         Q+UQ8j9wMOg51DBdGWiH32FtoGN512UWmhqVeQqCv4iAX9DtccnS3rOsDJ2+9J3Uy6dx
         EcZTMXeXwYjxd4DRZFAb5Obn3n7xteBnFQ9c0JqDG3vwYbzFBgSMacFQOMf7HNQE6bTn
         x7fSzVgfcTibofJ1icXUEsb54EmV8xudcDeY1W70nb7ux3mvO5vXgSOI9+ysXh8SOLlo
         gJUgZ+Jj1/U08jrcah5ZlWbbnoGv6aTPUp75N0g/caTCafpaekVyf/n/3K8MhaG+ACNk
         Mztg==
X-Forwarded-Encrypted: i=1; AKwUvByRbhZnnBxHhJdh8G8AfwcJ5SfIcpdi9Teev6Kngh3b6UX7iN+Zsu+fK/F9RjplgSUOdQ2FqcxOy0mii68=@vger.kernel.org
X-Gm-Message-State: AFuF++mOtZYO2b2TdE+WC6lQT0b5eBHM1rXjohbUQM6TlrHqVzwLIL01
	fV3+RU54XNmKsyy9XOXOEK77339/axkyclv80lWJ3l+bzD6by2Ly3LIJagPFbD4xGuQ3GG10bGr
	a8jGvZx0=
X-Gm-Gg: AYBFou1GdMFUYrWarUDtS6qxEqT0faUqWuN7MnXHmBa7y0XrQITpZhSRmw+nzp6b2Bw
	5cSpFPREtkhLZMeFv7XOQA334g+I2pvyZkg3gRBjdWvyW1jFxf9gjk8aO7aIIlf3u2gM0/A/M83
	bcjFke4+J7I2prKO6lpKcg8DFeNgS3N0IGGt92FbF87pY60B6XoPHNEWzGYH0n8W4X9nPias8q8
	V8lasEPv2JSlj8RoV9PoV/GVr/+vd6YTJkVGUsGGFQ/2NtworjWn3DrK1wNIaJT05uQ7SppXdhj
	us9I52+8JHUTwO+NAJ/ZybX/i8TR+0WsFW9/ScUrscD0LyIjf7rGzEcjxaKYcQqtTZCLnkrz25v
	4Qxa76WUeNEsW+Be6tNWin/znbEKlcKMx7ILSq0VV1ii+QYQiD1BLpeETMAqnQLGUEcBxrqzqB9
	n0MCct3sTkC5ucQtfynb7HN1/yRqsAqLYeoeuzty3oc7fXK1d8/lMP/lWXBCoCvubwKp9XOFsBD
	RTXORiwN7/QrF00p8+fv/fDYVpVrw6arepgiRtK31L0ua68bA==
X-Received: by 2002:a05:6402:3897:b0:6a6:32f5:90b3 with SMTP id 4fb4d7f45d1cf-6a9f63952eemr4538446a12.21.1789401642986;
        Mon, 14 Sep 2026 09:00:42 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f81f3sm4372687a12.7.2026.09.14.09.00.42
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:00:42 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso395301566b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2026 09:00:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/iYVf2mvp456P0vvLAqooR5bC8+63bELTMCWp4/9+wuH6MlnrVfj4iPxSu/qZEU1zzHfTpofc3thFSTg=@vger.kernel.org
X-Received: by 2002:a17:907:3f9f:b0:c29:444c:8f28 with SMTP id
 a640c23a62f3a-c29b84c2597mr415053566b.5.1789401247404; Mon, 14 Sep 2026
 08:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <202609140833.88C0E16E50@keescook>
In-Reply-To: <202609140833.88C0E16E50@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 08:53:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
X-Gm-Features: AcwNN1VyLYI7E7T_24gtwZZHDPdmXi1EUi9s9xthPRH35xQepEwWHVnUZ8r6fdo
Message-ID: <CAHk-=whB0X28MNAg71it=1SfFyV7rB+PK3qajpRyWoxXHW81fw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] kbuild: significantly speed up kernel builds
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 08:41, Kees Cook <kees@kernel.org> wrote:
>
> One area I think might solved via an LLM is the 3-pass kallsyms stuff.
> If we could get a deterministic kallsyms build in 1 pass, that would be
> very nice. A lot of people have tried, but it has eluded upstreaming.

Even the three-pass one hasn't apparently always been entirely
deterministic. We've had random reports over the years of it failing
in some circumstances.

Maybe we've fixed it all, or maybe the failures just go imperceptibly
rare. Regardless, it has definitely been fragile.

               Linus
