Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795032718;
	b=JaQMoZ/R6VTUBb4mzafEM1wKt3lSC+ZCj8/OW5AIQD/6k41NyWcSiDzjClYllg2DrcxR
	 1rL723U3AQKBtFUFfQNTbQpEms5RwkqA8yWB6KFHoFgiaU1kN0TCQYShN6Y/uMs0FWpZA
	 yqPp8rpSSPigBlNnVrWVsVX2lDrrtig9VSgGA09mWRKxdLnoYZ8Ix0uakJdbV7vTK3A9U
	 QNGAN+lTMVPsdr2qYra/BNsV+JjSiP0kybzI7XOoMb5h8VqeZVyRndLRfpyhh8dPErBZP
	 EtqovdZKfUELDogSZsF5OTxkvUZuRDq0Oixi8suw7tdHu1MwDXKJ/I3tbUG+m8TqP7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
	b=pQX9XfQe9KEhM7Jg/UGhKCqpohUd07MzJhu4C7P4alYfJIw9ea6mxfmm3F4nC/ax/IWp
	 qCk+LSGIsrDa4mwCAKYIRVsWekt4mMT6nGyIdmaRBG4iFTYAUWrWpPmsnqwAmTJYmwS5e
	 iMBWEZpZDNb917cVKMYkgeqjQfMDAln9dBDA0zdfXBZKIS+zMbj8NCpBjTPg3rUiWjfgc
	 ut/opVS46laDx9952zmE4T6Ten3ajZgLYhysSDZwVxOeoT2VJ3hEpDmyY7+O37Rniwxm1
	 gREBq2oqLWWmdcxLKpAkqcm21WAfCN9LjMyjqCC5OCsIbKxUgMe+axZ0+6wA3JkYCwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WnPEpb97;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF7260A2604
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 20:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF7260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WnPEpb97
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11322635e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 12:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795032715; cv=none;
        d=google.com; s=arc-20260327;
        b=R1bNbFwjjHVrXfYZFd9RZRlJT1zPAM35BnuLj3gQEDuAO7YKs0bZ0ulbrUXkcrAn/j
         5LKd/5ZjlV5QpRBN5o0Aq7T9oza8BBJGpvO2gppGCSURKtr93g1JRa1q/h7S+xdgIngR
         0lkF/vnGdTBd9D84Bmo1b0SWFRqnj1cOdTE6E6NGhnhwgUivieRivqEvAv2N/79F/GGh
         CTYNc3SaPKM1T762N+S+6jCTePfwPvjpqslSmatVEMJy0bE7RgVF8KTPFp5X4FIAOpb1
         knp0VtqII9/zxv3m+Qd1Rt9aW+O6ITAlheB/SO7DbAUqIWBROJOXvEtN8UdZ9VUCd6I2
         Wpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        fh=bNu2dT3mh7URaOLXtjr7YeW9Jlofhqf4OUMJOEM0Sao=;
        b=AyvDjMAII4QroqVfGrggOunZeOn1+91zgckEGkfQCKqc7wlPvWdVodA/45PW4Yqwkv
         2Y0h49sGRoMkVGc8sQjFcPr+7Y++P9/k5l8ScNSaT6Pg4tmVF5twKJ1K7amEvCjgqbWH
         2OR5sQL/G0sNfiMd8uwjxahCQWzxtWrfhACPEiDCudO/SRKpurNb7DnekU58+D+VhBKX
         IuhWkZQ8IDhrKyf82JkItkYM8118Pb2urcLf84yLT1uCHN+5nqGX39qdAuhR0W8WUZIy
         a26in1slPOlxCpcylPyfL6dhr9KnbjNYYAcwzZfaxYIGCD5lYOKZ+0IS5QR1/eXR/s9t
         qjPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795032715; x=1795637515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        b=WnPEpb97kcsekPHkHRowpccMWjX8C6s0r6JhqMP+J37hvVyl3KKbdYTrt2mCKnNDPR
         dFa++tGiOhCmVAPTDBNOBZ+/FYjY2XnEehCAl26jldhRwJjHQfxFxycMIZ2860yrP/dB
         aqtRoitnFK+bScW4973b50bWbMpLOkw2YyCX5jHh2E2Uzdlkyo7xXRYjzP52MgWv6/yd
         l5Hpc6/FmSbkceMFAEIunsH7fc/2JN6t/vj4zxj3eulelO/OY6aj3hPKErr0CVXD7o+0
         /2jgYoTAzXn72smJdbBxsLFgjx7CwV+4whoC7laZsKAqXOE6XoAXJ0yzr2PIRyaTC9nQ
         5Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032715; x=1795637515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        b=OLgY9awtCuyuTWBhvgyq1KNCpv0Z5xeCBkZotGbezop0lOqoUnFs2jB5wxGJ4owhYT
         mE/MglskXkdjNbWmJ0rpyR4XHKOptOtmYBiJnwkxLMQeUWITzl6muNOvS66JEK45t97O
         J3jRkiT//wxO+volU9HHHAYYX4LTq1K8TgI7cqR8F3NRVqxc7ccE816+QC/9K9VEX7Y4
         su7DetpnN9gf22dPyZK7QRJnWW1GNq0UygdCf++ZWWBmDYv010htzsFkdYYYuVUpe3T4
         nDUUByo0EdqZwhk7N84ItIWiMqQmPubX/CilzgwWtMUVrhevWbn2nVz2VkEoDWzvOHQd
         j1Sg==
