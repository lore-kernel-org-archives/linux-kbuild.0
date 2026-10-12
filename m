Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23393470130
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814695; cv=pass; b=BbRVc3qJGmRV4jkgI4x/BgAn6c2rQxJWbi32f91PSB6QwJIx5IN3bcCpbmWY2mK7PuJFv3tsXPZhpfA0DEb0CnUHkU1kCs05EBxJ4XmMnO2poc6TOxsBX49OksrgB8JO3gTDwlxRcznw+j0bkG/oAkTJ0M6Nn8O2Qg0/U5F8/yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814695; c=relaxed/simple;
	bh=g/BhmG4j9ffr0oFBvhz7lb5ueTvQbhXIGndnnY78eok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucnwNGjPfP7RB82j1jkKE3B7x0v0JGJWbE8srUHYtLZwL0XcbcYt2VQchFmSFqkKdrDHgnumL1ozY1eHFq8SjAjAkOH5faJKxOi2+r+Ao0+vd8Bv7Tu4xDQ7Q2DM5abG4At9A+bwAFPiz7rwF/ocK4IcqoHw2isT0rxiS4PVsek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My1OId9A; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My1OId9A"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-34c522572bfso221423eec.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 07:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814693; cv=none;
        d=google.com; s=arc-20260327;
        b=DHx9KYvgoJwNBAMH5bCcyvcQUZ6qnfmwWJF/1MgUCFdRpNpZADkAIQaUfe5iOddrGL
         wTAhzxt1m89I4MOKY0GgaZ3VMcNn/nWv2/303aSMSHboHwpgJhiTbaNDClMgKIbAKcR5
         BXmJRAijpZTC17xsivbFav5RXakvlFNjeJDbGCWY7W1ebsUOYlzoQ5RzjckcfPR0b/PG
         GsZT+O0W2r8176CHO9V7FvlBbMXWNbKKbe96hYipX4w8BixJMpKgfdayWZkJAyeKeCHi
         lrNqe2QqK2XkvsWiuVKuSYHKZOzlwFvE9qvO3EmR9ARoJqVWD4cUpjn2jzT/slZb/CqT
         3Luw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        fh=mgPV6uzqZUfb3mb5l6Ogib4+hrC18kJN13aFTchQ454=;
        b=ZdFCz0vqWjkN8jowXmV30JiCZegTVQ8oztQJlyPmV7UWS+KwK4qte4SPonZq9HL+4L
         FdRnwj8cz+uMilwzHWE99w0z99B47+JNQ/a7hGB3vZ0wHkNegHEAMru0E3TfsR8CoEW/
         kBrn/RC+jsji0x6mGUJtIXbvVm0yypKyNnMqbABfAc+/S6S7+wZcKG1yaS4c5mEe+z7H
         +dS8znAzqPCHJiGrWuN5eT/X+tU2otZTMLkYnQGYozqZx9cpCFmJmVvQ+g2xy4A24Y17
         qW+0ck3g82gM4JbC0e5KpbXKbDBQzYtrcGWjdazmjOBAu4pIMMvi9pMzHUhK++x4/wqT
         UGKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814693; x=1792419493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=My1OId9Afu44hbY9lwaqcKNK3hVPzp8rPSGYolT6JXNPvKYoq4DQfBxJm5eeoJXLPE
         LnEVGTrZuX+RqYI1veoEBDoEaHJ0XGtbCfJOw1YNRELMGZDHnFsmI08VMwcpW8q0F+AD
         v5ZfpZVhTLtHNjxeG3QnsaMv1jj4zddz1L4yMn0P2j8BpqLraO8mASnlHu8kXrlT4G0c
         MLRzDVtTDHSq9ocOFjs9CL4dC5zfsgE9m84pKgazql+TJ1BP5kNcPCNMod6lrfmLJDoC
         aKqrtBEw69cKrJ/QfHKwQnTNVLNkRGOqTs66ioJZ3oD84yrKdYtggQ11+otgINcck2Wl
         kEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814693; x=1792419493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=lLCWgEQkBDdFh/GnAwG/fieFBlmFOeuummq5mhca+RSkbbEZpyu1wX6aVng+ZUHaQS
         nsObNxICgTJH8C2t/gpatT+dv7TZXAKYtFvweu12H8hF4EpFKSdlwpY4LZEkZWV2bHNV
         RRg9uHTSCWpWHVe+rygBViRs+HLR/VajR3g+x1TmtLjURIyh9An9V9M5NW4PaLCNA8x/
         JV3IUY7hCjPnsviQTPEGLqr2l3eSs4489zjZNbFbhyOobofwcQ1DnM4qQutH/zr7YbKi
         gX31ZJbDprMIxju10m02GH/6SsHSkUbnWQYatLp0bH2prahN5Cv3Q5Y9kjnWxsLXkSbK
         f39g==
