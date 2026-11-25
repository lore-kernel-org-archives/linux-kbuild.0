Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650009;
	b=2l90XCrNKtStvdhnzLZ4ADdNphamsag/7LJcJ48MbOkVRyKciCGsCm9Vpbs0yITVWAE3
	 UxGmG/bGCL3PPhEv9CvEOQ3z8DgkwCXDbs2kdZCjWtB2aeAI0ni5hy3Peb6AVmsoDLBkz
	 B/DdCGu83UYtTbJA22peHKxeTsl888wpGq+PqbroA4Pf5OUHl4Sx50CRKDmB61UEtjAL7
	 zGNQ7KsM16HF6DoGNrFqP0McaCd51BznaBIVta6BvTRVFoqYxqsSadPxj4d0TUVfpM+7b
	 55R/kjcbfEfoK501uckbdW4lE9Z1XprOzJ5UUXoyPG5FWL7ysvo5XqiWNJV9GYp6J4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=kYQevDMgd4nV63TUt1qQ6dj7n6DE8YbUq5s0sfO2cZY=;
	b=e7Z+Evv0DhNjW9zinb5fKJ6NnCTO8/dCKV8LUsdO3jg7iZrnR9hvJ4Bq1EcWLsYxE6ws
	 dIAT66nq82Lxpn3bsTOKnmO/xOoG4xhmiEOq9gHegkUx0OJhbu3pJaZilRtgAaC693tzJ
	 D+QDic1edvtQIIowclkVustRAIJzzM7ASmSjV6HIvPPUeL3BcV9OkwCk6IWiVNgpxDYLy
	 fqwXZygHL1ZMVMevJKCMcRI1jxUoh+KTbIbw0k/aoTxNEq9MB6W5f9V1i+nbNOUrfZUNQ
	 7YmQrx3G8WMcgVaSCqzGBlrhLgjlG/DVwj58SRi7fZfKDHE8iGEAPEb8LUpNFOuMiBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2FzBzNZ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E234606A321
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2026 23:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E234606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2FzBzNZ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3779247f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2026 15:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795650007; x=1796254807; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kYQevDMgd4nV63TUt1qQ6dj7n6DE8YbUq5s0sfO2cZY=;
        b=v2FzBzNZYZD0Sw0ae+xQZHhUn/h9qCDu5Xp5CmZAXcbnhJlIDOVsAXStAkGP02sSQf
         47TRCel4gPcR76VFcIXaqdvD9onhUthkEyWT/ncQM+TWDOejSK1d8tzux5nuSSMsTU8C
         kWwzT3PNwz2YFQcs82VVsoUqpjOudeV2qdQpdqcEC6rpoolifxh+y/dmrtosjw9jZ5Qk
         wimddvXmQE5EZIoa34WR3Jlpzn8LbusV+II49OasSRrN50JZH3sIeLcbgJMRv50hUmkf
         kQmLBTu/pQWWi25et/nkGg9COIS2cxIiKp1xA0LGbDUZNLoRifhLCvPqFnXErmGfl2Gr
         U2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795650007; x=1796254807;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYQevDMgd4nV63TUt1qQ6dj7n6DE8YbUq5s0sfO2cZY=;
        b=RjyoBdFLYAfsvzQBpppPcNWM6ZTEQ+P2RuPypk8wRdTSH/cwBY3hXxOSgMtd4KhqEc
         R80BBYcVL2PEVd3WALWiDo04TTD9+mRl2guvrCI67GaerdKm9Boxjhdgmj0zlqrc2G3N
         xPqnyYNdSABg5nomN2P1NuTg9zSoXbY02SE8Lg6mX8VzjF/+Fi++bTGYuUZ1Xo3EpCxI
         cVrWIS/9PkF/Ss+Pq+oLTVficGSDjb7j+x3Vp3qFwMDhmk8QtLtBdLQCF6z52T9Kz1br
         ErqNmJTcs3WBTPtVsv4oYRTveDjoGMqYQv3SUNuEoAxC5cq+UIap1OQnIds2n5PsakRO
         XqvQ==
X-Forwarded-Encrypted: i=1; AL+hErEBHVaxuOTzb1JsdwVl2qslWX9J5ma26Nh3jwntgGimkaCJmFG09sB/+pSGKJ5xGbUdRGnVPz5LXnhh/Yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D3bMIJ4QzPD8/2AWP/KP1eBDGkIryaHUUpsjpAMTOimwpeKbb
	QLketZtCgV+gAxQxnQNr/rzqTPazxMcZYPmoBeMP7oH1EmGI8NxUw+B3
