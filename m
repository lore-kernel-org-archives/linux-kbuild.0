Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DCC477995;
	Thu, 17 Sep 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635939; cv=none; b=FEsXa9+0pDWQN6eS+MlIUhHZ2b39rnA0KnmdTgecqAKITZ+8UqXorD4u0xXAuun7LlEwD6XK6sgHjye/bk3OqyZnVaGQT9bMXalEfkpdU5v6t+tIOD6DA6SJA/XXHAgdKvr8mADLur5sD6QZCxqKUhPHwvHE6XbEQzuG+1uAsAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635939; c=relaxed/simple;
	bh=GsZPMKs8GBT4W2PsqKyej5smhTaCdg5BURTN9kF97gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9bH6kHCTDqtqDw0iOcYHd1Lh+iE5js8yZZ2gNFWdHVd7ZyuN17MdRTbBaifghaozJQWImibod212PeUPeKSC55g4vEc/piJu4b5xuPUBvDYUYu2SyUa5nG7rW5+43GfStu5tr7+hpXUlcycrpfCtu5cEjtLSWR+ICBSlYTzZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=T8I9EG4I; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="T8I9EG4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789635933;
	bh=GsZPMKs8GBT4W2PsqKyej5smhTaCdg5BURTN9kF97gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8I9EG4IZaakZ1Z12F7CG+97kxpVOHLPIKd4sX0HUMmWwH8rONj/4G8KH+svFwR4i
	 lQqIZYGwz/eghMd00Ai+RMQ6SsPfdSxtMkAvJrLFaDETcV09izinKueRWLhd9/d0oB
	 l6h29bWfejLsYScD7MpIZ9qDxrHbQrVXBcv93wn4=
Date: Thu, 17 Sep 2026 11:05:32 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
Message-ID: <71a8b988-3977-44e4-93d6-782e4447f160@t-8ch.de>
References: <20260915104331.255636-1-jani.nikula@intel.com>
 <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
 <20260916231319.GA550816@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916231319.GA550816@ax162>

On 2026-09-16 16:13:19-0700, Nathan Chancellor wrote:
> On Wed, Sep 16, 2026 at 03:24:09PM -0700, Randy Dunlap wrote:
> > On 9/15/26 3:43 AM, Jani Nikula wrote:
> > > There have been various attempts at adding a header test or check
> > > mechanism in the kernel build system. The header check primarily
> > > consists of ensuring headers are self-contained, have include guards,
> > > and, in some cases, pass kernel-doc.
> > > 
> > > The main problems have been:
> > > 
> > > - The dependency tracking creates undesirable artefacts (infamously also
> > >   known as disgusting turds) in the build directory.
> > > 
> > > - Gating the feature behind a kconfig option is complicated due to
> > >   allyesconfig builds. It's possible, but requires a verbose and
> > >   confusing negative proxy config option.
> > > 
> > > - Naming the dependency tracking files with a dot prefix or placing them
> > >   in a dot prefixed subdirectory in the build directory to hide them has
> > >   been exceedingly difficult to achieve. (In part due to some Makefiles
> > >   building files in subdirectory hierarchies.)
> > > 
> > > - The debate which headers, if any, should really be self-contained is
> > >   virtually open-ended.
> > 
> > I would expect that headers in include/uapi/*.h should be self-contained,
> > but apparently that's just a pipe dream on my part, or maybe it's just
> > a maintainer option.
> > 
> > With 'make HEADER_CHECK="include/uapi/" headercheck'
> > I see over 70 errors (mostly typedefs or defined constants, but not only
> > those), such as:
> > 
> > In file included from <command-line>:
> > ./../include/uapi/linux/hdlc/ioctl.h:74:21: error: ‘IFNAMSIZ’ undeclared here (not in a function)
> >    74 |         char master[IFNAMSIZ];  /* Name of master FRAD device */
> >       |                     ^~~~~~~~
> > In file included from <command-line>:
> > ./../include/uapi/linux/input.h:29:6: warning: ‘__BITS_PER_LONG’ is not defined, evaluates to ‘0’ [-Wundef]
> >    29 | #if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64)) && !defined(__KERNEL__)
> >       |      ^~~~~~~~~~~~~~~
> > ./../include/uapi/linux/input.h:34:9: error: unknown type name ‘__kernel_ulong_t’
> >    34 |         __kernel_ulong_t __sec;
> >       |         ^~~~~~~~~~~~~~~~
> > In file included from ./../include/uapi/linux/papr_pdsm.h:14,
> >                  from <command-line>:
> > ../include/linux/ndctl.h:19:33: error: ‘PAGE_SIZE’ undeclared here (not in a function)
> >    19 |         ND_MIN_NAMESPACE_SIZE = PAGE_SIZE,
> >       |                                 ^~~~~~~~~
> > In file included from <command-line>:
> > ./../include/uapi/linux/patchkey.h:15:2: error: #error "patchkey.h included directly"
> >    15 | #error "patchkey.h included directly"
> >       |  ^~~~~
> > In file included from <command-line>:
> > include/uapi/xen/gntdev.h:159:25: error: unknown type name ‘grant_ref_t’
> >   159 |                         grant_ref_t ref;
> >       |                         ^~~~~~~~~~~
> > include/uapi/xen/gntdev.h:161:25: error: unknown type name ‘domid_t’
> >   161 |                         domid_t domid;
> >       |                         ^~~~~~~
> 
> include/uapi already has its own header checking infrastructure under
> CONFIG_UAPI_HEADER_TEST and usr/include/Makefile, which avoids this with
> a no-header-test list that includes many of the files listed in these
> messages. To be honest, we should probably forbid HEADER_CHECK from
> including 'include/uapi' and refer people to use CONFIG_UAPI_HEADER_TEST
> instead, as there are other differences like being built under a
> different C standard or C++ and such that the existing infrastructure
> handles.

Testing the UAPI headers here too would still be valuable.
CONFIG_UAPI_HEADER_TEST tests the headers from the perspective of
userspace after they have undergone processing. The kernel build
might see the same headers quite differently.

For instance the example from above:

./../include/uapi/linux/input.h:29:6: warning: ‘__BITS_PER_LONG’ is not defined, evaluates to ‘0’ [-Wundef]
   29 | #if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64)) && !defined(__KERNEL__)
      |      ^~~~~~~~~~~~~~~
./../include/uapi/linux/input.h:34:9: error: unknown type name ‘__kernel_ulong_t’
   34 |         __kernel_ulong_t __sec;
      |         ^~~~~~~~~~~~~~~~

These are legitimate issues, the inclusion of the necessary header is
gated behind #ifndef __KERNEL__ although it should not be.

(...)


Thomas