X-Forwarded-Encrypted: i=1; AKwUvBzKcJLdCTSq9xocCEg/BOeAYRoHoaBEq6keoXS8D8CsGfUVzPn6j9CICNdmj76MWWo1xJOysiOku/bs+TE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/w/QsxVj8jVDPijBG91u1EsOPuqJ+QfQ7h4yqJ4FGjDwx3yhl
	KoPJB9piJnXIB+FH9hCEwNG9YrWodjZQBhyH89rnO8Y7g/Z26MWMROhN4FKs+xoeFG2hW/Zkbie
	4iIsTBytxUQsdR0H6I+mYGRVRqU8AqLs=
X-Gm-Gg: AYBFou2/4h73wcqiO2rmKvj6xIcw5AC5ufXiq+v9RH10Y3jL6yZRdd4nmmMMhayLRzT
	tCSQn3sF7405tOwIgHu9caSB830OCUxEixteRiAMG3rC2fBzb5CmIAj91m9+0NmWjePTwaQ4rfr
	XsncyYPNXM1MBo/rbIf5j7idnmFHQVTIEy4uwZHDjLQVo+XnqakfaS0AnMODOGdWH7ox1By4u4N
	VVbwyQT9vXgT0XNgQBPzO586OpKZ4U5YzYm57BGVnCnvElB0amvPxvDm+z+kHkIIEZsQwwDcW/x
	gpiHAicFcq2Mku3bHn20BOq0eToSiEfch2TsdG243CcihAPEWv9A7mUDgCJ5mcYYpYdZWMkELVB
	2a8tV6WXRd+sj0OGtiYHbW73KPkQMbxkYAnx4gdbCLWZXesm24yW5bwozM+m1gaEGEeYf0kL8C1
	UzkwKhlVj/reSPT+12jU+6bewJj6Qd8U3uu8Hat+4JDyampsSVCAiXv1mm/5n1tw==
X-Received: by 2002:a05:7301:428b:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3587ee40938mr13997955eec.0.1791814693087; Mon, 12 Oct 2026
 07:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 16:17:59 +0200
X-Gm-Features: AclHuK-Ywlbcl-S8KQPaD-1cIH6SBhIHUu2wWCV_8Z4IN4dYEXXQbTyoeFpEilQ
Message-ID: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> +Rust code is instrumented as well on architectures whose Rust target sup=
ports
> +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).

Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
places, although it is convenient to know in the docs (but risks
getting out of date, of course).

> +  Note that ``rustc`` rejects linking crates built with and without KCSA=
N
> +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o=
``
> +  cannot currently be used for Rust code.

Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
the patch (and in fact I don't know if we would like to actually
support it even if it works), but perhaps in the future we can relax
it using that.

(If it doesn't work for some reason, and we want it, then we can ask
upstream for an "escape hatch" as we usually do, since things like
this should normally have one...)

> +# The minimum supported rustc's LLVM supports all of these options.

Just to double-check: does this refer to the LLVM version of the
upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
support in that minimum `rustc` version (LLVM 18 major)?

I think all the options exist for a long time, so it doesn't matter,
but just to confirm...

In any case, this sounds all reasonable:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
