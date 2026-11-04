Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803754;
	b=pvEEp7UnRXRTuYawkBy8zaIuQx/MNCzY7ivrOV+s2Lvk2MS9v7uyBOvTh3oOyeJkxXQl
	 FxReHyQZPv8nAXspUGu184aFDT1KXFgtVI+8nqC4g3iyz6R7ctpeTwTtfIuQ/59TB6RHJ
	 AvvPSGR+CbmUzC3stnvYLSGdqUDRfBn9h9D6Kl6HcVP6gTIxarzzzpix4f23PyS+lgJ0M
	 hhHSC42D+7hcP4j3InYTFm9aVQ4n97zY13Ec88AttrWK/98+neai7HxYQ8KBwiorrm84Q
	 YqtsEWXwI3ArQNJJBAiqJ2v8c6gLXHTJO3SADgxcIjxv+RAMElRBHPkqoVfPPMmAEvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803754;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=G6B9uCJhaz/x6XC3vDz3LHbIW6JiHUlC6BCHCVTV+cE=;
	b=GnqLcrNFubsKptj/REgli76hBwwR+BkhBrCUDgiTlT9E0DTA5vTu685tm24UNjKXWOge
	 122SxHB5AmzKQ89DeNfqobGsCO+Nd1KmhLCFNHXXFT/RjpK0uPfOdG6E0jSIhr7LqT3Kv
	 JVL5RAVzFHZHiKyc13IkM/cAZMrrIpDeYFj1uMGqmeRnS3qajJSd6DnRgzo88+kqhN4s9
	 Ndk3mWCWzxzSLddySwtVsqveieJG7yU07Tc/MCPy6yIdIspbaJirl8i2SjQFca53NNOfm
	 1MQi1NqCnBOOpZtHL/5bQCuIhTUorjmdnL4F1J3fqg2mSgwCaC8VEr8I99MKyBXwgQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="VD/qdt5w";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A9606A328;
	Wed,  4 Nov 2026 14:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2A9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=VD/qdt5w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G6B9uCJhaz/x6XC3vDz3LHbIW6JiHUlC6BCHCVTV+cE=; b=VD/qdt5wbi1+bX0xSrigYbL38R
	ZhEPk9M24lPed52CccRV86P/Xpg6Ktg+zUgAZFHBLKGW4TyFbjvV9a7LzuwMbd9Roo0Clec8kUfNP
	SIcKmNjNuW7GjSNplvnRDC7JrXHHj5JOUBJeV8Cz7z1gP+LaHDFyWEKj9yOzQsJbz3xc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xOcIM-00EKwu-HS; Wed, 04 Nov 2026 15:48:58 +0100
Date: Wed, 4 Nov 2026 15:48:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Doug Ledford <doug.ledford@hpe.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Sandeep Bhoot <sandeep.bhoot@hpe.com>,
	Iraimani P <iraimani.pavadai@hpe.com>,
	Mamila Santosh <santosh-kumar.mamila@hpe.com>,
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
Message-ID: <52b6596b-385e-4ed2-a6c8-d0774b4be127@lunn.ch>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
 <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>

> My first request was an answer to the question: Should this driver go
> through the netdev community or should it go through the rdma community?

Does it actually make a difference? You need a driver which is
reviewable. Either the netdev community or the RDMA community needs to
review it. Being more of an embedded person, i don't follow RDMA, so
don't know its policies. Maybe they will accept much bigger patchsets
for review than netdev?

But you need to be careful. If you go the RDMA route, you cannot use
any netdev UAPI APIs except in your thin layer on top. Is that
possible?

A bit of an aside. Do you have the complete history of the driver?
What did the first 10 patches do? When bringing up new hardware, you
start small and get a little piece working. In a traditional Ethernet
driver, you get a base driver just probing and printing Hello
World. You then might write an MDIO bus driver, you can see the MDIO
and MDC signals wiggle on an oscilloscope, and then find the PHY.

I'm assuming you did something similar, small bits of code you could
somehow test. Those small bits of code, step by step development, are
generally easy to review.

> The second request, assuming the netdev community decided that this
> driver could/should go through here, was guidance on the sysfs usage.

Generally, none. We just want a plain, boring netdev, which looks the
same as every other plain boring netdev in the kernel. OS 101, the OS
is there to abstract over the hardware so all hardware looks the same.

Now, if your sysfs is controlling something described in 802.3,
something which other vendors are likely to implement, them you should
submit patches which make it an official UAPI, which all vendors can
use. Extend ethtool etc.

You can use fwctl. But you need to be careful. The netdev policy is
that it cannot be used in a netdev. You cannot use it for anything
which is networking, defined in 802.1/802.3 etc. But you can use it in
your base driver, for anything which is not 802.1/802.3 etc.

	Andrew
