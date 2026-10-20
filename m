Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492032;
	b=0VxShAFjKKexbqVI4UHfWLNx2SQnAfB97dKinOz/p2HUwGT78D8574pcaXlAKkty7GMz
	 G2B1liodVRQr1Q3pCp8xdG4cpjdzVhp+BSNsdvqSHfiHPMHkBylXoJG/B3HKysZqpT1wh
	 /fywvWT0apYCLSviboffaWxoDitAH8mACXahFIoMtMHVeFIQqmRr0N720LOU/n5e5jRMn
	 qV0qLkzLU/GgY/TQcel9EdubvCJdeWIe7xDA0JkztlB9D6Nfg4N+RhQaXDTmXBJZzygq2
	 3P4xKOPgSg14bsFVWtnGyeRErSCO06XYdRvHWc5t6MRd52IG2A2tDlXNY9Yre3FZgig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
	b=KOsLv64vWcdr9Zg9XAPJkY0EacZ+MejkwqXpRA1c1GSTRp8tPRpNdOiRLYMmT4+VkHWR
	 kin3QjHpxa0L6D0q+Hd8+7pRAa3mFA/IEJvEdY8vHiUVAaiY/NmMPbc1KOmfLC0/cM24d
	 UtEAIdMAvjvB95m57Z0MklkOrc6GibBKeDSm2OuHukMftcOOhlAtGHIx4JFMX30pz4F/b
	 yvEcdfXfr26KVQzvFCIphTSDFZ4tefS+bb6z6nRST3gOQKf6CdovIXuIUXsNgaQ3+RZop
	 p+U3hSvbgUCwD4kr57B4UPGZvEAJWoLoiV+lIHO/EA++UPjwowovOWslRBwfVNDtthQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67785606A31C
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67785606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35159e0092aso361841eec.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 03:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492026; cv=none;
        d=google.com; s=arc-20260327;
        b=Utd1mHaJkW6FXF7GZxg+AppiiHBSg9i9c2QK14IfigSkXy8cAd+lSV1q6FbEc7SWYw
         yYM4dNxNen9R3vD3xQmSufInmx3+tagKVHEa9ydeUPtpZF8TieI8IJ88IHU7hY46wxQv
         zCHgwzw60TmzT+s8w8cvLeP90mvwxv19p/maNLaxE1qvumKPAN9Ge/Et0vLf5amc2kJt
         DuQslll+oFMW9tSYnCYejGhxeUUAcDgyxvuCN1uu1QWqFiO3P/YX2eHVMnwmppDupBYg
         7eqsV+mhVp5dCoB8/W3YIGEli0Rf/opBg5CSiP/ie1FGVkM8Yh/k1l+XP2PDyahQ/nfR
         jKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        fh=OnbfK45Tj/sQtBoZKtuGNjwmMqEWNHvgbbm1F/x4C4o=;
        b=eKh80qWkrPeCJWNUahduwORB7LQ9IwmqkMc7j/dhAJDsf/1hvO/mGxPu2+k6ydpGSM
         ILGkb23XlMzlLrDaktWACDeNo844sGsvl5/iPsmSCS0NWWO/IvO8Aykpeiys+pkPVDo5
         0nVpnYEHvhDZ9hAcd2Am5KWdT0/x37ALdPAcGGOFUKlp5U47DiUmESGXKjs6Ke8ukOc1
         vtAEkLX6QoXaOuwDg3KcuAlKUB9go4snIyf89vu+WzCV+JoH7V8BS3k4zwmQ2QvO/XYi
         PntDG16w5+8leqmndyDLy8gon0Kghp5uIljo0DqOTqA9oZkRM22MgmfU3H2ZytE1OH+1
         vbeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492026; x=1793096826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=eK+TzsrG8ppsuUBTMaNmtZbCwx1Zipxq05QH5xDzFvCB8pUTqpe+AMfkezQc9FE4q+
         47eMC81vpyd1Omv5sO+zDkakHWpHql5m6bNxnQrVrvxr67vRPTY6ommHrH46rl4pbAGe
         oX6tn5uuhJ0Pny2Z7AimovUIRmVppIjpaIUGRyBcLReYhmWvOUSr+tvqcrmE8j6JqQ5P
         zlspHWJBGuPxO2SoBJ4XJKzWF7VFR+Lxl+xi39nnPAMB8SGoovD6X8OZvLAh4PTir1zc
         7fQxEGw85RUrzwIka79bjhAwvI/G9PAfrDnYuaEL7jdUzxlwUMz0LmM6SSEsa902xGjR
         EmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492026; x=1793096826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=zXSNP4DRPkTIDI6oGEeTqnmGS6JZ+/176T0Fqxetw9mScgN+Fl57xuKZ8G0mRVh/zW
         k1nMuISWIvO9dUb+3LaqryxCACJCPX2Bpq880JKsAw39W64YOCECO9xah6liq6PfG7A3
         vSIoAQyP6Jh/u8OdkLiu1ASwU/cyi3MXjfpqfIXAk3UoaXlLSI/q3McHsyXb+NGNr09U
         oWcVcHLI+WmCQZganjcuMHHzlA3BHX0OfQCfhb0clhaxYZLOLCZo+AnDbipDxruIlAf+
         U6V4yrxYxiEBSSg20b2SKOEkcmjjMKxBzDUapu4uoT6yWUu4HtnobVjYq9MAe9ztEBWm
         tI9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwImCbrlFEUrL9Ux7gBQXcKOMZPbB3BP/DFVhSX96bobpjIv1fIPZtE6AT5zaS4qT0hcrB3UMjbsIZygs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEg+qBeFNbAX5HxX2ceb2cgIGQ8ZwzsiUXqEstzmRXG2tKJK56
	2EPWstisHRBEYoUQRT1vh0LWOIx9WAKpw0GgJJROKMmNk57Sg54Y7X3F+ei/+2LQPsIPEAvVIQV
	hXgl2WagKv9oXDf5jCuVNRRrr/xNJ2s8=
