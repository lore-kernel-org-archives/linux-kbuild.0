Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519765;
	b=x3ErsKgAQ80pTUCS2DYDVmGJqQgoE9Zyqn180jBAHW31OULXSOWIwPxi0SmrAvPBKbVs
	 Y8XFkpzP1e3sOcdkCWBi3pdSvMTNRZRJeANDW3sO80Q//x5ypZ4k2RyDVQAFRaIS+n68B
	 j7pth1kqjesyRyCF+7nurnqQQM3eNNwgSQzh2y1UhG7EmH4StY5ltHHFN71WOLCVTeToc
	 rpnGFh+QsgjfkZy/FPwts/4Mdz4Ou1qHhXGtASsde1gZjNNbmCrQ3hBrUlmNwacgFQNLO
	 ucCYHl5bxQtZHV5ogWve7bPrQmKeWFGuNn5yiTl2Df7dX6TFd1q4//OdPvH6U5WJ0EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519765;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2JEc5pwDCszi7vyAPNJls9TubSl6y9QotLwlyHgyJCg=;
	b=P4LDS6fTFfvCxE/sp6c3qXX9Qijn8ftkGi48Z2ING9x0QwGfGhynbku1fRs+6Rjjz/LJ
	 pXdbV0We/WzlmOQ7g4OsTCbu687xSXmxwsNJxe0F6nywh/2Bkxg91JQsUubTOT/RLtTXK
	 pYgZCFymgKn6xMV+cpAvr+2cOaB99V7fzz/KZwJjaZNBG8KrNOPHDfsV16LFuMkJO74OB
	 2ctrJWaex5m2Y3zVr9gPpXLWq9gBWhJiaZS3PsC1M09VlSLS7sxCxNzKAITgW1EpNQ6EZ
	 aDvRpWPpeznI3OrHNhIfmEtdpNlLSqFvi+AG4Su3P6oz9/S2GdKzIyWy2xuTXaypLgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkQCAJRZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650E606A31C;
	Thu, 12 Nov 2026 21:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkQCAJRZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3065C1F000C4;
	Thu, 12 Nov 2026 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794519764;
	bh=2JEc5pwDCszi7vyAPNJls9TubSl6y9QotLwlyHgyJCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SkQCAJRZL1y1uRg87sdY6fAR+0JLVL9MzDOvYnzDfel0MnMypx8WEpanX9w1u2ozc
	 MJTB1sLj7jb+KqLaF7nCk5mC6KlzEo0o33nV8BGuljIHBmSWkHy6EC2K6SOfRSCwN7
	 E5fvwMOUxqN5ZoYfDPv2jXEqkQ0gEvxGAFyidJ7+MBr/w46ZEVAhzFFwEJqmnaNULk
	 kQjNir8uhX8ge60biCquTRKWqEGKCD1Ks5kfqd1Va3HhZAhr53hR2eyLPdkJSTUBZr
	 mzDUrBLkG0tkwxf5uPwObDDG6bnFLihLl/9W8cf/aqiXpyDHtni6pfpaGAoWVSW4kp
	 ja+yqcFtPWeZw==
Date: Thu, 12 Nov 2026 14:42:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	". Boqun Feng" <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: rant on Rust in kernel
Message-ID: <20261112214240.GF4107043@ax162>
References: <avXdJyqNNqopuH2_@ashevche-desk.local>
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
In-Reply-To: <avXdJyqNNqopuH2_@ashevche-desk.local>

Hi Andy,

On Thu, Nov 12, 2026 at 05:37:11PM +0200, Andy Shevchenko wrote:
> (Cc'ed to Rust and Kbuild people)
> 
> I have two quite annoying things that lately Rust brought to kernel
> (in some way).
> 
> First of all, it broke the old and nice kernel feature to build a subset with
> allmodconfig or allyesconfig. For instance,
> 
>   make LLVM=-22 O=... W=1 C=1 CF=-D__CHECK_ENDIAN__ -j64 allyesconfig -- fs/pstore/
> 
> Now this makes a very good fireworks out of some rust.
> 
> Ex.:
> 
> error[E0609]: no field `disconnect` on type `usb_driver`
>   --> .../rust/kernel/usb.rs:57:27
>    |
> 57 |             (*udrv.get()).disconnect = Some(Self::disconnect_callback);
>    |                           ^^^^^^^^^^ unknown field
>    |
>    = note: available field is: `_address`
> 
> Second one, is that now with the above feature the build is finished like
> a minute (sic!) later than it was before on a good server with 24 modern
> CPU cores. It started happening somewhat a release ago.

You are probably seeing this behavior within the last release or so
because of

  2625480a1bf7 ("hardening: Default randstruct off with rust for better allmodconfig support")

which allows Rust to be enabled with all{mod,yes}config to make -next
testing easier.

As for that particular error, is it a -next regression?

> I have no clue what is there, but I will appreciate if it gets fixed ASAP!
> I rely on the above feature to save my time when doing test builds.

Note: The following is my understanding, Miguel or other Rust folks
might correct me.

You are noticing the face that certain Rust crates like kernel are built
in the prepare target, which will run for pretty much every build; it
has been this way since Rust has been merged, you are just noticing it
now because Rust is enabled in your configuration. I believe this was
done to ensure the kernel crate is built and available before drivers
were built via recursive make since they consume it. However, as you
have noticed, this implementation bogs down the build and the same
problem exists for Rust drivers that depend on other Rust abstractions
and such.

Miguel and I chatted about this at Plumbers and we absolutely want to
get it resolved but I am just not sure how quickly that will happen. In
the meantime, you could just use KCONFIG_ALLCONFIG to disable
CONFIG_RUST during configuration time so you can still use a single
command:

  make ... KCONFIG_ALLCONFIG=<(echo CONFIG_RUST=n) allyesconfig -- ...

-- 
Cheers,
Nathan
