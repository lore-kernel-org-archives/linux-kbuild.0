Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:56370 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754944AbcGHLrt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Jul 2016 07:47:49 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [RFC] Kbuild: avoid "make tinyconfig" warnings
Date: Fri, 08 Jul 2016 13:50:36 +0200
Message-ID: <4257104.nQPxdqsVCl@wuerfel>
In-Reply-To: <CAK7LNATAp0vbHD5r9gboKGyozNhruMbn9mHM1ggYtfTtnzC1Tw@mail.gmail.com>
References: <20160704142608.2069991-1-arnd@arndb.de> <5717639.GLOFncF6tL@wuerfel> <CAK7LNATAp0vbHD5r9gboKGyozNhruMbn9mHM1ggYtfTtnzC1Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Josh Triplett <josh@joshtriplett.org>, Darren Hart <dvhart@linux.intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-build-reports@lists.linaro.org, Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Friday, July 8, 2016 10:41:57 AM CEST Masahiro Yamada wrote: 
> 2016-07-06 22:49 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> >> It is already specified by:
> >>
> >> allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
> >>          $< --$@ $(Kconfig)
> >
> >
> > I don't see that yet. How does this line provide the dependency?
> 
> 
> "make tinyconfig" works like this:
> 
> This means, run "make allnoconfig", then "make tiny.config"
> in this order.

Ok, got it, sorry for being slow here.

> > So, let's ignore my incorrect patch for the moment. Do you have
> > any other idea for how to avoid the warning?
> 
> 
> Of your four ideas, I do not like the first two,
> but the others sound reasonable.

ok

> > - merge the fragments first and then use the combined fragment as the
> >   KCONFIG_ALLCONFIG file.
> 
> This is a strait-forward solution.
> I thought of this one, too.
> 
> 
> > - change merge_config.sh to do a 'savedefconfig' step before applying
> >   the fragment, so it doesn't warn about choice statements that are
> >   overridden from their default, as opposed to having conflicting choices.
> 
> This sounds interesting.
> 
> 
> 
> 
> 
> BTW, I have been wondering if we could support merge_config
> as a native feature of Kconfig instead of by a separate shell script.
> 
> If we could support KCONFIG_ALLCONFIG for "make oldconfig"
> perhaps merge_config.sh will go away?
> Maybe I am missing something, though.

I agree this sounds really nice, but I see two problems with it:

- at the moment, we always read exactly one input file from the
  kconfig tool, and that can be one of
	.config
	arch/${ARCH}/defconfig
	arch/${ARCH}/configs/*_defconfig
	the KCONFIG_ALLCONFIG contents
	./all{no,yes,mod,def,random}.config
  Teaching the tool to have two input files basically means reimplementing
  merge_config.sh in C. Definitely doable, and probably nicer than what
  we have, but not trivial.
- It doesn't actually solve the problem of the warnings that I'm trying to
  address, that would still have to be done on top of the reimplementation.

	Arnd
