Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334739;
	b=sfTvGuTmqYX4ZU/Ps+XS1fb98xkUMe8FtwcuIKZA9IxFPi1asVIQkBrQh5u+KMdRSNC0
	 QkPNMc0qN5LZ8rqb3Ac27B1Ocu9ETdoC7SW1xZ8Vl25AKehFExPu6tax1tvnpXrs4WQqN
	 NsGKJoe/dECoUzvhUHkAdatbhXPCNo2/KG8J1jGa+6B57rM1e5sxtffysii2AUz/NQ0Lx
	 gwpZQ17euALQmYjISZzpV6exb0L5wYZZd3LRm116fiIZgfjI5JHCfpjWIwr+aQcZouLFT
	 cwqP3cPA70KlBn2nTzKMDVj9DkxRY0vw6gsDmAfq9lPjWOvuYsqc0Gtb6hzYg4mOSvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=SE2lrUu9zrSXQsWXpC9NEVG/yxx3i85b5haa93pV8Hw=;
	b=On2sgUJ/N7rWBK0fhC9/8qW8lJiick29KYLfxHQWD/3xzWYf+BGpSKSDLjriqOSJ5oaD
	 X1bWyqXVPY7xwv0h1gWYAgi5gAgayVf6gAbs258tue63N6kGhJjcN4XB7dqpLaTCOeV2r
	 VjmNoO1exYqvEBdmojdU7K0UkVRKy2LnAMebTs6toEkNgX0vmoE68Lrlfc9Lrbr9/gWyY
	 de0PxR8OCu0vKMj9rzN3r3fQKjA6cu3TmYdAggrtRIHv/UOw188RiGxrIqaGwlIx4dA9/
	 Zfpm8TpFtRlN8K96Op/HSCfdR1Y3Lt/KxWDahNOv6ZmZjlgfhArAZ3YjPXykOWg0GqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPZkqliz;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EE5606A339
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 18:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0EE5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPZkqliz
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so21529915e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 10:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334737; x=1794939537; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SE2lrUu9zrSXQsWXpC9NEVG/yxx3i85b5haa93pV8Hw=;
        b=SPZkqlizfa4It3AwLdPrXCHtu8hjP8QsFeAuGA6TzWaWCvEuPs6YRFrNxSLhGY6hGO
         zEkoZN4sdOPDpp0fSVUec9WqjBjvtMVvrEQ65XF2Yed4K+/loVPoO9Ic5C/uFsZE8NIW
         a7SuXA7nEFvGvWvLFPTq0Ynm5rdM5DLTPlMLycSJFkVrU8JWmlwSUfWDckahUOsYF0/H
         actdhCUUDnOinRx9t8xsvvN84/pj8Dul9B7nDEmVjtEJdE1h/jhCN5DMjHk5kgAuLSBU
         2XR0ZbSD1t6mqP82bCf1wjFydzdoOh5APY9FvvrzDfKRwdJ1NyIsBaSfqst7u6E0YpPm
         teKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334737; x=1794939537;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SE2lrUu9zrSXQsWXpC9NEVG/yxx3i85b5haa93pV8Hw=;
        b=sr9hioGU+Jfoztr60zixs4CX+pfS1bfUsXznWHIYb86Wrqff2y0MzqfVuxNLnUjjSI
         o4SbmCOPOrCEwfIzdWfIBB86kB1svfJkmrW36CV3QKkKjVTHJi3wtkmYWCtnYry4WnWD
         SqqRxOQHPio9LsyGJ/uxbAK7Jne6c72ymJwij0LtZfYZtz+AZkmpSclvyKLCVfOISCBD
         iST8zNeRZijDahYTFKajyHBiHL2Y16VFUwUHrS52NA3fIdUNikWgQvKCxU+5iygagTzj
         1ZnobpFLN5p6wh90cpsjNDOfZ5XqCmQsKwcGzfjRE0JhwnVEk9pVajnbb7vNWMI3FkTK
         RPBQ==
X-Forwarded-Encrypted: i=1; AL+hErH5zNCeyyR5M3TeMgvlfyzispSt3J1V6miUPFa4NiOGh07cW3JnqKiC4XA0UTBLPHgj4qno4c3UNILdeVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1Mo0QjJporCnLTj8wGx22SY/Lj64hlRVTd+uFS1pmd3VhNk9I
	RdzbSIYKT46+mOKjNIpY+88OaFPmFOJdIjnozVgIeeYb20NnqNue41De
X-Gm-Gg: AYBFou1YjBMlok7YmN9QzAT/eh0FQZN5BHahW33VjqP/85w3t9YY8EpkoocZFDoHvMp
	LIF9O1H2mnVOq4iSYlpwC1uYWIjbIUkqjoVvtadJ52w6LAAHlPgPQ0QgOJWfeJB7SIqsazxj9fA
	G+ahpSu5vSbcI6haBkR0RryOPhkTIUPzCNu9U1MKvx41kDdcKWIyTOqLv3sEnyMcwYjRV0+MvyO
	hjn3U9IuLQf+bakjnDS8Lti/YYFPnMZ7LLEklyvfbx1ynFYpZomm2g4O1058XvpsQMpBXgx7/iN
	tz8mjAmYHHxqtikBrGowcsZombYOHa1ucGXQOqYY5jZMZ1Xx+0xLy5LHSq/oIXAWium8w3H54Kd
	xBI4RhFEJNPYMxZLPJjWysiBp4H9zPgQW9whryGj4YZGZOi2g/4MKu8I+yVEOmxOV0A9BOnE50e
	1xqQ7EKAHS/oBGuZtZ3j0BJWuMK3DEluJ/ZNDIgmjbBibbCr+aHlcbViUEl2XxvOFwaY1kjXaSe
	5qVGIcFa3JHWYySBsSDHetDdNRYWHhoGiUjSFE2jfHFPGp0yN/NZI32ythtlLDwyLpCZ66e52r+
	WtUOuA3Y15CEX8gpTLQWNe0iRX7MTPBNOzfEN+CVt00rEls3iQA/7MSuLh22RFubGdVfsspaJtd
	RQnQhgqWOeqBmbKjg790M0POOd07ThXRZmv1KEuLt0I4=
X-Received: by 2002:a05:600c:34c7:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4ba0233a41emr53483145e9.8.1794334736887;
        Tue, 10 Nov 2026 10:18:56 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe63e6sm121456885e9.7.2026.11.10.10.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:18:56 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c0ccddbc-539c-4987-8685-ec996285f746@gmail.com>
Date: Tue, 10 Nov 2026 18:18:54 +0000
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
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
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
 <a20153cd-d148-4618-8089-ad81cb16fe23@gmail.com> <avHroNa1vcxmCIOs@lx-t490>
Content-Language: en-US
In-Reply-To: <avHroNa1vcxmCIOs@lx-t490>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mHZpGD8kyHvacYrtSD2O5A48"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mHZpGD8kyHvacYrtSD2O5A48
Content-Type: multipart/mixed; boundary="------------ULacv4ysiB0EGOGi4fngWV05";
 protected-headers="v1"; hp="clear"
Message-ID: <c0ccddbc-539c-4987-8685-ec996285f746@gmail.com>
Date: Tue, 10 Nov 2026 18:18:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
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
 <a20153cd-d148-4618-8089-ad81cb16fe23@gmail.com> <avHroNa1vcxmCIOs@lx-t490>
Content-Language: en-US
In-Reply-To: <avHroNa1vcxmCIOs@lx-t490>

--------------ULacv4ysiB0EGOGi4fngWV05
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/9/26 15:49, Ahmed S. Darwish wrote:
> Hi Julian,
>=20
> On Sun, 08 Nov 2026, Julian Braha wrote:
>> Cool tool =F0=9F=99=82
>>
> Thanks!
>=20
>>> If no ruleset is specified, the target prints the available rulesets:=

>>>
>>>     $ make checkconfig
>>>       Usage: make RULES=3D<profile> [OVERLAY=3D<overlay>] checkconfig=

>>>       Available RULES: preempt_rt
>>>
>>> The overlay mechanism allows distributions, CI systems, and Board Sup=
port
>> On the topic of distributions, this seems *a lot* like Canonical's
>> Annotations [1], albeit yours uses YAML and supports matching option
>> names with regex.
> The difference is not only in the implementation details. Please see be=
low.
>=20
>> As you say about PREEMPT_RT configuration not being
>> "one-size-fits-all", similarly there are 100+ Ubuntu kernels that need=

>> to adhere to a configuration "policy".
>>
>> So this seems to be a real problem that others are having.
>>
> Kernel configuration is definitely getting trickier.  That's why I've
> contributed the PREEMPT_RT kernel configuration guide earlier:
>=20
>    https://docs.kernel.org/core-api/real-time/kernel-configuration.html=

>=20
> Regarding the Canonical tool, it's the first time I see it.  From that
> announce e-mail, it seems that they're using it for generating a .confi=
g:
>=20
>    Starting with 22.04 (Jammy Jellyfish), Ubuntu kernels are now using
>    only annotations to /generate/ their corresponding .config.
>=20
>    ...
>=20
>    $ ./debian/scripts/misc/annotations --arch amd64 --flavour generic >=
 .config
>=20
> Yocto also provides a very light concept of .config generation:
>=20
>    https://docs.yoctoproject.org/kernel-dev/common.html#creating-
> configuration-fragments
>=20
> But this tool does not conern itself with generation.  That is, Canonic=
al
> can use this tool to validate that they've generated the right thing! =F0=
=9F=98=89

Yeah, Annotations also supports generation with --export.

But it does support validating a config with a policy using --check [1]

Anyway, the point was to provide context for the maintainers that this
problem is bigger than PREEMPT_RT. I want to see this functionality /
your tool in upstream.

[1]
https://git.launchpad.net/~arighi/+git/annotations-tools/tree/kconfig/run=
=2Epy?h=3Dmain#n117

- Julian Braha

--------------ULacv4ysiB0EGOGi4fngWV05--

--------------mHZpGD8kyHvacYrtSD2O5A48
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavNgDgUDAAAAAAAKCRDElYPCBXNxICmt
AQCnoePBJmblDtx791LwMw6vMN74dOGbn1riSxrX5t4lFwEA9U+EgthEgVL036QIb6Xcl3PkwtNL
NnsnRTbgzz+lNAI=
=mw7w
-----END PGP SIGNATURE-----

--------------mHZpGD8kyHvacYrtSD2O5A48--
