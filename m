Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629633;
	b=Fq7q5XCEhfsxEsb3rmEP+fCJrEQLzuEB7OkJceI3T/Hm2w3lzgKrLsf8j022633OOwOr
	 NYArzGE/QkkYKGJF/j3yzIWLoDPYBOAx+AoUV/+4bgLJnBd9Pn3cxp5s2oXrJZWQr5GZC
	 X/w2D+iiAU1zFtD9eQXLWcEChxnJZDB4p6npiMW4qT98b0rdh4i/IMoIrIwZ+SlONzEkT
	 VqoQTHzqbc4Qb0LepLfL2QXuKwkwmv1KXbojvgAstOSF/zDjgFhVHCAYWUhprWFanRlOC
	 gTP1Sq7T8WzfbS9uoYDUf+s97DAfKmMhZLQosJLUq/OtE5hhv5OfmVVemQ1Y0GPWDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629633;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=fGdAAPG3/kgbevcrSXbBGlUJfMVBMU/5Awb3Piy6wyk=;
	b=iZ2AaLjHmOEnGlfktIgEd8dIQOeS1wspklqRRJYBDV9q24vZjV67zU/QxoCWGIw73cD/
	 UAKH7CBXsTqcnD+Nl+8DBXLIRk9pgKZqNCebOeqabnLabS8wHYxuYI5qZC8wHEPdplCH7
	 qJHJ6NSTOvcupjWfQb3pXZK1XSP69FD6lr5G6SZaLlumiu6SqHEnaGnh0Q3gaRMtX7IYa
	 NxUj9HOx0FogoM1K/iZjQ3NBRtIakPhd+YIddv/ilXEq7l7kTKyrpa88RtWcEOyxK5gty
	 udwMjcaMmzwCIc2kc6rV1kYR65Joo8VaM7AwIlO8mCxbSD5CLV6qI6xnNkF48uiu/QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=32VRT5y7;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330C560A3802;
	Mon,  2 Nov 2026 14:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 330C560A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=32VRT5y7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=fGdAAPG3/kgbevcrSXbBGlUJfMVBMU/5Awb3Piy6wyk=; b=32
	VRT5y7g8A5pbHx3zjUJX9yrQXbqZaTMMT0+mEMXEraa5UH55IHMGKu/inQ8c6Zyug1wcrgam2yxgE
	RtT8u2JsQBo8WCpxH5wo3AMfLrOsf54aXN1Bkdc9+k0K76ZCc4yeQlhBLw3XtwWI/X1NAXTeh6yk4
	/Sm1vY5tSk/ST4k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNszw-00Do9W-KA; Mon, 02 Nov 2026 15:26:56 +0100
Date: Mon, 2 Nov 2026 15:26:56 +0100
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
	Mamila Santosh <santosh-kumar.mamila@hpe.com>
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
Message-ID: <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
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
In-Reply-To: <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>

On Sun, Nov 01, 2026 at 07:45:24PM -0800, Doug Ledford wrote:
> On 11/1/26 5:35 PM, Andrew Lunn wrote:
> >> I'll see how fast I can get that done.  But "the bare minimum" is going
> >> to be more than you are accustomed to.  This hardware does not receive
> >> Ethernet packets using MAC address like normal Ethernet hardware.  It
> >> uses a special portal table entry that filters in the Ethernet packets.
> >> It has the ability to have different filters that receive different
> >> Ethernet packets and so sorts them before the driver ever sees them.
> > 
> > Can you add a single portal entry which matches everything? Or matches
> > a single MAC address? KISS.
> 
> That's a complex question, and one which I need to go talk to one of the
> hardware engineers about.  It also varies based upon your meaning of
> "everything".  If, by everything you means essentially promiscuous mode,
> then that's not a good idea.  On the fabric there is Ethernet traffic,
> but there is also Slingshot traffic.  They use totally different frame
> types.  If you truly go for "everything", you'll get Slingshot traffic
> along with Ethernet traffic and you'll be throwing away tons of garbage
> and generally wondering what's going on.

The point is you want a very simple driver which it is possible to
review.

This is one of those 0, 1, many cases. Just having one portal entry
means you don't need any allocation algorithm, you don't need recovery
when it overflows, you don't need to be able to replace it, reference
counting, etc. It gives you a starting point to expand later in a
followup patch set which adds all these things.

The network stack is happy to handle promiscuous mode, it does it all
the time when you use ethtool and put the interface into promisc mode.
It is clearly not as efficient as having the hardware doing filtering,
but it works.

> If by "everything" you just
> mean "all Ethernet traffic on a single portal entry", that's when I have
> to go talk to the hardware engineers.  They have different lists they
> use for Ethernet and I can't say for certain that the hardware will
> allow not using those lists.  For instance, one of the lists might be
> specifically for packets that have been fragmented and if you don't use
> that list for those packets it may not receive them at all.

Think about this from the other direction. How does promisc mode work?

> The card has a burned in MAC address.

That is one of the MAC addresses it needs to receive. But when you
come to implement .ndo_set_rx_mode you are given a list of unicast and
multicast MAC addresses you are supposed to receive. And if the
hardware cannot do a perfect match, you do a less perfect match and
let the stack deal with the rest.

> I did have the AI do a full analysis of what you requested.  A bare
> minimal driver.  It passed this back (just giving the summary, not the
> full report):
> 
> Estimated total for a C2-only, PF-only Ethernet series:
> 
> ss1 about 19–20k
> SL about 15–20k
> headers about 15–20k
> That gives roughly 50–60k lines, or about 65k if C1 support stays.

How does it define bare minimum.

If you have thrown out ethtool, you cannot change or report the link
speed. If you cannot change the link speed, and you have followed IEEE
802.3, your PCS will probably just come up when powered on, since the
standard gives the registers sensible defaults. So all your PCS driver
needs to do is poll for link. A typical PCS driver is around 2K lines
of code, and that actually does more.

    Andrew
