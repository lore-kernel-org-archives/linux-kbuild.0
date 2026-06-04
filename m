Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0223F661D;
	Thu,  4 Jun 2026 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562733; cv=none; b=RUs23UEGzY1K3zRuhP3bbkIfm+6UKHJxRDN8RCm7nHh1YygzTGgDG36cuW7HL53u1ogzFbsLyVhMXs5k9ThpCwGzjoEZ5T8+vPUs334DEaA+Ndkk60x19dRgQNU6BaEJeDaynEENToLITGKUVtb2HLHbcP2gfn2abCFmKo3g0Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562733; c=relaxed/simple;
	bh=6ATw/jDOm2Bg8ZU6yVv+w3S4Jjlj/GH14nAKmgFd9Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJc7Qa60GFOuPVcOpJjUYo3DHmiLDR5TysUx6DKrPJ9Qh7HQmjKnpRXGPsVthaXol01bj/xEDLWcRvKvYcOgYo10hsrLHX3KEZH/VrjsDqssakFXdsoNOnRXP6HeGRTbuPcvnatS2cBv1xqe2ow0NCyNVdpl/dA1DBS8rao5Oc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UwKPae98; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UwKPae98"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g3BMk5ohjnfbiRgd2txp59JGh/kRY4Cer6gLXXyz3jE=; b=UwKPae98yl6026quA9inkgP9rx
	Y3/B13S6KJUmcvRO6LBrcEfgjh52WtSWtP+3N5YWYJIkiX7KbBb3mJ54ZGjuSV1Om2R//ltFV3D+Q
	bZd0AextTdnj8LfaeztOm75qQWZiSYe6v4uIwWFMNT3dWZBuRmxR7nDAvsq5tD7oVy1RvZFAkr5hY
	vrTW+C44bRqD1gaMQnLOnsbYhEpZ88XjFnuXuRUt8yw6rH16VyGXdCEqtpZdpAK2YLCxbLuNgPnAF
	PtoARNHJ/v2b2SMq8IEeFPjKN7E6PwS4VdYxPmhPafVsSvfDTv3zWFMe+P51d3EeXxsAXJshk8Ylm
	CMLOT2cA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV3hZ-0000000E5QO-0fPF;
	Thu, 04 Jun 2026 08:45:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 49529301218; Thu, 04 Jun 2026 10:45:19 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:45:19 +0200
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
Subject: Re: [RFC PATCH v2 2/6] kcov: add build system support for dataflow
 instrumentation
Message-ID: <20260604084519.GA3126523@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>

On Wed, Jun 03, 2026 at 07:43:29PM +0200, Yunseong Kim wrote:
> Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> scripts/Makefile.kcov, containing:
>   -fsanitize-coverage=dataflow-args,dataflow-ret -g
>   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
> 
> scripts/Makefile.lib applies these flags when a module's Makefile sets:
>   KCOV_DATAFLOW_file.o := y   (per-file)
>   KCOV_DATAFLOW := y          (per-directory)
> 
> Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> The flags are only applied to kernel objects (same guard as basic KCOV).
> 
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 78305a84ba9d..101173fe194b 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -2,10 +2,16 @@
>  kcov-flags-y					+= -fsanitize-coverage=trace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
>  
> +# KCOV dataflow: trace function args and return values
> +kcov-dataflow-flags-y := -fsanitize-coverage=dataflow-args,dataflow-ret -g
> +kcov-dataflow-flags-$(CONFIG_KCOV_DATAFLOW_NO_INLINE) += -fno-inline

https://clang.llvm.org/docs/ClangCommandLineReference.html

Has no mention of -fno-inline, furthermore, what are the exact
semantics? Does it inhibit __always_inline?

