Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108149;
	b=IyQqunSPQ6vRPGE43illR1wus4FyMY6u19V269ypEvG0bF2k9p3ZbDJmk7jKm8bFcEg+
	 TkBqxzyMX8khLCayxKATZ2hSsdJNTeS/smpg75t9EL6EciQnSY5rW+sN7FJIBOghDWwlh
	 e3ZJf8vWWdKvvu6n+e9YXDXS0tmtzu6EEbSSyWopUD5HazoamXWtbkqXy2n3+HYEVFKXI
	 a2KTvMW4qH0CS0T+OIWVkhH1qYbuSaOsX3KvG+VdWsBoqGjvEcx3KeFvnwjnkWYOjaX6B
	 QZhNKYEMjFZpzKIv4jpQcHSYE0cqSKaRmwjBoxAgwlR5K7K2MHL1GTawoAkEO426HqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108149;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Ne9pewg3lTR/XwteFRfApk8OTwqtNwxzKqScyzsN66w=;
	b=WrTvpmCEvfJOqwTF869C15PXxANlqtpfyhOWwiUYN/ka2ZDad15aIkLixxZutFLHJAmX
	 0zdjY4YC/YPDwh8Z9Peks4aWxqbAjDQQsIweoYEaufHk7KXEnQTzAtR35/6NrfZ+ZuiNu
	 5WK7X0/WvdFaNw1Br1w49OFUCwi0YRgyMuD+oMI+HICPF/rPLQdN07JJfAwluX51+pj2B
	 T3keTN0B7ruOxQLsrGpIFFu6PhJFuZlt2x+n7mE38tKzBU7IO5hHNYuo8SN4ZRvClOXyM
	 VGEhc1TNBaCUZtJdsAK9nLHRbZ2E3ckd4ohga/1qaYbujuKO/kd1VFxYHNAbnAS+N1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nk5tlUNz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="G/HsGIbW";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719AF60A3803;
	Thu, 19 Nov 2026 17:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719AF60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nk5tlUNz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=G/HsGIbW
Date: Thu, 19 Nov 2026 18:09:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795108146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ne9pewg3lTR/XwteFRfApk8OTwqtNwxzKqScyzsN66w=;
	b=nk5tlUNzv4CkFGquuK5XRwERT434B2HGM48+DOITH1b0FzZVYJwiio/Rh/NTG3SO0EmpW0
	6iBW4QwLZz/JGiGhhjDQXOkTm6mVhQhKLf+NXzfu8az0CMFiFzqHRbbFGi70Wm8siO/A3z
	9nmd4OgW/7CEGmbUMuDUlYGLSWnpACTEAb0HgTLnuF8+6V/jjKc3gmtcHExi8HKFaFgHV5
	G5e5jN7qBCIXTRdqUcqHcTITVM9Q1CcPcWvoqzz/qBfIRLbIu/GL2mtOvznhBXy2iyEfZ9
	5hKNlHafKgBDImJSFvMlpdT/Jta7ymWFKBizC7FDSyMbnhTxp3H2ZB7oL2mOCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795108146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ne9pewg3lTR/XwteFRfApk8OTwqtNwxzKqScyzsN66w=;
	b=G/HsGIbWh5x/anTnl4KMlT5n/w57hjNIWFoGNOlj8JYqHhKary8iohULTfeveAAbPj7daj
	xlOEnc5c9iT+pSBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Emanuele Rocca <ema@debian.org>
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 02/10] kconfig-checker: Introduce PREEMPT_RT
 configuration rules
Message-ID: <av8tMAE3LXz8QwH5@lx-t490>
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-3-darwi@linutronix.de>
 <avxFRmhBrlKLtQ97@ariel.home>
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
In-Reply-To: <avxFRmhBrlKLtQ97@ariel.home>

Hi Emanuele,

On Tue, 17 Nov 2026, Emanuele Rocca wrote:
>
> thanks for this useful tool!
>

Thanks!

> > +  - name: CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
> > +    expected: y
> > +    severity: high
> > +    docs_hint: config
>
> The docs mention the following for CPU_FREQ_DEFAULT_GOV_PERFORMANCE:
>
> | This is not an absolute rule. Some setups might prefer to clock the
> | CPU to lower speeds due to thermal packaging or other requirements. The
> | key is that the CPU frequency remains constant once set.
>
> Yet having the rule "severity: high" will presumably make
> kconfig-checker require CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y in order for
> validation to pass?
>

Yeah, the expectation is that the RT policy profile recommends the
"absolute best" kind of configuration.  If the system integrators knows
what they are doing, then they can override that setting in a rule overlay
and explain their rationale there.

> > +  - name_pattern: CONFIG_CPU_FREQ_GOV_(CONSERVATIVE|ONDEMAND|POWERSAVE|USERSPACE)
> > +    expected: n
> > +    severity: medium
> > +    docs_hint: non-performance-cpu-frequency-governors
>
> Similarly, by reading your docs, it seems to me that the worst choice
> for RT workloads is ONDEMAND.
>
> | The ONDEMAND governor should not be enabled on a real-time system. Its
> | frequency changes depend on workload behavior and can significantly harm
> | determinism.
>
> Shouldn't the severity for the CPU_FREQ_GOV_ONDEMAND rule be higher,
> then?

That's a very good point, thanks!  I'll separate the recommendations
severity into:

- CONSERVATIVE and ONDEMAND: these are the worst, as they do change the
  frequency during the system's lifetime.  Thus, rule severity is high.

- POWERSAVE: Frequency is low, but it does not change during the system
  lifetime.  Thus, rule severity is medium.

- USERSPACE: Fine if the user-space program that knows what it's doing and
  does not switch frequencies haphazardly.  Thus, rule severity is medium
  as well.

Sounds good?

--
Kind regards,

Ahmed S. Darwish
Linutronix GmbH
