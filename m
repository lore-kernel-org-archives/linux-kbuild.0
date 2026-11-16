Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858561;
	b=rQe58E4/kmnCfLpBXbxu/3fhoYdf1V7KppdyG+8VnonrJtUP/6vSVNKm0481XY3Wp2RA
	 ya4EQzsFCRjGkK1Q1TisSv9uct2HZ5snaQ/JSpFgwq8z/M09XHrGzYYEoiChyWtt2hzgh
	 O0pqYdw7EiaGUQr2T3ZqLHjudSY8VEU1bC8FjwAqAOm+bdUSUYQfLB84z9IS2VnqTsmtS
	 LFStXUUh51aOCO5dpNg1p4KCJvIFHcVR4bUGav+5y+tsGI5UrPWrwpV4BeE1W0XeJ5/tS
	 jF4sAlX4J5xURr1DsqBHYjR42px/c2K3jriw7QGrRtZM7El6Im2drcLmQo/RHCXaZtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
	b=omsA7hv7phbyuNvK4OqH9B+q//ksijmya/vKIMaFPnu8fQw8alc8tdhSWHR5KEhtjeui
	 ERE5R4cjoxBSwOZxyMdfzYSpHgY6+pq4G3aZCfqTOB8bjkvVzpZUlsMa30LH929vnSffg
	 EpSbFkGj3MguvzaR9oBcQEIyUIlGAUaU/0xW1lj0k2GPtgqLUjF1PHRpGbD7P93GzijdJ
	 f/KSnqfN4cH0OEx5cdtTjVbpJY7lD/JKsivYmu/yEn32QyVRuuKYxQy8uQ0kziRDh21cz
	 WLz+5y8CG/OfHuVVHhLrXxWSBtlXBsr3f6p0UnBoYX6HXjVvt2oVMiY0+3m5S3QVZiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UM8cvG7c;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB3606A31C
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 19:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UM8cvG7c
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d427836e9so514561566b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 11:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794858559; x=1795463359; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
        b=UM8cvG7ch/70OY+4il808LHaE1IJDQptNE7MFDLgX88dsFwy+V1iipPd4valooHPUy
         yqRCnlUEt3uYIhvdx+ALqLKae87vOP91KB9ORu6MphVJpUMGOPM7dWVv7ENC9S2Dh4tq
         K1h/UALhxlhOUz+L/QP1FUJ1ORLjmRWz6Wrc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858559; x=1795463359;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
        b=BN35W8tZffhlBjnNkvfO7nWGtba7w+d1+v13bCwww9id8lUl2qegsHJhdpBqKXK7Gl
         O3tQDFuNW/19DvLgGQmDEOb2Cb7phFAH8QjMdIwWM8INcxJBiMSBNqpN9KZ/ZEvrSMo9
         rP3EZT7gZ6SP7mzLcXP3bROlbN9hTDnDoPcoQkDijj5+ZYIbGHgYOEZZoCEDfKuRHIet
         LL64OEH7x/IdVtTVWiZ5U/KVWJWRpYPav2Jo2oi9nCjRmMGOPZyIUIRJXQw+zwMoX/zQ
         NYgsC1yd9K0i3Xwn2l4OD0rOpnnLChHKm77g8hVmre3+HRA/GkBaHku3d6ArvTtZ583B
         90+g==
X-Forwarded-Encrypted: i=1; AL+hErFVN3pxdCcbTATbt5V/lUvjcyuyoaMPg+9e9igLAind5TlNFT0AXz2PZ5eu2y8QD2FzI5GFmPJD+RGczHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zNBPMplEaw535aP3weJwxrt1d3UVEf1iVTIRdvoUggRYsktkM
	d9cc4fLiClQ1rNliYM9hW7uvoCFxuUA5mCz7QUmNMdExULPgG9ewWWwPREc5iv4LEGdc/ov6slp
	prfAp4+RElg==
X-Gm-Gg: AYBFou1j278N/9J+AIJ0S+SNaLfjeWIu5RvjPE60K7RErCXRd+rGo3GY6WKavCf1/SK
	CefxGm5WigSQjW71W3kIAJEvaXAfRVdF9NKUe1mmoXT8eZ/EwK3QdiAAnTZv0/LMf4N2YDDyPPg
	UfDszQE/GmoRmaaZP3Fd6gr9BcaRFS+nDHCzC10aeHyinTSxoPWRt9dS1ersb1NU7axhMp6xaWL
	ASg3609ak59RoDa3Z0/Ijm8B2PEFqviruTxLWehJnrVHNJsVmNfSjErN1a9USnwBXQY4PjDHwOT
	lxWfP2UsKt9/RbaE62M7PdSwCabHqBSEMnpYhhVTNlZi0EZFIr9C5wdBZtl80lJF64Nq6nARGbV
	liIAgSq/0cycjX9VX4a7c6913Ub8d2D24IdT3Yw3NLCpGIq+02GYVQm2/GA64cnh0lwtBrzRhrt
	jncJ5OPluJ28Vib+j4YcUFfs/mNEZn14gAsaRfaXQK9Q21Z/EODkUUQaUg4LSYQGqkCKIiuWUkR
	8FjKaNig/dcmamQq6mG7EEQKPdMzH3Aov1BcFhcl2DUnGFx/4owX9p9y2eVpHse3DNZqCSeEVun
	sWPUZPTf5L8TfmpVdSn6A0HBI//0g0kNFzXX83KuIsraGWusXm2LRD/V8h10iNb6ElvdpsbzsZx
	uCGY=
X-Received: by 2002:a17:906:4785:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c5095dbb6efmr845384766b.0.1794858559431;
        Mon, 16 Nov 2026 11:49:19 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b51bcbsm450588166b.44.2026.11.16.11.49.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 11:49:19 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso26269875e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 11:49:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHiV7gItXLsEG8bZIkRlPjDdc2yNmLZZbUUXtTAG4DcJuD6T2zRwtdBPB1klkPNgi2cxkYDUETtsFC8v5I=@vger.kernel.org
X-Received: by 2002:a17:907:60cb:b0:c4c:d6a3:f4bb with SMTP id
 a640c23a62f3a-c509634503cmr1008394466b.10.1794858120895; Mon, 16 Nov 2026
 11:42:00 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164719.1831477-1-sashal@kernel.org> <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
 <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 11:41:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg-5cWvYgmnE2WH4yys8tB5AwwRQU6kW0r5VoRYBLT7TA@mail.gmail.com>
X-Gm-Features: AclHuK-GW-sq_aqp10QbcNSLO7AtIlmoHSb6NWDtJ770GEzenoCICUrGbvxqol4
Message-ID: <CAHk-=wg-5cWvYgmnE2WH4yys8tB5AwwRQU6kW0r5VoRYBLT7TA@mail.gmail.com>
Subject: Re: [GIT PULL] Kernel API specification framework for v7.4
To: Sasha Levin <levinsasha928@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 11:36, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And I see *no* upside to any /sys/kernel/debug/kapi interface

And yes, the documentation calls this part "human-readable". Nobody
cares. No sane human ever reads and compares specs. We shouldn't
expect humans to do that, and we should not design *any* of this
around "humans will check it". Completely pointless.

I think the specs should be purely for automated checking, and I
suspect any initial spec should probably even be *generated* by tools.
Because the kernel API is not something that has ever been designed
"by spec".

The kernel API has grown over time, and pretending anything else would
make the whole project be just a fever dream. We are *NEVER* going to
change the API _to_ some spec. The spec needs to match reality, we're
not changing reality to match a spec.

Then, once such a "spec matches reality" has been generated, that spec
can then be used to check changes. But neither of those phases are
ever going to involve any humans, because competent humans have better
things to do.

           Linus
