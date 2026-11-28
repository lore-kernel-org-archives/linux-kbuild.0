Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795862776;
	b=0kGyp6PGNtY8M2y0sxCpniR/hLKppDiXbRc+g5/7sPInASnbXWj1PRMlL+z8h3mQeFq5
	 zS0DQwfwxuAFQK98RHvudC+KFYOp/8ocx2E2ima2R8FHHR6M3TRTxkXePQWjjUTdphRQP
	 H0ivpzJAIfSEl7vbj06p9CZSg7o9KvW/5kzAr+r6cKpvsg74HhC9+QXHKOI6EBADbvRB9
	 m6HnGJQItcAXx8M2kpWtOcV1hvPUcVQ8vAbIpfy18n4EC/x6Z28dqH8+TB4y1Qa60xx8Z
	 pjnzA6IjIabpk+01Fed9vpN/3uTtv8OfAx0ku8uQX+5ipGHMz917BiEcdOCLZyhd8Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=58a/+1zqValJNPe+f+fBjEPUXE4JHOS5ilKixH5EXsM=;
	b=i0G9ddji+TJgHqcK8GcCVjw/DLOXLjyzCqCnTG5K3opvd+CHu6lil24b5+aVJYEIlb++
	 h7PCjOpKZhSKW4f1hHZIbkW7fK28ONzcRyfb57zOCRI1Wwb85mtLx6/a/5L5n5h48VRE/
	 wByzxMJ0uufD4g/MMLmoTOwn5rmUiLU6MIfsISeBoCmmFMpvedSLsGkKQXtSy1HiwSZmY
	 64F+Q4Q7fkydmDOu1U84S94ZtXz7I6DNaxRRv8pfSDtTVDMgg2xmGfzkTJVskEaUcVWso
	 Z6eP2FdSyzFa/1SB5/zJm6R5PmsZrgTW72bs5r4BeLsAd8NOK8jll6fzw4DvqQTdrnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qEjED/nH";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B407606A31F
	for <linux-kbuild@vger.kernel.org>; Sat, 28 Nov 2026 10:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B407606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEjED/nH
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so58849945e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Nov 2026 02:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795862774; x=1796467574; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=58a/+1zqValJNPe+f+fBjEPUXE4JHOS5ilKixH5EXsM=;
        b=qEjED/nHy7RJsOmIY0mw1cYEX8pVGsl9KiW9f3/puk3+BXAvRcvCUKHinRZrOYxMjP
         lJpR+A2rNIyWE/aIX6vnXXMwbIx/X89Uzo5SLso9vXn0HU7Rj7s80yqnCxm3kbdS5qVo
         dFOLbs9I39qgdnDAEFj5vEBCtcP93d4zvIcSDWc7ymCo3gxvchxFlxSIhUM4ZqPKJbMR
         1bwDK5C2+4IeVMTWvI2r87z+8szgbZjuqXQH+xCZihSvPQpFbmQ+UmQ+ZpyKIl8bKs3N
         pdMxISq+cWcvXHlHmF0rSad/99rYVMd1nMbe0hcuYQHQjYUT5YK5lbeQNDVpljENcgct
         As9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795862774; x=1796467574;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58a/+1zqValJNPe+f+fBjEPUXE4JHOS5ilKixH5EXsM=;
        b=AH74zMCgI6Oltyy0O/fSx1X/HHwXqt3niBr7OB7jtnsqUBw8jkHrkcGa5LbLpVGVRJ
         wttesNySG/FTaoJJtdT8Sx1B6bg+pn3NuMzDkaiCYqy3VeJTs6E+ObYuS0hQk3Q9k3Km
         4m+K1IkLx8V1yDKfeXLGD1mOh/L5aoKUNN5fcmisdfeETnBgGJ1xUx1egdDlrEG3Vq+6
         Vui+/JNOSGPG5KBGOr3NBO1t3vVs2gwba//cU66SxVTkkXyTy9GSlA7QcMobv3gxGPw4
         We0D7K0M1S0RHGueRBD7htPRw6kHB0Xa2alp04Ovh7yLryNoyOwQ4I9NtRGTKoT2BjgB
         y46Q==
X-Forwarded-Encrypted: i=1; AL+hErHTvbfSPZXAOAB6n4BiM3AlfvUYW9fA9oqhdjabcxdokhrh84A2cWM3Tp625gfzKJ/BIEbpdij+JpDD36g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qri7QApUhWN+B1D2fKX3rFVCObfd8b6TrwAssKcZnEDz27xAG
	9hvqEo8mOGR5GwOZjcjkOO7yLpa+c9fv4sG5Q8JoQS9RKu96OQj1toYY
X-Gm-Gg: AZFdTZd+q6ftvB4ehLd4rKQrYGH2Q5dbjVWtwlRLvpgTbS0++EjdP+TDOKgfPI7k3OK
	OGywUHpf89MmPuUrgBWu5FSP8OZfhRFHt2X/swwnyPe3mle67dLuuK8KQEq/2kil5mc6JGSGD3+
	azaZ8+XEE96NKxEl1veMJo9UA5MQPs30N7GtOe0jEBZLefdKV6WYjV3HquixVKCFFT2Uh+j/y8l
	yPzwOi5jK9NHr02hKtpXJsw/WAVpgVDthIBT0EFbiRRM3Btc0/W7+8ItLshNYwut2E7yjeeHX3S
	/xgjU2QDXlFfoBPJryXGsE2KSJT/HeonmCNRPyuIOXgrXwpyRZ6AP43fNw8bbRw6DnLUvtY12co
	9Z177ch0Ei9JBli4semYOS86nlU5Tgszwy/KLafFloEKYrg0T/QAAodImQABzsx/3AJ24Zaq36K
	UujaaH3NhEeoW/1bZcGqENuuQeBxV390P33G5KMrWA07feshNp9lq1SsC3kiJrzrtdsNidnsP6V
	xFl9N0+4bshcdOTRDyuSZ9qE9Y8eFGzqg1OiwHJwWXz7XgkPRrGewYPXyjGhRcpfd51lv5AzIMi
	a4cEDHWFUe/OxZGbpUst2aXunkDvfrJNvnlYVG59ZUNECibqKA7mrzwOOxGNs5yQJlJIPhuY1mf
	1ptPutIQpX+bBnUtfzA==
