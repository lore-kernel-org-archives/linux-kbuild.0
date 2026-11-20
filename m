Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192876;
	b=UobYVbEYuJUY5pUYSqmj3+UrsLKhJH6oKGyQhHGUyfxbLK+f4oUfdSndB3s8QQwizbPj
	 Rxt2XS06+Tmk1RKEm2eVF12tiHUlxJCC+WIGGZJyYCnLaXSwTo5PnbYMpmW2cBnYX3iBC
	 JZ4pu8CIxaeZDk0mDAPSvUNqF27ZEcOfiGDUSGK2bFA+HRWrkMwmFSleaI0y76WJkAUrH
	 5OZ3o9TlbCQCKWNa/V2shELZYAlV4g/1aSyHb210wftKLznlrlsB6WKL3yNt7LPuOZ/kb
	 GJl+wYoQ7YsI/K37mPwMWFotZb4SgS2cImLQCIH6mYBYr4omTB7phJ+pMZgBfg46T8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
	b=S0I3nfEHYbVqBPldna06RrF7UUsC/ZwFqmjozFyejLqVaVOQTDS/1r5Gh6O+mLpnN67N
	 2AWnuchV6aqehFZDr/VW1rHp3fqjitCXIoIVNjCD+mQIyk602IqlJqcRev6I0XWl/Oj7q
	 GoOJtIWF40111QxFTMJpV4mEEIa+u1PzkqNB75+qdnnsQ2lXtxmp5jsY0Nkg8aVgtD08D
	 QhbDho9Se6oRgYpiD10yVhEDqoxq+sVE3DvLcvobR92OLi+JHzYy0L1leRLJqt2hzqeRD
	 DzcIUC5+GWOXS8+4jnEhz7cDwc7Qtc8drtfW+G2n7RQ0f+VPmGvVfKiOeSp2/74k8tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CR6kwwm1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986C2606A60D
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 16:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986C2606A60D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CR6kwwm1
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so61295e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 08:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192872; cv=none;
        d=google.com; s=arc-20260327;
        b=cPQFqYh/7Enj/lMwt3bKFDdUHQ5u7zSHkDB295jUeIXiUezVFrGZ0ebNWzqhuYmHz+
         TO2jB5V6+fKpB5eNQf+L8NXTwPUmKL3CKlgM3811Jz2v49z8z/TGPbRm/Oj2+kWTDBm0
         QyyYfYKhKN0eLZZqnkG2uOaqfE3AOi3fGikhZJO8UUxSDHL/RNPd7mV4LEmUVih9fiw8
         mWtrpxXK6y54jWZFOTWHBbBchqATiJWUyI6FNwt3IHklzRu9J1YXYeDQqIO+CI1B5R54
         6AaGuAgpv4EsWEKrWs6KV7mpZ1XDXeaUX3GAwVe28FiHQUH0LuiuiOHt26wctuGKkB4s
         85+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        fh=Qk54llx0oL9NtqrHGTdLjYDUkcAuuDnZQgf/6FjPq8I=;
        b=iLmhAkZ6B+ZxrcL5F/qmsEs2oQPZjn+OuJvGa2T1klzQ4Md29bKsqVgvVwFoAXtQZJ
         oQZFLUii8UsjdONXZaL9wTepsiUibevAODJT8sBpTdbTUZU1VDuRaDf+x2Rmx/u0nPDv
         eZOHpgqyfGQ/dBah7/aolP6IjmxbUpeUm+KEYczAp+0UB/M2PpXtMSk037nwqSRAgb1Q
         dxwHhezLhFZPHqGWr2x8UkK6MsBo54DtHXtyjVm2SsXkVgpqjUtDHl8aiVUMpYuyGcsU
         yu7RvZ4uUWNUXxJhF7q2hRzgdnIVyzE2WoKNxGyPy/4jKxyg3+qBKMMsqn1qEmH2y4pe
         ymOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795192872; x=1795797672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        b=CR6kwwm1oHbSxVATbOmkl8qKoYaBhgBn5D9snZ0tnQQ3Mum6vvcKkI/UYRjN3sbMsU
         Q3lP7ctTQ8Lb7hgMXk7ZerlRr75y+f4aYQidLl6z3oJYiMaKDGK3/R7U9pbJ6Y0C+4OB
         UKhhnMEVyFTIgUtmL1tvROIZwAd2MQkwQFMbsoAeySbHFbwa3nzNeVShfEzrmGx/jv+o
         Tj4RmDVqM90h5lRnDknyA1JU+t8COdH4pwqC/b9DqLWfgwD/2mKyrQ9XeJCVEaIOuWsj
         x/oFen3mIU0fyVzeYnYKAU/8YM/lNctAhZmTQ6Lp/G+PeuM8bChEd+t4yQXKFCshyHwU
         Um/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192872; x=1795797672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LKcQCSmGSFWH7cFrHCRUFRL7czFDZ0JoEIiivjm0J0=;
        b=zx2l0r95xrrCt7PFo7K0LCquFi8cjvyfsbVa5YRvHFZII65Z8Ie55LsbHErnoo04VD
         BHlsEnKjnnvW6UVDoAZkvSZDT1UE9yp4yAGiCC1u9wslSkGx1CxHoJYy9Fxh6u9OueWm
         VqG8C+LNGevUzpa/UEcJoTHkKeg7kOv2l+oMVoN5p5gQayDkrKhwe06J+KVkzFlHIWds
         oTVsUnHsAWEx2yqlA2oJcfxvXJMqjCYtZupbTJnOrLm7TZjasZhVv6rqtpLURnB5SmNP
         EMweo32ST928OSATSJv5IcGp8yyCXKB24TSr0PyovzjWxPHoIyhMkFJkkqKSfZGw51Cv
         3B3g==
