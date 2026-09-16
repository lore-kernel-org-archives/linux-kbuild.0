Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F04CC261;
	Wed, 16 Sep 2026 23:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600405; cv=none; b=DeETtLNj/sL1QodoJE0PxqhBzg3t6VEOxGEn1U7C4Kuc6KpXdxH0rAVsvxxHQ6Selri5bzzncWywhSrOoDm462HqHgEOavCNwC22FDqB1kwnnJFGPDTviB7OylAFUj7o36GQGYK8iZeM2QQC3j9Fz06aRiT6mEXOc4S6BN/DPtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600405; c=relaxed/simple;
	bh=B8+MBuH7hgnNHgjCFuUVsYMALksHXS1/a7kvWhXlbPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uaheq0Rgln0pg060nabwOSt58x84apvWWDmIi7zKneYhdW2fWBXrS2jfOjVu3fax0pRn245McXOYF78eDyhItqztMM7sVl0+lH1jro4EkvVLBs9YeuVz45dolsqNJmYpMbm2ZWhO6JZqqNzdKGXN7H5V88qKSoMgQTRrm6BxbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsiNUhRf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsiNUhRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0045C1F000FF;
	Wed, 16 Sep 2026 23:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789600403;
	bh=fdXOxNr6y2HLZ6S5d10u4ts4qJamRC604LgDoa2f+Lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VsiNUhRfFBcFmfiF1/uGCVgBqLk1nNS2vJPqozVzy2KOUinKDf9g9fhP1TVDawrT5
	 r41WzXD+4Xb5V5ohJaK91qm3YV+hBodzD4+ntEXHWbAU0Cd93BzxYGc7LES0FwI0qp
	 EzYEDMhzxZVx6+TzX9WTUpmWCp8/UqXcbMaloTCZnrnZmf9IK9VGwoKDjfQOG4Imdv
	 EdHQLKaphasqYpF1vUle36Mg/xyOVvAOAopKV84Om5s2qmCdqpqKv6qE1JLsOfyJtz
	 FRKjyA9MSPThdDnR1FBcaOL8sfFfAflfY05godRZN7kxxekwRkP2FtvRPMYweAXb6h
	 AZSRaIIE18aiQ==
Date: Wed, 16 Sep 2026 16:13:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
Message-ID: <20260916231319.GA550816@ax162>
References: <20260915104331.255636-1-jani.nikula@intel.com>
 <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>

On Wed, Sep 16, 2026 at 03:24:09PM -0700, Randy Dunlap wrote:
> On 9/15/26 3:43 AM, Jani Nikula wrote:
> > There have been various attempts at adding a header test or check
> > mechanism in the kernel build system. The header check primarily
> > consists of ensuring headers are self-contained, have include guards,
> > and, in some cases, pass kernel-doc.
> > 
> > The main problems have been:
> > 
> > - The dependency tracking creates undesirable artefacts (infamously also
> >   known as disgusting turds) in the build directory.
> > 
> > - Gating the feature behind a kconfig option is complicated due to
> >   allyesconfig builds. It's possible, but requires a verbose and
> >   confusing negative proxy config option.
> > 
> > - Naming the dependency tracking files with a dot prefix or placing them
> >   in a dot prefixed subdirectory in the build directory to hide them has
> >   been exceedingly difficult to achieve. (In part due to some Makefiles
> >   building files in subdirectory hierarchies.)
> > 
> > - The debate which headers, if any, should really be self-contained is
> >   virtually open-ended.
> 
> I would expect that headers in include/uapi/*.h should be self-contained,
> but apparently that's just a pipe dream on my part, or maybe it's just
> a maintainer option.
> 
> With 'make HEADER_CHECK="include/uapi/" headercheck'
> I see over 70 errors (mostly typedefs or defined constants, but not only
> those), such as:
> 
> In file included from <command-line>:
> ./../include/uapi/linux/hdlc/ioctl.h:74:21: error: ‘IFNAMSIZ’ undeclared here (not in a function)
>    74 |         char master[IFNAMSIZ];  /* Name of master FRAD device */
>       |                     ^~~~~~~~
> In file included from <command-line>:
> ./../include/uapi/linux/input.h:29:6: warning: ‘__BITS_PER_LONG’ is not defined, evaluates to ‘0’ [-Wundef]
>    29 | #if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64)) && !defined(__KERNEL__)
>       |      ^~~~~~~~~~~~~~~
> ./../include/uapi/linux/input.h:34:9: error: unknown type name ‘__kernel_ulong_t’
>    34 |         __kernel_ulong_t __sec;
>       |         ^~~~~~~~~~~~~~~~
> In file included from ./../include/uapi/linux/papr_pdsm.h:14,
>                  from <command-line>:
> ../include/linux/ndctl.h:19:33: error: ‘PAGE_SIZE’ undeclared here (not in a function)
>    19 |         ND_MIN_NAMESPACE_SIZE = PAGE_SIZE,
>       |                                 ^~~~~~~~~
> In file included from <command-line>:
> ./../include/uapi/linux/patchkey.h:15:2: error: #error "patchkey.h included directly"
>    15 | #error "patchkey.h included directly"
>       |  ^~~~~
> In file included from <command-line>:
> include/uapi/xen/gntdev.h:159:25: error: unknown type name ‘grant_ref_t’
>   159 |                         grant_ref_t ref;
>       |                         ^~~~~~~~~~~
> include/uapi/xen/gntdev.h:161:25: error: unknown type name ‘domid_t’
>   161 |                         domid_t domid;
>       |                         ^~~~~~~

include/uapi already has its own header checking infrastructure under
CONFIG_UAPI_HEADER_TEST and usr/include/Makefile, which avoids this with
a no-header-test list that includes many of the files listed in these
messages. To be honest, we should probably forbid HEADER_CHECK from
including 'include/uapi' and refer people to use CONFIG_UAPI_HEADER_TEST
instead, as there are other differences like being built under a
different C standard or C++ and such that the existing infrastructure
handles.

That said, I think the overall idea seems fine and relatively clean, at
least from my Kbuild perspective, as it is completely opt in, so the
previous objection to CONFIG_HEADER_CHECK_DISABLE and widely exposing
this to builds is pretty much moot.

-- 
Cheers,
Nathan
