Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CA943C06F
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494470; cv=pass; b=tAwUwqLh4aQH4b7bvpM0QXwJNMgc4GcHTZi4T8ZQZUD9aVzbpm+gjspy1i3+u80H0EZN7khRy3LzcWojKLbp7Xhnu8/yvDUY/aMD4BxAeZ2u+X/8UHN2I4IwDAutsjKsmHvxAdD7tAAM46WcbnsdeyQBSQZVYW6UqCmBgmqYoao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494470; c=relaxed/simple;
	bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJkkT1ar4pHRLmA2SakzRCgG4KHo8TbmJqmIfOtMOCbwYyFPlpq+mpQ7b4aVA36UMntqgWSrZPAkRC/76QVOXb0QiQJtAO4wjeq45LimCbZABdgCpsDPutlOrrCnWlVtHtlolulKaBKDJbzDdcAFo/SRA7/IXr6qABM6RGTKXbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SC4kCaqf; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SC4kCaqf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5417595e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2026 10:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494466; cv=none;
        d=google.com; s=arc-20260327;
        b=QDfd5iiLOnnldkoMqK7uQA+1oFLPdaMBX/kzHymnsjsq6OK7hokprEdCXV/raOs5Yl
         /ktEoF9hz127pw4e31tLX6KoCQpxTe74p+0eH5NRIF7P44OXFzGccXS4M44Ye7bkB0n0
         b+BvyxpsFZOYfNj49k6k8coRbTOYfPe/3U58Aw4kGXRUVgegMaHr76EnURzncqlicht0
         qcpc5jp2p7DRJSyY9n5nrCmc3fh5BgAyRHarJkloPQkxHnaRXXFfAH3j6x8XbDv/bTs9
         5hW7hYzZmHAyJ0uS+3yX/EGJzhFeksTO1vL6BYrNJJIhjkSVIK/LmJaQ9FvLZ4w535gt
         i1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        fh=ObiCns8u9XCzw8cJ0oaExqq7TjlZRio/nuEz48gKGhQ=;
        b=pLoxm6ua1bBOfDp5BeKCJcKWCkk5I/YQg+0LQnv0SyteOIhHH4SEtAqsO582Kw82EM
         zEhZm8Awvx2VFfWoQYwl3ymrU5+E5lKClaRPK/AOxQXexYifJ+68DzRlr0q9M1LNcni/
         tY14sGVY9KGrDciHUPwyfPe+L+JdMmaICeJJg2Jp8HlS+BpU3bHqSyDiIbwKsz8GGhcV
         ArsBMUSDYzsCJQGnxgR5oJIVL6rxzzlDDDkY9HS4gMNz6dkFdrdFn7acWDRHYZqEuQDA
         d8qn7KWo4dO5kZRBDT5CbUHRu9ro1jqz3u8gHWpAk7PWvWxLLoRpXLfitu7on+sC73Gd
         Drvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494466; x=1790099266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        b=SC4kCaqfVVRGG5CrPQH/SMlPkiIKeXl83D4UvgxjX69ghdnUrnuUqyHeshbHL7v3XU
         MciOzn7JIO9Y1K03tB70Y1eRi39OTU0IszyivUgKVlYAdjxNulv95mjqsR7bnCS8ldRX
         YSkgn4Qvd+FzLDnfI6RWmHgFd8RnJXjiw60CDK6CC3yZbf/T8tyHxKswzKVlpOU1Ifet
         cSas4HSNTNnIrGPq963ZUw9VRnXemCoxAdUi0BmmOeCPgGp1gPpG/dMliWtjlfDpuzkU
         U0Cp5g/97Q5+jtIPfWjlZAOjJDWvnugaRoFqaKUBCzD/GTkVXI9Yfcz6X/9gSZBRg0Ir
         vneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494466; x=1790099266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        b=NT4Nqhs0AxnlqdCW6thnhjD3Rvx6exE78vPhffaqvma1lRnWzwxLumVxBXYf4uxwPf
         NO/+9mNzS+0W1NyhHO8pbq/tMx7Iqej+yZLpdRtwIIJb4DFxpSJ3ugnD/UQrSbS9bidU
         wxKYb7PN3WOQJv8j0bD8wzCusFKGSEtgQnhnCCRfpI6tzRhpMnXyBd+7ZLqwy2sRU7lY
         XYyS2yX7ZV2dymIHOn6Dey83K28tflDUpa0SGZtPODSok1/l5GS90N882jQncXL9H+Gf
         oFzSfH+T1/1Iybh5jQv4zJXJ4FNTLoemR9dY/VzlMR+bsDezAWxp3zjg68jnhBVFXu92
         VfrA==
