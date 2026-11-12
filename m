Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524169;
	b=VhQu4Z2p4l5OGZoZm0PwXfmSgtE6fkNec8i0dig9I4oohDOO+SrZ0lsKdIvk5Q5moAhs
	 6uZ4sRad1MObjznyztr++Wq7NmI7cfOyKEcidhJF8dNdtGBUQX8QHAihibG/PstDSZkTu
	 cKHQ+tYj7ajyStnYz5NHwS0jD6XQPnUQGJNsufXA4s4Bpuj/46IybrNtANBpheNS0zsao
	 hO2qEXYL8rvrvGRNTG6l9DKBpeKqJBD0RQGR9nestPzaZfeabz7FbTvh5UUs1UsA4KQg7
	 dNPySR6BDJGE314Od1R2gDRZeiY3zHOo1oSNtEx6anK/kGOqmNy6rwYwLRsTvB3VEFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=ZxJf8bmNk9QYTuWMTZ/K0FYOKOyHJkvCDvBuAHHFKsk=;
	b=F1kuBxkVYJON+t7dv+IOAlOQIsQ1I0FqJrWCXPIzMuuDSbacSct4OMVPHup13Zx+wwZ+
	 oXENiln5ji9f63oawUPLpfKLK3Jmq899dZrCfoAgTRoxom4wS9049GgtjJqXKXUKG7GqQ
	 3/VeXMeeZ7Gk5iofX+TYDhHz7yRuNF3h32eETBm6D/RcgjRGOzdn+pK+dnDvffkeTBbKK
	 m0zgdW1qVWsN2P2N/vAaSHScGqPixD24HHh2fRP+W30RfBBmJEDH+tx57Wd16Xj6LjOwx
	 n6nHWMWVlITueA9QdSoNOlWz4A+59EX5XWDF+v5rkJzFoGabyiP0ve6bghzVCZpqegg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkBis687;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE41606A8B7
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 22:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE41606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkBis687
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so1581725e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 14:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794524167; x=1795128967; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZxJf8bmNk9QYTuWMTZ/K0FYOKOyHJkvCDvBuAHHFKsk=;
        b=HkBis687YMWsR/0fg9xOnoliz5zUt4JgZhssjAGFZn2qoEu9lBaGgAE4Pct0jhoyYG
         hok3LeTFHCBdZAbo440ONBw9YRtXgJcr8QGB0z326PWIHc3eoSmy5l4Ig3JaKpzdEUHZ
         9V54pMvzhaf58xbXx6GGjB/4Rk6HaM5NIpITDLuTulJHwm2zR/qLOo8d3Y1aj4chOELL
         0DlW/FWJUUcAg+QxC5mzlkabkrYLbKjgp8wjKMS7pjxlHrkY54YG5SF3ndKCh8qfae3m
         FjwmsS1OCcexuvkGCA3ioDZq23WX/5zgfSQTTDL9e30aRQptEXPW/I2XIM5IAiJr975t
         ghDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524167; x=1795128967;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxJf8bmNk9QYTuWMTZ/K0FYOKOyHJkvCDvBuAHHFKsk=;
        b=hYW55NWx9mqm8mMyhsT7DPILanUT7MXL2YLVl8/Ioa6LezmjJrsmLKlBLAS6gdSljx
         iX+bpYxWIoHtIwdlb70Y7jBQGQmawZyRnLKj/es72oAhTbtnKcT5yrikQX6Uvx8ef3Fz
         9tni6JTD6dRbXKQAKIT8rUQlF2T1c+RYC1ctFShVwX7vA6GlHYDO5QyHGhu4ieNqLl5C
         XgHVlOU35CNkMSXA7C9b437tKgtCjNzId3jzo12saku9YExIk2WVHcgE0MuqxvKRHAHG
         qXxE1W87gbOu3K72KQvFfmqCStwHgZil7IqngQK+oivA2YD/kBxLP+859EAhiIXpAurs
         eNgQ==
X-Forwarded-Encrypted: i=1; AL+hErH/LYe6oBrSdrs5jFniBUeZu0qq9za3wKUe6Z9Fps+y7pUtajnmWiVznuYpqtl7KWfizq/v8DSHiVmBKRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CZcQt+Wu9DCH18DmuetA8XpGCy0rGqzJihdfs4dLiOdQgkZG1
	p6RiOuYiqrh3xQJoW6h9wy4Luhn8tqNuPKLRFkJlrfauDr1YYpZGGSvu
