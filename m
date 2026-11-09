Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242894;
	b=H2DTlktvhQyzh3pvRbgFZ+3AyNpZrqRF27lnKcKp1jyEk81Qk293IMDVXT0ZN6McHm6j
	 FSAOTJy8DLJ9irvOXphlasBG/6yKE4Gea4yXgOMKMnbmz7DxtDzRs+10Zd5A3CYZokAKf
	 LklYGgUzXPb/zLaALpc8o8cdgnt697pFSBx+T3Nq/wismnofWPDBgEKoMfYIA+sY938Xc
	 IQFF3YR7uSS1DN5p19ajlcUmYrjrUOxS9tpbtLMoVblRPQtl6+j45zhu/5QIv91DNWXf7
	 bI9SHNHTK+V2UB//AEklVydfxqRug6hTD117Lz5IqfGacvMoaUl/VTGpXfkk9FWfEQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242894;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=WjCmpvBTBtjAAl5ks8xILiuJnGJaZE8yootAcNpntZg=;
	b=IX7FyK4NjG91+eF0emzxDawYiMo5sbgIPyIMFnRwf99XRG2rBW7MeOzcpbtX5/Gq53d9
	 EmlfRDsCjdU/eduvcU4q1Rr9x6n3puyOjd1n6iOFHQ+Xk2DXaicnUexhT6lOMiMFPw/lk
	 Kw0ynnHthvLOsgbgGUZnFxc4u5XlxZRGWoHdYpUoWhl+htx4yqJJuKonVBIkXy6xydaZz
	 HLvVKcJDOT4gZXpfE8HpHppPe6lw6zmvfHy82gIxkbE42YICMYN0Ny/mCvg9axcAD89Ob
	 HgnxfKLc/qyB6YyBLs9I5aesBHbwtBCl7c+3NYzSrVDoTjV/plk9D/I9jwcKvdWfQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=temperror header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2fgB66IY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="zDcrh/E0";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3708606A321;
	Mon,  9 Nov 2026 16:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3708606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2fgB66IY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zDcrh/E0
Date: Mon, 9 Nov 2026 17:47:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794242879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WjCmpvBTBtjAAl5ks8xILiuJnGJaZE8yootAcNpntZg=;
	b=2fgB66IYCOqAsgDiJ4Y85b+V/KNFfe3n2zAj36z1c5pXBXxmohpfcoMWGGbZHuiBzx5LZ9
	stSz/0vfbvISOISpa20+j80Zqf8ni9PPZgSDM3BZIEy3trqRZ50XU5jh+QoNhkJwaGvBeL
	iOP44Bf+r8tRSWphQYvET3l1XglBOb0Z/Zesbg2ypJSaFytVIjaM8j1tit+gozKPP0VHmr
	ao9rrSHIioHV0v/qNi4t4HQP35KcDHfgwlyj7RCeo3P5uOp/SH8G/jqLlgWEm7Q3qXH3Qz
	DBwoufM7XVe/+aOPkBGA0TjCDQ6Lw2MsMW+GTjejqNlA1TXUwLsKEnJhtWvDBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794242879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WjCmpvBTBtjAAl5ks8xILiuJnGJaZE8yootAcNpntZg=;
	b=zDcrh/E0c3Ts0L0CWB+Jv2CTG9QtpQQJ64ye3yZTlp8mPMNQw5byWSM6ik4azIjQ5nQ2eK
	JhSjaWTyJmkuVKBw==
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
Subject: Re: [PATCH v1 07/10] kconfig-checker: Introduce overlays schema
Message-ID: <avH5PftePd_0y6Lv@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-8-darwi@linutronix.de>
 <sashiko-outbox-202762@kernel.org>
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
In-Reply-To: <sashiko-outbox-202762@kernel.org>

On Sat, 07 Nov 2026, sashiko-bot@kernel.org wrote:
>
> > +# and a custom-overlay.yml:
> > +#
> > +# rules:
> > +#  - name: CONFIG_DRM
> > +#    expected: allow
>
> [Severity: Low]
>
> Should this example use "expected: allowed" instead of "expected: allow"?
>
> base.yml restricts expected to y, n, or allowed, so an overlay written
> from this example fails schema validation.
>

Correct, it should be 'allowed' in that comment above; will fix.

Thanks,
Ahmed
