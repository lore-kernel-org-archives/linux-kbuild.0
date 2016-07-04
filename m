Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58195 "EHLO
	relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753620AbcGDT61 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jul 2016 15:58:27 -0400
Date: Mon, 4 Jul 2016 12:58:15 -0700
From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH] [RFC] Kbuild: avoid "make tinyconfig" warnings
Message-ID: <20160704195815.GA10294@x>
References: <20160704142608.2069991-1-arnd@arndb.de>
 <20160704195156.GA10164@x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160704195156.GA10164@x>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Darren Hart <dvhart@linux.intel.com>, linux-kbuild@vger.kernel.org, kernel-build-reports@lists.linaro.org, Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, linux-kernel@vger.kernel.org

On Mon, Jul 04, 2016 at 12:51:56PM -0700, Josh Triplett wrote:
> On Mon, Jul 04, 2016 at 04:25:55PM +0200, Arnd Bergmann wrote:
> > The introduction of "make *.config" as a shorthand for merging configuration
> > files unfortunately introduced some build warnings that we see in every
> > single run of the various build bots testing tinyconfig:
> > 
> > .config:966:warning: override: NOHIGHMEM changes choice state
> > .config:965:warning: override: SLOB changes choice state
> > .config:963:warning: override: KERNEL_XZ changes choice state
> > .config:962:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> > .config:933:warning: override: SLOB changes choice state
> > .config:930:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> > .config:870:warning: override: SLOB changes choice state
> > .config:868:warning: override: KERNEL_XZ changes choice state
> > .config:867:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> > 
> > This changes the behavior for tinyconfig again, so we call the special
> > allnoconfig target directly, with the fragment as the KCONFIG_ALLCONFIG
> > file so it gets merged into the configuration. The disadvantage of
> > this approach is that we cannot pass another KCONFIG_ALLCONFIG on
> > the command line, that would again have to be done using the mergeconfig
> > script afterwards.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Fixes: 63a91033d52e ("kbuild: add generic mergeconfig target, %.config")
> > Link: https://storage.kernelci.org/mainline/v4.7-rc6/x86-tinyconfig/build.log
> 
> Thanks for fixing this.
> Reviewed-by: Josh Triplett <josh@joshtriplett.org>
> 
> As another possibility, which would preserve the ability to use
> KCONFIG_ALLCONFIG, what about adding a parameter to mergeconfig to
> disable this warning?  I've seen many other uses of mergeconfig in
> production systems that have the same problem.

Actually, I just realized something: does this actually do the right
thing if both tiny.config files exist?  The documentation for
KCONFIG_ALLCONFIG doesn't suggest that it can take two files as
arguments.  And if it can, this also need quotes; otherwise, this will
expand to "... allnoconfig KCONFIG=path/to/a/tiny.config
another/path/to/a/tiny.config".

> >  scripts/kconfig/Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index ebced77deb9c..35d0e191fe3f 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -125,8 +125,8 @@ xenconfig: xen.config
> >  	@:
> >  
> >  PHONY += tinyconfig
> > -tinyconfig:
> > -	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
> > +tinyconfig: $(obj)/conf
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig KCONFIG_ALLCONFIG=$(wildcard $(srctree)/kernel/configs/tiny.config $(srctree)/arch/$(SRCARCH)/configs/tiny.config)
> >  
> >  # Help text used by make help
> >  help:
> > -- 
> > 2.9.0
> > 
