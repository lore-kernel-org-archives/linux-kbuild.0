Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4E3DC4B7;
	Fri, 12 Jun 2026 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249956; cv=none; b=Tv8lu4A2FqjNjIUhCDQ6sD7XE45E95nqkFtckAwtjsDJ3bPL2J/e5PaUmhjSKFr8NMqEgnr2f4m2FmjfeU7HQW1ajcSfahAIIWyyEwCzn8qDjFghelVYHelQk7DM/A1TamabVrXng2sxvmCZFmT301m3vA/F9p3ZZywt/pE1gUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249956; c=relaxed/simple;
	bh=8EIgVIlC6JCHjwC8WE7jBSyv3q6eIlfqccBGuSSJMUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoWx4v6P/gx+R+TmQ3PTYW/c98dqFjP5p/brAbMugkyOTMw2qWAaYks0eVoHNQY0l6D0fCRKgFVe4PgT7VWN+lF40PlaWDmHyOC42K0j+Hc0M0eSwBZFiF8wyPl84n2V2CzPU497i8NdaA0EtOsRG9RHFiMZxu3K62pMkSZfKVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BRCECrHE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BRCECrHE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aFXH3ZvaCn7gj4KBpQ0PbXpZaSVf5vHbLJnf4+8FvJs=; b=BRCECrHEKbSK7ToV1zkhTBOAoU
	tyYAD+eXJQnzEJ9srI6eR9w4GMnnZnihCp33HS3mFaA+mKrVYxUehR/AKrqSqTLtmeEkRi3g6ro+a
	XNuB7gtV0YqbZpPE76ZgfV3JXf8zgdlLPPUtnVDkh30cbfb8bSGvC/PGUZTSZNHVlYuwt0kQQiSCM
	LDg+R1tYYQWi75de+dpQbRQKOfaGW1jF/ar6FcqgmXb6STYww3PakfL3gGHx50bRo/8ds0DfBavDm
	YyefOln/xEX7YahrfemWrxz/hY5gnoA8BSX01StzDd4oxjZctE9FvxBjAQn0HGmd9EXS7Qw87JXrM
	jy2k0bcw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXwTk-000000068Ie-3n31;
	Fri, 12 Jun 2026 07:39:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 85171300673; Fri, 12 Jun 2026 09:38:58 +0200 (CEST)
Date: Fri, 12 Jun 2026 09:38:58 +0200
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
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
Message-ID: <20260612073858.GS187714@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260604084026.GY3126523@noisy.programming.kicks-ass.net>
 <513c68a8-e530-4461-a8e5-36e5d3d5858f@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <513c68a8-e530-4461-a8e5-36e5d3d5858f@est.tech>

On Fri, Jun 12, 2026 at 09:37:40AM +0200, Yunseong Kim wrote:
> Hi Peter,
> 
> > On Wed, Jun 03, 2026 at 07:43:27PM +0200, Yunseong Kim wrote:
> >> CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL instruments every function in the
> >> kernel. 
> > 
> > Well, I would hope it would very much not instrument noinstr functions.
> 
> Thank you for your guidance. I updated the default
> CONFIG_KCOV_DATAFLOW_NO_INLINE to n.

That's not really the point. The compiler extension *must* respect
noinstr. If there it no function attribute to suppress this kcov stuff,
then its an absolute non-starter.
