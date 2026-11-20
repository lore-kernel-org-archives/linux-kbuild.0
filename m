Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173952;
	b=M4v8rK//XsKqZu+ouVTzVLDH1lNXT4sA1J6QMDYUQAcs5dYFZgwRi/TByBuhAgUhVApZ
	 WW8UEpP14QdSZaBHzFPRAjkzfv4h/YXF4uacUp9q9RTa9L3W7QRzXLEJAigCF8A/lKJBR
	 oXyDsqEdhe+zmb5XQ3nvf7iRWDNq/PxYsFu2sogeBB8XNdm8w6OYNwnDWRmJ0pFGLg2qv
	 dJE44TY/AP2Pcbrj5INWyH1XQRWyc4pbTi373napp+9uvQrlUSzEs/nQ0L0d0BCEsCg9I
	 Bz4EvN4gst40Fzu3n4PtEjJ9eA/yvB2Sj4iHe/4Kz86KvUC8RbpXvF/y3InmEQqAiWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NcV0t79NYJ/mK1aZ8pQRTmJ9otnohMh+O0hfCgV3Lfg=;
	b=RdaCuUsAeCnIfARHflXMdafRZiLEHIgIWIG/0kAm0aiP+oZS5h/aedKfIyPbaYID7WrV
	 fyTe/XZgSD49ysnsFhLoTe/4OWFmWuTcN3te8ex7sv0cYAQKrhBmlqefPitUr4To0uSuT
	 fTU80a0BF/FTmQf+Iex6l5eyTMooq/t5BTjtPASC4EcXu8vMpGenGCH9Zfdm7c9rsAF4U
	 79ERFB7KSqe4hxm81To13z8+ndTc4QxSIjcrhba3jKFIgR/PB7UNYVwDU5WeqtT+zSnGT
	 jvsKcisJ0nZrmN56QfUVhYCPVY32a2ItxuGDRx4q6H2WRembxesdmfbt2gVifPQ+FlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CiypTjF2;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239A60A2612
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 11:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E239A60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CiypTjF2
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so7172215e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 03:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173950; x=1795778750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcV0t79NYJ/mK1aZ8pQRTmJ9otnohMh+O0hfCgV3Lfg=;
        b=CiypTjF2jy/+DduTc91OBItjPmjWpksDx731Tt8/ASANkcMr1qve4vciEqTA7oaXjS
         Xc1+NzyNM/1DbXQFxqX7HWPOn6ouSdVuX4ofW2to7spZnhnTL9JBforLhr/Dnzua54x+
         dVB1ngsDoIsn8vk6NHMS9eE2JwW0muMQwBMYLUNt/IMxqlhdj5Y2e0tA+MtWKgxPXVpW
         ThSeGhuoKFMCiAvhH6HiHCvM76x1BzJ15t5W0Fr9VLPZrwD8pVVhd2YSms8QQ2AbP1+e
         Pg1GX4IfQf91KCY6EVW1dUwu5e8lYiA9oSsKMy/zisB1TuqrmGv3rBGMzzgwsDwfN2T4
         Injg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173950; x=1795778750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcV0t79NYJ/mK1aZ8pQRTmJ9otnohMh+O0hfCgV3Lfg=;
        b=Mzlnil4fS6g/NN/te6D93t4o5ttsla6ArvCoscZKYwGhixD4HtxF9t0MNiCkFW8W8e
         jhIuN7zQu1TxPA1ugs0ZAT8EcVeAfXyY7geKHfewpdplkdzChCfqGraHdAMkVU3ukwbJ
         +3wYhAg3LN/y0+vW51vncGhRg6x+EuWwCXAuR6gjeUSBJbNUaa4KoLpS6EIbHstzgfUE
         NRqu1gM+CmIptOpi7uz1E7nU+qnEI+/2ynL+JtOHzshgWxD66OTvag59sx0h6HmWjyvk
         ZL8IJXvZoPZNN+9dYt9mIAGrscQodDHXyKPc6bLlVtByUDRiYmBpHW7pgJSK7HSfDIWg
         lRAQ==
X-Forwarded-Encrypted: i=1; AL+hErFb3eBbElqdUoj74q8lVv6oMum0NNuhqmnNx5r73Oz+E0fhrfsXQj8ONpLPpdjmtgBxpCQzppMw2Ryx3KE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oi0aDEFQz9SC6cNjAOX8m+1bLblrrG8Qj4oSYzyWkVicXYBFb
	dwGhzPCQJZQZGjI6vKVS+P5A+RTJ/nog/eEozmls0fLEfcFU+TDE3cI+CZXvkUVKE8w=
