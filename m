Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984291;
	b=rdu/XMuk31w4kI/1vYbOF+S179YhulI9+y6GtYpxmqm1QNLHa4L5zD4utegBiEwL1fqH
	 tOWqDozSanetDiUlFL0+TgrtzsVtTtPeFSPDkiF2WIHJw6JiMcv9ZtrhmCfv8Oc666r50
	 1HKNHMqDBegmEUFzM6DANg2P7TWVnO9ph6HfdcIl/GRc4zRMsPvpxzveEEpOLdzI2czIh
	 hcQpiajXxkHVGEO78voFgxeV/vadbrh8MZozg51n05guAnc4JwepcA8CRNYFOangnwKzS
	 Imv+/VS1hU0qo9Oh6IFPiCrObx5ezbqG0Eqdj+ILnPTJLrYScCnJh8Xu3nOucWscrDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
	b=zMKAQvFXxU+bleMvBpbbqpsOxl4+k7qKze2XXuFFbWLPF/HzED8qnQtQHpdlyGNXowkH
	 D2Nle/a0BHCPkBGlDbDy24+PndJoMKyIGt6nTBmKvLhpzj3Mva5iMRew8AcyT2pCapoZQ
	 EuQaTgGMabss0kBaUwCED+h1WoJH/opOHdjLo+G0xABrxSaliBu2KIn1lIkZlRFb6JcHL
	 fdO/NI8CbTw6578p0S0G5cPV+tj/VzeAjRuOA+bEQd1+ADHZ4OZ+ccedDbiwpmQmbD/34
	 DadI2VWVKdr5BnWEk8ru0JgHFZWgYpEUpjTsfUtnLovP5x72lQuW53nTU6drdLCdosg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gin1H2B7;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475EB606A32D
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 16:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475EB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gin1H2B7
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so5552195e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 08:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793984290; x=1794589090; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
        b=Gin1H2B7wRNxcbyBjdL47uyUsygj6jXUQQMLnvnt70dhjtMpIp0wxMNHuLJ3+or5KW
         VtUGmlr6/jQOgAQ0l+85oN7AjQUcvwmjRMy2hj3TSQDg4RBl8NJmPTuFn2RIYcfiwrXt
         m0vyrORwQ5eI+N/DwsQlHzty5n5YE+Lp+GwKf27yJ9ifctGHUWorj9kS69k+oeddpxxd
         nq/qxFZ0gb1mL+p8C60sMHqS+YmtTW0M/GR+lDcVg90mirmvj31J0rd0Gxm9oGyTl3TN
         ZB6d2pS15uTIOuf0Nz585VVcpSAjMwFmOsa1HXyGzI9BJV8TDk3f/rY48Ch6LXUrEkwZ
         woiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984290; x=1794589090;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR15PMze+HXvf4bfvFEctvvE9+eNUsNFEYsIngDBI2g=;
        b=EN3GhojPlZR0hREz1lavQKeYPm7NyGd0mk6H8SDpMflTuAbMpz84HAJY98lWBLe1Gx
         1fdrfOB2tyW/F7IDt+b2vroHs/7oao3HcHH0DOh960H7fbOureLqVBc+JK5RNNc5sP9c
         5IGISv1cJvW+LuGwfE0MMW94bk1uwWwfvEsxC1T/7UUY1r7DREnhkSDMy2/joqxR7lft
         x4hvx646KdR9pGndIz/mbeKt4mF2mv3uxxdxqBOjUJco8/qWM/sYezHaJf7u4BKsNq8M
         TGYjWFyq6RKm9tZKLr812ftU6KvirmIT/bGdfnLJavPHplNDSgH7n7wZAiaLJ6yh43LS
         xjYA==
X-Forwarded-Encrypted: i=1; AKwUvBzZztGXbrh2kj/VomPCJt/pWKkEfUqDbRpwP7pM0IWQByHHOiN64yf/FTUB02kbTM63W1vko/rNcX7aUg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vrqkrFSD5c4wagzYgIw6H7gEkUI9rGyUAKv+SNy+KSB63IJjp
	O1EdmxpHJubVQ0BPjMynwmaArpK0QLcSe8z5J0FQo8V0irA1ucv+PX0b
