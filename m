Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793455102;
	b=PZPyNN8L2z5yMjPWc0mpzrbhaNx4CFWnVP5HE/vwtl4+rKPhvvz80khtKjndB7TalkpX
	 cB+wYl54Qa9sd1329qHbiZrdtIjKjRclk4VckpQDi4xtiVFdtTABxyP18H0QifrkXXrGD
	 y+hgO0//H4frs3hN/sKmS4euqbHW2ZXH0WcSbccqvKBmc7QAcltXG9Pkm71bXlXTd0dkO
	 O+cLgcJ+CbEc0KjyWEVeyFWHHn8mnjpq7cd2s463kKh+NCosw0xe4r8QEA04a+KfRVHje
	 M3xhCas5kLH+k1Trz0H16DKX6ugRNCgddmn0lur79xoJoWmnhB8EMod5h/9M0VMkIXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793455102;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=KdwwhQ4hmLe2ojysKovryYH2AE4HDI2oZLgU2MxJ0ZM=;
	b=A2dnR3KZh3+sKFBAyvMlQlu2+AybGPM3OpURLZ8y9ODL1S9eA/Am7NiLkEe1SpfUfZQa
	 NXb6YoHTqZ352PZksnF//rzQ3kZwYhB7FHeoz5QoiWuPMgfnfrLpHtQ4hYBqEGKuovLJm
	 svpndXHZqsvwTd7hXJk7a8MogmpEFQiIXA2h9OPkg2IR5xucPwFYcUJ6t8XmY/8ZE9Urr
	 lodgW0tNGhviMunavtuo0UA/ak8aYxSxk8oI+Ugeq7pCUS6dbmvvad/8Rh6X85MhzIRQV
	 FMvn4R9t/qexo+H1z4kCdWYdRmy7xEuW8N6cCffNe6zHDORfqtVsMyw/D3qCCl2atvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=isS3ErHr;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04866606A31A;
	Sat, 31 Oct 2026 13:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04866606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=isS3ErHr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KdwwhQ4hmLe2ojysKovryYH2AE4HDI2oZLgU2MxJ0ZM=; b=isS3ErHrsAIzCMLoNHWkaFEAo7
	YDK0QFMSiHyKxc8ya1zB0lmWd/pAdj5U1Cq+UYbVQIOsC8uSuAYH08Bjyo0b5Zm2g+9RN6QBGMRV4
	p8BkUQH/AXKoZ8u69b8GcgH30oglb6EBdHEJPZOcMCSntSFt6nhUSX5furwaDQK24Ch4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xN9au-00DX5Y-MN; Sat, 31 Oct 2026 14:58:04 +0100
Date: Sat, 31 Oct 2026 14:58:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Doug Ledford <doug.ledford@hpe.com>
Cc: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Sandeep Bhoot <sandeep.bhoot@hpe.com>
Subject: Re: [PATCH 01/23] net: hpe: ss1: add the Cassini headers
Message-ID: <531c7d63-548f-467e-95df-187214ff344d@lunn.ch>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-1-8c2c391cc283@hpe.com>
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
In-Reply-To: <20261030-cxi-netdev-submission-v1-1-8c2c391cc283@hpe.com>

On Fri, Oct 30, 2026 at 01:58:57PM -0700, Doug Ledford wrote:
> Start the Cassini core driver (cxi-ss1) with its headers: the register
> and counter definitions, error definitions, telemetry item tables, and
> the CXI interface (cxi.h, cxi_prov_hw.h, libcassini.h) through which
> client drivers use the NIC.
> 
> The cassini_* headers are generated from the hardware description and
> are not meant to be edited by hand, so they carry the generator's
> formatting.  cassini_user_defs.h is shared byte-for-byte with the user
> space libraries and is therefore under include/uapi/ethernet.

You want to keep the UAPI as small as possible, because once this is
merged, it can never change in ways that break backwards
compatibility. 

We also strongly discourage APIs that allow user space drivers, which,
at first glance, such definitions would allow. 


> It
> provides inline accessors that need errno.h, string.h and size_t,
> which a standalone UAPI header cannot assume, so this patch excludes
> it from the UAPI header self-test.

Does any other driver do this? If you are doing something which no
other driver does, it is probably broken.

> checkpatch --strict (100 columns) still reports the following in this
> patch.

netdev prefers 80.

> They need coordination with the internal repositories this code
> is maintained in and will be fixed in V2:

Your internal repos don't matter. Once this is merged it has a life of
its own.

	Andrew
