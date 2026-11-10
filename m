Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342803;
	b=j30UC/Y1s+/nOJgdyx+64H0FQLijoOnSM8iyzIpfXlGiGMsMrBfmZI/Bimvk5PkjS6Ww
	 w509GulDPoEbtX/CTc5oqWvM0Vij88HHIlwgBWLY+mRB67PquGE2366XNa5Ga/jqngO96
	 1KYSPSzz48/7PoJo6R7NnrmMx0OW4UYyR5RKAWa0fbSz80Wu189RI8tNWtjYyZaTy0wTU
	 UNHsebHKr3JA4AuCYyDTgaKSFeXsot88qnDLgIE8vzZL4LfEo35OATftW74lXtrJ2QMmf
	 GjGhkpFqyKr/EP5yZ3mr+SGjeeEAzfBdRUYyLYWEeTMwYRJ1XAUHU/rrTPM7whATIIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342803;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qgTKR/FH4Odf9egaKgFSB+FS6DwQ8nI7QRh2NSJgel8=;
	b=sbjJoV7p0E2P4JbkM6dlDtZiK+c3evsWUutouaV8QwC0/IGDxPW9fCGsbC8+V2nd//Qq
	 bdX5fbl99NqcWAcXmokPVqjy9ZDbSqnfJXpdtG8Nmiqq6IYFSqIJZZv+Va2yGArVwS2ES
	 H3yHNFN5ckoauSNxHwT+rpWweRhX9HHXyaRKY5mIB/UPdn3wuR8z3/YKojhWvJwjOhI3y
	 DH6atMab9OKYR2lV7F587OnErq67FI8MUc/OhanYnYOyb7ze142HlxdIhkn8pBNFvBVjL
	 z6ASEJgwTutqHjoCikrRZhBP82JrZuKMAm7xgm8CEhx67ga79Ncm9FTNxhYM8Np338A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jVEX0cPa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xZ1GCxt8;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF7606A32E;
	Tue, 10 Nov 2026 20:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBF7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jVEX0cPa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xZ1GCxt8
Date: Tue, 10 Nov 2026 21:33:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794342801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qgTKR/FH4Odf9egaKgFSB+FS6DwQ8nI7QRh2NSJgel8=;
	b=jVEX0cPaFlxBvXXYB+czWXU0erwrtCmM9sZLs2Jutu1xrqpXv74ZeYtvcuTH9LD1ucheWf
	Py97rMQTsPY+RrY58menLGqg3D1FDnxbK2zfZVNdPOirKdGADSkZY4WKobTGHI/0BsSB3V
	/TLozkp8CsNxdoleX6QSP/NF0C/GuoEjQBShzwtRM0k3QqEvqASYTC4pUbbHJgpCMn+l9c
	IwO7zOZXekYsQs7zalsF1MnOz9hSVuEX7N8fVIQI8xG7rRIUbwBeoBhDNq5yICLG7lh4zU
	hxjEKJhlIUz1TfWpGy41TszdPWqyZ8OEqwCN6qnPr0zlx9xB7FZ7wSgi1TJGJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794342801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qgTKR/FH4Odf9egaKgFSB+FS6DwQ8nI7QRh2NSJgel8=;
	b=xZ1GCxt8tXPmk0qC3Z9b5l/3G6MLfqduPjTEaxGwM53vrt+Vd6ThsS59PMscr5/gCB/Wfm
	cW9W/KDf5TsTZqCQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Julian Braha <julianbraha@gmail.com>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Derek Barbosa <debarbos@redhat.com>,
	Zbigniew =?utf-8?Q?J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	linux-rt-devel@lists.linux.dev, debian-kernel@lists.debian.org,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, arighi@nvidia.com
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
Message-ID: <avN_juQm3x30nP2n@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <a20153cd-d148-4618-8089-ad81cb16fe23@gmail.com>
 <avHroNa1vcxmCIOs@lx-t490>
 <c0ccddbc-539c-4987-8685-ec996285f746@gmail.com>
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
In-Reply-To: <c0ccddbc-539c-4987-8685-ec996285f746@gmail.com>

On Tue, 10 Nov 2026, Julian Braha wrote:
>
> Yeah, Annotations also supports generation with --export.
>
> But it does support validating a config with a policy using --check [1]
>

I see.

> Anyway, the point was to provide context for the maintainers that this
> problem is bigger than PREEMPT_RT. I want to see this functionality /
> your tool in upstream.

Thank you, and I apologize for my defensiveness.

--
Ahmed S. Darwish
Linutronix GmbH
