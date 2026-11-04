Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799582;
	b=I//etTQDAl2oVj7gOvjl1OJ0u4+oLPBK8hGKKBtFpcZLNuW1ZgDqOnkCCw8xBrVTS58u
	 ekRPXUcxU3fZYOflBHgHdME60+96uN+pL+i2rU2W6Nh9luBboPpHjFHjWnwgNRRGu2Lp1
	 c5uF1lwNcD5tFY1oPUdcioRjXm6Vnr12zkmNKyLl34YdSxR+T2KKPrRw+VTmV3PszfIVc
	 /UxRBHB2TDbwPDE3UjpTX/ENO14GPET+43ccBKAnP1MBTUpPBBnojgDZkQtNy9osw7fwC
	 DbG8JmBIZkXdghkRumSYJss/QBpFtd/ru47dlOSf4l5imXKA5dIF41jr3w6WbHIxlrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Lu6oIX/8hhhXX+/jHh7o/Ii7L+nOb7laO+bG3Z0feVk=;
	b=lvmDc9sdeM4FQA0RXmiiLSHIIrP+W8ZO4yBtIJJICtEjb/XOOcbrL4cAwLLLxfMAX7//
	 K+tcNJxMc+uCMEySgk4q+BD4qjBGzG6AdxX1v7gyAdsmAO8i6uxzev2Qlbw2BJIXz75I4
	 Kn/IGjrrlOLF8XlxWa1jDuaLCA1dxiHD9KzG2d99r+ChzkigzMjSfN+Kl9q0ZGb+/nkS1
	 nuQuwHzVgaLLgl3eSEiCqnWCCokIeKkL3j0B3qhWzAXmgdq71K0VK1A/JvCW2HnZpwhpY
	 LHfF1ZFv5YfVBGB4TdArCfw+5nqi/0BURqlhetM7Y8uKtzk5oHRR0kTzZmj4aUZBqiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hAgqiMcv;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A354B606A329
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 13:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A354B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hAgqiMcv
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-537548b811aso5059111cf.3
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Nov 2026 05:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793799580; x=1794404380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lu6oIX/8hhhXX+/jHh7o/Ii7L+nOb7laO+bG3Z0feVk=;
        b=hAgqiMcvcgTcz4QsX/ocvnzE+L+vb6JzBNaAFdDRoTBEf6uV+GvEXHJecqV7UtjlmB
         nMWep7UVAvhkBNXjf276o9VmYAotsWv/aE1y0QQ1rrr73UwPRCD2ZrQwOgKG3QBEVtRC
         WhR7o5wCiT1vj+NJW1Yk8ib+H3MGGL/Xkm2Xp2TlvMg7aQImIh4ciWiB0oq0ZB795JjA
         WUErsYEtbSIyL0sgofwmOFjD13SLPCnFnWlnZvM6tvoVTERuMrSJ1iBSZAbFcOBWC9V7
         JyzIz2moZI3RSsPMvsyXDPSOjJa9Z2f6YRKVSd20Ef2IFzjniiFxIj23G798/vUFQUk9
         3xXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799580; x=1794404380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lu6oIX/8hhhXX+/jHh7o/Ii7L+nOb7laO+bG3Z0feVk=;
        b=KvK+ZfjcfHWROcI2Pusk31ObX6RY6QClkPouKGr+iKz1sLtXVebtf8O5lPYSzFz8jQ
         +CcjB4Q5CcMTmOmEOHeiONzNI0aMSQecGJ72+a2fa5ixankKvsCO+h9lJpBnuCQQ4OYW
         xr++0YAcHQrK1FbSxd2qKg5JccJ7uQWQ4qQCcTlgv3aFSI76Yf4BxTfXo2ctvVIB1IDY
         cTuLBV7xJBsBZvUpldT/mF0EArcY2+8NpJcYidj1OxKqcoWXm9oXPSfx3Y2Z1zfq8IYs
         AGZzfyATdAeY5jL8GpNZgV97aFcKfyfuzT11FFab/dKCqVqEpbo+ncUQGjFTw73CUX3c
         i/RA==
X-Forwarded-Encrypted: i=1; AKwUvBxCIbcmjMTxkt+W5W9Dh1ivg2vlYfpnAO4QxCXLwRkAA1t8lW1mFgLzI7UHrHmQt17/peNJMNEJnItu2fI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ql5QsYgKYhUYKNXZ1wK/WgobYW8LcGR9iGFLt+69W9kjmmrfz
	nfFlm1RRQe64E8uPP4Ms2YInaYhytBESLaiRH6xqaXa3Ldm1MP5N8LfPJMDDFLhCZRY=
X-Gm-Gg: AYBFou1G+tjHIub6DJFu65DcscvCl7M6o15WFeF/rIvHn1FipzUIqtK7t/jblKZvgd7
	8mtNV0FnHtPS9v/pZL3qBSYC0pyYU4qMAB+akV+lJoBgKi57TTOJMh8dipQ4luT83+Y/jFT1eCS
	UCB0bPH58bYrIXLx+KULT++nBV1hNb8ylzBxQzHsD0kuHQRjoCLLK+Qe3VHlFQmY8SvUhE8qNmD
	Sn1McOrSP3jkYFC88mt9JCtvzYLfElYfi5sBkhtGMJYfnV7vy1TUa9h4ncEk6pRe5tml9M0f1zf
	itMYQvwvuleWKHXqeaVKpL6pHxfmPv7691Bt7nKQts056bBr9HAh28knFJt/W5ab4RlK+jnkQkW
	xpLG2iVBV8qIWXkHMJ0ops9p4sIcHcj81kexdg4umadqKRac0J4hbJw8sykT/3ywWlTcjw/0eqn
	BXDZiWYzTpQ0VsXOwquHDfWfDoojahVAGpzakOtcwl+uBS8tMeIKG5c36VmWc3iClMVyncMLMeM
	IMpIZ2FZEJ8x2E6XyB92Kndt/KGLxHOmETUQwISj6CnKCUfXDK+v7WVEr8KTOu60ft9B3J++Ec/
	cT2Ymc3pN/YEQv9Ir0aZE0kQt7Qe/fddqnsS+HOZi9VZvvJlHgHqxD3TygclPgI7ynB2dy1J8il
	n5womu+k4jw==
X-Received: by 2002:a05:622a:a12:b0:535:10be:7d46 with SMTP id d75a77b69052e-542b687da57mr269211251cf.29.1793799580284;
        Wed, 04 Nov 2026 05:39:40 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b1086db63sm24026871cf.11.2026.11.04.05.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:39:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xObDG-0000000GBDX-3ZyX;
	Wed, 04 Nov 2026 09:39:38 -0400
Date: Wed, 4 Nov 2026 09:39:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Doug Ledford <doug.ledford@hpe.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
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
Message-ID: <20261104133938.GP3889730@ziepe.ca>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>

On Tue, Nov 03, 2026 at 08:21:05PM -0800, Doug Ledford wrote:
> Top-posting an executive summary: HPE's ask is whether we should submit
> this driver through the netdev community or the rdma community. HPE
> prefers netdev, with RDMA as an aux driver, but needs the maintainers’
> call. A minimal Ethernet driver is about 48k lines plus 36k lines of
> mostly machine-generated headers (details below).

It depends on a simple question: can you create a functional ultra
ethernet device without a netdev and without an IP or routing table?
Like IB?

If yes then maybe you could do RDMA first.

If no, then you must get a netdev first.

Jason