X-Gm-Gg: AZFdTZfJCyiQxLlUEfeYvmQY1PX/QfiQkCdGexNU4z3bamIBz86cTkcNlVXAifNHCzz
	b/sZ8VGPiOy/GReDNXhWkGehTkdPa2Gu80bz9geiWPtxIsTegH4IU+qIJ/wRacltgL/dSI+/F7i
	nT4r+bArucVTIJJb2bgV+FMDdm5jao8GM8lsOVW2Yf/GEHucbGkdY7lbtIUDy/H7aSI3O/LaFJi
	QHlGyMYiInLf19ntOzu4LA7PYmlUiROqu9IEj68eXrMprcTPAYr38jmMgh3FGtvgoqLrCz3oQbR
	9KHWZZyTrRQNMxgiGgBq24oj8qt4Ce1txm2yNheYQbyA/PHZrUbRqGaIHAFvuHGHdARoHNOWXh2
	7FTXlqMVuwYVHp2ULVoxtx57u+LEtbmjukhQvycl5orsXDkcDREjUQDa0dki65wuPFxMXP2kzPh
	2NhjedCWW66cNgch+W9++3eC71mkfUlpWtj6AZ2Pif2ByH5Q942dD/1TkihyyIyBWr83w5PmiGh
	XX29D1hw3mYoiqlRInFvlccy+VAMWOd/eXbIq7ZdUy1U6QCCDaw+arte0lQoPbEptlKXAUdm3IG
	nirNOb5dNxzq+Z8a7xxEwV44hTZATkdiBJGyRliXIm6D8QgqAcAr23p7SVYH86EfWx9+xwUuoEz
	G09oz6B0sj8VzShZX8Q==
X-Received: by 2002:a05:6000:4813:b0:490:2033:1477 with SMTP id ffacd0b85a97d-4abb917a9eemr34174451f8f.56.1795650006473;
        Wed, 25 Nov 2026 15:40:06 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm36478394f8f.10.2026.11.25.15.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 15:40:05 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <eebb7d7d-48f8-47d0-810e-b03e47929fcd@gmail.com>
Date: Wed, 25 Nov 2026 23:40:04 +0000
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
To: Nathan Chancellor <nathan@kernel.org>,
 Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c5HntaBRVjPdisNjAnoBfb0c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c5HntaBRVjPdisNjAnoBfb0c
Content-Type: multipart/mixed; boundary="------------N1B0s7j0n7AdZMYFuOHkCOmu";
 protected-headers="v1"; hp="clear"
Message-ID: <eebb7d7d-48f8-47d0-810e-b03e47929fcd@gmail.com>
Date: Wed, 25 Nov 2026 23:40:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Nathan Chancellor <nathan@kernel.org>,
 Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179564821041.3369856.2083626361406656618.b4-reply@b4>

