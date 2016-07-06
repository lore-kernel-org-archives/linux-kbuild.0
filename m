Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:64762 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754246AbcGFNsK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jul 2016 09:48:10 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [RFC] Kbuild: avoid "make tinyconfig" warnings
Date: Wed, 06 Jul 2016 15:49:18 +0200
Message-ID: <5717639.GLOFncF6tL@wuerfel>
In-Reply-To: <CAK7LNAT4mZ_W46wvmM9BWY8VDznfi7mXOHDQvV2sXXrUiH5sVQ@mail.gmail.com>
References: <20160704142608.2069991-1-arnd@arndb.de> <CAK7LNAT4mZ_W46wvmM9BWY8VDznfi7mXOHDQvV2sXXrUiH5sVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Josh Triplett <josh@joshtriplett.org>, Darren Hart <dvhart@linux.intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-build-reports@lists.linaro.org, Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wednesday, July 6, 2016 11:00:01 AM CEST Masahiro Yamada wrote:
> Hi Arnd,
> 
> 
> 2016-07-04 23:25 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> > The introduction of "make *.config" as a shorthand for merging configuration
> > files unfortunately introduced some build warnings that we see in every
> > single run of the various build bots testing tinyconfig:
> 
> I am not convinced with this statement.
> 
> Why do you think 63a91033d52e is a bad commit?
> 
> 
> With/without 63a91033d52e, I see the same warnings.
> 
> 
> $ git log --oneline  -1
> 63a9103 kbuild: add generic mergeconfig target, %.config
> $ make -s mrproper
> $ make tinyconfig >/dev/null
> .config:871:warning: override: KERNEL_XZ changes choice state
> .config:873:warning: override: SLOB changes choice state
> .config:874:warning: override: NOHIGHMEM changes choice state
> $ git checkout HEAD^
> Previous HEAD position was 63a9103... kbuild: add generic mergeconfig
> target, %.config
> HEAD is now at bc8f8f5... merge_config.sh: rename MAKE to RUNMAKE
> $ git log --oneline  -1
> bc8f8f5 merge_config.sh: rename MAKE to RUNMAKE
> $ make -s mrproper
> $ make tinyconfig >/dev/null
> .config:871:warning: override: KERNEL_XZ changes choice state
> .config:873:warning: override: SLOB changes choice state
> .config:874:warning: override: NOHIGHMEM changes choice state
> 

Sorry about, my mistake. I misread the original Makefile contents.

> >  PHONY += tinyconfig
> > -tinyconfig:
> > -       $(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
> > +tinyconfig: $(obj)/conf
> > +       $(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig KCONFIG_ALLCONFIG=$(wildcard $(srctree)/kernel/configs/tiny.config $(srctree)/arch/$(SRCARCH)/configs/tiny.config)
> >
> >  # Help text used by make help
> >  help:
> 
> 
> The dependency "tinyconfig: $(obj)/conf" is redundant.
> 
> 
> It is already specified by:
> 
> allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
>          $< --$@ $(Kconfig)


I don't see that yet. How does this line provide the dependency?
 
> What is worse, this patch breaks "make tinyconfig" on x86.

Right, Josh also pointed this out.

So, let's ignore my incorrect patch for the moment. Do you have
any other idea for how to avoid the warning?

	Arnd
