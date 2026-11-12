Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794525273;
	b=dce9eemMRgNtlEkJBCfZXqGt1kLVkC5FJdqrboQmDjIX9dzvB7bynfRMxqLDfIgeQzNI
	 rk28rrnW8gjiapM3N/etMxFR4Qb/ZL57aJfPLp0uv3YewTho/rslN0BrUqutcVjQfn6zl
	 ywuH/1oOPAw3txhsoitHLQj/TeQW91nRb02uGLzzM4AKgon5rTJhL1YUQ7CCX5XHXmoZ3
	 XiYygqq7wA1ik5r3LjgIMzEu1ama1Omi+IGcAA3mtm4Y/xI4KnSga/1xjfIpoX3OSe/Za
	 XSRUzoDAfn6XOQrmACxPZJxwhfFGFmM75kFskbO2/NXBItq0jB/MSi22S07zYPaQ84g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
	b=2dmnZ0YYxXKKKWclXCR7spTc/99HvLtMzFEdX7bMGNLdgPxWEfpm+z0iWacQWLiuBY7L
	 Y5mwnqKRE4KEv7gNsYhn83KvFa8YNt7T0943vVvSzUNMKkV6AfR6P7PokdOtbG4JauCFo
	 pcCKwZS0KqOVvhgCEeMR0ajeKCiNh3pySuIyiDq0TDgrAxMgks8N4cxaRnrVonTluDtKq
	 Hf0egOfG3k3QvbYtXumpc1iDKqAntGK+tSzM6CldL8J9aD2BS0I7NpEFW6i1hoeXLC5On
	 czEvy2aZfwmouYRpqrUBNGRsn0L9rBcgkSBujbOAvwLNYzBAunY44/0s9RaKS+ZsNTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsvJdqN+;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDD4606A327
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 23:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EDD4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsvJdqN+
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so2700615e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794525272; x=1795130072; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
        b=EsvJdqN+wWCfOMVWs6MUfw7XtuobuRCUPvEe6yaTTEFIspcg/SFHUzBExrtZtJMH+/
         WfIz7fdJHXtBzhFUxWQ/vq9c2Y71iKDMQOjJM099c77pSaaK3RtGVGFNi9grouSdUDYx
         d/Xw3C5QjmcT0YCXCLUQNfKxeqDOLGmvrP9bhZhxEycST49kjuObKaXrXzJonXajTTD8
         ItxcN/ZJpvZ2Kd38Tkvl/LO+v9rvYVLaGNtZr2F/tTd0ejZ5cQhKzW8y9QcZBJVficIz
         N2DVpC+JtYfBVIfCGC/Zs1ayz3EM8nKfaJCkx5jf5B+1tf5Hk2rqteKfCXH6HiVyYDk1
         kCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525272; x=1795130072;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
        b=Fj0UX2olIUMrXAVOjWFkkQktS9NiSKVuimZCMAkPohtcn8w5FrInMDWK4PLnM0OmhL
         yag4a2/Ct30TzH3DlD4dAu0nls9AfJsfy2dZ/TlpbzUvSL4mpfp+MAixMpLWnDgznE8E
         SsrKWVav1XvE4p101by18/N0JfCWGtq47OvseeMxGsQrEMrrMtyqSplnzBpz2tu6+7l8
         X+x1u3a1bZy7DWKf/l/6FHDulO6NUeprr71Vp2rJPPD0gjm2qf8BCn7JNSgiGrzbZSfq
         zLlSgRfoIqF3qIjFjfLVKKR9VwLVH/o987VaHvuFtlscZfdRydCZEorFW13X9xR6gANq
         W7JA==
X-Forwarded-Encrypted: i=1; AL+hErHnxEFthqCvmw5P+U54nx+PjOpe9Vbrj0g4L6ej/hCrxXT9IgWIO8tHT0kJGaLcwb0DLz6PlF9sBqKBZQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p+DotusdTiwQA+eM+vWX/Wa/IJ8Py+ueTO491QTDqiuS/llfB
	uHnWmHtv/mvxwDIWOg/W7VHeawBpc4Og85+vpoEKRt4hf+j9P2cl/gls
X-Gm-Gg: AYBFou0qyPt73hoKHxNuMRGntOBxpIFl7wvJLx4e3aLH7IwcjLO1q8pMxnyV75DipCG
	6FKYjdJ037ngeU9/1H39IhKCyETwn8mvPiNFiZxnsyxgORVCjPgvAnYe/0xZUAIR4v2EZ8EijQz
	9SbyK0/klgSGLPldAFq5dA3TBcHub3DH1U2WIrU6FgXVr6B80FTpTJ0bjiBg1zHy2tbDlVQd+NG
	OTDGgzqMxZEmttI7E0tBTMf0bypsINwGjh0qwAaULmyc18fSmeTbhZaPsYx7JOmK5tsoXZ2RfMr
	0fk+AHqjqeTsEM0gNvXkbZrgMnhrtqL236KzNeLRVRtjnyDPmAMIeVzL5sQnt+n65r50423zIv1
	Zijw5+27qSAo6Q6BSUK51XCU+CIsW+4XPDE/Dlm9Cj1umL/gxFuzFw6snDk0RcVNI9ZsQVDOxw9
	5lzXR4NQ0EGNJsJ4iMKMtVNDV004lNpI5SMNgqHGAHkN9Ohkz5gGfcyZeGCUUyH+j7rOzOnn9e/
	UnDGLvQBY9+EuAe+dvITc10NJ+xBGgVFgVGAqQHdouCFKwik7+cLGRJu8tuZ9+T0tz5Lf3elonq
	e7CmOdqp4TfCVWnGFthTHcNmgsMUkj8ljj+M5bsbDAiy8imbu60cgFsSSTjp/P27Ea8D4HcCSHE
	CeJ/EFXTaOE9gn+gbXg==
X-Received: by 2002:a05:600c:46d5:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb55a8329amr13702305e9.13.1794525271736;
        Thu, 12 Nov 2026 15:14:31 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm96030325e9.14.2026.11.12.15.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:14:30 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2226c85e-2902-4964-858a-2d1603263252@gmail.com>
Date: Thu, 12 Nov 2026 23:14:28 +0000
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
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Nicolas Schier <nsc@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
 <avQNdicGzL3De556@derry.ads.avm.de> <avWy2r1BcDatzwo1@lx-t490>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <avWy2r1BcDatzwo1@lx-t490>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K2GKi8S106PfrZNN3W4EREbC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K2GKi8S106PfrZNN3W4EREbC
Content-Type: multipart/mixed; boundary="------------onQYsP5IVHvnHSUuO3vsIGv7";
 protected-headers="v1"; hp="clear"
Message-ID: <2226c85e-2902-4964-858a-2d1603263252@gmail.com>
Date: Thu, 12 Nov 2026 23:14:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Nicolas Schier <nsc@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
 <avQNdicGzL3De556@derry.ads.avm.de> <avWy2r1BcDatzwo1@lx-t490>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <avWy2r1BcDatzwo1@lx-t490>

--------------onQYsP5IVHvnHSUuO3vsIGv7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/12/26 12:36, Ahmed S. Darwish wrote:
> Hi Nicolas,
>=20
> On Wed, 11 Nov 2026, Nicolas Schier wrote:
>> Thanks!  I know some people who are definitly interested in such a
>> config policy checker.
>>
> Great, thanks!
>=20
> I hope this leads to more mainline kernel configuration policies as wel=
l.
>=20
> On the user-space side, it's one of the reasons I'm versioning the sche=
ma
> in v2.  This way, projects like systemd can ship their own kernel polic=
y
> file, and that policy will be guaranteed to work with all future versio=
ns
> of this tool.
>=20
> So it's all mainline-first; both kernel upstream and userspace downstre=
am.
>=20
>> Please prepare a new MAINTAINERS entry in a respin.
> Sure.
>=20
> Beside a separate entry for the checker itself, I'll also add:
>=20
>     F: tools/kconfig-audit/policies/preempt_rt.yml
>=20
> to the 'Real-time Linux (PREEMPT_RT)' entry.
>=20
>> Are you planning to maintain it after inclusion?
> Yes, I'll be happy to maintain it.
>=20
> Would it be OK if one or two people from the Kconfig side also step-up =
as
> reviewrs?  Julian? Nicolas? Nathan?

I will politely decline the official title, but I will (unofficially)
watch and review some patches if merged :)

- Julian Braha

--------------onQYsP5IVHvnHSUuO3vsIGv7--

--------------K2GKi8S106PfrZNN3W4EREbC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavZIVQUDAAAAAAAKCRDElYPCBXNxICgY
AQCrg7omkjFSbzIwDbf86DhWih90vS9Sw1cD5XogAdL8JQEAugMEfkQyo0VYrMXEMxzxjaqaD4Dv
40JhZXotRyfJ9A8=
=Wy7B
-----END PGP SIGNATURE-----

--------------K2GKi8S106PfrZNN3W4EREbC--