X-Forwarded-Encrypted: i=1; AKwUvBwWnPkqyeDX/SigtWU6RPOk8LOhi3EyadY4SwIKHxCTCfnQNGlvr8WnspNvuBWGRaTP4rmMx6vVg2D0aWM=@vger.kernel.org
X-Gm-Message-State: AFuF++nkj/Uo1FGuV4sXxWjG1BeMD+j3erUEURTYdp8JQOP6enidYLds
	jmJrzBgxIBeYeIctkEHrVhp/9jtIYgg0RWq4OuNk8NP/ucXv35cKXIB5z8aYh3aiOUw82OjwnQm
	iYb0l7qdQs2mqjw3uFtsygoImHTAzPYJdYO9cIbsu
X-Gm-Gg: AYBFou1SRvYGFUaMvq1dGuVdWNCIdN3e/v+01dBVWxmWhHPPF9U4Tc7jHAMGB4gakKh
	pwmtSf4o7HCyj8tPm5QYw7qQxRcPv3EU1Dh2dkEEpiXoUdcQv6ztJWeMH6Kbc8PDM0fGK9xc40h
	26KFMhZAPoJ+RjmlakHWeqDIjKKCYTlkzLijI6DXzdEOCfAwOo2L65Uj6lJ2GeMhHPhjHTJzDz8
	A7KzdvW0S6ulvw44vx59arajPoM/orwMhwleLFpWsFuGWQjZIBCaleS3zaf4jqW9+19sJkNy9zx
	ZfNOihVrkZkOMvMoaNE549AXwVrW++O5UwwbwCsas+QKR2lE9Mi+LnuFR/2HyvKKl9QFLoIxuER
	iACNJOO7QMPSpXQvk6ndTGY5UaxaGtulEw66Z1LcNDufPBpQDXjsFEJpFP59Zzs0+J4I=
X-Received: by 2002:a05:600d:84ca:10b0:49c:ff66:7d88 with SMTP id
 5b1f17b1804b1-49e7d725e6fmr51370615e9.7.1789494465544; Tue, 15 Sep 2026
 10:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org> <202609140844.FA7E848A@keescook>
 <aqk9gakQhxToLnDI@gremlin> <202609150955.A51C9F7A20@keescook>
In-Reply-To: <202609150955.A51C9F7A20@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:47:34 -0700
X-Gm-Features: AcwNN1U4CY7rpoxX3OGd9mqCs-kE5osRcDbnjG2lLmWDcf89pyFwGTPPrVzl7qI
Message-ID: <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if available
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:31=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 03:30:43PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 09:39:07AM -0700, Kees Cook wrote:
> > > However, parallelism needs to be set. We can't let it eat all CPUs: i=
t
> > > needs to respect the -j make option (and make its CPU reservation kno=
wn
> > > to "make"), which we already have a solution for in
> > > scripts/jobserver-exec.
> >
> > The only place where it's invoked is vmlinux.bin at the end of the seri=
al
> > tail, where all the tokens would be free anyway.
> >
> > So I don't think it really buys anything at all?
>
> There are 2 things I'm thinking about:
>
> a)
> My main concern is the lack of respecting the -j make argument. In my
> mind, this is a blocker, because it means a build will now _always_ spin
> up max CPUs (not what -j has limited it to), and for CIs, shared compute
> systems, or whatever, this violates the requested parallelism level. For
> example, if I'm doing a long-running Coccinelle replacement in one tree
> (which uses half the CPUs), any builds I launch I'm asking for the other
> half of my CPUs to be used so they don't thrash my cache.
>
> This is the kind of "why are all the CPUs spinning up?" question I
> helped track down with commit 51e46c7a4007 ("docs, parallelism: Rearrange
> how jobserver reservations are made") forever ago.

Parse -j from MAKEFLAGS (https://stackoverflow.com/a/76517886),
forward it to pigz?

--=20
Thanks,
~Nick Desaulniers
