Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248530;
	b=2pNIlX/J4VRiXqGZ5qz9x6RkDeUyMF0I0gHlIPa205e/Hi4p80uaaz2gDx2VwYCnKjL8
	 SHXOBPVfxJ+1uAxM7avJ2m7baYT8xWswd/oX11SjySrHWSPoOR1YxZKQlbncjvPxsWPUV
	 0Ppdc2rtmbrrtMe4dqF6PDuvGyBF6i6OEttIzfnm3bAkZe+wETfVv8KJCdoa1NsWR4vau
	 skGGD33qMV0A2gs9yXWVuwW1eH7EzURi8hkRRmLtppKEGTcWM4ItUyLivS17Dmlvrvl4H
	 V8gMcqasOdxbvUEuLLZUWB0FYE33CkjfIGJJoWXZX656c8qVM/FdRs16yS9VASXkFAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248530;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Ja3tkhm4ACA2zEZUm0pUvF4L6qYtPMvWaZCfKZM329s=;
	b=oidU85IzSPFtnm2gVL2hEZBdCwyUbcxOkEP8YTrOJpjo2yUWH6JzZcpgMv1dKWSniQwd
	 Cbao6E4jghOb/JLAQfTMAUHD6X/lxHCdCXDdOJmbYhbBYcukeFivl29DkJegyGtFqIl69
	 83y6ML4joPlAokhSB7cNv27rVmbTYmHtBZI+Z4VynKj5J6kveJt4laHmuqq3mvdZxKZe6
	 wjJ2e6t7wysK/0Hez2rvhZd52zpJDAzHfTMGlfXNYJUDntq93uTImebPYMP3toY3bZJ4t
	 JdXkZ9nj8DhVvGybDC3nujtopjdTuMdSxGip3oGlju1xEi0q5Hvp6OfiNOTLCk3wg6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pl8+CpWR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hTCAT+8A;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A6606A335;
	Mon,  9 Nov 2026 18:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31A6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pl8+CpWR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hTCAT+8A
Date: Mon, 9 Nov 2026 19:22:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794248527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja3tkhm4ACA2zEZUm0pUvF4L6qYtPMvWaZCfKZM329s=;
	b=pl8+CpWRz3aCZAgD0glCeF4Fp4deflIwWjN3ka4Gsg3nvxDug5iNVPIgyfF2k9SDgbDagG
	wgJga+cloT3LVUixthEAeWAbnqhuGRgOsqX9YFyWg53I9tB/SjxxMzuVuP1nlDGAl/OCry
	hcUILTqw5ooDbuJcNsgrMqccKDmdLD3oNOShuCcfOwCd8Btokw2NmWQqtSBawbKE1tQ2Hh
	3vvGBbijjnrP7SRhZm32qMHUtsVWJRXnM32ZnWplZCFxQzmJFGMGjiRv0UffVa8NTf9UwX
	IzaMjZDUr0YrJC/V8SgVvjkZHSYz5rDhBtFR5ILsQdHUJkeLu4W4sSo3ezbAvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794248527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja3tkhm4ACA2zEZUm0pUvF4L6qYtPMvWaZCfKZM329s=;
	b=hTCAT+8AX5tPmmtcKysIOncQocFqixRoR3jrBbUFEfvgGox6GpER1FzI9eJlJUL1eH7WGg
	ngWKqAjb97m76JCA==
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
Subject: Re: [PATCH v1 06/10] kconfig-checker: Split schema to support
 component reuse
Message-ID: <avIPTjjZ1FZ9sZMg@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-7-darwi@linutronix.de>
 <sashiko-outbox-202761@kernel.org>
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
In-Reply-To: <sashiko-outbox-202761@kernel.org>

On Sat, 07 Nov 2026, sashiko-bot@kernel.org wrote:
> > +from jsonschema import Draft7Validator
>
> [Severity: Low]
> Does this import need a "# type: ignore" comment to match the earlier
> "import jsonschema" statement?
>

I don't think so, as mypy does not complain in this situation:

   $ mypy --version

   mypy 2.4.0 (compiled: no)

   $ mypy --strict --no-warn-return-any tools/kconfig-checker/check.py

   Success: no issues found in 1 source file

So I'll keep this as-is.

>
> [Severity: Low]
> Schema.as_dict() has no remaining callers in this patch or later in the
> series and could be removed.
>

Correct, will remove it.

>
> [Severity: Low]
> Should Documentation/tools/kconfig_checker.rst also be updated here now
> that tools/kconfig-checker/schema.yml has moved to
> tools/kconfig-checker/schemas/base.yml and
> tools/kconfig-checker/schemas/rules.yml?
>

Correct, the documentation should be updated in this very same patch
(instead of updating the docs two patches foreward.)

Thanks,
Ahmed
