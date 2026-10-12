Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323E537F8D7
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815899; cv=pass; b=lBOZ3Zzqqw5Eai9WzddPvoKB2++huPu1XTCSLOvX8RQ2srD5yeA1Bp2C1Fpec8riGhhAk9YgiYmovOAHr1bCQzKzWIKPQevTzRe6xTtP94XRz0ngudI8grOIZkspaIVhGewpbPpO45kBZn81PMbpNzE7fupcDipnoF0SRMjsPuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815899; c=relaxed/simple;
	bh=Jxmt9KjzM1tHZnS+/rDQVag7Gv7qwGz5Mz0R33A9/8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbSgnLVevOpIyV00qUYGXA7SYHZhBmCa2KZbcBvsD7iv3W2stZx0MeoLKPhC5q/tYeKJ/9+mL7QPY1AZI6G7wdiy0ap4JER6EqQQzqGyGdbQCnj3hxbcT3Dy3i1i1EN8mZJCwNRhBfZodbuoOcc2PMBAmFfaDUsVVIZEjypKFag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kxrpma0y; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kxrpma0y"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677d35fd168so1513636d50.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 07:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791815897; cv=none;
        d=google.com; s=arc-20260327;
        b=HCQPAdiETAOLv5+yTzWFR9n1Udu3JBFi4aWtOPYmohx02+ffCDNeFoNKKflyHx23ei
         84njVgzWv5kMZ/J+qVc587hv46pn2ljB4B2QLksyE8794oRmKBEKzBs/1DilaO/lENWw
         inaBu+Ts0zlovQ1s0HqAlLTKvbQX3sUwHbFurYWPCxCiHl6h0w43CF29gFFgTqzB0omw
         kWyRN2tbvUP2SLx5g6XtgIJWAxqDWrBTcow1nD63l1nydIMcxDA1uN5ArIcjzEaJeqQh
         CKvIQgNuhzdNLFJUEhiXQs1Er3xxmBrIiJi0VccQsXIZriXsKJkMluHcP5/dIGK/0K+j
         DoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        fh=zN1YS0jlyPi+hKXu3qjhiAAttPuAFhEoLOkiWE1nJgE=;
        b=SNCahXpHonLG0j5F0W88DCNEXAyIr3FolAvkWgA4jE0y0p/Xmi1ptZisDZcfxN/Bvf
         o3R7/xNQJ5NHOZQCk4ioKPRDXK5XMk4vm3zsmeZTkCePIse3QWLWBbEViiR6oDWfZGOA
         YM19Zxja+KrvxXRAPXABaNojVBKC/6pbfgpG8GRcmLKAHexMae/xHVTFCLl9L8Np1tHO
         7VK8pTzWqueoWrVF9xrCs0ATl5bKDNYleZYJN5mU80aeXeAda1ZK67P+M+afqiepKDgO
         m6qIyJwB3e665/npMZfyEU8E6P7935i8R5bTCs0JDSGbcF/oLhShc+onNbgm9ns43kxw
         TOjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791815897; x=1792420697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        b=Kxrpma0ytHecy0j5OkVrxYU5EsioaK09WTFxrdXEB8XsG0QPh+WCko42bmjYIOAXY4
         E1ftWSpb/s9R3nYuo+xGXQ4juk2uUzhUp+XSIpVyzH6vRZ0ZJAbrSVtUxpPT3FF8ZRHv
         stbcOZ2BhbahADsQN4w0uqUkBStfhtKAfYNVA9L+4KB2+0SRNdVvsdB5rIB+ahRp+RX1
         jeH+ssxIWCVyIaAbfBq4fCY3AdvqYktfc//n5i4Zidpe6IDyI1qmqdkYDodVONalrkAh
         qeFlhbXX3y6VO34YHcKFh+5RpZZ8VbKsjA93SafOQnfnC9/QaTdGv6QMbtCqqgBa8ExL
         YHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815897; x=1792420697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        b=SUZqYRaACvmRK7c35CltX8v5ZnLv9IISX5UqoZ/+5KJGGMQbnU7jAOEaKkRdaew00q
         jSbEfIqscgOaTPDQZLsIUpUjpZLvvgB50+e8cGlpxeeQ09AFNtXCGUBtNLhqm7jYRfWf
         /XXpzh3tapoyb5eLQAZsg7xTVZPzBIrcpizP+rsYgFELe+wd4mhvDUuKq8DdvrQAGdGm
         +GyrhSL7AdDOA3YCSjCxuQt1AQfvGatpiLFV1B3XS1vH8pe+MzIjmFAPWAKlmGRLSITL
         mGG6vjN3u9a99WBZMAa36fBsjo6tawjqTeht2zLd/x/GF0DvUknIk0g4QAPvJUCG2o1r
         Twvw==
X-Forwarded-Encrypted: i=1; AKwUvBylaPZ4jCcQuwp91uEpNluufmAatYY3Z9js/3kPn52CNBhJwS4Nzgi/NomtAk6ZnUmY8XauZsCHI/xsGDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBQj++qc3oPhFH6e137HWuk2RXaEkudAKNj/X6bE9fqH64qjtL
	mquKEZ0CcPcG5zPpAn3rFx5cX0T8tX7xvoz+70OkaiahoaKCywozJqQ2co9wpe0j0FSjpUoebF1
	pkkOuxVW03a+yJ8wvZJCg1ZquP/nXQVuYQSOmRtgL
X-Gm-Gg: AYBFou2FDnoqMVJV2lnuRXCyawaikkB5ioIw9xSTVptiUrUwhx76LXcO/hsopw0CBN5
	6kgPNIz/41KBJuwk4c/z8UhvNu8HFcnDSg929gxW89WMK1Nxfj3WnZGSTuv86EZrCeuNWHVPiDi
	YcpAm99oHtDY8uM/ur/WuENYkmHdeQjUwvwMpoNmwjlw0zOusPLuiPHQkep9aq8GRydtBvkf5jL
	2woB3/WHZHStkM9XWtnQNimwPEM+DOhw3WUo70lyc4qxUQ/EF4Ki3thIRouMUMG92RfDEU31VVu
	h4q89c0ncIMCVYzHlNMBeS3nmzMveqVckODsJp4muhCf6TQR349ZZ6ppn78wWl4lwnebCKcKiWT
	fp/bdSF730A==
X-Received: by 2002:a05:690e:4852:20b0:677:ae5f:927f with SMTP id
 956f58d0204a3-6793630f86cmr2427106d50.106.1791815896536; Mon, 12 Oct 2026
 07:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
In-Reply-To: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 16:37:39 +0200
X-Gm-Features: AclHuK92MyXxJeDrxPQQFA26o80Qq00iYKL0aWA4ivRbmQNLUfwOPJLz7iq1CKA
Message-ID: <CANpmjNPRtT6PLf6qAiuEaX4hG1GBYD-=w1A4y_-i8vSv0e7Q-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Mon, 12 Oct 2026 at 16:18, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wr=
ote:
> >
> > +Rust code is instrumented as well on architectures whose Rust target s=
upports
> > +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).
>
> Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
> places, although it is convenient to know in the docs (but risks
> getting out of date, of course).

I think any future patch that enables more architectures, can also
update the docs. We have historically maintained the set of supported
compilers + architectures (if that set was still small) in the
sanitizer docs. Once that set grows large enough, we can omit.

> > +  Note that ``rustc`` rejects linking crates built with and without KC=
SAN
> > +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>=
.o``
> > +  cannot currently be used for Rust code.
>
> Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
> the patch (and in fact I don't know if we would like to actually
> support it even if it works), but perhaps in the future we can relax
> it using that.

If rustc's sanitizer instrumentation is similar to clang's, and rustc
doesn't introduce other ABI divergence due to sanitizers, then it
should work. Same with KASAN + Rust, so this would need to be a
general Rust + sanitizers decision.

The only exception is KMSAN (which I think is not yet enabled for
Rust), which does affect ABI.

> (If it doesn't work for some reason, and we want it, then we can ask
> upstream for an "escape hatch" as we usually do, since things like
> this should normally have one...)
>
> > +# The minimum supported rustc's LLVM supports all of these options.
>
> Just to double-check: does this refer to the LLVM version of the
> upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
> support in that minimum `rustc` version (LLVM 18 major)?
>
> I think all the options exist for a long time, so it doesn't matter,
> but just to confirm...

Whichever minimum we could ever see the kernel compiled with, which
looks like LLVM 18 in some custom setups? But yeah, all we need is at
least LLVM 12...

> In any case, this sounds all reasonable:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!
