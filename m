Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719073F4DD6;
	Thu,  4 Jun 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562503; cv=none; b=GlRiAl0hapj0+lGEH9d92eRjzoAlO1grvvlTVXxsvSx6LlkM+V14SUINsEOm/vzFmOYKoVLfV553axbZOo52NXwCuN8NZXVp7RPdIhwnHafqr4h793Za8HKnhuD3vG8+umNZrQfei38mDUXBKQ2ptFKiKmRHYwVQ+a60pi5uVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562503; c=relaxed/simple;
	bh=YhPh9IdcFhqWCb23Ip6+9JjOw7kiI3zOhCMTEZUY4YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv5WhAF02fxKUvGo35LoTHVvCVwwmuajBHmbrW0zAqOetV0vp+77hGoCjtffSBtZ3vwiCnyInAKdPYERvzNi5k7JPRRslGetMUXVuJkwLMsfXq6/XB1IB8N789RZ72QWNkqCOn6ONwxA6efGn93cy1lbNqVEE0CUZYFqSmAL3ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CQ98wPYQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CQ98wPYQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zX0Yb30KXoTmDPaFSCGyuSG5yzLZH8w2VoPpibkRoBc=; b=CQ98wPYQoIHQ1u1jztpo5I6r8j
	XzYvlNRbvS2OSdI3KZKnYlbvF1p7mbD3a0tHNxCEOFtHY/La7T0NtKRuVjE6Ku4qcY0cVRipJeYxQ
	NgfmGfcmFe6pkGxpIS38AXkbIM5vUrZSPZvwtpl2FPcFMS5y2CT35PRTHn8vAxIORLzsFkr7bK9yc
	2AbfqXLQHaiH2MclpqCeZQE0RmEBdb8/U7xzJrclk6HStdm8ax3vBNt3Jf5odFNpyLMqpY9gah/jb
	/5CG2FyF0NZfAgw3Wv51omNe/O3dwCZs7mt5yor9BCER+U/KUwOjIOtsPuTEjf2lnhRL7k3IGwp1W
	+1ptFuZQ==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3dc-00000005SJU-2IhO;
	Thu, 04 Jun 2026 08:41:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 73BF53007A4; Thu, 04 Jun 2026 10:41:15 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:41:15 +0200
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
Subject: Re: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
Message-ID: <20260604084115.GZ3126523@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>

On Wed, Jun 03, 2026 at 07:43:28PM +0200, Yunseong Kim wrote:
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index e2f976c3301b..abd1a94589aa 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2261,6 +2261,28 @@ config KCOV_SELFTEST
>  	  On test failure, causes the kernel to panic. Recommended to be
>  	  enabled, ensuring critical functionality works as intended.
>  
> +

^ This line...

> +config KCOV_DATAFLOW_ARGS
> +	bool "Enable KCOV dataflow: function argument capture"
> +	depends on KCOV
> +	depends on $(cc-option,-fsanitize-coverage=dataflow-args)
> +	help
> +	  Captures function arguments at entry via /sys/kernel/debug/kcov_dataflow.
> +	  Struct pointer arguments are auto-expanded using compiler DebugInfo
> +	  metadata, recording individual field values at runtime.
> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
> +	  Requires clang with -fsanitize-coverage=dataflow-args support.
> +
> +config KCOV_DATAFLOW_RET
> +	bool "Enable KCOV dataflow: return value capture"
> +	depends on KCOV
> +	depends on $(cc-option,-fsanitize-coverage=dataflow-ret)
> +	help
> +	  Captures function return values via /sys/kernel/debug/kcov_dataflow.
> +	  Struct pointer returns are auto-expanded using compiler DebugInfo
> +	  metadata, recording individual field values at runtime.
> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
> +	  Requires clang with -fsanitize-coverage=dataflow-ret support.

Probably wants to be here...

>  config DEBUG_AID_FOR_SYZBOT
>         bool "Additional debug code for syzbot"
>         default n
> 
> -- 
> 2.43.0
> 
