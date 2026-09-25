Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB143BDA3;
	Fri, 25 Sep 2026 19:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365464; cv=none; b=NJV612+Y6TSHxMg2OpNEC8uttAgunzy1qEAzX8KA4kD6KumCQfC93QZYRJQQjPL3yjvjuwFLg+5VEN1nwgTopezw0kv36BOD6vo15armrqfIIIsQoTjlOYi52AB7TmGhF56ZOpuowMJac3Nc3SVTAlw51r6mDBFr5DG/w/411JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365464; c=relaxed/simple;
	bh=3Xb0oGhzLfYczPGuE2/pQo/PBUev7kNI3+4C2KVWQio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ol6nQpem3PdDauG2kiulmQnPTM7dR5Fyh1/it14PbOY2bnZOTqcrzuAx0CFmRVUC27Mf2z3yKdzNPXnPZBfWamNaP0Fhws3S49Vv+1RMLPrdPwHuXEYJoyNJJm5fpQGcp7vg+r14dHH6AO+rU/L622SS72iZWrwKLl1dNkgjZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edVBNN9Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edVBNN9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603E91F000FF;
	Fri, 25 Sep 2026 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790365463;
	bh=3B8UaLQAJccxK3dSqs8InHQL9/S4ix3IsZ9bb0Uj2Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=edVBNN9ZRY1ru4c6XE1Kig1Te25JnVJC9L9gnjSOXBz/74U/D3TiM+uSCN3qhFr8L
	 0KwvcALYoH+oj76ZslsqAdlQJi0Fz+9syvsjQRHeTUEBrCUca8sPIXZD0TVQTGlN4R
	 asE5hIf9T8oV8s8ol26p7zOUK+s6lSGrh/wHR8Wpxm7NsKqq+2vl76wMKVvOMrj8Xp
	 zy6hXtAPnOOf14LnrdTDkk/aVNd/xOkXszH92C0/MRDfS8HRCk6SUpmru2U807MJR0
	 BJLb56i5ghpqf58hfo5E3pPtWvFlcgIqLUBd+ouAdazWHzvXD+jvfTAmvfDtJWdoo3
	 W+AkOv780Ny0Q==
Date: Fri, 25 Sep 2026 20:44:18 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
Message-ID: <20260925194418.GA3652012@ax162>
References: <20260915104331.255636-1-jani.nikula@intel.com>
 <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
 <20260916231319.GA550816@ax162>
 <71a8b988-3977-44e4-93d6-782e4447f160@t-8ch.de>
 <20260917171722.GA356152@ax162>
 <80690e33ca5d2eb3cdbe5b84f75b2af39e3b8423@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80690e33ca5d2eb3cdbe5b84f75b2af39e3b8423@intel.com>

On Wed, Sep 23, 2026 at 01:40:57PM +0300, Jani Nikula wrote:
> On Thu, 17 Sep 2026, Nathan Chancellor <nathan@kernel.org> wrote:
> > On Thu, Sep 17, 2026 at 11:05:32AM +0200, Thomas Weißschuh wrote:
> >> On 2026-09-16 16:13:19-0700, Nathan Chancellor wrote:
> >> > include/uapi already has its own header checking infrastructure under
> >> > CONFIG_UAPI_HEADER_TEST and usr/include/Makefile, which avoids this with
> >> > a no-header-test list that includes many of the files listed in these
> >> > messages. To be honest, we should probably forbid HEADER_CHECK from
> >> > including 'include/uapi' and refer people to use CONFIG_UAPI_HEADER_TEST
> >> > instead, as there are other differences like being built under a
> >> > different C standard or C++ and such that the existing infrastructure
> >> > handles.
> >> 
> >> Testing the UAPI headers here too would still be valuable.
> >> CONFIG_UAPI_HEADER_TEST tests the headers from the perspective of
> >> userspace after they have undergone processing. The kernel build
> >> might see the same headers quite differently.
> >> 
> >> For instance the example from above:
> >> 
> >> ./../include/uapi/linux/input.h:29:6: warning: ‘__BITS_PER_LONG’ is not defined, evaluates to ‘0’ [-Wundef]
> >>    29 | #if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64)) && !defined(__KERNEL__)
> >>       |      ^~~~~~~~~~~~~~~
> >> ./../include/uapi/linux/input.h:34:9: error: unknown type name ‘__kernel_ulong_t’
> >>    34 |         __kernel_ulong_t __sec;
> >>       |         ^~~~~~~~~~~~~~~~
> >> 
> >> These are legitimate issues, the inclusion of the necessary header is
> >> gated behind #ifndef __KERNEL__ although it should not be.
> >
> > Hmmm, fair enough. I guess we can leave this functionality in place for
> > UAPI headers then but I just worry about people doing what Randy did and
> > reporting these issues when they are already known and handled in some
> > other way. Maybe the UAPI header test could grow an "internal kernel
> > usage" check similar to the other checks that it has at some point then
> > we could forbid HEADER_CHECK=include/uapi but it is fine for now.
> 
> Do you think the patch at hand is good to go, then? Anything further you
> need from me?

I don't have any other comments or objections. I will give a few days
for other folks to comment on it before I apply it to the kbuild tree.

-- 
Cheers,
Nathan
