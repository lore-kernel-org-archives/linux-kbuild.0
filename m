Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440551;
	b=RKQ9OCn8jBcsZ/XnXnmaNpFDAokmaIR15RqghIO/UDd3k3SumO5ySeTu0R8U/k2xAGq9
	 +zyA1BqFkzTLOPuD+EwEsBntBcTl2F/n+qob/GIYKGorJ9Ax4W2srIwBe7hrg7aX9I8TB
	 SfTkM1H4XOaJSAjArLp6Le4P6VHWBsaLpTKNLFUR+Du/zG+IwfC9yCH5YF4NItAGRsroG
	 y8mSHJ5uATMjIR8w91PLPVNL3vjQU33BtWeRo4qImB7ARwhRndsaGDTiNMXiey6Pn0S+y
	 +S4aHzqSLASj+fzGag0rxwSB0N/v467BrQwJAPaHuowEISXMzRFqYM6EWXCWpEBXozw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
	b=qOk9jrrHPvvxMmC2kqG7yUGETx0ZR6ThAUiOPt65AluhJWq0GfnlFNjAk0k9QHKQfGja
	 OrkC6qw5prVQUQoBjlDydRhh/AdzvyGy9+NbZh4ZRbJYKB9u92klJ/Smrtw4L1voGrVRb
	 htndB2RqcUxHmxrO9nU3O06r7tyOGEE/L66VOUik7k63bUb92Wok7qqfrVeQO3psIopat
	 S+cBWx336LkvYphZ55gAZ7YqRG6JU9u+Uq7RhLNoOrAVADnCDjH0+GoBqFVTh5CUlEJuC
	 EjC+7+ZqY7+yWK5AqdXycjMs4WEAhwZPfoMcxsnvlgtgdQvXFXeEav9ZVdkXV7J99wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U72tvcMy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A29606A31F
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2026 13:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A29606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U72tvcMy
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab1e5a01a1so2887141fa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2026 05:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795440550; cv=none;
        d=google.com; s=arc-20260327;
        b=WlcpJ6MNiuxN90UPhqNiYS9u8CWxXQGmQVGYDKGQvGTwnTHTH9XQwX7lDTySNKbKcd
         n1gtM8OWiC8xagSjmnIleg647tAI77E3tKGeJ8ytxAmpWEaMS3jhfNT7BQdv9YnCm7QI
         z7V7gz73vpL8amddVbKrSo0oaUNX9Rovu/EVxAcgDGA58cvkO8AjtcnBfxbWqJfiaYoS
         mMaGpy/dp5cAKTo4EHZaph1lgd1aMH8f2fcu+xOs8uBtPgcg2vI3IuHH8y5o7+IQzEgb
         SkBplnTWyZcTvjNdzHwRs9vyjuAy/m7ajuawjNKiI8XP+suV0DGImwbpYzdaN9cwy0LE
         YhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        fh=4Wm5n4bEclkl/nhJJxCm1Opo8N4ir5O/XgCi+082o8c=;
        b=JtmNb/AQIWykkX0iRs41AaKtgOQu1mQ0/jQldBybxRO0CQOdyquXgaq3IQrVJw80JH
         JZh1qBPz4fT/i3cHnzMIEb6igyi9SU65cdqxa5If9YRo1rgdvTr+UST2G70mEJqD5nId
         ML24loLnnI5nx+plhTtLRRXcbMNf0aIVipwTgPWxnE7TUiiPHtfdQ02u1kQ840eh1Qnm
         NKHG8USkUh632k3kJqXMF+eflffcH5oU3wefRUOYiraCa/gxliRFpGCUN7U0H5VLGTXZ
         S01Wewsnq68qmV99woXMKVQgyLjUTyOyYFEOtlw8h0yD1W6UJRjG+a0xZjTLeC3ytsAq
         npsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440550; x=1796045350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        b=U72tvcMyV5XMhL9cZWj+pz06WurNiz2d005dmAPzrrXo6karRJl+VT0FOaBnD0G7wV
         ai9Z3lRkjFc3cL7DveVH4oLwS6Ya2AbR4zjbWXV0ySev18N+WySR8FRgj38zCV79zsyy
         0QgOAmP7d++U35Pp+P3xZmSLuwEo6a9+t5lY19X+k7rxKAKPk7Ab5Iqe5ka2iOkGnOza
         QfCW8GbQjbJqmNHdxS2QsECbA7IBX5C/n5LJDcWpuyDpj8YumNchG1QW9m1tEz4AMBLb
         xBbre5Xtd+L89N2pkXYlClp/sRqqcQ+RSpDiL4mozFN/hcCbiT0rGPX6ANhH10LFM0P2
         LVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440550; x=1796045350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5P0SfAg0RNgf//T93vMcvwfndd3128+sOIInvKqWpbA=;
        b=Qix3gb4gl+UXZrtedryZl+NTPb/xyfskITpcBIQjyFx+kpPfvcz7lHfEHxX/+N2/aj
         h80Ko8SoE9oXtgJVn+3tRC9WKwfGGyKmqvltcozDxXGYkMrwEfnWDKdBZ1RhuqnRkrYF
         D5iun+K5vZy5/eE3suMhLbvlmrM2t7GDk0gRmaH/l3zYffr6TyIGTg2YRjfKxBDGuGrj
         ZAG8vZEhz5bNxP7apjKQlnYuZ8tasGbqjD9LHW76whNi5VJYA/05kyViOmuyWsnamIIS
         A6R+BlaS+pwBrxC/7ps7IWPp8/8XKOY0ACPM3SznxAKeZYZOlVOzVmkbcrhDVd3RqExv
         F/vw==