--------------N1B0s7j0n7AdZMYFuOHkCOmu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/25/26 23:10, Nathan Chancellor wrote:
> On 2026-11-18 07:15 +0000, Priyanshu Singh wrote:
>> randconfig parses KCONFIG_SEED with signed strtol(), causing several
>> validation and cross-architecture bugs:
>>
>> - Artificial constraints and portability issues:
>>   32-bit seeds in [0x80000000, 0xFFFFFFFF] and values > UINT_MAX
>>   are capped to LONG_MAX (0x7FFFFFFF) on 32-bit hosts instead of
>>   matching 64-bit host behavior.
>> - Whitespace handling asymmetry: Trailing whitespace leaves
>>   *endp !=3D '\0', discarding the seed in favor of gettimeofday()
>>   while leading whitespace is accepted.
>> - Garbage handling: Invalid strings (e.g., "xyz", "42_foo") fall back
>>   to the clock seed and exit with status 0, ignoring KCONFIG_WERROR.
>>
>> Switch to strtoull(..., 0) and consume trailing whitespace so
>> whitespace-padded seeds are not discarded. Reject 0b/0B prefixes
>> explicitly so C11 and C23 builds behave identically.
>>
>> Emit a warning whenever KCONFIG_SEED deviates from a canonical unsigne=
d
>> 32-bit integer, and exit(1) if KCONFIG_WERROR is set. Otherwise, retai=
n
>> modulo 2^32 truncation for parseable 64-bit integers and fall back to
>> the clock seed on unparseable inputs or ERANGE overflow.
>>
>> Add regression tests in scripts/kconfig/tests/randconfig_seed/.
>>
>> Fixes: 0d8024c6ebad ("kconfig: allow specifying the seed for randconfi=
g")
>> Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
>> ---
>> Notes for reviewers:
>> - 0b/0B guard: Under glibc 2.38+ with -std=3Dgnu2x/-std=3Dc23, strtoul=
l()
>>   maps to __isoc23_strtoull() which accepts 0b/0B binary prefixes in
>>   base 0, whereas C11 stops at 'b'. Rejecting 0b/0B prior to strtoull(=
)
>>   keeps behavior identical across toolchains.
>> - Backward compatibility (KCONFIG_WERROR unset): Non-canonical but
>>   parseable 64-bit integers (whitespace, signs, -1, or > UINT_MAX
>>   timestamps like `date +%s%N`) emit a warning and truncate modulo 2^3=
2
>>   across both 32-bit and 64-bit hosts, while unparseable strings or
>>   > 64-bit ERANGE overflows fall back to gettimeofday().
>>
>> Input                   Pre-Patch (64-bit)    Pre-Patch (32-bit)    Po=
st-Patch (32 & 64-bit)
>> ----------------------  --------------------  --------------------  --=
----------------------------------
>> "42" / "0x2a"           0x2A (quiet)          0x2A (quiet)          0x=
2A (quiet)
>> "0x80000000"            0x80000000 (quiet)    0x7FFFFFFF (clamp)    0x=
80000000 (quiet)
>> " 42"                   0x2A (quiet)          0x2A (quiet)          0x=
2A + warn (WERROR -> exit 1)
>> "42 "                   Clock fallback        Clock fallback        0x=
2A + warn (WERROR -> exit 1)
>> "-1"                    0xFFFFFFFF (quiet)    0xFFFFFFFF (quiet)    0x=
FFFFFFFF + warn (WERROR -> exit 1)
>> "4294967296" (2^32)     0x0 (quiet)           0x7FFFFFFF (clamp)    0x=
0 + warn (WERROR -> exit 1)
>> "18446744073709551616"  0xFFFFFFFF (clamp)    0x7FFFFFFF (clamp)    Cl=
ock fallback + warn (WERROR -> 1)
>> "0b1010"                Clock (C11)/10 (C23)  Clock (C11)/10 (C23)  Cl=
ock fallback + warn (WERROR -> 1)
>> "xyz" / "42_foo"        Clock (ignores WERR)  Clock (ignores WERR)  Cl=
ock fallback + warn (WERROR -> 1)
>>
>> Tested via `make testconfig` (40 passed).
> I am pretty ambivalent about this patch. Most of what you bring up in
> the commit message is in "who cares" territory for me personally since
>=20
> - 32-bit builds are going to be pretty uncommon nowadays
>=20
> - Fixes is over 13 years old and it does not look like anyone has
>   noticed this in practice based on searching linux-kbuild
>=20
> - The documentation states this is just an integer value; if people are=

>   plugging in arbitrary values, that's on them
>=20
> - Most people are just going to be using a previously generated
>   KCONFIG_SEED; can these issues happen with the default logic?
>=20
> That said, Julian and Nicolas are free to disagree with me.
Sorry, wrote up a whole review on this last week but then fell down a
rabbit hole with another series...

I do appreciate improvements to input validation for Kconfig, and we
recently took a similar patch improving KCONFIG_PROBABILITY input
validation.

But, I also agree with you Nathan that some of these particular bits in
this patch are just not necessary to handle.

If a smaller, cleaner revision comes in then I'd be happy to give my
R-B.

- Julian Braha

--------------N1B0s7j0n7AdZMYFuOHkCOmu--

--------------c5HntaBRVjPdisNjAnoBfb0c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCawdx1AUDAAAAAAAKCRDElYPCBXNxII2W
AQDCRm3ZTYDGGokWxIvnTop4m9dEXBmUkbwBsd9iEowCagEAznn+8+OZ1WGpNhGdSiCIXJylmKoo
tpmsCzPVE2/H1Ag=
=TYh0
-----END PGP SIGNATURE-----

--------------c5HntaBRVjPdisNjAnoBfb0c--
