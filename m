Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF543314AC
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578536; cv=none; b=YESv2yCFai1tbQA931IGoGBZPHmrRsKiZSzHSiBjR5bHiwCZChoT71KLlixMAfwirzWGokfOFrt3FJIEuUCUoRT9zlN4aOSbo4QersqckRy86/FABrRhQI21ICm+TBKpzz51p7sqsthivzU/3YK8GQUo0k5GTZBnFp+VuTC5+1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578536; c=relaxed/simple;
	bh=vnE596Vv4LGVEj6lqcpPlm59VQOJAQO5KTmYlAKUsdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HXcZ/+kLljpRN3gcSvh7FE15Gt4L5/tjhshACFahoJP0YRnW/FvBM2lpngOT/aVubk2YCR9fSv/TsIpJOLYBOJIWkmN6vCCyRP/PHcCsrkA7mDeKdTuGZCLw8L5HwOz12AyRv1J7pYQu2GG+cggQ4aDziUkzZi9zXbzSShysZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLawD4dU; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLawD4dU"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so6422344a12.2
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787578532; x=1788183332; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vnE596Vv4LGVEj6lqcpPlm59VQOJAQO5KTmYlAKUsdQ=;
        b=oLawD4dUe/2mLQZ8ScS+v7lUVLuLj6UI71T0Om0nT4fRW3XjP7cfa9zWD36w2fNWse
         F0cBp6+joaBlKuDjdHQ2IDdlinD2DX1qGNdFYfUO7/O2/+jjGvm4arew62MUk/JvxEJp
         KsXfVwDBDHZgPelJEYUE9lEhk0/VMKTxn9QDuHy8jIRKcu21SLLKCHDLX3SHAJgrKv3+
         xNlz962wd2eoLMBWctJiSl3nRTTQpufd6rK59aPjAoRehPKCfPSVuw96+oRWUzmraizc
         Q/F7ITwQ8CEK4ZkcMrxg2l77C/1sNiEEqd+gWK888ljhR4uj5nc8lYgkqaoaSjPlvpTy
         V2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578532; x=1788183332;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnE596Vv4LGVEj6lqcpPlm59VQOJAQO5KTmYlAKUsdQ=;
        b=TSWkSu4aiHYq55JyC8v2O85X5KXsqMvIBvSguwS2QAN6r3gzpBODn0AtSoJ4Uz+LZK
         r65zCSf2BXe1jjR4xfbLzz4frZM+ZLz0lyaQKLLeljyCz6pOy2Ig1XvKrZZVRjGvYNyv
         C+u3wF5A4slyyJoT/ulkaqWJ0yShYgC+cuvNkaeuL7fnENLXVYvUdzD3PxlfuZL4czBQ
         j8t88s20nEvxODe4B6OC7chi9kLkXQXQRpOpTkoM7ZJNYWLVsr/HsqPT2UDG4qm7Ugw7
         K6UY8yFa8i8LqB4JFlErsVQ6qq4o5CdZenE1BnHAqludP8UxI8kN5qemk65E2HuJ/aH1
         InPw==
X-Forwarded-Encrypted: i=1; AHgh+RrRIsmdPAUiHVKd5LMOQ4Ww+xTeMZGXJTsLYCx2N+l+J7q3XD1xrP2ouvH4OyN9lGv/aHom8qFMTmdoL08=@vger.kernel.org
X-Gm-Message-State: AFuF++lc5grd5FEVjrCvGlJouJQs0H20pOgM5G6Q0UtpHh4Qomh6KD1G
	6q9DhEC4/eaQsuX4cWyCg960VcK8rIe0gSQCAFlD9toij3iglRdKxlMMzGMSfMAko4U=
X-Gm-Gg: AR+sD12zHdUznvvpaPyua0M81jZANaJ1dnmheS9wk3m40yKwIo5EC2ZvWU5kDTVaUZN
	e7vHI7otihhKeExz2uB3f83XgItGhJW0ov8hwkzDXHfLCJnfFWD32TSnYEMAbWIQueER+GeLwno
	iKLKDOw12l7NSSyZVo2zm8+qiw+aJj1I8PUWgWOmxbAhGGCFqvLivmwMXEvOFHGoevtCnGrSWvf
	dol0YQVdg9G4aF6JL8kN1ZXN8SHX4qkRfILKuT5aN0jianZoPCvXwoLNLna3ysQGIR33+jiI9rs
	EGh9/XtXY+5UPJNr856sysSmA0NHjleatroh5wXbzPHr4ffMrHVLAVO34ST8ijcSgMaG3c1YT3k
	X6AUJVigWJQyzVkf6uvrgeQx1YI/aC5GIwE3RyUc+sVnqFuJDw/sRlEIXtbb02xFUa+VvQekVb0
	fyH5gU7VZi2rfr5kPuqx3WcFki5BabKccGcJ831/lqAPgqX81mq2RlBLkR7/MB1FuH
X-Received: by 2002:a05:6402:3202:b0:6a1:b515:d2b9 with SMTP id 4fb4d7f45d1cf-6a582ba2f09mr22312579a12.14.1787578532100;
        Mon, 24 Aug 2026 06:35:32 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d7399sm12707547a12.26.2026.08.24.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:35:30 -0700 (PDT)