X-Forwarded-Encrypted: i=1; AL+hErHnF01yptkCIywiJ/ezGP68dunfps5+uSeI1OkDYRq+e3jOIS7nWyMvAVi60rziuGUl6Yw04VXLc4piYZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Av+TgVW38L0Lnb3uu7xMSehq7O6rvKjF6PqX2tdhakzknLxAc
	gEjhvip66aMFA3DMhN8x4Y5B6l6WUvvjft0MQy118UaihpDLJmZFHXEgzOcgAUKcNjBuMxZ1tev
	2apAZOTr0VHLIDxuyYJ+EceIvKwiSxT9jVnFF6H0b
X-Gm-Gg: AYBFou1yKX7DZC3Y6WLvqPBznkgh/+GGbNt56Rhkf5PB7hEML0hcq5zf1dplilWvPrU
	nZxyI9DqeLCMZ75Rv+9do/OhxElYQwdk2GaGSK/N5e7lvlZaFkLyqhTynft/WWA2ptcEQXZQn7v
	vrgE8hVX8ozRw2aaMNFOQPMlPXuNdurdDC8rCyWEsA8e7McQ9PjK4RvExevbWOtcpTTxs2mH7nG
	dNdW1oiIc5smxFQQgRZSxtBnS9Qa3i9CWFUf+SU+1P/vql2Vl+KGV69S7YjoPxwR5ZViWKZZV28
	aUTYbaa0AG3raFh2jGiuKAgy+Kk6nLH2SGEU2K2Zj3K0jvF7sfQGjrBIMPVkzAdn6HLrHmpqXJA
	VgpNZAz3/XehY3TG2+2I6DhdmyrDgn/mrASXxuAiGky/vePS2lMMIglGRUU7C5qCIHt/AEMYFiq
	AW2C7iHCUVYNR+
X-Received: by 2002:a05:600c:4f4f:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4bb7da1274dmr73938355e9.10.1795032714637; Wed, 18 Nov 2026
 12:11:54 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com> <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
In-Reply-To: <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 21:11:42 +0100
X-Gm-Features: Aa3M54q33nCN9_jrrnbqRVjKUIfyyWJWqzyIJScCl4pTAw6Zw2JFPOFUAC-yfZc
Message-ID: <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Nick Desaulniers <ndesaulniers@google.com>
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

On Wed, Nov 18, 2026 at 7:48=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Function merging causes various different issues:
> >
> > * For CONFIG_CFI there's an LLVM bug causing functions with different
> >   CFI hashes to get merged. This can lead to crashes at runtime.
>
> Do you have a link to a bug filed against llvm?

https://github.com/llvm/llvm-project/issues/217629

> > * For gendwarfksyms it causes functions with different CRCs to get
> >   merged. This leads to broken MODVERSIONS information if the function
> >   changes in the future so that it can no longer be merged.
> > * Wrong backtraces when a crash occurs in a merged function.
> > * Possibly also issues with pahole/BTF as the merged function's debug
> >   info is lost.
> >
> > These issues are new to Rust because in clang, function merging is off
> > by default, so these things have never come up before. Because of this,
>
> I've never heard of function merging (in clang). I've heard of
> -Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
> default, implicitly?
> https://github.com/ClangBuiltLinux/linux/issues/1598

No, this isn't linker ICF. rustc doesn't pass --icf, and in any case
kbuild invokes rustc with --emit=3Dobj and does the final link itself, so
rustc's linker arguments never come into play.

What I'm referring to is LLVM's MergeFunctions IR pass
(llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of the
optimization pipeline, within a single codegen unit, before any object
file is emitted. Clang only enables it with the cc1-only flag
-fmerge-functions, which the kernel never passes, so C code in the
kernel never sees it.

rustc, however, enables it by default whenever optimizing for speed or
size (opt-level 2, 3, s or z), which covers both kernel configurations.
It uses the "aliases" mode: when two functions have identical bodies,
one is deleted and its symbol becomes a GlobalAlias to the other. You
can turn it off with -Zmerge-functions=3Ddisabled.

Alice
