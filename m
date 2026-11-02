Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793583359;
	b=ufhEAtfmcl5pHXOoi+h3cB1Uu1xLVM+6QKZ+e/orFZlMCHtjQCdi0JFTgchVoeIBdBgW
	 hsjyWd2bY/ba8hQLA0kI+CCsyGPK0l5Wi6GmhQUcNWaO6p9VTBeBezylNjwBg5G/+O0ZZ
	 Op28u9tEe7T5OOfsIr5XUxm0j2CMD8y03CM9PjFLhFMzarruX1NeHryG5NBgparwWnQMz
	 pVhNy75EDvB8Vkno4kogWTqJVYiCwFfU8DGL90bT+CO5lvErWYgsxYORrIHMPoUH16HTY
	 UopDBHoM0CGe6UHwnl6m/va6XnJFng5LUHBrarCO0rR9MqIgF0KS0HPrSC4SeQm0IuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793583359;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=dlU73RR5PLs3OxNGnWFwp4gEKCDYj3V/cQaaU2gVSyg=;
	b=X6fdVUsYQZ2JfEOp74swKkiMv2tbCXgyKUx6UuoCj6R7Bs1h0OaAGA4KaPOllGd9MS8P
	 vAaT3DrADHIStADEiAMQHpQjAR1EA2HvEWPlrEsySYd3iFRgpnwR7mpom/rvsWthaZeqr
	 GfyYwmwFDvOw1rz0870+0UytNdk8B9SXFzvAEMGXPmalsYdbet6Up4G5uz3bU4swrw/i2
	 JSmB10n3nmRVkI/q0XrdJ8Bi0fF5Zo1ZcthoGehejEArDFISm4101rnuXLwGXxmj/A/2e
	 9hZkKx7G8r71V78qbv4K5yeHaTIJxacKhQmsXlOBSTVe9brNoJWF7S08Q9dWwG0z0Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ujjqRWDL;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DC9606A324;
	Mon,  2 Nov 2026 01:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61DC9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ujjqRWDL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dlU73RR5PLs3OxNGnWFwp4gEKCDYj3V/cQaaU2gVSyg=; b=ujjqRWDLSM35ZXJrHv4cRciEhX
	ih9dwrbYjr+X+My4f5gNPokhio5aabBHAsqb8roJ4PwbG1Z1xLY/WUvAozOBpWxoOvxdbCGrmjONl
	SO9TL3QOPq8+zkMThYRdSkkOs8IpQU3b3cnKxOEcBqyBto4oeiHcq8MSXF8ahZ+f3TjM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNgxe-00DidV-5x; Mon, 02 Nov 2026 02:35:46 +0100
Date: Mon, 2 Nov 2026 02:35:46 +0100
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
Message-ID: <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
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
In-Reply-To: <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>

> I'll see how fast I can get that done.  But "the bare minimum" is going
> to be more than you are accustomed to.  This hardware does not receive
> Ethernet packets using MAC address like normal Ethernet hardware.  It
> uses a special portal table entry that filters in the Ethernet packets.
> It has the ability to have different filters that receive different
> Ethernet packets and so sorts them before the driver ever sees them.

Can you add a single portal entry which matches everything? Or matches
a single MAC address? KISS.

You can then add on the complexity of adding MAC addresses to the
table in later patchsets.

	Andrew
