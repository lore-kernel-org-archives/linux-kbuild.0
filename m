Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243037;
	b=CMDo57/10HA6dEfiDYkddG8IfbQUi3juImuJHWdxezC9bkYx3fvqeJCcxAGVjuwGGZea
	 AS1ccQDe0g7LGqUNJayWqcy9rmb2uru4jw9TavoiDbsyqY60DO5/uxe4WtEwmaVdPLrnD
	 eTrG/HKcNYiixILAY81ipoPaHgtZeevDpMfl1B9URRiVAx5mMgPz/Qwpr5DpnWzGx5sUz
	 965RpywXsMl3ZzW0S8UMQC0BGWPuM2fxa612ep8RMRIjxIOoMIl256d8k+RmbtjpQu0wM
	 ntFDwZPzGqXc2jB0lt2oKULvmbUzVYjU/rWKd8FyJCfjSeRm5HNh6sCq75jCSsq26EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243037;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=2jRbhBw6baBMUmbh4XONHUrX7MOgp3Ir4bPIfNW4hEA=;
	b=hW0oYye9YmTsaQq5Klt/ynm33s6dTAC80tC+/CBPGDHi8C9s+ZA06tdlHmRUA6a4xmOl
	 bPwcuvoUubEHjUFvbtNwozYIRREbhKU/9oQQEeiBiMIDggifq1aS8G3VIIKB9v0EoczCk
	 VtcX4CoLUvXHNFmRxa2Fvy70sSFIObehE/d6PKkLuWpqoJZuDyIXXc2VCcWKDGnO46v6z
	 C6ZS9evsyxv7Mdgen0eVVYFmoswEbD+GvRC48nALRCqu6yzlCLJO8BPii3cyCOyNlyEi7
	 mG6nG7PNr9rYGmk8IcsHtWkEduclg1ugucwOgCSFa9GEuUC7PTZYI9R4BG2tH05xuMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=duGuiTyR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=erKPWCqA;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB320606A331;
	Mon,  9 Nov 2026 16:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB320606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=duGuiTyR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=erKPWCqA
Date: Mon, 9 Nov 2026 17:50:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794243034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2jRbhBw6baBMUmbh4XONHUrX7MOgp3Ir4bPIfNW4hEA=;
	b=duGuiTyRv+49YBjT1Ft6NT0W91FLB22eQnpH+F1L23o6keejZnKvacwq4/ZT5kZt7Ss1zb
	Vxj8RYnMDpVRcYLl0hbYHVyVXwKWpV6rDngRRQeUxlZshzprcc4LY4pkzZphYekseoceqE
	YbjfVnuIJURV4+vc4xG8xR3fVUvp4QqSSrtqNEkE43A/5O4j5N+u8Oa21O190kq/UEM1L4
	kog9I3UGzp0Mq4x4Ol3zmgVygnrv+qrWjYd4VFD8fVMf0+NnimzPCKDTlUptE1Yg7qDoXB
	l3mMRhAZz05mY9ipm5rOVM0JulKWIRiR1ZIvEfJ+KYeb7lHfX7GWQeucfG0t4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794243034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2jRbhBw6baBMUmbh4XONHUrX7MOgp3Ir4bPIfNW4hEA=;
	b=erKPWCqACE2DDb7rdPBq6Us6HYeHi9F9+sBIahjViG68IO7FHr+XFoL8QDPlynR5LivQ0j
	rG6JXrS6vNIg2/AA==
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
Subject: Re: [PATCH v1 09/10] Documentation: Describe kconfig-checker overlays
Message-ID: <avH52flseJWwB_D1@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-10-darwi@linutronix.de>
 <sashiko-outbox-202764@kernel.org>
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
In-Reply-To: <sashiko-outbox-202764@kernel.org>

On Sat, 07 Nov 2026, sashiko-bot@kernel.org wrote:
>
> Could a commit message body be added to describe the new overlay
> documentation and the schema file path updates?
>

I'll add a filler.

> >
> >  The schema for these files is fully documented in::
> >
> > -   tools/kconfig-checker/schema.yml
> > +   tools/kconfig-checker/base.yml
> > +   tools/kconfig-checker/rules.yml
>
> [Severity: Low]
> Are the schema file paths here missing the schemas/ directory component?
>

Correct, that's a documentation bug.

It should indeed be:

        tools/kconfig-checker/schemas/base.yml
        tools/kconfig-checker/schemas/rules.yml

Thanks,
Ahmed
