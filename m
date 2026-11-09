Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247782;
	b=BBLea36hPK4+PS1eUaQjUR53JHmXTIbFV2IY0MVv6PKU81flNwXs7w0ZG2wbrln7Wmv6
	 rBXi/rIF1H8ANq074wULin8J7zFqajr749NkPfQMlWR95eO7hL06cJN4KU1pjkfT5xhci
	 BMGRXXfbGck/fFmSrZ/PRr4qclVBSo/rqdyOU20V6kYapfCa71nw0CSpblwq9tY5H7wFw
	 oBsfUa7P+1Irz9fqtDoD4QpVk1v9MgGfC6ypt1alxoRRZVAGxNZxGKycMR4Wnl4dc+yAw
	 +UdNxcNeanE8nhPcbU3TdE4LxYDzK7zi0wfhf1F4WSWgYMvyRhdqqOVrZXtADA5im5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247782;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=hoQOzrsBfuekc5HffGWMwvLYL2nRUtXJwxmyC3goQbg=;
	b=Tp1rNgNAfK3mbHpyyo9rKaFeCbOBPtycaMjgVRYhj1h6tB2VWQvSJyM3WnXE5wNmFeIy
	 B9P9gD7HEG1PE26dacwl/z954kfN8R8EntIqGkb6qRv2TaS0zZx+sSO+Q8s08gdo+0BQ+
	 hrVN5U2FWGURq3LmQyhrTQ2cY4lSnrjz2af+mYw69t0Rqjc970tJRlZPc47SQ+CWyqaFH
	 xcSaQRFNu5iESmas/S+7XQ+0GM7RCfzgXY6ssdL3ElBb3pBF82FI8naexboVTbTj8UJB2
	 VrBcV/b1g+06FBYWSqDHHOWUXPYyKNaTpzpFs3DSDn1z/Yns+Q8QN30T06rj6BqbZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=c1YnfyYH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cZnTZKI4;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C3606A31C;
	Mon,  9 Nov 2026 18:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=c1YnfyYH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cZnTZKI4
Date: Mon, 9 Nov 2026 19:09:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794247778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hoQOzrsBfuekc5HffGWMwvLYL2nRUtXJwxmyC3goQbg=;
	b=c1YnfyYH4Jkf1wyvgFuiBZhOGHbif341DwyM9F/dA/kFZoJ3zmersEJqTTGNjl6Sracff/
	28jhNQ6RIu2Q6TygiohXin57t1gyEcrFcBLHQjaKl4DIp9OahytWc9vCOeIPIt+tLfprf2
	5J+gUM+rNO0rG789piUC0cSE3zcgxRXgQB58uzjNk8OeVpE0p06RemNywnkh4i8DBfHCF1
	DFYvantMZ5rOOqGO5STNwpg5fvMPIOCC6FjanFaIBo2c7bgNxEvKJgqBj0zRjEe6uz2vhT
	aWHRoFgrAyRJaWROKpTWT4x46Qi2fARrXTHtpjdMLPkFfClvOOsLm8fJtxLqog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794247778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hoQOzrsBfuekc5HffGWMwvLYL2nRUtXJwxmyC3goQbg=;
	b=cZnTZKI4NHAI3Dktunl/gh47SVwPWYsMWTdlJLbeHZtMW+885w8vJswl+YnbI88JZ+CAZO
	5ACkXliLEDXbP8Ag==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: sashiko-reviews@lists.linux.dev
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
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 02/10] kconfig-checker: Introduce PREEMPT_RT
 configuration rules
Message-ID: <avIMYMqTKkwAozk_@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-3-darwi@linutronix.de>
 <sashiko-outbox-202757@kernel.org>
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
In-Reply-To: <sashiko-outbox-202757@kernel.org>

On Sat, 07 Nov 2026, sashiko-bot@kernel.org wrote:
>
> [Severity: Medium]
> Should this also check CONFIG_NO_HZ_IDLE?
>

Correct, it should be added, as legacy "compatible" CONFIG_NO_HZ might be
removed in the future.

>
> [Severity: Medium]
> Will any .config with CONFIG_DEBUG_INFO=y or CONFIG_DEBUG_FS_ALLOW_NONE=y
> still fail against the CONFIG_DEBUG_.* pattern rule?
>

Correct, both CONFIG_DEBUG_FS_ALLOW_NONE and CONFIG_DEBUG_INFO.* should be
handled.

>
> [Severity: Low]
> Is this rationale meant for CONFIG_DEBUG_KERNEL rather than
> CONFIG_DEBUG_MISC?
>

Correct!

Thanks,
Ahmed
