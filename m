Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744785;
	b=YTAJTKALy5x0hmQnRGa62qfupugVlnjetGjTWgdC6cz/WHy8YA+RNh/CVXWmFc3cHB04
	 tmma9J/5Q8TQcjibcO0koa9tms7REmjUI7boGDuC+gNnIkPXHnIUUsXJqEH1LNcl82g6Y
	 ZYPqhVfYO3F9gV39Xxrj9eYYKkIxmGdkIWPz8mPI+lo3M6CZuPdLeCHk/6hv1U4XUEBKm
	 5oEOhMUohlA7Yi6PzuUdymaNrb95y/D6fVuJe/qi3yvz4YJB/J8BFVoiRfcXODwQvOt/Q
	 50zQDh6BV3/vz4XRMP1i1NcaabgZswQrbQQg4Xm00Ge3FBP14F/OIyvJNs23P95ojWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KvH0hopfpv+dCdNRhn5bg21YimqLr87Kiz9kswyfh3c=;
	b=Sv5jW3qsCAUcl4ioGVQGPbaWUSBclLa995B+w2UzFxPozOBM+kqMkomU7fkRC4nMcks+
	 JicvCPSiuOm25Fej2dRQjxbijqbceddzl8VFJ2Fimj+OeoEyi4eJgUNKgg7umj8VuqvcM
	 PPItbIzZzHCR6EG62Xbyr7YLyXCx9IX49/PM2CkthgCGmNZUK8W76WkwO95+Dy6DTvWRs
	 izvhX1ooqi2C1xVRrF8iJMRRvLPvg6ses8WRzIHKS3mJKnIhCgILd0XDZzr579yWCbEKm
	 vkh13U0CFev7n2bRMeWNrO/sUNHSoKMBdVBxqBEXSBqHHITS4ueAi43IzzvrJSWygkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIcLA6Y5;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCDA606A31E
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 01:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FCDA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIcLA6Y5
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so3418953b3a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 17:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795744784; x=1796349584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvH0hopfpv+dCdNRhn5bg21YimqLr87Kiz9kswyfh3c=;
        b=rIcLA6Y5C8JEI2kSPAjOE5IL14hAZfbNi7ckBZnp5flUvv9pDH0u48eal8TTFngLf+
         q0vd0EZBh8Hod+Ugu/CJZRuwfSN7XkFZ9Yv9g8wsDPr1Y+1Y6tosU3ccxfXHoPVQ2oVu
         Ch5s16eo5Vhcgq6KqzyDXkDWglRGaJMuuzSGLjK3ARHCD1pA0E66EodtM50zESI2QHxR
         Sq0Z6P+XBdPjrWo5yHGAGyU1zkHsNJe6v+hrHwh9lRhAc+0vOVFHr4Q9xDcDYsZR3Sci
         Zmn0SasPRZGtmNosGbNLQWPHvQ8sYBjUH6KH25Mh+Ew95QI/bYOyb73YUBHUyflIWtcX
         cVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744784; x=1796349584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvH0hopfpv+dCdNRhn5bg21YimqLr87Kiz9kswyfh3c=;
        b=yYHPLxIwr8qR29pQA2etX82jWrEotTC5OyncZhz5basO9j27PMxCV71Nw8fi2l6T+n
         RmIusAc+JsmMMAZPZXXTx+rAdof8ajd11YL1c3KDAdC5RImDMam9siEZybm8Ds20Fafs
         M/EW1+IS0gkVqgcMCpmRl6Narf+AeRqgZHrQIRj8KYN77ELw3U36x5fymNlotmzTW7PK
         f5aItV+BoxrQAWXrpAhbIMAVGYeTqmfmnW5oT6aUYHKDP57gzqF/Inbvveth0XdC32f1
         65U6eB5Sdpwtqlweb/7gWi4FoDHTo7iOiLNMyH5fZ/PXFccf6TMwN6iQy4Cl88MaDoiM
         5q8g==
X-Forwarded-Encrypted: i=1; AL+hErGyPX/zkZ3HqWpidQk+9LOqf/mwTYUxlIIqTvSZjQHl8Fsvv5AiMh+LFL8H5/gyC9J7SgArojY9h5dpzUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kAuz8U4aKT0Sx61q11ZZhAxHrLHZK4S8jJ19wC+O8VB6onwWh
	jEs5x0gqItNX3HeXsJ5oH0x218aT5Bgt8f7Hh/Xhj8yBQ9o1LwRYoF7Q