X-Gm-Gg: AYBFou3BOAV9EJqyA4nt6rvMtDwnvyszxWWQ/qOTRz2mQQtNbjdtYcxPP3Szt6+raaU
	07X9W4wva7r3wzgwa+UBwJYtaRMDZXvVpP+UdX59GlPAGPL6t4fACMB9MtI1Dyd6Yp3jsS1Eckz
	uJ0qRh+uepK+yn32x8geYeDQu1ZTV1HsoEo3rHRV4KUzmbL4fX6eOAZXVEo9azmTUsg9+1p1bXZ
	BS3yAZI4Ozen5MGp3R5RyvrZLimLVTukNb91RSUOFahjR56l+UOkr5hDLRsXqrh7Hu5L3B/RCZp
	uYzsAfJWB63IZIRDoXsDU0+ZMWFRS73y3o0MWjd0sZWERQ8CBeC5Ah86rNer6xG8++IXHssx57Z
	IdDDOGJBhE+KmaAl5/inaES8gYGDWCfXS9ySqA4dWoXlwnpjiNL8GYk4JNl99dAG0EyfdUKuWom
	19Ha0PG2ATq373IBAN+iY7QcWC2T6UHvVlA97wLvO1DiAONvssGQ66eIzAy3/F2730OpAHd9MBc
	07aXOA1NSr7kcbPtstPItgpkqrTRGfe7AyfnU0MMhxajwQ++zHriNceZntUCdFtDN9hA3ci9ou/
	Y8jz7lvBp4xa8IRLo3qYgXFBzDf0mpdQmT3c3xv2L/wbvix5SleDiDwiWFwpZQXqqJiXmpb8wCH
	+rLPAY11LiWj/XmTbdtSv
X-Received: by 2002:a05:600c:4e8b:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b6de4a6fc0mr55795315e9.11.1793984289501;
        Fri, 06 Nov 2026 08:58:09 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm176253205e9.15.2026.11.06.08.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 08:58:08 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c855ad2d-2d30-4a49-8bdc-3adde0ead951@gmail.com>
Date: Fri, 6 Nov 2026 16:58:07 +0000
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
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org,
 nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com,
 jakub.git@horky.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261010095001.265759-1-julianbraha@gmail.com>
 <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fFUEAkC32a0sU4w7dqS1o43G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fFUEAkC32a0sU4w7dqS1o43G
Content-Type: multipart/mixed; boundary="------------uCKM7dDNQohHbh0KBfQRDc9s";
 protected-headers="v1"; hp="clear"
Message-ID: <c855ad2d-2d30-4a49-8bdc-3adde0ead951@gmail.com>
Date: Fri, 6 Nov 2026 16:58:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org,
 nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com,
 jakub.git@horky.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261010095001.265759-1-julianbraha@gmail.com>
 <179385226473.826739.16877681288448258281.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179385226473.826739.16877681288448258281.b4-review@b4>

--------------uCKM7dDNQohHbh0KBfQRDc9s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/5/26 04:17, Nathan Chancellor wrote:
>> In an offline conversation, Miguel Ojeda reported that scrolling
>> horizontally in menuconfig's search to read RUST's dependencies has be=
en
>> slowing down debugging.
>>
>> Let's wrap expressions (like in the 'Depends on', 'Selected by', or
>> 'Range' sections) between tokens at the end of the window, such that e=
ach
>> line begins with the same indentation. Ensure the '!' negation stays
>> attached to the left side of the option symbol, and keep the value
>> annotation attached to the right side when wrapping.
>>
>> Note that the 'help' textbox uses the same expression printer as searc=
h,
>> so this has the side effect of improving the formatting in 'help', too=
=2E
>>
>> In the future, we should consider a larger revamp that would wrap all =
text
>> in the search window, allowing us to safely disable horizontal scrolli=
ng.
>>
>> Assisted-by: LLM
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> I spend some time searching for random symbols to see if all long
> depends or selects lines looked seriously broken and I did not find
> anything.
>=20
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>=20
> Like you said down thread, this seems much better than what we currentl=
y
> have, which is nothing. The Sashiko comments [1] seem rather contrived
> (if valid at all, I did not check closely) but it seems reasonable not
> to get things wrong off rip so with those fixed (if necessary), we can
> probably get this into -next to see if there is anyting we immediately
> need to tweak.

Thanks for taking a look!

I can confirm that the findings are true positives, but it's a mixed
amount of contrived-ness:
(1) there actually are some Kconfig string constants in use with
trailing '!' characters. Rare usage, but not overly contrived.
(2) the leading space problem is much less realistic: technically yes,
Kconfig allows strings to have leading spaces. But no constants in-tree
are using that and I can't imagine potential use cases.

I've thought about tightening input validation to disallow leading
spaces in strings, but I suppose it's _possible_ the host has a poorly
formatted env var, and preprocessing Kconfig macros should probably not
be the place where that gets caught...

Okay, so resolving sashiko's alarms belongs here.

It's taking me longer than expected (why is expression printing this
complicated?) so let's see if I can finish v2 this weekend; I agree on
giving this its fair time in -next.

- Julian Braha

--------------uCKM7dDNQohHbh0KBfQRDc9s--

--------------fFUEAkC32a0sU4w7dqS1o43G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCau4HHwUDAAAAAAAKCRDElYPCBXNxIFKr
AQCrhnSPHcHE+swEYsZ/SIizzkKit9xBCx5qG07aLfWfpgEAv9xaTjeThzK/bKy4bN4It816GVjU
jxvCawJTIw4GLgw=
=zWGj
-----END PGP SIGNATURE-----

--------------fFUEAkC32a0sU4w7dqS1o43G--