X-Gm-Gg: AYBFou2/743bqwEnSRuXJ1vHRQwP5KrSzd7mr5wn/fp0EMZUMEvL+ur5YDcXFiYpnVc
	SuTZyDaHl+68/W9uL7lnM96ywzK02AnaMRQm/9CKKKnNHYzGpk+B9lc/OXNLlytfknSl2qcG1rB
	oO5VEurzErTI9cNQO4HD6cJiLRoaIJ1EsyWwTr+M9UFGpZwoFi/15nErVtWbIJG6q/QHyiPPGqQ
	kYOrtc/VzdJyWKByUGn2at1l0CkaCQ9khXjGFwHmAy6rAF0EVcBqqv3TFGcUlKRbs9GC51RZasx
	wISL1T0VLzcZDemu5Ycmv7X0m4Aik+NpRYshVVG5k6keIYxqayJ1gC9cTYbM1CcGfTkVZTMSeD7
	jmMrBJurvYhhE6BXb+y4SZS0rHm8qi3Wx233z0ZlQozCJRerY2PwZ0XXQ88c+CZFYvw8mQyDuhV
	8Iswgl1+7tX3CKoiE2nUKb5d94NQSnGS/gFJgJmCHT1T6Q3yBicwMIjVaeBCOup1PBRJnaDXel/
	hhE97sj0EKw9mEzToEr1LsI++iQOYUF60YIi8yTH+Z/xoiquliJgUZo8TiwjGy1u0w0UMizEl3Z
	oHrvYY5G3JGisst4muzDJXKsPQupkKxJll5vuJkBvuJjdrz6+HvyemM8HxH2KOPzK7s7SdMu/9M
	ADr6aenrhMEaWsyydfQ==
X-Received: by 2002:a05:600c:46d5:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb55a8329amr12879245e9.13.1794524166792;
        Thu, 12 Nov 2026 14:56:06 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2a9bsm14024995e9.14.2026.11.12.14.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:56:05 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <81c91813-79ff-4d36-92e6-8c0ecc1772c7@gmail.com>
Date: Thu, 12 Nov 2026 22:56:02 +0000
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
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 03/10] kconfig-checker: Add the configuration checker
 code
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, arighi@nvidia.com
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-4-darwi@linutronix.de>
 <9729a4c6-22f9-4102-b62f-c76a75488240@gmail.com> <avHD-3JwbQofpJdH@lx-t490>
Content-Language: en-US
In-Reply-To: <avHD-3JwbQofpJdH@lx-t490>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VdvWlLDeG07vMoPV8nhx8PYM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VdvWlLDeG07vMoPV8nhx8PYM
Content-Type: multipart/mixed; boundary="------------Rga8Q7Rmd8rON8aXdAwiRZDL";
 protected-headers="v1"; hp="clear"
Message-ID: <81c91813-79ff-4d36-92e6-8c0ecc1772c7@gmail.com>
Date: Thu, 12 Nov 2026 22:56:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 03/10] kconfig-checker: Add the configuration checker
 code
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, arighi@nvidia.com
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-4-darwi@linutronix.de>
 <9729a4c6-22f9-4102-b62f-c76a75488240@gmail.com> <avHD-3JwbQofpJdH@lx-t490>
Content-Language: en-US
In-Reply-To: <avHD-3JwbQofpJdH@lx-t490>

--------------Rga8Q7Rmd8rON8aXdAwiRZDL
Content-Type: multipart/mixed; boundary="------------0BXEV3ylG2oOQNRGA3FZ8ghK"

--------------0BXEV3ylG2oOQNRGA3FZ8ghK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/9/26 13:00, Ahmed S. Darwish wrote:
> On Sun, 08 Nov 2026, Julian Braha wrote:
>> On 11/6/26 09:19, Ahmed S. Darwish wrote:
>>> +
>>> +class KernelConfig:
>>> +    """.config file parser"""
> ...
>>> +
>>> +    def _parse_symbols(self) -> dict[str, str]:
>>> +        """Extract CONFIG_* symbol assignments from .config"""
>>> +        symbol_set =3D re.compile(r'^(CONFIG_[A-Za-z0-9_]+)=3D([ym])=
$')
>>> +        symbol_unset =3D re.compile(r'^# (CONFIG_[A-Za-z0-9_]+) is n=
ot set$')
>> What does this do for Kconfig's int, hex, and string options?
>>
> So far, the tool only supports stating whether an option is enabled,
> disabled, or have a neutral 'allowed' policy.
>=20
> But there's nothing stopping us from supporting something like:
>=20
> - name: CONFIG_PANIC_TIMEOUT
>   expected: int
>   expected_value: 10
>=20
> - name: CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE
>   expected: hex
>   expected_value: 0x1
>=20
> - name: CONFIG_NLS_DEFAULT
>   expected: string
>   expected_value: "utf-8"
>=20
> In v2 of this series, I'll make the schema explicitly versioned.  This =
way,
> new features like the above can be cleanly added.

Adding schema versioning would be great.

>=20
> P.S.,  I can definitely implement such support, but I'm a bit hesitant =
to
> adding features that are not yet needed by the existing mainline polici=
es.

I suppose it's not necessary to support these option types at the start,
as there are few of them, relatively speaking. But it would be good to
add some input validation in case a user attempts this.

So I've finally had some time to sit down and test this:

I created my own policy with these other types, and sure enough, if I
specify them as 'disabled' in the policy like this:

    rules:
      - name: CONFIG_LOG_BUF_SHIFT
        expected: n
        severity: high

      - name: CONFIG_PHYSICAL_START
        expected: n
        severity: high

      - name: CONFIG_DEFAULT_HOSTNAME
        expected: n
        severity: high

and my .config has these values:
    CONFIG_LOG_BUF_SHIFT=3D17
    CONFIG_PHYSICAL_START=3D0x1000000
    CONFIG_DEFAULT_HOSTNAME=3D"example"

then the config passes the check -- but it would probably be better to
provide a warning or something about these options.

Also, if I modify my policy to set 'expected' to 'y' for these, it
reports "not in .config" (which would likely be confusing to the user).

This regex stmt should match all int, hex, and string options for you:
    unsupported =3D re.compile(r'^(CONFIG_[A-Za-z0-9_]+)=3D[0-9a-fA-F"-]'=
)
by checking the first character of its value.

The included preempt_rt policy worked as expected (nice).

- Julian Braha
--------------0BXEV3ylG2oOQNRGA3FZ8ghK
Content-Type: application/pgp-keys; name="OpenPGP_0x0664101D2FC252D1.asc"
Content-Disposition: attachment; filename="OpenPGP_0x0664101D2FC252D1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEapsKOBYJKwYBBAHaRw8BAQdA3mvh6nlHEvnMtdMGgqCAaM3Nsvuf8218NgEp
UYZ3GanNJEp1bGlhbiBCcmFoYSA8anVsaWFuYnJhaGFAZ21haWwuY29tPsKWBBMW
CgA+FiEE3vXonTpsa3w5RQqpBmQQHS/CUtEFAmqbCjgCGwEFCQPCZwAFCwkIBwIG
FQoJCAsCBBYCAwECHgECF4AACgkQBmQQHS/CUtFZJQEA1KusHq55e97aMeBrp7e7
UVBW/KSQwD74hTv5flHpEioA/REUaia815i+qzvft2b2k6OklqL7Nk5vXcmEZS7e
VRwBzjMEapsLWBYJKwYBBAHaRw8BAQdA9/bcRDPCvFzqqx4b3LVPDeOF6sju1/WR
4h3ldYdesrXCwDUEGBYKACYWIQTe9eidOmxrfDlFCqkGZBAdL8JS0QUCapsLWAIb
AgUJA8JnAACBCRAGZBAdL8JS0XYgBBkWCgAdFiEE+qo5ZfvrSBcRfE1DxJWDwgVz
cSAFAmqbC1gACgkQxJWDwgVzcSCsFgD/U4j7hwSEh61Oa4s7R4tUW7Rk4QXJ5QYs
vcIagFNebLEA/2pJH0zmbz5SKUKctYslxZ5kIwmTwHv1WrpJkp+LQKcEmMIBAO/h
CxaCZqrsGDSNflfIV9VyUMEPLbCvfTBYjNwdsPCYAQCoTYODxyxaV961a6Jq0E70
Js0eCdlqdx90XMjUDQBOAs44BGqbC2kSCisGAQQBl1UBBQEBB0CfrYRXqZGPNhdK
Db1uwVFrlLz9hAa3mhsuj1l00A5JbAMBCAfCfgQYFgoAJhYhBN716J06bGt8OUUK
qQZkEB0vwlLRBQJqmwtpAhsMBQkDwmcAAAoJEAZkEB0vwlLR4B4A/AmkIlpPLSZ0
C6yjqhpnDw4h5sIMu9fzfY+wpyONkYB9AP0a3QyeX2lCHdqdEsNX3ubF/ulc2DYS
0cxeDFVX3Sz7BM4zBGrJT6UWCSsGAQQB2kcPAQEHQGX2XtPmGz+dyR78C2db90ry
FJ4j/ekbwHQ41WdLi26jwngEGBYKACAWIQTe9eidOmxrfDlFCqkGZBAdL8JS0QUC
aslPpQIbIAAKCRAGZBAdL8JS0YE4AQCrPL7T+dv83/SgWVsa2LwUxJiLbiTCctzc
5rISDmWHAgD/TnBEQkxYBXJTgnvjVmuMGSSl0SQZ5z6hVZvH4mU7zQ0=3D
=3Dyg1h
-----END PGP PUBLIC KEY BLOCK-----

--------------0BXEV3ylG2oOQNRGA3FZ8ghK--

--------------Rga8Q7Rmd8rON8aXdAwiRZDL--

--------------VdvWlLDeG07vMoPV8nhx8PYM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavZEAwUDAAAAAAAKCRDElYPCBXNxIMuZ
AQDMrrOgssYsmZu7r97D0KltSrsj4rjS9lQpoKvtgWkLgQD/QUf7yjdW3ke5GhASowk8x+G76gpu
WHV+5iNnSCYOfwM=
=KhF2
-----END PGP SIGNATURE-----

--------------VdvWlLDeG07vMoPV8nhx8PYM--