X-Gm-Gg: AZFdTZc1jwC+9hih1SSvLveATFPYMOYpldd3PrW/iCbTflfRCjvwbNJ3uUyCzzM7Tj1
	3vH9QoVtk7UYDRQCSO/hWm6vJGiEqoYDHtFBnUH/rOytiwp2I0Dlwbn15PeI3WOAcI/isKwOPW6
	OxVAreTGpJxpWFAFUkGJ3qqZgnhHVvlr0hxfUprSUaCzvanVTA1ypU8tVMkx7a+XaLw2BTQLuxu
	IoDz1kKV6CniSoqPIRBUxg0DoQ+cLP1g5TDUXFv9AX8jvGHEs4BK++BP6+x1Gwkk4YWTkvJrqYS
	NtR1MWR4rGo+8XyV1G0+JbyJVIQdobiFmcWp1q4Zrs9IzBI/bcagiiOXae9vbXjfkWiasxGu8BN
	it6wzt7fJSn8KzxF+6j4L7370dyf5TgUw+irEQDJtLsQSyfnM4vGCm0N62Hq3rT4yuP1MrBRhsK
	TbwiqynGx2kK9JIY14FePUcaItXodDhOK9fcefgr6TT3oEmyh9CfEfyiN4BEPps58qL0aQMMzpS
	57jmY1TzTWdQE+OA9oTreNB62oQ2RaCC4A4Ccjhdiy0Jm8B7tLVdBgC7ATcgor4qvS7gaxzUgD9
	w37T17CNlCj7Hf0tmSjYrhnVlvYf/5p41W/8k41sRo3aF9WTyzVeSUyB1+NDuKcNEVvw793TMPv
	Ta9t5ON3ICXKHoCcrTsMLlYKpbuNMkPE=
X-Received: by 2002:a17:90b:2585:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3b41c9cd182mr20276785a91.23.1795744784296;
        Thu, 26 Nov 2026 17:59:44 -0800 (PST)
Received: from [192.168.29.169] ([49.43.113.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm35008632a91.0.2026.11.26.17.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 17:59:43 -0800 (PST)
Message-ID: <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>
Date: Fri, 27 Nov 2026 01:59:38 +0000
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
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Julian Braha <julianbraha@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
Content-Language: en-US
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
In-Reply-To: <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julian,

Thanks for the review!

On 11/25/26 23:30, Julian Braha wrote:
> > Switch to strtoull(..., 0) and consume trailing whitespace so
> > whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
> > explicitly so C11 and C23 builds behave identically.
>
> C23 builds aren't supported yet.
>
> > Emit a warning whenever KCONFIG_SEED deviates from a canonical unsigned
> > 32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, retain
>
> Yes, it would be good to improve the input validation for KCONFIG_SEED,
> especially to reject negative values.
>
> In a v2, could you make this part more explicit (add it to your bullet
> list of changes above?)

Sure, I will add negative values to the bullet list in v2.

One quick clarification on negative values before I send v2:
Documentation/kbuild/kconfig.rst currently only states "You can set this
to the integer value used to seed the RNG" and does not explicitly
forbid negative integers. When KCONFIG_WERROR is unset, is emitting the
malformed-format warning while preserving modulo 2^32 truncation (and
exiting 1 under KCONFIG_WERROR) acceptable for backward compatibility,
or would you prefer negative values to fall back to the clock seed even
without KCONFIG_WERROR (along with updating kconfig.rst)?

> > Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconfig")
>
> Improvements in input validation are good, but 'Fixes' is for bugs.

Agreed that input validation improvements shouldn't carry a Fixes tag.
However, on 32-bit hosts signed strtol() clamps seeds in
[0x80000000, 0xFFFFFFFF] to LONG_MAX (0x7FFFFFFF), so half of the seeds
printed by randconfig itself cannot be replayed on 32-bit hosts.

should i split v2 into a 2-patch series?
- Patch 1 (with Fixes:): switch strtol() to strtoull() to fix 32-bit
  replay of [0x80000000, 0xFFFFFFFF] seeds.
- Patch 2 (without Fixes:): add malformed input warnings (negative values,
  whitespace, >UINT_MAX, garbage), KCONFIG_WERROR handling, trimmed
  regression tests, and any Documentation/kbuild/kconfig.rst update.

> In a v2, you can remove the changes for binary 0b/0B handling.

Makes sense, I will drop the 0b/0B handling in conf.c along with the
corresponding test cases and C23 mentions in v2.

> > +				seed = (unsigned int)val;
>
> This cast is unnecessary, you can just do 'seed = val;'

Will remove in v2.

> This is *a lot* of test code for input validation of just 1 var. Could
> this be simplified at all?
>
> Is every test here absolutely necessary?

Definitely not, I will cut it by half or more in v2.

Thanks,
Priyanshu