X-Received: by 2002:a05:600c:19d0:b0:4bb:ac6c:de67 with SMTP id 5b1f17b1804b1-4bbac6ce1aemr163926935e9.14.1795862774223;
        Sat, 28 Nov 2026 02:46:14 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm828517335e9.14.2026.11.28.02.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 02:46:13 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <fc17e915-d4d1-4847-a915-03a8d8daf55e@gmail.com>
Date: Sat, 28 Nov 2026 10:46:11 +0000
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
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
 <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZSpO0HVhptVQBf1zPLRSpuW9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZSpO0HVhptVQBf1zPLRSpuW9
Content-Type: multipart/mixed; boundary="------------rUOHdxu0LED0EUWmKulj2rVt";
 protected-headers="v1"; hp="clear"
Message-ID: <fc17e915-d4d1-4847-a915-03a8d8daf55e@gmail.com>
Date: Sat, 28 Nov 2026 10:46:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <4335df02-3864-4635-8429-a2946bd76a00@gmail.com>
 <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <07f2e58e-d576-49c3-a3ff-91e499d412e5@gmail.com>

--------------rUOHdxu0LED0EUWmKulj2rVt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Priyanshu,

On 11/27/26 01:59, Priyanshu Singh wrote:
> Hi Julian,
>=20
> Thanks for the review!
>=20
> On 11/25/26 23:30, Julian Braha wrote:
>>> Switch to strtoull(..., 0) and consume trailing whitespace so
>>> whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
>>> explicitly so C11 and C23 builds behave identically.
>> C23 builds aren't supported yet.
>>
>>> Emit a warning whenever KCONFIG_SEED deviates from a canonical unsign=
ed
>>> 32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, reta=
in
>> Yes, it would be good to improve the input validation for KCONFIG_SEED=
,
>> especially to reject negative values.
>>
>> In a v2, could you make this part more explicit (add it to your bullet=

>> list of changes above?)
> Sure, I will add negative values to the bullet list in v2.
>=20
> One quick clarification on negative values before I send v2:
> Documentation/kbuild/kconfig.rst currently only states "You can set thi=
s
> to the integer value used to seed the RNG" and does not explicitly
> forbid negative integers. When KCONFIG_WERROR is unset, is emitting the=

> malformed-format warning while preserving modulo 2^32 truncation (and
> exiting 1 under KCONFIG_WERROR) acceptable for backward compatibility,
> or would you prefer negative values to fall back to the clock seed even=

> without KCONFIG_WERROR (along with updating kconfig.rst)?

Negative values should probably use the clock seed fallback, but there's
no need to update kconfig.rst for this.

I really doubt that users might read "You can set this to the integer
value used to seed the RNG" and think that includes negative integers.

>=20
>>> Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconf=
ig")
>> Improvements in input validation are good, but 'Fixes' is for bugs.
> Agreed that input validation improvements shouldn't carry a Fixes tag.
> However, on 32-bit hosts signed strtol() clamps seeds in
> [0x80000000, 0xFFFFFFFF] to LONG_MAX (0x7FFFFFFF), so half of the seeds=

> printed by randconfig itself cannot be replayed on 32-bit hosts.
>=20
> should i split v2 into a 2-patch series?
> - Patch 1 (with Fixes:): switch strtol() to strtoull() to fix 32-bit
>   replay of [0x80000000, 0xFFFFFFFF] seeds.
> - Patch 2 (without Fixes:): add malformed input warnings (negative valu=
es,
>   whitespace, >UINT_MAX, garbage), KCONFIG_WERROR handling, trimmed
>   regression tests, and any Documentation/kbuild/kconfig.rst update.

We don't really care about 32-bit hosts, but o/w yes: this approach is
fine, I think.

>=20
>> In a v2, you can remove the changes for binary 0b/0B handling.
> Makes sense, I will drop the 0b/0B handling in conf.c along with the
> corresponding test cases and C23 mentions in v2.
>=20
>>> +				seed =3D (unsigned int)val;
>> This cast is unnecessary, you can just do 'seed =3D val;'
> Will remove in v2.
>=20
>> This is *a lot* of test code for input validation of just 1 var. Could=

>> this be simplified at all?
>>
>> Is every test here absolutely necessary?
> Definitely not, I will cut it by half or more in v2.

Thanks!

- Julian Braha

--------------rUOHdxu0LED0EUWmKulj2rVt--

--------------ZSpO0HVhptVQBf1zPLRSpuW9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCawqw8wUDAAAAAAAKCRDElYPCBXNxIB/J
AP9gyChxWqxUpAJDxj+NIVLS+FlsedP1lJV9ATgQnxuT6AEAksTgGy2un17kk8noShT2iOEvE5R8
9BClDNbDU6grRgI=
=/mKU
-----END PGP SIGNATURE-----

--------------ZSpO0HVhptVQBf1zPLRSpuW9--
