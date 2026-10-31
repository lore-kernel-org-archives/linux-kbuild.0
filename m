Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477878;
	b=vqGpIQOsH9WYmn8bcF/ln5ZGZO7lJo985BmUMTa6WV8DXfkyL/yx37hw2rJasf+u1t+z
	 PYe0hCKHjsoPwYJxYUvho44f0E9EmfLI4MNdSvn0EUIT1Cjy2oFnjABJ9FeiGtPKg4K7s
	 ZEwtWUhsnqLpUGRPKBuQ32QZ7xHuBTISHEbJ0G44xQNRfAZ607ISeyLBlEMxOt18nLqZ3
	 PqZZbF9ePqddIZRB0CsE3WfH+ScfJ37wSbfjT28z5O7bSqnjS013k6m//RvEcXlYXZahw
	 jHIpkDpu3f6P+UhW6oe6vbfux74HRLXAlpCFMtVknuAVjc9fkeKDtTkjasRor1UZGvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477878;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=/BmtKe0LviVJcdQYrKqkYdveUKdihwjDIkPXLIvZk8A=;
	b=YcIoZE0kP+ADQgDFk2gVQ87Zy3eSiYmXI3S/eiWaXp0Ket2sv9bMw+wyuPUSnI+uEVij
	 7vZCrMBJCo8mgVLNizxedz/Koczd9kkDasJmLrWH2RaAnguidC1H+PizBxBWbLW/Q1iNR
	 bVS49VMHFby6oE7etJz9n6lRzw552wj2BSNSXAbNGNNeh5LZpORXmGyu6Dxe+nn6krH26
	 /N13zoQCxgyfALWz88Go1nk6ziRXhoRArEWyTqmtrDQ5NhsM103M3F5YZJaMDL7oUgG1z
	 DmyDA6pQE2n+Kj4y2dlg9IejaNzg/lhOGZYD46NAa3cwR9qO80CiKC56z0Ae/XicRVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="0//m+9ih";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D96606A31A;
	Sat, 31 Oct 2026 20:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D96606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0//m+9ih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=/BmtKe0LviVJcdQYrKqkYdveUKdihwjDIkPXLIvZk8A=; b=0/
	/m+9ihBWBR8ndOxXTEqWm7kitFVZmONuG+vliWI2IN/sHChgqxUp0UAVOBaUnRUYYKEt237PTxh8c
	hey+de0P89JQ1ycRfB/tMNC9g43UpZEJBFt4C82r34GKdaFUwP8WhgABix/gZbBtxAKd2gN69K23i
	zq9rIcfZDMuPa1o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNFW6-00DZDw-Da; Sat, 31 Oct 2026 21:17:30 +0100
Date: Sat, 31 Oct 2026 21:17:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Doug Ledford <doug.ledford@hpe.com>,
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
	Mamila Santosh <santosh-kumar.mamila@hpe.com>
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
Message-ID: <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030151121.1f232b50@kernel.org>

On Fri, Oct 30, 2026 at 03:11:21PM -0700, Jakub Kicinski wrote:
> On Fri, 30 Oct 2026 13:58:56 -0700 Doug Ledford wrote:
> >  416 files changed, 185137 insertions(+)
> 
> 🤣️

Yes, this patchset is going nowhere.

Please throw out everything except the absolute bare minimum.
Ethtool, is not needed in the first patchset. All the UAPI stuff is
not needed. All the sysfs stuff is gone. One PF, no VF. All the custom
debug macros can go, etc.

If you manage to get that absolute minimum base driver merged, you can
then start adding patchsets to flesh out the driver. Eventually you
can get to the controversial stuff, like sysfs, uapi, etc, and you can
argue your case why your driver is special and needs this.

And as a bit of an aside, how much has an LLM been chewing on the code
and spitting out issues? The prompts used by netdev are available, you
can run it yourself. So you might want to address as many as you can
before posting code to the list. That will avoid you reaching v42 of
the absolute bare minimum patchset.

      Andrew
