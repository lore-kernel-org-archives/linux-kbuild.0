Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:40330 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965562AbcA0UVE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Jan 2016 15:21:04 -0500
Date: Wed, 27 Jan 2016 20:18:45 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RESEND] dtbsinstall: don't move target directory out of
 the way
Message-ID: <20160127201845.GI10826@n2100.arm.linux.org.uk>
References: <E1ZoWXk-0007DX-SY@rmk-PC.arm.linux.org.uk>
 <20151020132002.GD3953@io.lakedaemon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151020132002.GD3953@io.lakedaemon.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>

So what needs to happen to get this change merged?

On Tue, Oct 20, 2015 at 01:20:02PM +0000, Jason Cooper wrote:
> Hey Russell,
> 
> On Tue, Oct 20, 2015 at 02:01:32PM +0100, Russell King wrote:
> > No other kernel installation target moves the target directory out of
> > the way, even deleting an old version of it.  These are destructive
> > operations, ones which the kernel build system should not be making.
> > 
> > This behaviour prevents being able to do:
> > 
> > 	make install INSTALL_PATH=/some/path/boot
> > 	make dtbs_install INSTALL_DTBS_PATH=/some/path/boot
> > 
> > As it causes the boot directory containing the kernel installed in
> > step 1 to be moved to /some/path/boot.old.  Things get even more fun
> > if you do:
> > 
> > 	make install dtbs_install INSTALL_PATH=/some/path/boot INSTALL_DTBS_PATH=/some/path/boot
> > 
> > The kernel gets installed into /some/path/boot, then the directory gets
> > renamed to /some/path/boot.old, and a new directory created to hold the
> > dtbs.  Even more fun if you supply -j2 when we end up with races in
> > make.
> > 
> > Remove this behaviour.
> > 
> > If this behaviour is required at installation time, this should be
> > done by the installation external to the kernel makefiles, just like
> > it would be done for 'make modules_install'.
> > 
> > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> 
> Acked-by: Jason Cooper <jason@lakedaemon.net>
> 
> fwiw, I honestly don't remember adding this brokenness, but the git
> history doesn't lie:
> 
>   f4d4ffc03efc8 kbuild: dtbs_install: new make target
> 
> thx,
> 
> Jason.
> 
> > ---
> >  scripts/Makefile.dtbinst | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
> > index 1c15717e0d56..a1be75d0a5fd 100644
> > --- a/scripts/Makefile.dtbinst
> > +++ b/scripts/Makefile.dtbinst
> > @@ -23,8 +23,6 @@ include $(src)/Makefile
> >  PHONY += __dtbs_install_prep
> >  __dtbs_install_prep:
> >  ifeq ("$(dtbinst-root)", "$(obj)")
> > -	$(Q)if [ -d $(INSTALL_DTBS_PATH).old ]; then rm -rf $(INSTALL_DTBS_PATH).old; fi
> > -	$(Q)if [ -d $(INSTALL_DTBS_PATH) ]; then mv $(INSTALL_DTBS_PATH) $(INSTALL_DTBS_PATH).old; fi
> >  	$(Q)mkdir -p $(INSTALL_DTBS_PATH)
> >  endif
> >  
> > -- 
> > 2.1.0
> > 

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
