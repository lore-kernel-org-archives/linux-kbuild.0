Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shells.gnugeneration.com ([66.240.222.126]:59498 "EHLO
        shells.gnugeneration.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbdL2SlO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Dec 2017 13:41:14 -0500
Date: Fri, 29 Dec 2017 10:40:43 -0800
From: vcaputo@pengaru.com
Subject: Re: [Regression 4.15] Can't kill CONFIG_UNWINDER_ORC with fire or
 plague.
Message-ID: <20171229184041.tsmjvrdrj2jvgm4o@shells.gnugeneration.com>
References: <20171226043003.GB10431@windriver.com>
 <d053e6df-ed00-2a02-eb27-4287b7549276@infradead.org>
 <20171229021323.GF10431@windriver.com>
 <20171229164739.rgcqmam6wtno6hge@treble>
 <20171229181830.GH10431@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171229181830.GH10431@windriver.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 29, 2017 at 01:18:30PM -0500, Paul Gortmaker wrote:
> [Re: [Regression 4.15] Can't kill CONFIG_UNWINDER_ORC with fire or plague.] On 29/12/2017 (Fri 10:47) Josh Poimboeuf wrote:
> 
> > This seems to be related to a kconfig quirk where only silentoldconfig
> > updates the include/config/auto.conf file.  The other config targets
> > (oldconfig, defconfig, etc) don't touch it.  It seems intentional, but I
> > have no idea why.
> > 
> > That causes the Makefile to get stale data for 'CONFIG_*' variables when
> > it includes auto.conf.  So I don't think this is specific to the ORC
> > check.  It seems like it could also cause bugs elsewhere.
> 
> OK, good - you agree with my initial diagnosis of stale auto.conf then.
> Not sure what Randy was testing when he said he couldn't reproduce it.
> 

FWIW just to add another data point, I tripped over this repeatedly
during a recent bisect of v4.14..v4.15-rc4.

My ad-hoc solution was to just delete the stale auto.conf and
reconfigure, IIRC.  It was pretty annoying at the time, and I assumed
everyone would be tripping over it so didn't bother making noise on
lkml.  Looks like I was mistaken...

Cheers,
Vito Caputo


> > The below (ugly) patch fixes it, though I'm not sure this is the best
> > way to do it.  We probably need Masahiro or Michal to chime in here.
> 
> Yep, that is why I intentionally put the kbuild folks on the To/Cc of
> the original report (and ran away screaming at the prospect of debugging
> Makefiles on xmas day).  But with holidays and all, it might not be
> until early January before they have a chance to reply.
> 
> Paul.
> --
> 
> > 
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index 297c1bf35140..3a0d92040a9c 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -21,18 +21,23 @@ unexport CONFIG_
> >  
> >  xconfig: $(obj)/qconf
> >  	$< $(silent) $(Kconfig)
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  gconfig: $(obj)/gconf
> >  	$< $(silent) $(Kconfig)
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  menuconfig: $(obj)/mconf
> >  	$< $(silent) $(Kconfig)
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  config: $(obj)/conf
> >  	$< $(silent) --oldaskconfig $(Kconfig)
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  nconfig: $(obj)/nconf
> >  	$< $(silent) $(Kconfig)
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  silentoldconfig: $(obj)/conf
> >  	$(Q)mkdir -p include/config include/generated
> > @@ -85,6 +90,7 @@ PHONY += $(simple-targets)
> >  
> >  $(simple-targets): $(obj)/conf
> >  	$< $(silent) --$@ $(Kconfig)
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  PHONY += oldnoconfig savedefconfig defconfig
> >  
> > @@ -108,9 +114,11 @@ else
> >  	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
> >  endif
> >  endif
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  %_defconfig: $(obj)/conf
> >  	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
> >  
> > @@ -118,6 +126,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
> >  	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
> >  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
> >  	+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  PHONY += kvmconfig
> >  kvmconfig: kvm_guest.config
> > @@ -130,6 +139,7 @@ xenconfig: xen.config
> >  PHONY += tinyconfig
> >  tinyconfig:
> >  	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
> > +	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> >  
> >  # Help text used by make help
> >  help:
