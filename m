Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164381;
	b=P/KmDkbv5t3OVA1oQhnvSOWN0mtxAbW1o3GIlHo50pD5MCgseolRHL8ufxrV97NgT3oN
	 z5FyCQKWaVM848KECX2SZz8QMcN3+1m1/mSMEr+88tMFILPKRmR/R/3v7mKEFZhTy3uYb
	 BTxWCe1ylY+JpzSb69QA5tG2wbczfrpqjs9Zyo/WFneP3xPeSHzHhl/ye4QLyv9slCMi5
	 02tcSo4BYY1DygDlv8GK5Y/4R4M4HG4Gl4isUtOQhMBiSCa+FqCjAOS0qUN9AMisCpifQ
	 vjl8fyGYAwigYYoJoeKfFH010IU8klN5orm7jrDTuvTcOz2QVauy2l7phdZRfoBoP7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
	b=gyQ6uGXG4vlYufvAHTm8I7BjX9B69J3YSTxuD7MpUPjj+HrlR1M8E0lgu7W0ONQB3iM5
	 TDq4cHM/2eDqD2POeoVvxzra9Rtdtjqa/ON5JwK8yB2H3a6oFT3kzhIHa1Tl/aGGmuezj
	 wDzThoN03ffbRLLDlnnaJO5YZyzG2/B1ipvDPVYNpnumQibIGY/tASj1gHBhlT4J336Wd
	 +DpqkxA5MIkbsA5Cjmw+/1kH4n818RF1gvQeZGgZ6i6KHXDY1I6O6BJGdCD++2DijhRCy
	 DaJwP+90vE3M/QyxfQfy9qf0f+63744iq3obsDlrBwr7Lna85iIPWnk7pBYzMyl1poQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZiPLsrl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CC606A323
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Nov 2026 18:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 008CC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZiPLsrl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1227535e9.2
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Nov 2026 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164379; x=1794769179; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
        b=LZiPLsrlu1x8AztRr9Uq6JLLsP7Yb+7eubPrBwFxd8nZPLedfudb5+EUpZi1R3Zd6t
         kdLmKiiLo0hfGZAP7cEuHoJIPs70tvyFELtdLlN1XdvrhI7QJHcJY/U+S7kV2m01vCrj
         uHEzeYRrLKlN6+0dE1mYTwuTWt2Ywkuedk0qTtLZN2NrAmJpNUYApx6likhuTN/VvrkY
         rL51UfQ4i7FagdSGbb56a6go7X0Nt0FXxKcHbn0hstftBI2m6nv4R2BylyLDyckEQwV6
         AZAv5gwpIGj3xQjsPRpl+Exm/kqHQhOECoX/7bJfjkGP1nDZE9TJX7QvaSr0s36996TR
         IYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164379; x=1794769179;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
        b=V88WJ9sg1oQFEI62weEkhqnZj/u/t9FcNMtLgKA749qeT9FlVJGEof7gQ4CN5J9YBo
         Nlzjlrt2H52i0kzdoFVobic5TySStKSBjinT21NugPygdWbTEFrRIy8R7kfTus1Z8zkQ
         l8LNnPZRDlQW2XApiijC8tbuy4Dz7lX6f+8Mq5yofFFthu/7gVyP9yKdDq+C1i2vfB1A
         AMOYD7YG7ihPioUJ33ONuI9dU783ZxaPNds3+7NReNx0moAgRt6kXPvnCWrDz/G7tMWG
         q7edibfrol6T+o0gDw69PPDnUIHT5pgQb/EeP9JlV84caqD66lqeLTbYKaOvz32lk9jC
         Klcw==
X-Forwarded-Encrypted: i=1; AL+hErHUR9DVYccSQ7F24kNemV4mwrJLW1AGkHc9WEEe5pHJQxIqkkGni/40vNSnI3L50kvEOXMJOADx1xYhwa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KYcCE2FoQxr9bmbCXBYeHm1/WfkKchhNaxDsiFb8GB6V0OjA/
	dk7HvExwLc9+w0KhjMh87D3gKoRnoNQL8m/ZIXPOvK5Rq3TjHWY/s+lP
X-Gm-Gg: AYBFou2+z3ETmGwliBw9lB9STFpS3awKF93+fYziDEU3iJb+lF1clh2yzvXK6xEb/HK
	Iug7NT/ACbrQ9jV9aYL3DQ1Ctiia7jYa55jXlVBunGKjNHHqg0UKXYsbdsythNTC+mmjPvxskIe
	EHWWYJpVvVGZaqhXUkTBVRqPh/dTz7XOI4Q61Rv9Z4Ad8QwdAChGRaIcd0LFGwUPZPzxGgBtHxm
	P5cSqlbZotgf17xtdLxRw/gbyo0CHOfsIs4cklc4KLPq9VyIkvRLoSavL/xK7e3XIvFFRanZhPk
	Jdf69FPQJM2P2UbKhfh8UUZZVkj5BfcWkvAftBS8728V+Yw44QmttS2t1DYAf3dUkyi4VREsZLJ
	4Osi0Bn+e4bHCKhRQXvPjTTaoeLpruZzAh1fQsVIUC/Zz57ePSHDDk71obUbwdKMENYQX9uAqCD
	xYlhIevxYbfRcnTbCoUmPTqOTrNUnxtqIEoIlurl/42IDkxO6LG5+aLr7yAEJIpM19+rLJKD8Ss
	Rxckt7QmjU53Ca21dZBmhyNFfy1DjByVoiSA/tyXCM67QikDvclQBVe3eo3fuVu5OaD+elvLJXv
	LzycgaktzT1+Dbsc5iVevPi7FBLBf8ZqXtkNwtyscFEWK2zWjlIo9hsZsZHlscpTXO49LT2nYpp
	Vd3L8F74e6brziG3SrEdU
