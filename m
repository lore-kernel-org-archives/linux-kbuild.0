Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230334;
	b=eQB5E9tiusEFVJb2PVgPwXef8JZNV0clfWmnVgXjBAqsTwtWKZiNnpL7eEhcU3NFHYpt
	 YsGnMgiGzTC8+QdDQhm/GYDVnfqYKTXyiFjwW9/DP9FgPCTf1Z2JmULIzi8iqTOwWLkIZ
	 olkSW3mUnq623PfKqBdQaVPQgxQfd6z9tbyubfIyE3W/hehfDhgdygMvEEfXrru7vkcjC
	 MZYO5eIv/3U3+NOTkodyfJbh08+ilnEBrq6uSbovfSAQqwzN0i1PLtkgS9SuWN8oaMPGS
	 hhOi1Io9cWhyVH6ueNNAc0Jgh4PzUGX6eBp0Px6zkvam2V4ycRmiI3SM9C9uNKSH4RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230334;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=tMXHe7LOEpQwsow8Uy2YcO83thnpHcV55BkTpvZf2y4=;
	b=FKmerXfLQZqV0hb9IyvWXsQgIolMA/+wq9c1wu7CAe5hMKaELasNaG81EfCIMP+0MK1X
	 GcUhIx8OisFYjNGzbwlc7zGQq2Fo/maZchfwpb34JimW5Knu3A/zcyN5kVZ4STkS2mYU8
	 vMA7A/Kpqtsk1TKUepu2DIH6aM8cx1irWtE9cWLHAgpNR8GXlCgA/9izZz29BP3eluLQG
	 yQY/ixJqU+OpgHwCruOfa1cSZ4MBgBx24qVL2Nn5qzb0PR0bLs/rgbfmq5j034JTSpt5g
	 l6UVFL8RGsjmWVcUkjev2IocshgQEE7ullkROZi/Rz/nyBHskKXmW9ITjXQRvY0CQNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="zZliaNK/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6EHalkND;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54031606A331;
	Mon,  9 Nov 2026 13:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54031606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zZliaNK/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6EHalkND
Date: Mon, 9 Nov 2026 14:18:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794230331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tMXHe7LOEpQwsow8Uy2YcO83thnpHcV55BkTpvZf2y4=;
	b=zZliaNK/fyFYpmhiHJpfrBmH7+jesJiapHjRMSvmu+ji6oo6e3NVekzFNZWcxWP4ROwxeR
	5rIXNxLWlHPC7ZUpj1qctZX32sVB2mXjKkfUV9YzJWFiBc1WHRCC9DF9rDeWK+XoH2AtN1
	9IOkSXESFFjAUqZ4Qfv2NZIa5YteCOSb/hEwn9QNyMLpJK0ZhY1Xr5pP2tgCyp3z2aUTwj
	H7a0rCdx0YwPeK5t9Pa7dwOFdMSakXlHvZEcfmPNGBQAHbU6eDT95eCVHtacRNnmdMfXQE
	mqn3LriZ30H2kUQCRsCBou06q0pgOywDVzNmtFuNcROFjmXa85Mi4ODqtKQtlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794230331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tMXHe7LOEpQwsow8Uy2YcO83thnpHcV55BkTpvZf2y4=;
	b=6EHalkNDoeS3bse8s75evKp7TN2+D6q/akhi/zJZefHHgXJx7R4ozf4qfdVR/P+yfaCZaA
	8Y9D1X/YOGk1qBBA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>, Nicolas Schier <nsc@kernel.org>,
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
Subject: Re: [PATCH v1 04/10] kconfig: Introduce checkconfig target
Message-ID: <avHIOS9NHwCCMITd@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-5-darwi@linutronix.de>
 <3dd2bb0d-8486-4630-b496-e92e4ac37c29@gmail.com>
 <20261109003909.GB3429615@ax162>
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
In-Reply-To: <20261109003909.GB3429615@ax162>

On Sun, 08 Nov 2026, Nathan Chancellor wrote:
>
> On Sun, Nov 08, 2026 at 06:59:45PM +0000, Julian Braha wrote:
> >
> > I think this tool may belong in scripts/ due to the kbuild integration,
> > as was mentioned in the past on another tool review:
> >
> > https://lore.kernel.org/linux-kbuild/20260428183101.GA3304253@ax162/
>
> Yeah, while I would prefer for the script to live in scripts/ due to
> being called from Kbuild, I am not sure if the rules/schemas belong
> there?
>
> It might be better to keep everything in tools/ for that reason,
> especially if this may be called externally, but I am open to other
> thoughts.
>

I would prefer to keep it under tools/ as well.  Because of the PREEMPT_RT
policy, and the possible extra policies from ELISA, etc.

This is why one of the development rules at the top of the Python script,
at patch 03/10, is:

  The tool must not depend on being run inside the kernel source tree.
  This simplifies invocation, testing and possible future packaging.

So, upon (hopefully) including this tool mainline, I'd send a patch to the
Debian kernel team to create a separate Debian package from the kernel
sources for it.  That is, exactly like what they're now doing with perf.

(v2 of this series will add versioning support to the schemas; thus making
 the tool's support for packaging stronger as well.)

Thanks!

--
Ahmed S. Darwish
Linutronix GmbH
