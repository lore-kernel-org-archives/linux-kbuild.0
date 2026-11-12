Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510890;
	b=zdLAvZ5pW3pCdmVu63ZR9M/yeZD3mKiKSKRPCrJez7Js9M/nl/4YqXqNN+ovnV0csNLQ
	 tqYLd/bHCizwqV/rO0miV7hYLDjjgnYF/RXKxfeWv2rOskd4A+8BsiSB/ZBOkhv5vnQmn
	 Y2KVzNtN+LQEsPf6iVJaDUHGJ9w8mCgDgNE7xcqkQ7yy1IV2TZPa+At9kuiDkyTlM8KQL
	 4qfMg7TypJ5rl3V/Snj8aEC8mOM8ZdQPpVl+sTZutuvx6DfhUwkrg5Kx2zGfogcSkKXTi
	 LtLB7cAHSYbOjXk4FjlbnXdXBEzVAZ5M3uWK3o4p0Ih5Hgy8IByOqQ8U4fb9SzHlKTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510890;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=zNlGFfzkwV6FPF6+BDZB5x8JOUEfDn0OibP8uM9DPxU=;
	b=nPM3OHH1qkrejpCRoYJRYTNu+C08FEXxnIdX90ZHrmT3ME0Uu0Zxt2QAbomwf9sNHj/V
	 3wN25LY2ZwuKxHpPtWo3OVolv7q9DP9npmcsJiB5kg5tdwcM3PMv+I4X0X7Y71DiIojGk
	 GjJAahoS+S99nT5m/0ScsF0gWCtI84CaFL5zIniz1apmAjsc3rqPN5b9SQKWPTY2Kr4Ay
	 XG6AbmuaMRVi87vV2IUyVA7FxYHF/aKkE4xu/xOowZy/ArBDNZ+nP3ysAGHqLZDZDhAUV
	 VhzTQGFiWJ6sP6Xo/85aCwOdTIuUaiZ4kibzcomBMJ6BVaw5d3mMlJkDmiXT9ZbscVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dgf9PKGP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BuI05u+J;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A823606A321;
	Thu, 12 Nov 2026 19:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A823606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dgf9PKGP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BuI05u+J
Date: Thu, 12 Nov 2026 20:14:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794510888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zNlGFfzkwV6FPF6+BDZB5x8JOUEfDn0OibP8uM9DPxU=;
	b=dgf9PKGPPx6MMiVxAPo5ClHsYi0fWqjpAjmvvMZ49eOommAsRo3sGZjni06W/f8HM8UB1Y
	iZBNrBH9nLTiorhkSKwKbrsNPxgY/zTFnOBgDT1kGIUg5SG9nq0A36ZtzS2VLIP2Qq5C88
	nddRFEzBTAhHA/MDnxJoiD6uQWHSNLfuLruJcguv3eziiKR5TnvtauI1vxHl/zSEXCBizW
	0f+bJ0LYN7k3Ruwq3qzjLdFiNoy4+Sh3Jb22U/uzGM31Yo89yQREnpo2VkG5D0WaYjD41z
	gRH1AXMxqUqfDDmeYLd1luUk8ay/LCl3vWXTJlyMOrnKWuzNVp+lhJNf0+wpTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794510888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zNlGFfzkwV6FPF6+BDZB5x8JOUEfDn0OibP8uM9DPxU=;
	b=BuI05u+JiHs7vQsJX/T/5J4yDMpGINOxVPsk6nzq3wwhvQVDxEnC4YTlm2ahGnhGWTcvLu
	MIiIXuwGnSE2F+CA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Julian Braha <julianbraha@gmail.com>,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
Message-ID: <avYQJiHwzCkzeONg@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <avQNdicGzL3De556@derry.ads.avm.de>
 <avWy2r1BcDatzwo1@lx-t490>
 <20261112175042.GD4107043@ax162>
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
In-Reply-To: <20261112175042.GD4107043@ax162>

On Thu, 12 Nov 2026, Nathan Chancellor wrote:
>
> On Thu, Nov 12, 2026 at 01:36:42PM +0100, Ahmed S. Darwish wrote:
> >
> > Would it be OK if one or two people from the Kconfig side also step-up as
> > reviewrs?  Julian? Nicolas? Nathan?
> >
>
> Sure, I have no objections to being a reviewer for this tool.
>

Thanks a lot!

>
> What tree(s) do you envision this initially landing in and taking
> subsequent updates through?
>

Unless you have any objections, I think kbuild would be the right tree ;)

All the best,
Ahmed
