Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036350;
	b=I4IW7sFOV1vFdz3JPvew8VnpIQmdRVpDkwjQIRZLQhbEvfxUCYtYmqZMyH8sVTImctge
	 z98C0LGPvqL4HP9zNFrCDvE+w2YyGSvqPvA9MuSza1C2WERpxQq5/ZDPvvCVQqm0W995w
	 3Y21kiG2ptqoHQiaGnFdNhAgJJIOsqfT7voZ4fJLMKyFV/y8811gUA34EFFcAB3ogRgzt
	 n0bWcZTX4B/qpUzrRAOlIhjvPvq6wyjSTiXfNqrN1b/i7HFDr/CDkNCAE6ZOhjH8v3wir
	 z5Op8PnULTO6upKVkZYxyIEqWVvWx5WpZ3XXUxcBhShac5w6IXGZKXSappY+GS+kXpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
	b=ZjFzVbdhYGHPbavKfxD5iB22KTkQWebsG6+EGf0KVUjKvN6P+5Y1UTPmqgiW2ZHtpSk8
	 RIlGhMCOwX/GaZHl9Of8P7OhmNWHhVx+egotqYDr5fOH74Aegbw8TLwOb+1QBf16MBJsW
	 F3jzNY5yadM+qvJCMiuDZ9qjFKT9qBO8wvNj3cJT6FqYxzgn2VjyvzkoUCTCbiksqmI1z
	 TRENPqMPczwkG6FIw6SEF3AvgH3qAQu/LKmTsWdzBFSISI1k7clghniDMfaJvpwLdu8Ah
	 Zn3CGpGRtpqRWZF5qM4IB4W7sWkduhzWX6DlmB82EtSczVg87qFTvsr+bOgTFTjlIJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dmlfi5TX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58361606A338
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 21:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58361606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dmlfi5TX
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so11114875e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 13:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036348; cv=none;
        d=google.com; s=arc-20260327;
        b=XZqO4PLR/NDYy2KaPbXREGfy0U9vHxUPSXb0kUvbg547bw2COQYm4oaPIU/tIhtrSn
         bFyn7vIEGi5a+4l7q0SNm3SCZ8i0C5gH0u7658+14yUvLSsDt3P0xZCawL0ULidosYHK
         F1InrBsPD1JIAyovAMeyPoxA7bb52Au1fSanH6hvG2jOX8LGN1yHjFnL0KL+2qzf2tKf
         SHHlLa1A7n4F9joIrWJ/HcEH9y5wXw6CoK9Ln/3qj8KmXb0a1Mi36zP/r+IFJFdJsyz3
         ODamG9tvX7uNZwUZEO1plS5uwhO3cGs84O3yZXBlyFPZ3q8aM3fjm86sm5LomJQvBTpK
         pb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        fh=hqs2HSTXH6IVomF5w9ZQ8HKAu1Ri9M1G7W7bI3MVhrM=;
        b=bpG1tvf33a2llNjpD7lCmmoLFnJSzFhUmSET+skVzy8d05t5qDEDRGSyyfXRn3uhfz
         XAerlMNog12EJAQykL/cqu/HcUil8eHSz8QY/XIhVyfawsYw9NzLahrWPvBuH5DPxLDw
         cHUDQABalc7bEql2fyoGysz7T6IopTWHP2u5Q2Vb+D5ni32A3OhZXDLtpjScxBqtVPG0
         fdTqHDAXAOcjKUQaxGfCj0C3SKbVgeH/9oGB7D0lTuPVEfQvP7J4tIl8ZEyuIxpeV+ap
         wM6hk2ECywxfVGm3du0IJoxpJ1eOCEkylBgZzwCvVJOvJZl2p9tFBLleQI8pNBQJVYqf
         XUYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795036348; x=1795641148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        b=Dmlfi5TXCpgDfmBFbH12jFEe+eCqYa9u6tv4aC1RqtyZ/ewYF1YnHznurBJhjQI/DQ
         u/dcKvXcZeaJqWBCeOn7NVywvmG42klldHAPVRQFasYnZXYwdzbYpEhTu6F8vm03+Ta4
         SxNefPrMhaJ8G3t+vmrdMY42SH5aPl3kgAzRl9bPNzKhx+qwkjBv6piDBvcFUyEdbGLW
         deLwCvXb5Y+o7OEwFLA/O1yyR95FRCCyxncKkMnMxivGphWF+NZRspdK5GnRPdB5zrT6
         GDBJ7tmEVuQ8DA/aMMdu622h11nPCWWWgOKjTKEZtGPSw+0PORvcGF2feFgXpu8WHpec
         IH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036348; x=1795641148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        b=fuNcBrSrGfWVz3OFXrdpCk4YSint1vj4ERriixjJK+8ZjQbHYYHnsaBYpVy6NIYFku
         JQu2PRGd/r/8TQw9anJPmHTI4Lk3Nv0IDu7nsMCbBsxyCff3/RKOhV8qXgDGYTsTdZCl
         DCpRJrdrMPlQ23xdKCOpmqeNwMbOyo/x6xxGk7Q83XVLFzVQJn/L3UDvLtX+d7c6avGl
         XXTPnPWpV10Q8UsKdLmvTIkTFyAV/vmLT6bPc48c9sa4WOV0SDNt6fgd5Hq5vcokiohX
         S5wlsYHMBHjt9saF+z6OBqsRYLWdnvSyociC5VkkUc1qQ91wAzccKfCoZXlKxt/ixNhv
         6Thg==
