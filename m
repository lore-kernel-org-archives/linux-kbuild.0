Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF863EF0A8;
	Thu,  4 Jun 2026 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562456; cv=none; b=SVRG89JsrqYE6WoEuRi0ruCl7NifRY7Vw2SQi31HCTpV5j2jPMDT5Mq9aNdnWRm/QMQy8+xF8TavjZ1azEkOyfKJQ6hGEHvhzaUrvun8dmTMvTxW3UJmF6QM26bje+ilSKWNxf3bbWdMevOrUolGFfGwRNjOUQlhyKaJ6w16+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562456; c=relaxed/simple;
	bh=XNJ5fh/1NAptoMwID6mqwCNkEDVJ8H2qsK87wsPVrSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTuICktN6FMUwvVo4IdET+wTZ8ScPgRqAFK7mpDReoCOPRXja6jf5+UFNJwVyTO8bMf3pQsGTwR1PWElv8aIsYpPh24fAGqoGZ1jYkJlno8fjhESqaUXoTv/cjEL6dwI2zWQD+At/t2sq3DKKISxgOzZrWOQnzaOaIKgbgSj9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L6no8zPY; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L6no8zPY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EhPz68VyJlQQ+dusNAoBTrGhK0qOXoWr/Z3uLUPpF44=; b=L6no8zPY8073oqEm2Ybs2554J8
	NgH8DOY3QprzDhFjN5W6fBiI/O3UoYDcVa8+jiqWw3nLGG24TUpSGKY2QMfV3zd9dZMoFs6P24p4o
	Az1l0f43B5Xz7/agrtvKF4OWmJEWplN8l9gZrjtHn6jwfXEAKXxbWPM98sbo3jGotKfz8+xqHl0FW
	MwVVVtB9kRL3xHHXCUpnvSAXAgGK04T11334YmD/2hMmDKzGZpA0RiY5FjdMpcDIwgPEBFntPQ0zq
	7D06Z+e2lWwTV+4sHBbiwM8HH05jzhg8J0PnxlI02CUaoMCz0CKOOl/oNylyzzsRAIxkMDVG/6P1p
	GhLW9J2w==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV3cr-0000000E4sE-1mY0;
	Thu, 04 Jun 2026 08:40:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9B3D83001FD; Thu, 04 Jun 2026 10:40:26 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:40:26 +0200
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
Message-ID: <20260604084026.GY3126523@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>

On Wed, Jun 03, 2026 at 07:43:27PM +0200, Yunseong Kim wrote:
> CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL instruments every function in the
> kernel. 

Well, I would hope it would very much not instrument noinstr functions.
