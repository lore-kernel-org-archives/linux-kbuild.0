Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483A329E6C;
	Thu,  4 Jun 2026 21:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780609731; cv=none; b=Stzr4rNzyKtVbicycBzadsGwUY9h+Bj3dHsVR75V7lmSXuGySIVGhLcnXHG6x1fTIepaD9umtxUZtZ7hEbI6pCDoVw2P8lYXnpRwoFTDtTABOOdaJsncihePKcvLtD8Ea9/GaxSTjAU4v5As77OZh7rwGKyNM4sqlKDYoq4LzXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780609731; c=relaxed/simple;
	bh=iK7nDkaVl+kbc7PjAEoaEgaDEKAIkheFFI1yWCxh/uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLvbVHmrIlsDwkcItFk/QJBBJkwwBsFhSMXbBuLWAKGbxZ53qY67wfHTlehJu480XBjC80idK6siy3tEDgF/lWkrLkuwMk/VA9MvJ5eUd9ELhulo9WXw1VkVApyd6N0Wo9XXm+vtYqX+0B/dBCZipmcXzhJC2LtLgDv1OpPimSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOJtH3Ws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOJtH3Ws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EC31F00893;
	Thu,  4 Jun 2026 21:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780609730;
	bh=hccU/NDSuAvcNj2qshs5G5T8N2B5+zR4AKzNjS5QKDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oOJtH3WswuxaSXCBwtdBZdGgqvPxMl2AxmgsBn1Q7sv9bv+2fIQpUu8P6psX9SraE
	 lSBE1kDOlOcCkxwq1Te5aY2Bf5gUb74/snkw1zcC7CzFdqpd4Avhfe2fsm750odqgS
	 O59dMX2g/aDU3jKvEKl8txbOdj8B+U3/SsyEk2xAP8EUrnd4KHHvI+btOw06/4rK2Q
	 taz///r7YoJ8dRaGduBLFDxVhYonPuOrFN7EFKzndPcRwg/FSeYlsjY8zFKlhD4Wob
	 HX+achzSxwGdodU9S7+z5XB058pkm5Q/iau8rvefFGQqQMoYtL2OOWHLyI0pZM4xE6
	 OCPIVEZUZh7Aw==
Date: Thu, 4 Jun 2026 14:48:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Yunseong Kim <yunseong.kim@est.tech>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <20260604214840.GA3915915@ax162>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
 <20260604084519.GA3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604084519.GA3126523@noisy.programming.kicks-ass.net>

On Thu, Jun 04, 2026 at 10:45:19AM +0200, Peter Zijlstra wrote:
> On Wed, Jun 03, 2026 at 07:43:29PM +0200, Yunseong Kim wrote:
> > Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> > scripts/Makefile.kcov, containing:
> >   -fsanitize-coverage=dataflow-args,dataflow-ret -g
> >   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
> > 
> > scripts/Makefile.lib applies these flags when a module's Makefile sets:
> >   KCOV_DATAFLOW_file.o := y   (per-file)
> >   KCOV_DATAFLOW := y          (per-directory)
> > 
> > Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> > The flags are only applied to kernel objects (same guard as basic KCOV).
> > 
> > Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> > ---
> >  scripts/Makefile.kcov | 6 ++++++
> >  scripts/Makefile.lib  | 7 +++++++
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> > index 78305a84ba9d..101173fe194b 100644
> > --- a/scripts/Makefile.kcov
> > +++ b/scripts/Makefile.kcov
> > @@ -2,10 +2,16 @@
> >  kcov-flags-y					+= -fsanitize-coverage=trace-pc
> >  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
> >  
> > +# KCOV dataflow: trace function args and return values
> > +kcov-dataflow-flags-y := -fsanitize-coverage=dataflow-args,dataflow-ret -g
> > +kcov-dataflow-flags-$(CONFIG_KCOV_DATAFLOW_NO_INLINE) += -fno-inline
> 
> https://clang.llvm.org/docs/ClangCommandLineReference.html
> 
> Has no mention of -fno-inline, furthermore, what are the exact
> semantics? Does it inhibit __always_inline?
> 

Based on clang/test/CodeGen/always-inline.c [1], I believe the semantics
are the same as GCC's '-fno-inline' [2], which avoids inlining except
for always_inline functions.

[1]: https://github.com/llvm/llvm-project/blob/1d13b74cf086629d5cdae5f44ef4a62cebcaf3ff/clang/test/CodeGen/always-inline.c
[2]: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-fno-inline

-- 
Cheers,
Nathan
