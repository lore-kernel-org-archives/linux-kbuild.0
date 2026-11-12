Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519087;
	b=bYmpakAxSwaM3ejqTlTJkIK726GCd+tg8/9GipZH6B4Jy0saMnEOjdlvF4xqlxSRCT+b
	 rCkUDf+U31tnVTHSz0MG+u/5n+i3RrcJzCtEOniMO72vWPf7B6JdW+XSfZVQaw3vpPBHJ
	 d+f1i9DjOOacWeyN5VgZufZB55u3S3iny37eXoKccnqXwXbvdKzuCzuLmgARa6pGJMuy2
	 jyiGEsYrD9RQc+3BusUe5KCslsm8rtA9Gy8IQQ12d6oxd/Oa8rqRMnojg3Zu7dFmjDAA2
	 Ccoaj8x9RjNvGh3qP+I2u+u0/RNsLD5W0IOEUYtwfBb3+gvCXPOezNkYhm/cj1q8ioA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519087;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=X2jGY2B55gs19JO82DR2MUd+5P11FRdNArkeVNyYS8c=;
	b=fzl6WXerHNGs9ksPSD5uWwPD+36unUV0/6k2i3Rg1csqF6cqzGmcN8SbTcUxGJaMiUEP
	 +V1wM1yWPtJSlEVCdUK+UXAYzGaEGXARVSuLMwqrLl5dj+4oB5DP1CZHKhtQjQKQCc+IR
	 ygPUYBaI0lDWRC6c1WwVl829fdHy6IrpzoIVLOMM5uqWGwyGYUVD8SgKXRw7UOqWG7L5I
	 T6iMWv/NvOk/HkOEzoTtaK0zbdcMxrmWTi+J1B6Ve8inieCykC4gNSJxGKN2M/R4c0hk8
	 OcCKJ0vAryyVSRkUY4lKXjamk/63bfSC2Kr0v5oV/tYcHj9A52B0afwbMy+pYI8UKgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="2/YZSWWC";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FBXaMFav;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B7606A31C;
	Thu, 12 Nov 2026 21:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC7B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2/YZSWWC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FBXaMFav
Date: Thu, 12 Nov 2026 22:31:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794519084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X2jGY2B55gs19JO82DR2MUd+5P11FRdNArkeVNyYS8c=;
	b=2/YZSWWCqCt8qr14vyLr3SZV8YOVeSocinAbKb3MikFgyOuiWqh/RGtzFz4zyHLaZd/QkR
	ZO/i6rkudZyMY3jnBRsIsZs7K1TtJ2CD67PjyC9SyYwlrrlrldoxH6iIoT2Voh3NH0FmH0
	ZrsZULTn//L6Wh7X0Afi4W9tJqXmQLlxrl7BvFZYYVGQxrwamEYHAsVPwwREbie9ENUWLi
	M7M0X+6NmonRwv27geXvB5++i3WXkixEn/imRQSGiNXf9csKrAjJoyCdSBaSf6OP+n5KFT
	/BVitZJfRyvh+mEqPxVyS+BS++n0GTUXg9T/UT4VpX7BRHf3mp0jqqewkvfvIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794519084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X2jGY2B55gs19JO82DR2MUd+5P11FRdNArkeVNyYS8c=;
	b=FBXaMFavNoJpkNUsEcQRm8+tXyYatEmjsRZvVY7dPp1fm5G00WJiw1fETJ1K8heOwEbAu6
	TM0l7PuvUySgD4Bw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
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
Subject: Re: [PATCH v1 10/10] kconfig: Introduce OVERLAY= for make checkconfig
Message-ID: <avYwKuCrHOHV_gOw@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-11-darwi@linutronix.de>
 <avQNgXSWhODyc5Fc@derry.ads.avm.de>
 <avWmzbh3rp7TawCn@lx-t490>
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
In-Reply-To: <avWmzbh3rp7TawCn@lx-t490>

Hi Nicolas,

On Thu, 12 Nov 2026, Ahmed S. Darwish wrote:
>
> On Wed, 11 Nov 2026, Nicolas Schier wrote:
> >
> > Please add the optional overlay arguments right here:
> >
> > 	$(Q)$(checkconfig) check -r "$(RULES)" -c "$(KCONFIG_CONFIG)" $(addprefix -o , "$(OVERLAY)")
> >
>
> Sure, will do.
>

I've just tried the suggested addprefix function:

    $ make V=1 RULES=preempt_rt checkconfig
    ...
    python3 -B ./tools/kconfig-check/check.py check -c ".config" -p "preempt_rt" -o ""

Notice the breakage due to -o "".

Unquoting OVERLAY will make it work:

    $(Q)$(checkconfig) check -r "$(RULES)" -c "$(KCONFIG_CONFIG)" $(addprefix -o , $(OVERLAY))

But it breaks the consistent pattern of quoting all passed variables.

So, can we keep it as it was originally done?

Namely:

    checkconfig_overlay = $(if $(OVERLAY),-o "$(OVERLAY)")
    ...

    checkconfig:
	...
	$(Q)$(checkconfig) check -r "$(RULES)" -c "$(KCONFIG_CONFIG)" $(checkconfig_overlay)

Thanks!

--
Ahmed S. Darwish
Linutronix GmbH
