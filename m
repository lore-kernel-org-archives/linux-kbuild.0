Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804680;
	b=zllKJ7fj/+9Cf3E11VjPpRKQdAifSTNRV8BlS1GgVvPBYsjyY1qd4Dr+X0F/wqv4uizf
	 EigfXXeHj7PSDvDLk5vPCmS8s6s0IeruPCycAuDOn+Cnr0LEWMl0gcNhHfZQGyA4rk38c
	 WS+SMZ4Pz8oGpX99qfKYCgHSfZQWJuRRWjw+YwKfaZU3xBZuKeI1j3+fNLMAxVdE3xwtp
	 8PnVovbK4ZjP7zP2yh5YMQf1dlFuKyMFHDUc6wvf8rKImME/37CWN+9LYakcRaRatzocy
	 Cvrt86yUGYDr79YgnXPa9mrrHJou0ZPbfxbWqn9/jWCEsiItl2pUGTPos22lf4Pu8hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/kXFui2Y6M4wWVfeKvuvI3OBKJ8D0ABBqlzGf+qKuD4=;
	b=aJZkStmDjU+TpesuqBGauOE5BoYieQIxowuxKpgiB4np2UN8dLGfO1paXldhMI7tEZ4g
	 M0cRwxtrM6VK1D90tyLd4JVztJ+ZHT90+dD1bqigY7xJeDOv0jnxgDldWqdjzpfVF5J6T
	 EJSqfOBAXgHoMq7PM+nHJsuvz2pgArcMm718IAunSWOMoPO32zWgVBIEBzDG1cmMr+7b9
	 RQjVy7se+RDdDl5/+T2z8VHZYzXsDHncqTyMA+6SKzl5JAOXYCmSiqzT4k/ommMAG36hl
	 T3osP4gxbvEmvACFJgUURFSwM+0xOEg4cBLTZqbygodrfvT5YN7iPKj5c5tYF3rt9ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Bbfx10kC;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D62606D810
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 15:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D62606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Bbfx10kC
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-945ae2daa68so83221985a.1
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793804678; x=1794409478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/kXFui2Y6M4wWVfeKvuvI3OBKJ8D0ABBqlzGf+qKuD4=;
        b=Bbfx10kCLfB9Uhm6lrt1rASCnob60LxOUXr08+90qVn/ASfAZ7xASqarH1RPSS/b1s
         /zS4ijokVuFqt0K80Dw0r+/+KRN66qPWpcC97F7iSBe8FKkJ3TrwTnx95Tn1IqIO3CIx
         giaWBGS0ELPf2iT48QTnJRKhsKsNy7Epp4hs3ZDwjOjckm0vf5qJw+5WvPruFn8JNCSs
         QnHB+/7zhmCxv/cXfZR44mYrmYAEdrc8SzIM/JyuokKOmkLZEQZuUHqCMsiWa2m0x8/d
         Vd8gSS7Jum+OqYaPUK2Ba3sxi3zybKpj3aCPRG7j0Yp2pixsIWcHM6UgJ4Lcmp07ZHIW
         EXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804678; x=1794409478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kXFui2Y6M4wWVfeKvuvI3OBKJ8D0ABBqlzGf+qKuD4=;
        b=ziJXgIJXQ3IeHjHQ9kE5odsz8Dm51JQhzzeetOb9nOsGRj5bSJChRplvZnAw6ztrVf
         GJLIu5tw2ZCQa6hkMZRVk7DNlnneBRMHxFxyYHzQAklNGaV4Ab+vX1ZVWWhQ9u8uh1+B
         Cyf1lfexP2+74pWXtrxJWBf/aHbIzj2VtCsLU8btZq5JYhSX4F+FDmWJ/AH+0phyVIEQ
         44PwkqavmaNhfw79a9BioUeumpzJSl/7Ecr3+Vj0LtIkkWC0s+QmLU7raQDR+65bcsta
         b1WyBG87akzja55AIOgQTO58xhvPlAdIAsHajCncrA9hXlbFLcZXtPImlCAnJMUP3XGI
         987w==
X-Forwarded-Encrypted: i=1; AKwUvBzEsFOrHAUoNzTtG6b4yqlRL/CZ0Y4NbZCgU5T3/r18d479JPWYC/nE+36RIrDOigxOPacDaFig8hPmdTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XYYvYPt73L4oyXKnsKF9t5dYEg7x7lfz/Pa+0CmUTWsUQulkI
	MDfSnxiXmBZ+N3W0BBpk7gjg3S6P1CVounTqd3OhnSUVk95wUFJLnJfVQ3/MiePMjG8=
