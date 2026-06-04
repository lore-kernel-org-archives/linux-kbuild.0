Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC63C9ED6;
	Thu,  4 Jun 2026 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563174; cv=none; b=W68K0NPByRoP9aZWfGNpSRnb+MjDgE3boCYtbp3AwjzfwqbcyreeQYiZhu/EPKvbAErAjDAtxHjO7RoTfETFRYg6xJEtqNdKr/MIgrOaJDbIUKGxDepYujsBG8XegiMQaCLsDuPwCIWKiluHFXkhoNTDDJoTmauPOQ81QI1PMJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563174; c=relaxed/simple;
	bh=Z9qW52xw2v9DBLSiydJCHgrUN8NPyZ/1G6ef/sKILWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oC0OcGviN72n8JWDG3EJp6M3k5UMUDI/MJl4H7UQD4XzByLSedC0ahOlr05kIDABodX1kyz5EtuvJSwArZTVkQ/kWU2vBdJFv4eWjwGH2A61oY7vXCDXFGBSd322hgaAbvyiEwLJUg7x+JYMbeTzqhNVE3Xtte4E3BRatRLVFTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CL5yX7gu; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CL5yX7gu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6tI9/y+X+xZ79PrI57JmKszz1dgu7wPk4F5jzgpriT0=; b=CL5yX7guiYMkyCUe4gdSRiiXrT
	/Re/UCoWOLkXpo8Zck95jp05jDNkcBlaj5b596hvjWJdK2aAs6dz1jEmnPI46NkHIpHpogQbKdyLc
	iO3KmET4rxhPN5IFojpgT0ylSDSejS9DNvjNiUshCt5Rwe8CXwjd8mb44qWuzUfa6ZfWRRxw4ZPFD
	oB7r83j3cs7Gl26n95lfecEA7uD3gTp9XBz05C4Pana8RS1qa1EzEMGQlwksDCYGZlSUKx/wbomzy
	kmWKSjhgDe/1Vmeyufl4YauHPTn+Eo2fhSMKiZFLcLfRGk6h6YEgV6Rw5IPMccFouPJDnwrnEqBek
	JORsfEBQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3oh-00000005TSm-1svG;
	Thu, 04 Jun 2026 08:52:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 55E6F3001FD; Thu, 04 Jun 2026 10:52:43 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:52:43 +0200
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
Subject: Re: [RFC PATCH v2 6/6] kcov: add recursion guard and documentation
 for kcov-dataflow
Message-ID: <20260604085243.GD3126523@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-6-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-6-fee0939de2c4@est.tech>

On Wed, Jun 03, 2026 at 07:43:33PM +0200, Yunseong Kim wrote:
> Add a per-task recursion guard to kcov_df_write() using the high bit of
> kcov_dataflow_seq. This prevents infinite recursion when
> CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL is enabled: functions called by the
> callback itself (copy_from_kernel_nofault, xadd helpers) are also
> instrumented and would re-enter kcov_df_write() without this guard.
> 
> The guard uses the sequence counter's bit 31 as a re-entrancy flag.
> The low 24 bits (used for TLV record sequence numbers) are unaffected.
> 
> Also:
> - Exclude kcov.o, extable.o, softirq.o from dataflow instrumentation
>   (same pattern as KCOV_INSTRUMENT exclusions)
> - Add Documentation/dev-tools/kcov-dataflow.rst with:
>   - Prerequisites and Kconfig options
>   - Per-module instrumentation instructions
>   - Complete C example for data collection
>   - Ring buffer format specification
>   - Ioctl interface reference
>   - Fork interception example for child process tracing
>   - Rust module support via post-compilation pipeline
> 
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>

Another really weird patch. Adding Documentation is okay I suppose,
although I still utterly detest this rst crap. I still fail to see
what's wrong with plain text :-(

But then you do these two other random things in the same patch. Which
make no sense.

> diff --git a/kernel/Makefile b/kernel/Makefile
> index 1e1a31673577..9c56421c5390 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -37,6 +37,7 @@ KCOV_INSTRUMENT_extable.o := n
>  KCOV_INSTRUMENT_stacktrace.o := n
>  # Don't self-instrument.
>  KCOV_INSTRUMENT_kcov.o := n
> +KCOV_DATAFLOW_kcov.o := n
>  # If sanitizers detect any issues in kcov, it may lead to recursion
>  # via printk, etc.
>  KASAN_SANITIZE_kcov.o := n
> @@ -207,3 +208,5 @@ $(obj)/kheaders.md5: $(obj)/kheaders-srclist FORCE
>  	$(call filechk,kheaders_md5sum)
>  
>  clean-files := kheaders.md5 kheaders-srclist kheaders-objlist
> +KCOV_DATAFLOW_extable.o := n
> +KCOV_DATAFLOW_softirq.o := n

Why?!?! You Changelog also does not elucidate.

> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 373b8034ca5c..8d9d5e33549f 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -413,6 +413,16 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
>  	if (!in_task())
>  		return;
>  
> +	/*
> +	 * Prevent recursion: functions called by this callback
> +	 * (copy_from_kernel_nofault, xadd helpers) may be instrumented
> +	 * with INSTRUMENT_ALL. Use a per-task guard via the sequence
> +	 * counter's high bit.
> +	 */
> +	if (t->kcov_dataflow_seq & (1U << 31))
> +		return;
> +	t->kcov_dataflow_seq |= (1U << 31);
> +
>  	area = (u64 *)t->kcov_df_area;
>  	if (!area)
>  		return;
> @@ -449,7 +459,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
>  		if (KCOV_DF_IS_ERR(ptr)) {
>  			for (i = 0; i < num_fields; i++)
>  				area[pos + 3 + i] = KCOV_DF_MAGIC_BAD;
> -			return;
> +			goto out;
>  		}
>  		for (i = 0; i < num_fields; i++) {
>  			u64 off, sz, val = KCOV_DF_MAGIC_BAD;
> @@ -469,6 +479,8 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
>  			area[pos + 3 + i] = val;
>  		}
>  	}
> +out:
> +	t->kcov_dataflow_seq &= ~(1U << 31);
>  }
>  
>  #ifdef CONFIG_KCOV_DATAFLOW_ARGS

This needs barrier()s to be functional. And should be in a separate
patch.