X-Forwarded-Encrypted: i=1; AL+hErEpsz/ZrP9LoU0Sr1T6w93Lm5udDUqE/la1RDjtJxjiJHz52TNsB8zmSdszJ7DdiHFNIX7hjTSRxQD3myI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/25QD0wsQS5nERQSiu6Ym4Qoz8AzZ8N3UyxJLNfkH1effNgBvk
	Ap4HQI/Fcmx/+852tTP1YWAtULEAzs6tFgl1TEci5srOGnC3SsFrIyCokM3aii24VgYV7VYViul
	RTpRIS+AXcoVPP9FW4dIPbuHfIVwkLmuMrWaQonHk
X-Gm-Gg: AYBFou0/5lszAOeBc3GTEtQG1Ih+lTW2KEIzL6Ax3+TfLpZdBtEVJcxT35pW1hkIu7F
	OELRiCWxSmVF7wS/Wo5HH22I3041ZSuhQFY/hrobMseA35U6N9bTxdWe/pmboouLYSy3Iv6fxgz
	2fgO09Cewmlrw/XJ0jM2Q7o+dUsYH8AlZShtsGhdffFHFlMSvVfeo1ZMBE85pgJQA4eWdumMMCE
	cz13+/NPHCY3FOGfOfdkjJZdlRS6wPFroyrGZub28Q8Zjs14b5hthRfiEb/gF+FczqdOWuKqiS8
	0/DDPFafCWGBP/w7/R7eUf4l0SmXBPqoYz5YoBA2/6svzKU73GD+JXzctGG8QSJsDyIjJceeNb+
	nusrvJVu4Z9b42LUpriahlj9HJE8bSmQPLA==
X-Received: by 2002:a05:600c:3ba4:b0:4a2:bd1:a80a with SMTP id
 5b1f17b1804b1-4bb89619133mr1203705e9.2.1795192871012; Fri, 20 Nov 2026
 08:41:11 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
In-Reply-To: <20261119-fix-rust-build-error-modversions-v2-1-1c2271cbcab5@gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 20 Nov 2026 08:40:33 -0800
X-Gm-Features: Aa3M54oct8MRe9MZBWMaHsVotwxFhMb4AgWLlWpoCWN9GDOy9iSx4jSZ3IW3NJ4
Message-ID: <CABCJKufYm_PXLzoTSyj6jFjz9fO4hoUQT5eTqxofg7ARMg=2UQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: generate a symbol version for rust_build_error
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 2:19=E2=80=AFAM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> CONFIG_RUST_BUILD_ASSERT_ALLOW exports rust_build_error to modules.
> When CONFIG_MODVERSIONS is also enabled, modpost warns that the export
> has no symbol version and records a zero CRC because the build_error.o
> rule skips gendwarfksyms.
>
> Let the existing Rust library rule run gendwarfksyms for build_error.o
> so modpost gets a version calculated from the Rust definition.
>
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1201
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
