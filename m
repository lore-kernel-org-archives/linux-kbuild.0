Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826360;
	b=MUT5KuqzoO63CLHFSMbwYBaDNmbPUr7jtbm5FhT2j0PU1mnueJ10ovgimANHizPkk3ee
	 TIA2UPDcey0QupPCrUW0KW0/VtHY5k/HqadQsNjlG/NG7LVrdMHS96jhECQcnPsHctlSR
	 Xg3E4cWx/eziYne6rZVJSrABChTRxPFEtuUfUXtmDX9lBvlBMM3rqC/0JRskavo7ndV2c
	 hO1PTgoINiQt4+WVWDou2yeeORzC3Y5aLrTO8Hl5tp/vIbEK1lBXjJwLyTb8wg7HQKGVv
	 hKiIxFcFJft9NnDGvMvPIwCKcJu0I9ERbO5ylAkZvmX/pZteKDqYnxCKnRsq68QRq/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826360;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=UVdB4yH8xlc148639BsaqXg8zOFxV1Tx2mgUwlLZXoc=;
	b=p7wwrQ8B3gpRygPociJprTpWSulruzBoRJAN3R7x7JpICqIUZV+3Wi9sah+9oqaf2EoX
	 z38awClhHZdp7qvdCmLaRW41rHsIKkuvQFZgS2WqL4RMSUysQsmoKftNNthFz/iWmVkg9
	 7qN07wxnJwwqwujdPbCqdh4fmsDoSz/rAavDi6LXsrLtJiWhdeSBP5VkiCEkCD3rrhje+
	 R7/pROiHu9XQ/WSPp9Ayx84ZiK4cai4h62FffTYQr78ArF798pXEmf4vX3Cf2UR7lqth+
	 cKFOIaJoJl5MQK6U9EUDlUdmtDL+f34D08G4kPLaTB9e+L+Es0py+dRL4fkurIhdTZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OVHet9mq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ITH5DgT7;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8576D606A329;
	Mon, 16 Nov 2026 10:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8576D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OVHet9mq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ITH5DgT7
Date: Mon, 16 Nov 2026 11:52:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794826356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UVdB4yH8xlc148639BsaqXg8zOFxV1Tx2mgUwlLZXoc=;
	b=OVHet9mqJB7WlNT3jlBvGzgcDtRa72k3k1DorZkwB454/FdXdX35kHdJDgzTlC4hJR+Yvc
	VY1LfwP+/tyi3mck3Ht+8QtortzArb5PSomBY08wdw5im4REK6v27oAKCBLUbQhc/qDQOE
	Zq4A4aVB/22WBtBIh704f8ILi6M4vwyS8xX/S1+Nd+9quBo5A8UHmB728A+3ldy6rcNmw9
	kNq+xovrS44HCXlwGgYMBBqP7Qh/+N0+8YN58ITcCuj8cEnpwZAX7aEgKH9FZ9Oogh91y3
	/Lw29ET5rmV09PX1WcRQdolKukwtp4ICdMm5ZjcaMpnFjMyyEuRuhNDkwLECrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794826356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UVdB4yH8xlc148639BsaqXg8zOFxV1Tx2mgUwlLZXoc=;
	b=ITH5DgT7VtEiMJCal7bHMw9N5YiPZnAXMrlEskXVtwy3fThvHuVK+biFnbUhAsvyTO2C2B
	KBdAq+5pK4DpPIBA==
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
Subject: Re: [PATCH v1 03/10] kconfig-checker: Add the configuration checker
 code
Message-ID: <avrgcfcsp2FBVG4u@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-4-darwi@linutronix.de>
 <9729a4c6-22f9-4102-b62f-c76a75488240@gmail.com>
 <avHD-3JwbQofpJdH@lx-t490>
 <81c91813-79ff-4d36-92e6-8c0ecc1772c7@gmail.com>
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
In-Reply-To: <81c91813-79ff-4d36-92e6-8c0ecc1772c7@gmail.com>

Hi Julian,

On Thu, 12 Nov 2026, Julian Braha wrote:
> On 11/9/26 13:00, Ahmed S. Darwish wrote:
> >
> > In v2 of this series, I'll make the schema explicitly versioned. This
> > way, new features like the above can be cleanly added.
> >
>
> Adding schema versioning would be great.

Yup.

> > P.S., I can definitely implement such support, but I'm a bit hesitant
> > to adding features that are not yet needed by the existing mainline
> > policies.
>
> I suppose it's not necessary to support these option types at the start,
> as there are few of them, relatively speaking. But it would be good to
> add some input validation in case a user attempts this.
>
> So I've finally had some time to sit down and test this:
>
> I created my own policy with these other types, and sure enough, if I
> specify them as 'disabled' in the policy like this:
>
>     rules:
>       - name: CONFIG_LOG_BUF_SHIFT
>         expected: n
>         severity: high
>
>       - name: CONFIG_PHYSICAL_START
>         expected: n
>         severity: high
>
>       - name: CONFIG_DEFAULT_HOSTNAME
>         expected: n
>         severity: high
>
> and my .config has these values:
>     CONFIG_LOG_BUF_SHIFT=17
>     CONFIG_PHYSICAL_START=0x1000000
>     CONFIG_DEFAULT_HOSTNAME="example"
>
> then the config passes the check -- but it would probably be better to
> provide a warning or something about these options.
>
> Also, if I modify my policy to set 'expected' to 'y' for these, it
> reports "not in .config" (which would likely be confusing to the user).
>
> This regex stmt should match all int, hex, and string options for you:
>     unsupported = re.compile(r'^(CONFIG_[A-Za-z0-9_]+)=[0-9a-fA-F"-]')
> by checking the first character of its value.
>

You're definitely correct here, thanks.

If a symbol is expected as enabled or disabled in the policy, but the
.config has it as an int, hex, or a string, then the report must include
that as a policy mismatch.

So for the above case, the tool should report something like:

  * Below option is set as an integer:

     CONFIG_LOG_BUF_SHIFT

    But it's expected to be disabled instead.

And similarly for the other symbols.

I'll fix that in v2.

> The included preempt_rt policy worked as expected (nice).

Glad to hear!

All the best,
--
Ahmed S. Darwish
Linutronix GmbH
