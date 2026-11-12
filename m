Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794520777;
	b=J7ALjKSoGqa7PcMsJXHNVZ3zFQHCTSL1/TdR+754teAfhYRSsg/XSvApM4cdjicVNAMN
	 6IdNu7DWRqwZUwSFK2R+lKxRHjES32WcrGKeiWGvTvldG3mhxM1wS28pDoUVBhInQSozl
	 zAjSvgmrQ/G0sP8HqcyJRoMqVQTOqN9ZPN7J6e9s0P8CN1rxL+V8QxdZSFm+YVHWaSLaI
	 nRn5PIoOUZGkfavHAiSqy1sKrs2VPKViQeV8kBaYl1QdjxcgWzJVYQEFJ5hOGXmZYzlqu
	 6wirJrLQeuE4isnoQKgHQLb2ao/L1ZCJ4yWN6TQ/7yfv44T6eFAiNnB4IZFjPoXOzcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fOBjKw/47ZpSYasxOW9rbBD6ghc/N8eUBSz5y2GcMbg=;
	b=ZjXCGen29lGiZuWlTwQqJtJOjoNogHpEhkHXfFn/VR8ai8AIIQpgGanRO9LKOIbtxKlK
	 YUUT6xpRibqxsHf4994E2iDi07yqoELDj1PiNBKuqGjPIroe2WQkirZPiSESHJ0hyFN/7
	 r3kyGoOcNm5qZtG1NVkxM6M5rBhiPl0xiaY6pCkzBQJQsUS3z8v64aqD4VfSj4IZbb60x
	 Jmhajt+qngiu4W2HKCTAqz5zYxD3GR7Y8EThzt9P/IKxfWBpOPtjVTHWoG7QMTOMlLTwe
	 tc8IA4MVXQ1UakUyeTCWqsNk58TlE2sE0nbzEYf2z5iT3iIs5y2q7Mqb9phz2rKlY5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCTjNrNO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F09E606A321
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 21:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F09E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCTjNrNO
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37605faade6so48834eec.3
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 13:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794520775; cv=none;
        d=google.com; s=arc-20260327;
        b=nSDjOTi+kR4n/V2v8OJMir7y3bbMlWLiOs4B0x+rIdvflqQX93sjivpV77SWlLlNjO
         LDCib09crYskZD4a10LIsXDW5kweplL+2rC0tkJTbqE7tK4g2PkSgjeyG7k+3IJ0wjbn
         K53+lxYXqjeqbjeMDXnzV4kDRUapg1FiW/IlnH6iRXy7/cppa6LfVZwonQ7WSulM++gp
         RpLaTf5M7uj4fllrFQOTN6VJ5GIZBO7eai/9uNRP2KBfcu8NPj5vNT79Lc6PE9tmQ8/c
         HjnE8VThUaK1tVkHDGD7U/GeBLYpbPOgCfDcm7V5MLUEjAt7TixLmCrvy11W7Wy5oRrf
         L3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fOBjKw/47ZpSYasxOW9rbBD6ghc/N8eUBSz5y2GcMbg=;
        fh=PmKAX+mpi5L1I1GK85/Pp3VOGNd/PeHCCZ+WZTF6Vi0=;
        b=HuuUC5G8BbZyl9BQeNYmx+0sD8hlaTpHF/a9W4bV4q2zFRzgwHfk3luvdV3V9daQzC
         E3xdkA5HRUxlrFFY3+nSGzyT5+YUrLhfsXMFxSXbED1PGsfOCIcK45McM4heJ6MP+qVH
         Eb518ovmwI4RZJ0jDJ9mZWvVYoX0EyMo1GabeePKhagB6J8q35VdiRb860FKfLRuwup8
         G3SY24StktWuEoGu6dcK8bS3qxzZfcYCELbSr4OMC1R4PrCFbdq/eI+wYFsZH0i8NfuR
         BEvIQ2tqhvlFruPnOvXLLslTx+Exu2yGZyXOFuEqLnE+TkLewvcOYX+uilSs6KYlxN58
         K+TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794520775; x=1795125575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fOBjKw/47ZpSYasxOW9rbBD6ghc/N8eUBSz5y2GcMbg=;
        b=VCTjNrNOIpHe59YOSqbnDT4z+nO8aCbXYM6QLyB70nWSt3Raf8wDrU+uskkLZ2S95t
         ZtsdE4VWpAQ7O9G+uX1ELMTU1wrtC4VbTUbzX2e8XTEuBfeA9gArNRlp0XReTMHxycP8
         jwb4bi93RQ2GggUWE1kOQviADAV9GmmdrjnGzbi09G2whPsvCCO653LhDc4i4tT/xxNu
         mPc8tXiGTHOUgMRzddCm3a+qSm6KMS8kr4lFiNiWNUoCh6tqmrJbrKeh1N7NOVvI3bMB
         ZFV1rrTpwvEt6cqv6r1fpRgm6j8PWBSu03OUz3cLFWM2GX2z6R+HwOa2F5EVP8jhDXvm
         Qjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520775; x=1795125575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOBjKw/47ZpSYasxOW9rbBD6ghc/N8eUBSz5y2GcMbg=;
        b=EEOWQQwZ4/GKXZbspGa3Lr6ZHAu4zo4GrJBc+IU/u05SXlsE/e0BbSCBjYIrffoZsu
         4EmGp2QXm3qmofuV6aJUz+n7D+rIry41216Yw4yMECTg/c5sfPErVoZ2KGsmfc4PwbHt
         tuJkbgdhzyCSgta/XQ0bBl1rP/gpr0+/TXHrUSedLJWHAsW6fuVO6Ea1reoQ0/JFTMGo
         rPzUWlVRQlv0s+tNH+0uukulCo3NvK535Ok9xbmDcBWqgdlaMxfzpNKQreCOPh0+u/sf
         mpK6tdI6aa8e3guFIWuY3nRJnE20NPRAQau+MTdW9PAvwyAS+c1iC9hM9j01cNsNbUkG
         wj2A==
