Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487006;
	b=DRnZfDtN9J3mYbn4EY7CwJcR5lAf5F0o86C+ykDdja403X+qRKgIbsIMCal0GRef5c/k
	 uAHNWlPauc0amavk4j7/fk5k4Ax9NGRyXt6PmkYBbRr6iNc7pl9fz4d2IUWweL7fycg5I
	 2mTm56fMirAIkyqqo7/h+3oVxNc0uy1CMV6rlB2KffAyxkAevkf06d58fkj0miAU1K5oj
	 JrlbK45A6LLkZ2ygFnBlRhVRIB5+hcEB0HtMDS+LU5JyrdJPHmUoM+Asa/sxMq28tzbmR
	 79JCR/Fr0Eo+CmtGxdNOck/h1OtUuuGE6D9mCcuuhbLnMP4ienvcW1P8Dif+jay2Q8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487006;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=J4ynqIBSfVzw+rEpy/cObYYx4ZAAJOboAFNeWh8nIQM=;
	b=v/3ji3heRe4vsIXq87WYRX/T7J8V6RaKXHKrHXooGvd4Y/Xt6ttvNYzRoMt+DVUX1kK/
	 RNsTvSU/p5ziN1fS13CJU6wjlGjZCHA1d7hurt9cU0Din+/uSB4Xa17tOd8mi6h5NOQCq
	 COWNKI11STHk5zhfW/HItNkkhXSab0uFl4E34eFGZasWHdHd8jZBmFWQPVn+dBDMfwjNr
	 SrbPT57tRslFi2A2nf2DPm4vpI1wSl3cWGrWTl1xiwLO8+zTEvcJsDZ9ZTVBGkIfNuFQF
	 7Jpl99oFgsMtNu2JubyC8HGv0ardBdILqc5/cmdoRggYwxgq9PGeGlegEYCtD8FXrtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=elrslbwu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+TrMSOnp;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A89606A895;
	Thu, 12 Nov 2026 12:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A89606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=elrslbwu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+TrMSOnp
Date: Thu, 12 Nov 2026 13:36:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794487003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J4ynqIBSfVzw+rEpy/cObYYx4ZAAJOboAFNeWh8nIQM=;
	b=elrslbwuU38g9YXSXdn+gxraSJVQS06AFc4PCzYOi8FgK16zj0CIlI7H/wwXw9Hq3EgNuH
	2i2cKH1zeBWPqm84SsrHd8UECMMfaIXjReWc8NJmjkVauf0YwPjvee6IV800efkReP1oO6
	CAguI1PbmtzSP+j4zJEUnuhbIqTver7uiXUxxjlbzjvtYV42UBDwUadEFxK/WmNpnPkMNZ
	a0OJwjLc8QL0bQ/r5M+pLI2QRLT6Yhf3FGdRbOqTpGHZEYK8yK8os07Vlqt4yf9kznSjwh
	8Ki2QTx6iEhzcTyPztqTuFngAveN3RrkNTdHi7vwnlFFaif0kGB1peGx7O8Ayg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794487003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J4ynqIBSfVzw+rEpy/cObYYx4ZAAJOboAFNeWh8nIQM=;
	b=+TrMSOnpqyRE1l2mBcpBINr+40Dc+KUcbbqYkobiGjraQQTEE8HBvtGoBcjL+SREyQWJgb
	DED1kAF/XbA3kQCQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
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
Message-ID: <avWy2r1BcDatzwo1@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <avQNdicGzL3De556@derry.ads.avm.de>
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
In-Reply-To: <avQNdicGzL3De556@derry.ads.avm.de>

Hi Nicolas,

On Wed, 11 Nov 2026, Nicolas Schier wrote:
>
> Thanks!  I know some people who are definitly interested in such a
> config policy checker.
>

Great, thanks!

I hope this leads to more mainline kernel configuration policies as well.

On the user-space side, it's one of the reasons I'm versioning the schema
in v2.  This way, projects like systemd can ship their own kernel policy
file, and that policy will be guaranteed to work with all future versions
of this tool.

So it's all mainline-first; both kernel upstream and userspace downstream.

> Please prepare a new MAINTAINERS entry in a respin.

Sure.

Beside a separate entry for the checker itself, I'll also add:

    F: tools/kconfig-audit/policies/preempt_rt.yml

to the 'Real-time Linux (PREEMPT_RT)' entry.

> Are you planning to maintain it after inclusion?

Yes, I'll be happy to maintain it.

Would it be OK if one or two people from the Kconfig side also step-up as
reviewrs?  Julian? Nicolas? Nathan?

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH
