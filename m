Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485B41DED0;
	Thu, 30 Jul 2026 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785438717; cv=none; b=FsZKE1hes4DkJHh29vMWgdeJ0OKk0lJ7K56i/CQIdugeDhk1pTgvZySf2/u2I1jrXmq6eW/5QH7RcoA5ZrQXDrwA0Iz2K/PRjXV0wql/L8s45/AVcu4hvmqKc6Vb3TLYWiZt9T5kKeh6YbadxlI/9Gwtf9CJsQkrbNNhQhZqETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785438717; c=relaxed/simple;
	bh=t2Bn8w4wKZsAbUaN/GA+4G/1K5glKVe/ur+UC1KE7Vg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pNWPtW5jtwHeNrlbb+2dMmCKKeM47yRfw2yEpkPLiNrsX6xsjVMH/+baXAqguNQzBhtcsJWZ9RScf6Zhvw547yzxUTC7HRiMvJoVV0x3Oi5Z5lAXu1zult2NLudJMea3GEUaKWdewQwDI9IAxDiPFSXEo/AkDmB3iSHd6xjYBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Xnvacv9i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Xnvacv9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB521F000E9;
	Thu, 30 Jul 2026 19:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785438712;
	bh=2D2dlgf/lEFrepZjIxzuaV1xiILgoxdYGvRf1fwBpbw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xnvacv9imqCW2SN3z99zPlKh4L04zVEmzCCOrbpCVUwRvGOHBpSbD80+LRyfBCoL3
	 29KsboLGwkeP3kkidxYNrgBizYFs454EINUp3Y/D/jcJMgfCOQqytPqIoOTgrtsoj5
	 6nwo8TsBW4mrvMkLph9ePhsnIJtCnh+GBM0Pw+l8=
Date: Thu, 30 Jul 2026 12:11:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: David Laight <david.laight.linux@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Hildenbrand <david@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Nicolas Schier <nsc@kernel.org>,
 Christian Brauner <brauner@kernel.org>, "Paul E . McKenney"
 <paulmck@kernel.org>, David Howells <dhowells@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Randy Dunlap
 <rdunlap@infradead.org>, Kaitao Cheng <chengkaitao@kylinos.cn>, Philipp
 Stanner <phasta@kernel.org>, Alex Williamson <alex@shazbot.org>, David
 Matlack <dmatlack@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 "Joy H . J . Lee" <rkr0k0r@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, Ian Rogers <irogers@google.com>, Namhyung Kim
 <namhyung@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Prepare mutable list iterators to cache cursor
 state
Message-Id: <20260730121151.9d0577c2772b70c5e648b27d@linux-foundation.org>
In-Reply-To: <20260730095041.35715-1-kaitao.cheng@linux.dev>
References: <20260730095041.35715-1-kaitao.cheng@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jul 2026 17:50:32 +0800 Kaitao Cheng <kaitao.cheng@linux.dev> wrote:

> The list_for_each*_safe() helpers are used when the loop body may remove
> the current entry.  Their current interface, however, forces every caller
> to define a temporary cursor outside the macro and pass it in, even when
> the caller never uses that cursor directly.  For most call sites this
> extra cursor is just boilerplate required by the macro implementation.
> 
> This is awkward because the saved next pointer is an internal detail of
> the iteration.  Callers that only remove or move the current entry do not
> need to spell it out.
> 
> The _safe() suffix has also caused confusion.  Christian Koenig pointed
> out that the name is easy to read as a thread-safe variant, especially
> for beginners, even though it only means that the iterator keeps enough
> state to tolerate removal of the current entry.  He suggested _mutable()
> as a clearer description of what the loop permits.
> 
> Add *_mutable() iterator variants for list, hlist and llist. The caller
> omits the temporary cursor and the macro creates a unique internal cursor
> with typeof(pos) and __UNIQUE_ID(). The existing *_safe() helpers remain
> available for compatibility.

I can't say I'm very motivated about this proposal, sorry.

It adds nearly 500 lines of tricky new macros.

It churns ancient interfaces which have more than 6,000 callsites.  Are
maintainers to spend the next decade receiving "switch to *_mutable"
cleanups?

Unless I'm missing something here, my vote is to let it be and go do
more productive things.