X-Received: by 2002:a05:600c:4e50:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4b963c7d01fmr38198605e9.17.1794164379254;
        Sun, 08 Nov 2026 10:59:39 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm80401145e9.12.2026.11.08.10.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:38 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e0ffecfe-8c4f-457e-ae8d-32a9601e69e5@gmail.com>
Date: Sun, 8 Nov 2026 18:59:37 +0000
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
Subject: Re: [PATCH v1 01/10] kconfig-checker: Add schema for rule files
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-2-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-2-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n0jyBVewKwmhUucz3R1v1dT0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------n0jyBVewKwmhUucz3R1v1dT0
Content-Type: multipart/mixed; boundary="------------DIHfuWC5H49s70Tk4afQiYfK";
 protected-headers="v1"; hp="clear"
Message-ID: <e0ffecfe-8c4f-457e-ae8d-32a9601e69e5@gmail.com>
Date: Sun, 8 Nov 2026 18:59:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] kconfig-checker: Add schema for rule files
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-2-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-2-darwi@linutronix.de>

--------------DIHfuWC5H49s70Tk4afQiYfK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> The kconfig-checker YAML rule files describes which kernel .config symb=
ols
> are expected to be enabled or disabled. Introduce a schema for such fil=
es.
>=20
> Describe and add rational for each element in the schema as well.
>=20
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  tools/kconfig-checker/schema.yml | 115 +++++++++++++++++++++++++++++++=

>  1 file changed, 115 insertions(+)
>  create mode 100644 tools/kconfig-checker/schema.yml
>=20
> diff --git a/tools/kconfig-checker/schema.yml b/tools/kconfig-checker/s=
chema.yml
> new file mode 100644
> index 000000000000..a7f1b0a78cc7
> --- /dev/null
> +++ b/tools/kconfig-checker/schema.yml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +"$schema": "https://json-schema.org/draft-07/schema"
> +
> +title: Schema for kconfig-checker rule files
> +type: object
> +required: [rules]
> +additionalProperties: false
> +
> +properties:
> +  #
> +  # Optional base URL for the documentation page used by rationale
> +  # links.  See `docs_hint`.
> +  #
> +  docs_url:
> +    type: string
> +    format: uri
> +
> +  rules:
> +    type: array
> +    minItems: 1
> +    items:
> +      type: object
> +      oneOf:
> +        - required: [name]
> +        - required: [name_pattern]
> +      required: [expected, severity]
> +      additionalProperties: false
> +
> +      properties:
> +        #
> +        # Exact kernel configuration symbol to check.
> +        #
> +        # Example: CONFIG_PREEMPT_RT
> +        #
> +        name:
> +          type: string
> +          pattern: '^CONFIG_[A-Z0-9_]+$'
> +
> +        #
> +        # Regex matching one or more kernel configuration symbols.
> +        #
> +        # Example: CONFIG_DEBUG_.*
> +        #
> +        name_pattern:
> +          type: string
> +          format: regex
> +
> +        #
> +        # Expected value for the matching kernel configuration option.=

> +        #
> +        # Values:
> +        #
> +        #   y        option is expected to be enabled (built-in or mod=
ule).

Kconfig's tristates use 3-state logic. It seems like you're
approximating 'm' as 'y'?

These are meaningfully different values :/

> +        #   n        option is expected to be disabled or unset.
> +        #   allowed  option is permitted and must not be reported as a=
 violation.
> +        #            This is used to exempt a specific symbol from a b=
roader
> +        #            `name_pattern` rule  with `expected: n`.
> +        #
> +        expected:
> +          type: string
> +          enum: [y, n, allowed]

What if a user wants to specify that the value can be 'n' or 'y', but
not 'm'?

- Julian Braha

--------------DIHfuWC5H49s70Tk4afQiYfK--

--------------n0jyBVewKwmhUucz3R1v1dT0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGmQUDAAAAAAAKCRDElYPCBXNxIBhZ
AP0St5Gm6t5qmVeEmHVFmeBETjuK3DVAGHB6hDtQY4jQcQD/ZxYo1ObM3GAgg5kaUzxTu4/2XW7B
bUrRbAjtbCe3pQs=
=jHVw
-----END PGP SIGNATURE-----

--------------n0jyBVewKwmhUucz3R1v1dT0--
