Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641178;
	b=i7lp6PlsGEeXO0GY5ikRMMMzR944hWS3ABlLIuOseta6CrFjdk7r/6/AdswZcpEKnFBC
	 ELCmYyAkmKjP2pj9ijcct5yEa22ERjup05WEh9ZWr98tubWelwiExvUroPZDQHrr+vafw
	 74nbXkcqWeiotgrmWX7Oly/kSgiwXGkrCq5RjzIX1sDj9Vc2WElc7Z0ruTfVZ6dp3Pvi1
	 h61rkQDpXN59J8LucBQ7Dm6tdaJKchualXLS39Yu6Re+zwgffilLhkPF5hcRvQ53HQkqW
	 fVB5waLP0fRSqj22osu9igA3crTIlbZAXfCwpTwLnnqv+Sex0Nu5RcVhI8+/o3iZixg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641178;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=M46t8w35UxmCjuKGOfV083QezXATTtv2L3yE3JiuDI8=;
	b=uU+Q97Y4G376BR/LolJ87/K9nmZx1e7FjLfem/eWKLx5B1i4SRa8+4fJ67zSFv0pXxKx
	 PrS7/xdQpJMbSwTpmw+jJ9kfHRX+g1lOJqcK4Z4PhltvgWPXL4bsmuZkgVbCtKblea0l9
	 H/Zehhdf+ri4pEJ4GIsKP4l6xnHoL7u/8H11b+ZIt81+il+QC3qnNe5F4MO9Sk/7mFLz3
	 8/hvJRFgN+GwLTapLhrUx/4SzKcK79yPG15rGJYTw9kvsdPQFDlp5mlmajhKxRuUaqVzN
	 9ONUOruBGpKgFtM5UlwBrANnksYswaWixQ2W6OcW8+W49rPw2wt1qxBw4F1wWUGZ+GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=O4pF9ElD;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF313606A90B;
	Mon,  2 Nov 2026 17:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF313606A90B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=O4pF9ElD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M46t8w35UxmCjuKGOfV083QezXATTtv2L3yE3JiuDI8=; b=O4pF9ElDREeZJBt2Twdm9bHx3p
	RvII/Jl/3ovHIH8t28+GJelDonfwvf549+iV18nBRWLoOfVJeR7EyBScHJ8WVjAOUjBsZVx6dTgtH
	G8s39MPwWuLKoYTllh8W3tR/UKI1cKV7V/h0GCS1hzakcQ4+afF38zEtzSo/92qgHlWM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNw08-00DqNp-QN; Mon, 02 Nov 2026 18:39:20 +0100
Date: Mon, 2 Nov 2026 18:39:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Doug Ledford <doug.ledford@hpe.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jakub Kicinski <kuba@kernel.org>,
	Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Sandeep Bhoot <sandeep.bhoot@hpe.com>,
	Iraimani P <iraimani.pavadai@hpe.com>,
	Mamila Santosh <santosh-kumar.mamila@hpe.com>
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
Message-ID: <a5ed91f4-7d53-41fb-9661-ecb4507089b7@lunn.ch>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <71e3083f-c845-4953-80b7-38682a4cd84a@roeck-us.net>
 <f235dd80-477a-44ea-955e-93252ae4e7dc@hpe.com>
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
In-Reply-To: <f235dd80-477a-44ea-955e-93252ae4e7dc@hpe.com>

> Our only allowed AI inside HPE is Github CoPilot.

Now think about that you are posting the driver to a public mailing
list, to be archive forever. All your customers have the driver, there
is nothing secret in the driver. It is GPL licensed code.

Does this policy make any sense, in this case?

     Andrew
