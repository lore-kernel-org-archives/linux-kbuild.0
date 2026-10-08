Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116F3AC0F6;
	Thu,  8 Oct 2026 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791478063; cv=none; b=mchcKVaJzNvhR/2RxOK+rDf9AD5+DgKf3YNGXSkvapVBvx4ygcIWYcCLyA4kF87/M3Io6pRLJV0bLmEPY1YUfU2Q9Mjdv3a92Scid/m/GCr0MBRW2SckdYuk3CRyv2qNPqBTVwro6JHCV0paQoXklrWA/1kzl5lPIdOulNmi6k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791478063; c=relaxed/simple;
	bh=lfi62Wq4KPAm0onZOFBMdVRcXq1i6ZdsCCMqpM8htjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDqaVMOzQF0x5m+x8JRB7rOaomV9pebS7aLZd9f4BzeKTDdb1MZPDABwYhB1pgmv6Qn1ybQeOwNLIM5g2qCKNwFbFkwsbIGc2LLTnz2AE4HZBYoTl1kAb/yMycCTQdC3t7HoWCmeFNy5JReEVpMAdkFGtWWGzQb/PGab2xxrwCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yv6L+Luw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yv6L+Luw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5EA1F00893;
	Thu,  8 Oct 2026 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791478061;
	bh=hllApcy/IlPy1HyPhy+oUxqSwH0G/YI4bva0BhyB9uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yv6L+Luw53id5zVnxBMMWJvMzrQd3K7+g3yMjZrz82A+n9Ki3q6CUzUEFLxekqSUB
	 sEOaJkiVwe4pMT40dgXBokZ4qBl5tiJPdghfQL1sVM3vD6VVo8AceSEitWzNLMALEM
	 ez3HoF+0Hgx4ZqmEtMrkA1Wmpg5398x/AXbHFwvSKbi/aFYaL0G5hvzkXMile83s/B
	 mdq3UvlO4HjOZuVaZIbPJ7v3AeWYxG7yjAQ2cg1tR8mBaZLab7Uhuc8eGeOGkkIC87
	 L0+jnZgU9+L5/LOSowJDjka/Ei2HTnjc0HayZXgpUaTIcZFBIosTs134UEvcY+hoTT
	 yRDCcAcVwKdTg==
Date: Thu, 8 Oct 2026 18:47:36 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Denis Benato <denis.benato@linux.dev>
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, nsc@kernel.org,
	thomas.weissschuh@linutronix.de, chewi@gentoo.org,
	abelvesa@kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] kbuild: install-extmod-build: install
 kernel/kallsyms_internal.h
Message-ID: <20261008164736.GA3975095@ax162>
References: <20261005200123.146822-1-denis.benato@linux.dev>
 <20261006081116.GA830598@ax162>
 <0cbe9bb2-69b5-4d6c-a780-07a55d40a63d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cbe9bb2-69b5-4d6c-a780-07a55d40a63d@linux.dev>

Hi Denis,

On Tue, Oct 06, 2026 at 09:39:51PM +0200, Denis Benato wrote:
> On 10/6/26 10:11, Nathan Chancellor wrote:
> > On Mon, Oct 05, 2026 at 08:01:23PM +0000, Denis Benato wrote:
> >> The tree staged by install-extmod-build contains no kernel/ files, but
> >> since commit 4fafd1165b33 ("kallsyms: increase marker density to 16:1
> >> to accelerate lookups") scripts/kallsyms.c includes
> >> ../kernel/kallsyms_internal.h.
> > You did not add either the author or the committer of 4fafd1165b33, I
> > have done so now. This would need to be handled by them. However...
> 
> Apologies. I used whatever came back from get_maintainers.pl without
> much thinking given this is not the area of kernel I lurk in, but thanks
> for taking care of that.

No worries, that was a little unfair of me to put on you since this is a
bit of a weird situation that most contributors won't run into (a patch
living in one maintainer's tree that needs a follow up in code
maintained by another). A good rule of thumb is if you have bisected to
a particular change, always include the author and committer of said
change in the report, in addition to whatever get_maintainers.pl spits
out :)

> >> install-extmod-build rebuilds the host programs inside the staged tree
> >> whenever CC differs from HOSTCC (cross builds, or a ccache-wrapped CC).
> >> scripts/kallsyms is hostprogs-always-y, so that rebuild fails with:
> >>
> >>   scripts/kallsyms.c:39:10: fatal error: '../kernel/kallsyms_internal.h' file not found
> >>      39 | #include "../kernel/kallsyms_internal.h"
> >>         |          ^~~~~~~
> > I would rather not ship an internal kernel header in the external module
> > build. If these defines are needed to build scripts/kallsyms.c, they
> > should live in a separate header that is included in
> > {kernel,scripts}/kallsyms.c that is safe to expose to the external
> > module build but I defer to the 4fafd1165b33 folks.
> 
> Fair. This is something I spotted compiling our training/testing kernel
> at OGC using the github CI and my main goal was raising awareness
> on this issue so I simply started that by sending whatever glm did
> to make it build ahah.
> 
> Please when something better comes up CC me as well so I can use
> the proper fix rather than this llm-cooked thing :)

Indeed, thanks for the report raising the issue, I hope Andrew and/or
Jim can comment on it soon.

-- 
Cheers,
Nathan