X-Gm-Gg: AYBFou3RtmdY5HcdjBW8kTWiRuxovfBo7yqh79YLqrVlRLlEg38+xEiyQYyTYLGktHe
	5YKL+q30kHzQH24U1dn/rMc6qBayo8zKExzFKSTbKAr1w3gr4Ow4j0wVi0ac5OCzkFLQfY4+2LH
	Zw/vkREKgqOCWnlYUMJPlJzS6alJuLREES89pzmc7WDOFAOw6yTgPmDOJBnnMsgVvTFR4hDz8kU
	oJJP/4g8LRXZi7CGyQFW37fv0cXix33xry+B8837StK6QIj+Ol9/GYFEW/zD5loECLjXOmJfUud
	iGooEnU7vzUn4A6xvdKv4q9gLf+yUxh+FbuzwkF+VxY5zfneCQTIvybjdEYH99lB7lwBASpCbcj
	CLlxMsb6hM5G6pYSV9msSCYKt2nRx3w1fBr5rP0nduP4s0bK2HE2VPx7E9kdDqGIanTJZiESYM2
	22n+FttDEECWc+xiXzcfuaqZ5J13gppwXRd48YDoqBVjw2S0gQD2dnssq11ZBZr6qBuNm4noPjP
	Cn/mZok78BTaL68gVbY/LLqq+OCOx1kdeV1Fp1hrzK3wGekOlbfskAKwpTaBsdUfUNlThl71JKC
	eR6TwcovGonuAfAzi+LwbIIDQaahc+gyzH3EUHI01IQ9+J8nqkBcGektabiTnsxIj8/0VBIFAHX
	f0alAHm4yOA==
X-Received: by 2002:a05:620a:6486:b0:93e:c12d:4ecc with SMTP id af79cd13be357-944134066famr2851022685a.44.1793804678031;
        Wed, 04 Nov 2026 07:04:38 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d47e72fbsm219471885a.18.2026.11.04.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:04:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOcXT-0000000GNdO-1REH;
	Wed, 04 Nov 2026 11:04:35 -0400
Date: Wed, 4 Nov 2026 11:04:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Doug Ledford <doug.ledford@hpe.com>, Jakub Kicinski <kuba@kernel.org>,
	Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Sandeep Bhoot <sandeep.bhoot@hpe.com>,
	Iraimani P <iraimani.pavadai@hpe.com>,
	Mamila Santosh <santosh-kumar.mamila@hpe.com>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
Message-ID: <20261104150435.GQ3889730@ziepe.ca>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
 <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
 <52b6596b-385e-4ed2-a6c8-d0774b4be127@lunn.ch>
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
In-Reply-To: <52b6596b-385e-4ed2-a6c8-d0774b4be127@lunn.ch>

On Wed, Nov 04, 2026 at 03:48:58PM +0100, Andrew Lunn wrote:

> A bit of an aside. Do you have the complete history of the driver?
> What did the first 10 patches do? When bringing up new hardware, you
> start small and get a little piece working. 

If you are implementing a driver from a datasheet, sure.

However a device like this was almost certainly co-designed in a chip
simulator along side the HW and by the time the HW was done they had a
mostly complete driver ready to go. The actual baked chip probably
never ran a driver like you are imagining.

> I'm assuming you did something similar, small bits of code you could
> somehow test. Those small bits of code, step by step development, are
> generally easy to review.

When you are co-designing with a chip simulator things work
differently, you'd focus on the more risky parts of the IP and do
partial driver flows and so on to vet things out. Lots of carefully
orchestrated shortcuts. Then you take that and assemble a complete
driver to run more complete sim passes. As this progresses the HW is
changing underneath and the SW is following along.

So it is completely understandable they ended up with a completed
driver at the end of the process rather than a bunch of logical small
steps.

> Generally, none. We just want a plain, boring netdev, which looks the
> same as every other plain boring netdev in the kernel. OS 101, the OS
> is there to abstract over the hardware so all hardware looks the same.

Yeah, this is a reasonable place to start. I also discourage any uAPI
introduction into any new drivers. Start with the basics then we can
talk about why it needs new uAPI point by point.

Jason