X-Forwarded-Encrypted: i=1; AL+hErGlqqhnz9SpmGehRCBLUkin3DX+P8hgSy/4k00hsvdardbYeYRI11D2otfdgxhSJYUlmjoQ2uSb37JL9kU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TF95wwzYaPwE2vTNpEAbdVj2hmnSPnRllZrkdSm4y9OOpJgDc
	JWfXeVc5HajvpSpnjEizBneeIQjhhQYjAayCmqmVw77o/e40R7ZYadaoyWcX6gmLkpXLG7BkHeL
	LyzM2+o/ahboM0eAkLYtLfpTx6F6s68U=
X-Gm-Gg: AYBFou37ZW9UcEYSJO7uxzawpT6fkHwZw80TeEuG7+J0UvsZ3ZxCKX7yukypChedcJc
	H5ARUDY4QQbo9Pg0e+xhGQEsXTjBj3c8HZquqG60QCazXrbx3i7XAfhfBffIxH9MRLU1kAP90Ii
	WL+j0fYS2L9iw4T/uuz9WAEJ7iffN+YC67d+MNTtkivFjSyq9hW7msSknOiUdoVgazq/FQ1VCLC
	czPv7B6Ufvolu6M/czvSzRSIF8q2L92XbPVYmSs4GWvHy6jm/TbYeNxoW7JBeO43lx8s0fThkR/
	5CDhhmWHq75ujAYQ31LYS2w7mstAITmdTssdF5wY0RHAD217zyJ/nTcnVrwqGOmk9zzA5jcj8OO
	+e7Ap14sJ7bLrMfqJnJ+X0Agfoto9UvMotwep3WrDhNv1h0MVr7+7llM7OemwaRo4xy8TWpI1/7
	8+KxZxIUDezltGFDnrrzNxqdXQzxoGAo7cziHSNZre/kx72dpBbfc4qfnz96tv+MVCOH/93zfMF
	LK79+pBENMt/e4U6AFHyp3ZExpfvbokzx5D7rXbLgWXhiQ2lZ3eqjWFy4Vgztfoi+iIm5uRIIY=
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id
 5a478bee46e88-3796057b529mr715902eec.0.1794520775246; Thu, 12 Nov 2026
 13:59:35 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avXdJyqNNqopuH2_@ashevche-desk.local>
In-Reply-To: <avXdJyqNNqopuH2_@ashevche-desk.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Nov 2026 22:59:21 +0100
X-Gm-Features: AclHuK8HEc77klTAoc_1mHlFie78HYNB9k1hvUrY_KkXsL5VCHPiiiSVNXJnFLM
Message-ID: <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
Subject: Re: rant on Rust in kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, ". Boqun Feng" <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> First of all, it broke the old and nice kernel feature to build a subset =
with
> allmodconfig or allyesconfig. For instance,

> error[E0609]: no field `disconnect` on type `usb_driver`
>   --> .../rust/kernel/usb.rs:57:27

This doesn't sound related to building a subset, but rather a known
toolchain bug -- our `rustavailable` script checks for that. Are you
seeing this warning in the log when you build?

  ***
  *** Rust bindings generator 'bindgen' < 0.72.1 together with libclang >=
=3D 22
  *** may not work due to a bug
(https://github.com/rust-lang/rust-bindgen/pull/3278).
  ***   Your bindgen version:  0.71.1
  ***   Your libclang version: 22.1.8
  ***
  ***
  *** Please see Documentation/rust/quick-start.rst for details
  *** on how to set up the Rust support.
  ***

In particular, you mention Debian unstable packages: I cannot
reproduce the issue in pure Debian unstable, nor with `LLVM=3D-22`,
unless I also pick `bindgen` from Debian stable (rather than Debian
unstable) which is older (and then I get the warning above).

Can you confirm which toolchains are you using exactly? Ideally
checking the `CONFIG_*` values in your `.config`, e.g.
`CONFIG_BINDGEN_VERSION_TEXT`.

> Second one, is that now with the above feature the build is finished like
> a minute (sic!) later than it was before on a good server with 24 modern
> CPU cores. It started happening somewhat a release ago.

This is a bit vague, and there were some changes to the build system
recently, but I agree with Nathan: it may simply be that you got
`CONFIG_RUST` enabled.

It could still be something else, of course -- if what Nathan suggests
doesn't work, then could you please compare the kernel config file
between the "good" and the "bad" points in time you have, and/or the
build log?

If that still doesn't explain it, then could you please do a quick
bisect if it is reproducible on your side?

Cheers,
Miguel