X-Forwarded-Encrypted: i=1; AL+hErHYquitT6GlElj723G4975w/e2tvWCfW8mJvPDgnddhKkr+Xqha2tnSNO9+SWigcPZMjd1IAPUOSvYvXl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m39F2W+NspHHwoVofluLneY3dq+UeLSDlIwqCjBXMdWpi7Wu8
	lYoIKxlgYyh0ENp3Ag6zaHwQK7y90yfcO/3WDZczfhOtrKujeTvXyCYLRcUPOs1+qfbchiUzZU1
	TAvtcXIuIV4scivWC0ZCFzl03TVwnAZyJpLdviwFu
X-Gm-Gg: AYBFou1CfQ+jefckEDw2tuGdbZq+XA+qq/kJGLDcFfoVOtQsakNyK1OWQ68tWkgtQ8N
	tIkx4V5uUZdxNtil/sGIEvkH+cjrdKsPB1zhHWxX3fGomvOkNV04jkZBwYz20tO3NMFuMT6tALv
	qFN/imQ736RdYQ7mS48q3oeP6Iegq2iwERjqMsxpJZlG49ZDFtbLgNO6yFCw4XKDV7if0+EzDdM
	keJy2POShqoShnzhL0kDf1JbXti0y3Azmzzh3FWRC6I9imysc6Zhb+gad2ZUiUOdDW75+RW+HSd
	WJv8F+M1vPlLizOC3WuTH90+esJUvDXR5yszqav2OwzsNwTvJ4d7QYBOS3ywpsYgYmYvsOIrz/E
	BpWLXLKiSMGZoaCO7NuoOzynAoJLCKijr49hoyDbYb7I8T+Onh4yKz0w/Ncc892n4f3R38k3a+y
	+8p5Xfnv1Py4j4nDx/caV0R2H8YZk6bFo5jrXH4EkLDPiwPU/R4u3dHEJvEEF59vThoQ6pfD+WD
	1gOr0fhgHHwIyvizQOJbfPWb1x6votl/8Om0A==
X-Received: by 2002:a05:600c:c8f:b0:4bb:69b2:d3b3 with SMTP id
 5b1f17b1804b1-4bb7da3f50amr85274465e9.27.1795036347018; Wed, 18 Nov 2026
 13:12:27 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
 <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com> <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
In-Reply-To: <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Nov 2026 13:12:15 -0800
X-Gm-Features: Aa3M54rwqBnTNo9s7KzOH39H6ui7-iQszvNlrDcPs70i2RE6J983km-iNd7m9tM
Message-ID: <CAKwvOdkNWp4us-zNPw8Pp3J6TVev3nTRsjPrjd9w9M66w2Qbzg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:11=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Wed, Nov 18, 2026 at 7:48=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Function merging causes various different issues:
> > >
> > > * For CONFIG_CFI there's an LLVM bug causing functions with different
> > >   CFI hashes to get merged. This can lead to crashes at runtime.
> >
> > Do you have a link to a bug filed against llvm?
>
> https://github.com/llvm/llvm-project/issues/217629
>
> > > * For gendwarfksyms it causes functions with different CRCs to get
> > >   merged. This leads to broken MODVERSIONS information if the functio=
n
> > >   changes in the future so that it can no longer be merged.
> > > * Wrong backtraces when a crash occurs in a merged function.
> > > * Possibly also issues with pahole/BTF as the merged function's debug
> > >   info is lost.
> > >
> > > These issues are new to Rust because in clang, function merging is of=
f
> > > by default, so these things have never come up before. Because of thi=
s,
> >
> > I've never heard of function merging (in clang). I've heard of
> > -Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
> > default, implicitly?
> > https://github.com/ClangBuiltLinux/linux/issues/1598
>
> No, this isn't linker ICF. rustc doesn't pass --icf, and in any case
> kbuild invokes rustc with --emit=3Dobj and does the final link itself, so
> rustc's linker arguments never come into play.
>
> What I'm referring to is LLVM's MergeFunctions IR pass
> (llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of the
> optimization pipeline, within a single codegen unit, before any object
> file is emitted. Clang only enables it with the cc1-only flag
> -fmerge-functions, which the kernel never passes, so C code in the
> kernel never sees it.

Thanks, consider amending these relevant links and details into your
commit message.

>
> rustc, however, enables it by default whenever optimizing for speed or
> size (opt-level 2, 3, s or z), which covers both kernel configurations.
> It uses the "aliases" mode: when two functions have identical bodies,
> one is deleted and its symbol becomes a GlobalAlias to the other. You
> can turn it off with -Zmerge-functions=3Ddisabled.
>
> Alice



--=20
Thanks,
~Nick Desaulniers
