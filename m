Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21203D88FC;
	Thu,  4 Jun 2026 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562813; cv=none; b=lSfgug6btvl90KAjBPFJ0g4UGuO7Iqaas0ODRwpY+qQITSemnWzbp4zZRG70quOCPg4nS0KNecynYpSRaxPgj4hZn1I60xE+fI3BAqP83JlUHbNkEnSc0Iq/8I3uOx19Gy0rvBqm0rJaGSUWGej8qrYUlI9hHXmOE+sK/YCYq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562813; c=relaxed/simple;
	bh=7gcvKq4MneT/9HwdnQWZlTS8kTDFAW4V/FQknCdCgtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hd8puN3z3p10ZvV+u+oahXYOUxMuuOVQLvNKj7M4o/uvckXDXhlEpe5moB5MwIqhCBbF/EB7PR37Um/H4MHoWV2arUr9aop8mle1BDPPy42ZoPMYYWPzT4wjTf8YmqZ3juC6sOC+Jc8RZfmg1e9gBWtQNqTaRJ/+4aune4+CWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NWvi+i30; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NWvi+i30"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LsKVmAnm3ILB7WzqqyTBqPJ8q4JEg/9nOmZun/sFDtU=; b=NWvi+i300YMR8vDdnBWt9iIktx
	rF/OlgbcF8sDhsmWgnWmNNhUnxEau5Y1SGv4dMnk6oqLKS1feoNWHpB0lLWjFtyTXOj6X/87hanQ8
	uquhXxhwwQ1E2JZ14LEb791FIXJO/HD7Mpv3vJnc2KCzyQjg8AhTUsgITZwAq2jw/JjK/EsBQBTrE
	Ng0taSt+RaWN5EQnqmrlTHPs2KK9TDXuL+6Q9t8DsAdZZZ62InRdpwdNHo6JPgodIZl4jGlYlhZrM
	t8MvDau5mSn5BMffXQ3L3wDAOhNBiOsixSHzmjGEPbfrRPfjCyH4H4vR/loes1JsI04d3C6RD/uri
	jRlLfpJQ==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV3is-0000000E5W5-2Bg1;
	Thu, 04 Jun 2026 08:46:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F1CCD3001FD; Thu, 04 Jun 2026 10:46:40 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:46:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Subject: Re: [RFC PATCH v2 3/6] kcov: add CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
 and NO_INLINE
Message-ID: <20260604084640.GB3126523@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-3-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-3-fee0939de2c4@est.tech>

On Wed, Jun 03, 2026 at 07:43:30PM +0200, Yunseong Kim wrote:

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index abd1a94589aa..3b952b6361a8 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2261,7 +2261,6 @@ config KCOV_SELFTEST
>  	  On test failure, causes the kernel to panic. Recommended to be
>  	  enabled, ensuring critical functionality works as intended.
>  
> -
>  config KCOV_DATAFLOW_ARGS
>  	bool "Enable KCOV dataflow: function argument capture"
>  	depends on KCOV
> @@ -2283,6 +2282,28 @@ config KCOV_DATAFLOW_RET
>  	  metadata, recording individual field values at runtime.
>  	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
>  	  Requires clang with -fsanitize-coverage=dataflow-ret support.
> +

This goes into patch 1