X-Gm-Gg: AYBFou3/qUe7D80duf4VgVBuC+2912yFymC4aUgtRnVRCWqRfZ2Hu+BvGzFquxLEFNK
	nP6BYhTdKKKdvnXoEGxDQHnbQpPdPmpwuInPWp21HVjV4TnGxEGqtFUjqj0N0I6QHZBYQQSZWmt
	K+nwVKQHqbMuDx3AiXQjkJAIwep8ygsqQOYUEnj50ab3aSVOZreAa69a71+QRjtJuJKUNn9YArh
	eOxVfTeezf6lE3Lp0k9rQsW2lYQ6y3Q6/Ud82JDBwuNC331DVyAbl1TubrcRFppjHMKD3m+lKYI
	TRfZm70MA2Xsyjti0h7YyI9TMzunr+AUHJM0KqSJ1dOEYqtcD0gxPo69KDTUr1SDisnx5wJihBu
	kMUDh38xSHddsvO7nmQnxoZMiHwXn0iu0o91+unesbhU0sgzJQiD2tAbZOg2fuwtVHkye8KFMsx
	QGmdoZdnUxQ5rVw/GY9EuPi6hNTB3nZqvccurz75+ieGJczt5rSb/CtNq9Lhu+jo4e6jT29IILw
	NWIEdgJXMZQmJZF3NltNeqrb2bY0OTOzUDOBJpolrsl4p+lqOC0HYFNF1PSbo+BHOgXftbK8IDE
	rKp8/0r0VueIcjnQDi7bIpqcuyM+GOgErsbUnZnWpK2kIVHecFwSrOC05K9dGgWzdps9DvbwtoM
	yhyaZIYWauiX7tyHp
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr56451745e9.11.1795173950208;
        Fri, 20 Nov 2026 03:25:50 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884b8429sm117437835e9.14.2026.11.20.03.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:25:49 -0800 (PST)
Date: Fri, 20 Nov 2026 12:25:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nicolas Schier <n.schier@fritz.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-kbuild@vger.kernel.org, linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"kernelci.org bot" <bot@kernelci.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH 2/2] devicetable-offsets: Get struct cpu_feature from a
 device-id header
Message-ID: <awAtvSIQeLJq2hvF@monoceros>
References: <179424040477.1704532.18231793404479518924.b4-ty@b4>
 <av8Uv7EV3sLqUBfr@derry.ads.avm.de>
 <20261119194738.GC875856@ax162>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tv3l72rardngbokt"
Content-Disposition: inline
In-Reply-To: <20261119194738.GC875856@ax162>


--tv3l72rardngbokt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] devicetable-offsets: Get struct cpu_feature from a
 device-id header
MIME-Version: 1.0

Hello,

On Thu, Nov 19, 2026 at 12:47:38PM -0700, Nathan Chancellor wrote:
> On Thu, Nov 19, 2026 at 04:24:47PM +0100, Nicolas Schier wrote:
> > So my questions:
> >=20
> >  * Shall we keep it the way it is to keep the original patch order
> >    (bisect might fail on the two commits before this patch)?
> >=20
> >  * Or shall the patch be moved before Uwe's (removing the 'Fixes' tag,
> >    and rewriting the commit msg)?
> >=20
> > I am in favor of the latter.  Are there any objections?
> >=20
> >=20
> > [1]: https://git.kernel.org/kbuild/c/f1dc66c38b7eb4b2fb946a2fd6929250ec=
d2d85a
> > [2]: https://patch.msgid.link/bc9fbf5784f6788e10c749a05d56c42bdb68f3d9.=
1792144769.git.u.kleine-koenig@baylibre.com
>=20
> If history is already being rewritten, I believe it is always good to
> fix potential bisection issues like this. Rewriting the commit message
> (and maybe some of the diff?) and placing it in an order such that the
> build cannot break sounds great to me (but others are free to disagree).

Full ack. I think the danger to hit that point during bisection is
small, but I like the 2nd option as this reduces the small chance to 0
in that case that people yell at me :-)

So from my side: go!

Best regards
Uwe

--tv3l72rardngbokt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsALjoACgkQj4D7WH0S
/k4lAAgAru4huUD6XgX/xEc0md/r2uTYSHfAeG9y3GIzcVC+zkGIzmFUEZ2+X4HN
rc4d07ok+2mGRZ9v9k7dO2SUzjDaoahlVqRd5ldtCwi2b03QrEfGe2Bkte8IiCCM
0vWjLcJWss62UN3gAxmKMHIxKvKcYFle+LjAYqi8dWM+YPc2SXS0gqmTZISLjEXN
HHeBGqcecdsyrFtzxYnMLvmdJ9vefsQNNlLcyy6V/EUtnk2yt1k5ZwXozAUEojXQ
OhiuLXypzkqUPvCXOQKtrqveg6g0hxnDtqlFTZfptssoqxNVMwLsN52Nsic5nzT2
9LO+HiyUPz5SPNVTac2QsyHue4WN2g==
=RzUQ
-----END PGP SIGNATURE-----

--tv3l72rardngbokt--