X-Gm-Gg: AYBFou3gtgfo5Iy/qtdVJA/9jY67SIvXdIXuBo8aQEGRCq5ZNVqb5LxHWz5jJHk/mz/
	Gq/oZNtiI+cjkf4MziUF3YeIhe08nW+n/eoW+kJ8P6DleWIGMNW+NctVr7Wh/BZK1PhWj+oG+rF
	+oFFKebt3fjtt8tS9gfpECbCn1k87hHPqtYHZl0WJ5fdfWSNPasBRoCTh6sO8GXd0xCQ6IzUjcL
	vdV2DbXJQ+icsCmUIuTr9Lpq8PVztDpnzqBp9A+WyY08gxOGqQalz963GdVL9Rjq71JWleYwUS4
	7Dg8bP0HDLBOEFz1LvT+IyMCyhOrTXqZUYN+pfc96PeDj8Ol0q+i1+XyJv/jM0gnFKp/it8iVuh
	mxn5esi99fw1xswttGzPNr6AXiLmWUwN4BniNa+XCh27uNaSdUV623BqpxlmMfbHptjo6IUIr1I
	biATbMwLUnao0QJ1NyGyt6ZtoRcoArBVXluByMfXVAiiHis1pFoGw=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr21744064eec.2.1792492026480; Tue, 20 Oct 2026
 03:27:06 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
In-Reply-To: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:26:52 +0200
X-Gm-Features: AclHuK-QCNlJqtXqMEy-POlR7cKE_rSWRMxYBpanQuZ3UPD3z8WuYE16A81SYDk
Message-ID: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Which tree should this go through? The Rust tree? Probably too late
> for this cycle.

I think you send KCSAN PRs, so I thought you would use that, thus the
Acked-bys (I suspect others thought the same). But the Rust or Kbuild
trees are also a possibility, yeah.

In any case, at least for Kbuild and Rust, the PRs were already sent
(and, generally speaking, I would have expected a patch like this to
be in the list for longer anyway).

Thanks!

Cheers,
Miguel
