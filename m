Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:56547 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753532Ab0JBMOk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Oct 2010 08:14:40 -0400
Date: Sat, 2 Oct 2010 14:14:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] Kbuild: Treat KBUILD_DEFCONFIG=old as request to
	use .config as the base
Message-ID: <20101002121438.GA15326@merkur.ravnborg.org>
References: <20100913143830.GK2919@stro.at> <4C8E3B15.2040807@suse.cz> <1284436209.5323.744.camel@localhost> <4CA5EA97.3060405@suse.cz> <1285973254.3916.68.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1285973254.3916.68.camel@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org, Bastian Blank <waldi@debian.org>

On Fri, Oct 01, 2010 at 11:47:34PM +0100, Ben Hutchings wrote:
> On Fri, 2010-10-01 at 16:05 +0200, Michal Marek wrote:
> > On 14.9.2010 05:50, Ben Hutchings wrote:
> > > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > > ---
> > > This should work as a substitute for Debian's updateoldconfig.
> > > 
> > > Ben.
> > > 
> > >  scripts/kconfig/Makefile |    4 ++++
> > >  1 files changed, 4 insertions(+), 0 deletions(-)
> > > 
> > > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > > index cef3f75..19558a7 100644
> > > --- a/scripts/kconfig/Makefile
> > > +++ b/scripts/kconfig/Makefile
> > > @@ -112,9 +112,13 @@ defconfig: $(obj)/conf
> > >  ifeq ($(KBUILD_DEFCONFIG),)
> > >  	$< --defconfig $(Kconfig)
> > >  else
> > > +ifeq ($(KBUILD_DEFCONFIG),old)
> > > +	$< --defconfig=.config $(Kconfig)
> > > +else
> > >  	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
> > >  	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
> > >  endif
> > > +endif
> > 
> > KBUILD_DEFCONFIG is an internal variable used by arch Makefiles to
> > select the defconfig file, it should not be abused for a completely
> > different purpose.
> 
> OK.
> 
> > Also, the same can be achieved with 'make
> > oldnoconfig' or 'yes "" | make oldconfig' in older kernels.
> 
> 'make oldnoconfig' does something different - it answers N to all
> questions rather than accepting the default.

To get default value for all new options you can use:
KCONFIG_ALLCONFIG=.config make alldefconfig

	Sam
