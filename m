Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B33DD53F
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125848; cv=pass; b=RFHChfhns8ZzazBkK4YycTqsiy6noKVNoUY+st/iMr1e5/zfdfKNoTGBLgdtCelVNlkiNPDtv3fRt6vx71gSBwt3tgaUmoXRKBttJixYMt1kluLxdBt/iSJcW265+E5DG7/NWWVGn4fTLDa8c0/WGhArKsiHW8dg52TqXc9HJ14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125848; c=relaxed/simple;
	bh=BiK66Ja63sGBdP+p5szis0SgkFa2xSLSpWzb20fg000=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEHAnS5+5WB3RYOUtqfcFpKXhVCegB0950RNp0qiREvdqG4I8JOrId5+ZTXUq5rgwf+/VAHLsNFmpXab1K/jPOnSe2hom6kKvrWK/tWz6pIGBzFBBFzbnR2KpeB+opnC3mMiE7UgGs520SA7FXshgviW3ysgndCwTO9Xs4UETo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO/4s9Pb; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO/4s9Pb"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bd801b40dbso73271eec.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 03:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775125845; cv=none;
        d=google.com; s=arc-20240605;
        b=A5KNRCdWUawyNn0n30epDrcNvq4JdfLMdJjpMv2nUUeDJTKrNxhhhndUXOVXcpqh3R
         /ecws/lbHNzjxm7WcCWLCBs+9KlWBl1lGxjj3tW//XtPNp8/8rCt29qtkicj1XXGrRYP
         Mneb712zfzyjhxGveYQkp4Z1y0GdXTHFQa9lOvEJk0zaNa29xOHTeBezRynuaL22Kscb
         y6+PtbXV4izeedTPmTmj/Lk4g4HzNU5pT3e2lRfRHd+I9qc+wvn12lLum5TBs1FTWXKx
         sF3CnrS8BvpfdEb+xW0wdbFU+6w8CnTzdB8I3SCKW1AK4G1eYQMwgeR6qGILyXJVt9IS
         ltkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BiK66Ja63sGBdP+p5szis0SgkFa2xSLSpWzb20fg000=;
        fh=+Pcd9G7NZB3vFgZHG/slIdeO876vEJXIBtfLeXUa2rQ=;
        b=ZBeJAhCM23vycpXSxabCHOdI9Ibr77U6g1jh3sqEz/7ihjBhPX1Gvx6xQplWbI4eqq
         Q8YuMcjWei2AxTKoNl6cfFJTdCPseR/v2Tnw/2kRq9CcJ/vds0pjBA2YZq+eZipYHf7L
         De5gqBwibkYeO+pqJfg0p16ZOz2kTJOrvSqixJUf+31hBAupvq70/1q/BV8WiBwADBT0
         7JDg/0uIjQ89aaZbVqhICVITRTUSe9D2888guW5GSXhZzZPqyfQ+KGcoluvCvPpEbCYb
         J4mzEGdC5kWGhntmHrbWvfGIUV6ihN9S3Q5x21dlNxDZ3OP5j6Lfl1vXBXqa3qrR2/tx
         IKHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775125845; x=1775730645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiK66Ja63sGBdP+p5szis0SgkFa2xSLSpWzb20fg000=;
        b=fO/4s9Pb3nM0qSacm1iTY+/NyU+h7WZC9jeuPTIpLmv9OSjbmR8YoNaXN8ks9TT5q9
         gRcaplJdbNHvR3AV2nNrsZIOUtFDdRCYDQatLe1m3kk4gL+ACFLqd02ipB+8/zwO97dv
         i8yhOqAjLMM4IJIY9LgB+AyaRThD1uvP6Qn0ewqeOBYcjuzTKhoSPdDohaSnkU9dmgAY
         tbOM82lwu2XHN8Ajpw+skBPN/1F1qFudPYqdsN8IqbzYVb+rTwSVggQPmnp0ARmAYSZG
         alBjs3WBrMndLvzlWe3OdOYoIPribHlhLI5+x9bq4rH/yVmGmRidvuMCGaImncTkUr5M
         nF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125845; x=1775730645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BiK66Ja63sGBdP+p5szis0SgkFa2xSLSpWzb20fg000=;
        b=FxNhANvRgJRTdI4qYWvEDhh3Hcf41k2DrYwdvHlP1Tbq5Eb+7WIcMQ6TbTXcdQ0Nl6
         CqlWSAXtSi4Xo91Jo9l8Ovwn1JfwU3NYg17cGw45B1slklNri1NfFTfl7XgpOq78T/9w
         IBpNAGVIP8OPuDqvsnezFT0qZV+LgbT5EnpXUeJkVTUw6qYxYwNNLp2YloSb8cljPW6O
         dn3r1NMddF6HXOHrJxcal+AjzTVihmqxWYvvVmspMZyfplmw0+wPLUVt2VmE/H5H6Vil
         KCIB0HhivhFaab0UzN6T6MyJH+OB39m2BrigdlY/FjrFA4s+4q/1aiyOOW61DCYCOYl1
         i69g==
X-Forwarded-Encrypted: i=1; AJvYcCUG65gaP7qg6zsTpVihswM34Zz1yvsHAppASBg14PDb8dmgWetOyqa09/gY529JQE3S+UnGhVpcyaUW2Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcjF7+69brQw4dadXJfQgeCtGoOY0zmzCuz4XJm6tm3kkL+OEB
	M2q05/ZginM9CmmhdGpNW9N6cbJuoGxlOO2FInMAnXkxn4Bb3OZrAJ7bgA1u1crH8Qn0qOrNlht
	3XymKNeE+Rl8ypoiq5XwkoDvMxWY4Yz4=
X-Gm-Gg: ATEYQzzjVr5m3HAkUz+l7vGGfHuQrW0bXkmLLWtFLfqxinlsd33BPkpAcRexFTTLWU/
	Ia00Itp8qxM5JLXxekfs6/PG42Jb76nSKlCq/63r1+Yri9NsN49KguMBksapjXSs115KCdgz5fB
	iyXkeCzulxG7GVtOggoT8BYyHvpbaWaayi1DfXO2Zn0RWoaeEEkCvStywYOL3wjZ3hr8NiUkYTn
	NaLiyOgo2rg+975cwAElOBU1eE+wh94xFyxWZI3hJKXZLRU5legOrUWw7AAdepYU3D27N8apoUL
	bBJQwWUxVQH0muXLI3OAmSxPBFr+E4Mlg7VPZqSYJ4Yan/XsPmSSk3GO7yG6jDMyQYAxy7noXdv
	qySxaWIMkPZhfAjGVCfXnQWo=
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1632114eec.1.1775125844672; Thu, 02 Apr 2026
 03:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
In-Reply-To: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 12:30:32 +0200
X-Gm-Features: AQROBzBsEeAx7nnfVGiSD2TX6oKkCL7WuTUbbT011Xm4AwR7twRDG0Ux8Qwzhlg
Message-ID: <CANiq72nbd1krDja-N-HwL7=dw7+OYmqGSa1c36dRMWjRo+OA_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Change Rust Binder crate name to rust_binder
To: Alice Ryhl <aliceryhl@google.com>, Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> - Make rust analyzer python script a bit cleaner.

I merged Tamir's PR -- could you please send a quick v4 with the
rebase so that he has a chance to look at it and give the Acked-by?

Thanks!

Cheers,
Miguel