X-Forwarded-Encrypted: i=1; AL+hErH2JLMS+YY1tZddLTbiypecNRKC3Ad5861nJVMuZyvn1RgwigPjQzVDhakULMZ6EfOoZAhrfW5JUqRLABQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B19uZfbUdYuGvsxOQ+SQzRKZFx5wyFIPns2T7L16Fu1OknnZu
	1QwDjIrCru5cA4rWj2XX5tz9kK73GifPGUGzzDGK8RYcWq4K5jV2O8KLqYaoXfwZsdbI8Tu2cMn
	KUOyjp+x2oEUtHGfILjx5YGQwFUqAH8o=
X-Gm-Gg: AZFdTZeyEEKdXzKNiRx0mV/s+fNpaeez6wh4MV2AC2vNkEJI6bK66LpyZwl0vNSg308
	PKUDqbT7n89wztCY+IZIZLebSGy38G1HCwkLZWiXgWaKCBigG6uzYp301NK/Jho7VGJE5Hm/eIu
	IJPA9rO+gids+0uLo+Rbnab3oYcENi5sIJEzAO144jXdSjCv7efoEP69xG26oBNGldK0Q7O5BH7
	zlSUuyxyTYzN0WzGGRUsSA1CirKIczaEYBFoYHdSV79tywNqIA62NtM9w05ZS8X9UVqNZFkX+lx
	aCscI9A1L5h3JHYdJuo+EtswTyu6DOnZLjRzh+Lj++P6Jxowt6C6pXDRy7qIMNCcEU71c84RbZb
	QMQjCbbwAr2Yj7Pkt+mB5wqrAAnrXHW5wHxrZTylwy4p2+/jIpBBitTIk+ni+0aCOFNSCorLgme
	9ReicZdkxY6As+iLGYqYVqW2cwQ77lfpOEN5SOQtGeSjnThW0WI3mUtKvCpdTjf/hBJQ7GjzzzH
	Zm64n1RX8X7/92kmwr04i5SsD/CeoNElHrAGeRGdB25SzAL4ywJat2ux+LoE6Zoq8ZjcYbh
X-Received: by 2002:a05:6512:6718:b0:5c1:57b6:c731 with SMTP id
 2adb3069b0e04-5c1bc55528amr2860372e87.0.1795440549518; Mon, 23 Nov 2026
 05:29:09 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-2-0f6018be8dae@kernel.org> <sashiko-outbox-199744@kernel.org>
In-Reply-To: <sashiko-outbox-199744@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2026 14:28:57 +0100
X-Gm-Features: Aa3M54p2MuaVPrel21pLHhiv7_UQjxDcbruYJqUL7bjr4LeGvFh_ddwRm4qiHrQ
Message-ID: <CANiq72m57kFE5LTjT6V0Vajbwv_oPFEVwkBWgp5B2Xhh1E9uFg@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] kbuild: implement and use depcheck to check
 dependency timestamps
To: sashiko-reviews@lists.linux.dev
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> - [Medium] kbuild: missing fixdep prerequisite for depcheck in scripts/ba=
sic/Makefile
> - [Medium] kbuild: concurrent Makefile.build runs race on .depcheck.mk.tm=
p and .depcheck.mk

I have been using some of the patches of this series for something
else, and I have been hitting these two issues that Sashiko mentions.

For the first one, e.g. `olddefconfig` in a clean tree can give:

      HOSTCC  scripts/basic/depcheck
    /bin/sh: line 1: ./scripts/basic/fixdep: No such file or directory

The suggested prerequisite fixes it for me.

For the second one, e.g. `make -j4 rustdoc rusttest` runs two Make
instances on `rust/` in parallel. Most of the time one of them prints:

    rust/.depcheck.mk: No such file or directory

and sometimes the build fails:

    rust/.depcheck.mk:1: warning: NUL character seen; rest of line ignored
    [...]
    rust/.depcheck.mk:22: *** missing separator.  Stop.

I hope that helps!

Cheers,
Miguel
