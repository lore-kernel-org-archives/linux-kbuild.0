Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26F16FF37;
	Wed, 25 Feb 2026 19:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772047511; cv=none; b=rprUsjK1collwA6q1J/aWobHsjaezQSNjzWAfhMOeOm8i1IBcQb8xMKSIdgaGCQlQQZXYdtrHwTzUGYwIZq+q6Sklm8TuEG8r+0sbdjVKgNMzAYkm9cQgKAqCCOuNfDaoJAnJVkzIF4ZKz5fB5C+bz4Jm92oav2SwdnpSEqepNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772047511; c=relaxed/simple;
	bh=yLlDHHE6EIsR0u5akoFM3y92sk3iwDyQzKeafuT9mro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+NJtbQZVKOjzGJwlrYIE5fGAtjIvgvvjMQhOW26WiPzTpOlYSDV203EQuDJmk5s7smFHnjw2Kv9yP9qFq51Sw0Z/x+Yz2Sesxq0tr+wvl+1HNd3FI3cSqrnOFlTj1ce2j52Ic/z4JzyG5AsN0cTM0nsxRtqjDxNmN4nGt6rmno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyP+KFpx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyP+KFpx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4EAC116D0;
	Wed, 25 Feb 2026 19:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772047510;
	bh=yLlDHHE6EIsR0u5akoFM3y92sk3iwDyQzKeafuT9mro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyP+KFpxUWVhzoXKl1qNIxeNJYj/RWupYgMXlFKJkf8k40P37oatvs+QuOi43/57o
	 9mWXVkix+SeEscgxIjnY08aqvJZprxvUB8dK+JStI9Yz7RkIjZwuFTpbZLEGK4b/AL
	 Ifj4zkxzVe8UUsoXyiCHsoosIk0/CoLZjfDe8z2eQur6C8e8wAleRNv/MWeUrcLrlW
	 ZKnvKAj4HMaS+YCoMGZDUyuzGErukmrxiWOnuwsE5/Ae8eaoDOsQfMB5P8sRV8LhRJ
	 MF9jAleS1Cs8qy9ZxZLUAAB1ehJ3lBYb5zzGE5GOmk4CE8rpagNfqj8/L25tAC2tF7
	 6k9pzSum4QLeA==
Date: Wed, 25 Feb 2026 12:25:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Leo Yan <leo.yan@arm.com>, Namhyung Kim <namhyung@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RESEND v2] tools build: Use -fzero-init-padding-bits=all
Message-ID: <20260225192505.GC2755225@ax162>
References: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
 <20260224171956.GA639152@ax162>
 <202602241310.C3641B97@keescook>
 <20260225092210.GC4184494@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225092210.GC4184494@e132581.arm.com>

On Wed, Feb 25, 2026 at 09:22:10AM +0000, Leo Yan wrote:
> On Tue, Feb 24, 2026 at 01:11:19PM -0800, Kees Cook wrote:
> > On Tue, Feb 24, 2026 at 10:19:56AM -0700, Nathan Chancellor wrote:
> > > Kbuild does not maintain/touch tools/. This should go via another tree
> > > like perf or something. It does not look like
> > > tools/scripts/Makefile.include has a clear owner, perf and bpf tend to
> > > be the ones who touch it the most.
> 
> This is a circular deadlock.  Namhyung (the perf maintainer) advised me
> to send patch to the linux-kbuild [1], for fixing an union init issue
> found recently.

The tools/ build system is not Kbuild, so I do not want to take patches
for it, sorry. Issues from patches I take become my responsibility to
deal with and I am not at all familiar with the tools build system
because I am not a consumer of it. Nicolas may feel differently but I am
going to assume not based on his level of expertise with tools/ [1]. I
am not trying to deadlock you though.

Namhyung, I think this patch can reasonably go via the perf tree since
it will be a primary consumer of it.

> > You could claim it! ;)

Heh, Kbuild and ClangBuiltLinux give me more than enough to do around
here ;)

> > Regardless, I like to see cc-option available here, as I doubt this will
> > be the last conditional option for tool builds. (Actually, are there
> > other conditional options that could use this today in the tools
> > Makefiles?)
> 
> Some subprojects in tools have their own conditional options.
> 
> This patch is ambitious that it changes the global Makefile.include file
> so it can propagate the '-fzero-init-padding-bits=all' option to
> projects that include it.  Why do we need to do this globally?  This is
> because Perf needs to build several subprojects (libperf and bpftool).

This seems like a great reason for it to go via the perf tree as noted
above.

[1]: https://lore.kernel.org/aNhGp7NDCCrtwJqm@levanger/

Cheers,
Nathan
