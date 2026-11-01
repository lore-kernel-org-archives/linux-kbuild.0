Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576683;
	b=SqzDeXjOKp70bsOUxmhCU8j6LeYPMVP6PYppC2iWoyO8jofuJ/ufCocJ7lzaIbiFXoZS
	 1PVseO8vwM2F75Gwc5Xu1pvwqKJhH2JoSMcpSRVseixJYctHh+BMFj2Kv+lksFgaRYrur
	 b/V0wcLH+r6y55QTtYXnNGIFvGlFPK8d64H/Qg/OTtpI8Gg0frGWubBsPupDIu4z6Yyq4
	 IPKuIzqlFb6h2fJ5/jYkIevb9qceXfrd67gXkhf/gxJ4j7CjDnn9ter/hN5Mn8nb7DsHX
	 kC0UM5Cov2Fw8Y8+tVlbhtuJDG1UJ2bcfILQ0l1Zd9OJfxsoAHA5ACv1LLTJcuh/Q/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cmCKtuKWGdM8HNfbRfJhwyASQenO/GwuxXairf/0/u0=;
	b=OoHRUJeoggZBWa7pDi/qh2mFPmU6tq+rG1VyNNMQacekUJl5HAo0Opc3QX9a5eF/XoAw
	 sa857w1zsfCp/dxvrBnzAxn9RgtTjdvRb3c+N64kqKthCnYiBjd/NNwJMX5lUbm6t5t8L
	 tFex1IgMrvgwN6qlEtJLa+yoIPDsplXqiebr/2U9aA2cxExwyKuDavZpvB7Kg3WW7gZ2k
	 p7o0mBjRS5g91B6t3JEDEFpo/CcdEl1wJYh34C9vB87VzQ7pKv/X3JERv2ubWFXdLMNK5
	 lQ8viu8grgzPj0lgJPl0Cn8BOEOQILReA4FEaKL5C58BcaTxqkXKPXB/rXRLWatWMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EInoisVf;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D011606A326
	for <linux-kbuild@vger.kernel.org>; Sun,  1 Nov 2026 23:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D011606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EInoisVf
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2306801f8f.3
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2026 15:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793576682; x=1794181482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmCKtuKWGdM8HNfbRfJhwyASQenO/GwuxXairf/0/u0=;
        b=EInoisVfS8QOSy4pIAtt5rCQ5V+jvEcqXQAGTVtQcnJDFoJhs87zb4rjsgSCJaR1VP
         1StuJCPt/GYzXCyAZlBH4EPaUAMnrJSR9UdprLHYTCyy9tP5qTumL9dCtv/zcrl1MXGz
         IauFjc7OQhgEH5bK/zDdQJnJljB6jRfCp1SGqBKovHGBvuUtu8/PFwJ0jeqIdvA/CxM4
         dq3kvtbwTKctdLaFUxwLDs/lAc8tucD2AoLsyP8p4fVQl2im4Q3Ux2wRTvEAPO0BS1pG
         uiNgrIVlxNGWE8x9DnPN9U95Uac+CLg6O39tY82UA8i6yBHhA9aFqEKSzDwdnzREW4cd
         sBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793576682; x=1794181482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cmCKtuKWGdM8HNfbRfJhwyASQenO/GwuxXairf/0/u0=;
        b=E3ABlA7FB5HnPmFevouhFWzOOiP9noXUUQ4Uvgro7mzgB6UzWLo2vkZ2UoJ3nBxdLx
         Rf9MKr7XQJRA5bJFJIUFLgm5WLkmXg4P5tvEEu30kJpVTpBjEZQ6olPYZg0np/4ExtVa
         Ss+7DDybed2weIbAcvmisnikXFsbjmcUIKBVmj0nFy2mA+004+PtLGbqo5Im+KiQ9YPN
         stjjbIy+KBdO0+DRhOgCWJfU4Q38eIIlzRN7yneFpijOw69uxy+tn0ovCxLyWJa6X46F
         /tWE/t77wOxdwBV5enfL1vLtUenWISVOzKOUQtPIswSFZ5aAj+Tlkk50LEwA2GcWuXLE
         kQsg==
X-Gm-Message-State: APuU4Z+dvptCn1TRHuyhGWzonj5DPyVkTjzoJDMulKFUQ7V7zMxZVzlQ
	n2NYXQIYCcwaVwzMyI7qLnMzNPMZQZxxmRdpLZoT0b7bjMcVa8b3g0b9
X-Gm-Gg: AYBFou0z1plgSYHEqFDc7A8yeEnvTIvz56lkHDgd08X7nsxAuZhTf7VvQfWFisZKCE0
	lO0NJKIQ5/+RW2pEvuiIVZjoQc9J+WpsKAtTrqNq3vQVeszDKqFJ19PPVvGX4tefvNUx5kNefCs
	P6YyfC9ngaVwDBL7IS4zI8M5n3susbJikq0kbgNnQ3PLh4hR44VJivjS+EJNTrClMuinnuraeyQ
	920DF7WierDfE5jCk5u7cxntePAreWGs9xcQxEzFNGzEKor3vN9B6oo7RyHqrwnT9tSodMb4jRc
	+DxCQaaLhp8+a4yDyrabwIxHMqK9jqTlVLLDl1a/S1emUUn0cAA20Z9+5bGFaBkUNZ7tOSuqJQh
	5VUo6e/6C8XvSgDJeW2rHAzgC9eG+BHegO8csIKgkYT3Ls4As5pGQf3xZkY/qG6vCHdUWxZAuXP
	kBO6ir2Wj6iS7tOTrO6Qi/2Wm8k7QCBozmPss0+zgCWL9neR3piCaVkg1bIc+pKpqO25419ikHN
	CJnJJTPQVERhMsfVLQi8RLZqLxg792zhYOK0AQEjZK6zgdKY3oHh2YtwLNIMcrJzv2siyWNZyY/
	aoaOohw3eqb4kHSyBbafer/7W8zFU0EcpSVTr/5QmGFGWZw3lp9XMCffeKIPXHR5vF7NaFtHjl5
	xMfG3ym8UjLaV52pbB98C
X-Received: by 2002:a05:6000:25ee:b0:48e:84b:e83e with SMTP id ffacd0b85a97d-48e6e2bce33mr17685080f8f.1.1793576681677;
        Sun, 01 Nov 2026 15:44:41 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm16553351f8f.57.2026.11.01.15.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:44:41 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9c21c5f5-355e-4520-b48e-acd355c7fc6d@gmail.com>
Date: Sun, 1 Nov 2026 23:44:39 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Speed up KConfig - fix hashtable confusion
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/1/26 20:08, Linus Torvalds wrote:
> So the Kconfig 'expr_lookup()' function is criminally slow and takes
> over 10% of the time of "make oldconfig".

My own pet peeve is the occasional slowdowns in menuconfig search...
> 
> The reason is that it's called just a lot, but it *really* doesn't
> help that the scripting versions of the hashtable functions has not
> understood the subtler issues of the hashing code that it took from
> the kernel side, and in the process got things very very wrong.
> 
> The "hash_32()" function is a perfectly fine hashing function - there
> are better ones around, but it's fast and "good enough". But when you
> use it, you need to understand that it puts the significant bits in
> the *high* bits of the result.
> 
> The kernel uses a model where you give it the number of bits you want,
> and it will pick out those high bits, which makes it all work right.
> 
> But the simplified hashtable code for the host code didn't use those
> high bits of the key. It just did
> 
>     (key) % HASH_SIZE(table)
> 
> to pick the hash table entry, and that's basically pessimal. When
> hashing an address that typically has the low bits clear, the low bits
> of "hash_32()" will *also* be clear. So the hash table ended up being
> mostly empty! So even though the hash table was sized appropriately,
> it wasn't being very efficient. And while making the hash table larger
> mostly hides the problem, it's the wrong solution, because the cache
> footprint gets worse.
> 
> Teach "hash_head()" to use the high bits of the key. Because the users
> don't pass in the number of bits they want, this is pretty hacky:
> 
>     #define HASH_KEY(key,size) \
>         (unsigned int)((unsigned int)(key)/(0x100000000ull/(size)))
> 
> but at least this improves on things.

It would be a bigger change but IMO the host-side implementation should
not differ much from the kernel's -- like the rest of the data
structures in scripts/include/. In other words I'd prefer to revert some
of the "simplifications" that caused this and adjust the callers
accordingly.

Nathan or Nicolas, do you feel differently? This is also used by some
other tooling outside Kconfig. If not then I'll send out my version.

> 
> I also stopped the expr_lookup() key generation from using XOR of two
> pointers, which I suspect just ended up clearing most of the shared
> bits. I doubt that makes a difference, but XOR of thigns that may have
> shared bits really isn't great.
> 
> The cost of 'expr_lookup()' drops by a about factor of four on my
> machine, and it's no longer the hottest function in all of 'make
> oldconfig'.
> 
> No, "make oldconfig" still isn't the fastest thing around, but at
> least this removes on particularly stupid reason for it being slower
> than it needs to be.
> 
> Somebody needs to double-check this. I don't love my HASH_KEY() macro,
> but it should work for power-of-2 sizes. And as far as I can tell, all
> the hash tables are powers of two.
> 
> Comments?

Thanks for diagnosing this, Linus

- Julian Braha