Message-ID: <73b681a103cecd66fe122cc225b08d529c2ed56d.camel@linaro.org>
Subject: Re: [PATCH 1/2] kallsyms: add symbol size for kallsyms symbols that
 can change size
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,  Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas	 <jyescas@google.com>, Guenter Roeck <linux@roeck-us.net>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Date: Mon, 24 Aug 2026 14:36:16 +0100
In-Reply-To: <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com>
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
	 <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
	 <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgR2VlcnQsCgpPbiBNb24sIDIwMjYtMDgtMjQgYXQgMTQ6MjYgKzAyMDAsIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToKPiBIaSBBbmRyw6ksCj4gCj4gT24gVHVlLCAyOCBKdWwgMjAyNiBhdCAx
NDo1MiwgQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4gd3JvdGU6Cj4g
PiBBZGQgc3ltYm9sIHNpemUgZm9yIGthbGxzeW1zIHN5bWJvbHMgdGhhdCBjYW4gY2hhbmdlIHNp
emUgc28gdGhhdCBzaXplcwo+ID4gY2FuIGJlIGRldGVybWluZWQgZWFzaWx5IHdpdGhvdXQgaGF2
aW5nIHRvIG1hbnVhbGx5IGNhbGN1bGF0ZSB0aGVtCj4gPiB3aGVuIGluc3BlY3RpbmcgdGhlIG9i
amVjdCBmaWxlcyAoLnRtcF92bWxpbnV4Py5rYWxsc3ltcy5vIG9yCj4gPiAudG1wX3ZtbGludXg/
KS4gV2l0aG91dCwgdGhlIGFzc2VtYmxlciByZWNvcmRzIHRoZSBzeW1ib2wgc2l6ZSBhcyAwLgo+
ID4gCj4gPiBUaGlzIGlzIHByaW1hcmlseSB1c2VmdWwgYXMgYSBkZWJ1Z2dpbmcgYWlkIGluIGNh
c2Ugb2YgbGlua2VyIGVycm9ycyBhcwo+ID4gcGFydCBvZiBsaW5rLXZtbGludXguc2gsIGFuZCBi
ZWNhdXNlIHN5bWJvbCBzaXplIGRvZXNuJ3QgaGF2ZSB0byBhbGlnbgo+ID4gd2l0aCB0aGUgb2Zm
c2V0IHRvIHRoZSBuZXh0IHN5bWJvbCBkdWUgdG8gcGFkZGluZy9hbGlnbm1lbnQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+
Cj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IGQ2YmYxMWE3
ZThhODYxMzUgKCJrYWxsc3ltczoKPiBhZGQgc3ltYm9sIHNpemUgZm9yIGthbGxzeW1zIHN5bWJv
bHMgdGhhdCBjYW4gY2hhbmdlIHNpemUiKSB1cHN0cmVhbS4KPiAKPiBGVFIsIHRoaXMgY29tbWl0
IGhhcyBhIGh1Z2UgaW1wYWN0IG9uIGtlcm5lbCBzaXplLCBhY2NvcmRpbmcgdG8KPiBibG9hdC1v
LW1ldGVyOgo+IAo+IMKgwqDCoCAkIGJsb2F0LW8tbWV0ZXIgdm1saW51eC57b2xkLH0KPiDCoMKg
wqAgYWRkL3JlbW92ZTogNC8wIGdyb3cvc2hyaW5rOiAwLzAgdXAvZG93bjogNDQwMjY0LzAgKDQ0
MDI2NCkKPiDCoMKgwqAgRnVuY3Rpb27CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2xkwqDCoMKgwqAgbmV3wqDC
oCBkZWx0YQo+IMKgwqDCoCBrYWxsc3ltc19uYW1lc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLcKgIDMyNDU0MyArMzI0NTQz
Cj4gwqDCoMKgIGthbGxzeW1zX29mZnNldHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLcKgIDExNDQyNCArMTE0NDI0Cj4gwqDCoMKg
IGthbGxzeW1zX3Rva2VuX3RhYmxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtwqDCoMKgwqAgODQ5wqDCoMKgICs4NDkKPiDCoMKgwqAga2FsbHN5
bXNfbWFya2Vyc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtwqDCoMKgwqAgNDQ4wqDCoMKgICs0NDgKPiDCoMKgwqAgVG90YWw6IEJl
Zm9yZT01MDg1NDk2LCBBZnRlcj01NTI1NzYwLCBjaGcgKzguNjYlCgpJIHN1cHBvc2UgdGhlIHJl
YXNvbiBpcyB0aGF0IGJlZm9yZSB0aGUgcGF0Y2ggZWFjaCBvZiB0aGUgYWJvdmUgNApzeW1ib2xz
JyBzaXplIHdhcyByZWNvcmRlZCBhcyAwIGluIHRoZSBFTEYgZmlsZSBieSB0aGUgYXNzZW1ibGVy
LgoKV2l0aCB0aGlzIHBhdGNoLCB0aGUgYXNzZW1ibGVyIHBsYWNlcyB0aGUgYWN0dWFsIHNpemUg
Zm9yIGVhY2gKc3ltYm9sLiBIZW5jZSB0aGV5IGFwcGVhciB0byBoYXZlIGdyb3duLCBidXQgaW4g
cmVhbGl0eSB0aGV5CmhhdmVuJ3QuCgpMb29raW5nIGF0IHRoZSBkZWx0YSBiZXR3ZWVuIGVhY2gg
b2YgdGhlIHN5bWJvbCdzIHN0YXJ0IGFkZHJlc3Mgd2l0aAphbmQgd2l0aG91dCB0aGUgcGF0Y2gg
c2hvdWxkIGNvbmZpcm0gdGhhdCwgdG9vLgoKQ2hlZXJzLApBbmRyZScK

