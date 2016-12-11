Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36287 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbcLKCT0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Dec 2016 21:19:26 -0500
Date: Sun, 11 Dec 2016 11:19:18 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [regression ?] kbuild: fix building bzImage with
 CONFIG_TRIM_UNUSED_KSYMS enabled
Message-ID: <20161211021918.GA454@tigerII.localdomain>
References: <20161209024357.GB4661@jagdpanzerIV.localdomain>
 <20161209025637.GC4661@jagdpanzerIV.localdomain>
 <alpine.LFD.2.20.1612082235510.1657@knanqh.ubzr>
 <20161209045857.GD4661@jagdpanzerIV.localdomain>
 <alpine.LFD.2.20.1612091302540.1657@knanqh.ubzr>
 <20161210072305.GA6394@jagdpanzerIV.localdomain>
 <alpine.LFD.2.20.1612101506520.1657@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1612101506520.1657@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Jarod Wilson <jarod@redhat.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On (12/10/16 16:04), Nicolas Pitre wrote:
> On Sat, 10 Dec 2016, Sergey Senozhatsky wrote:
[..]
> > so this will not install modules:
> >  make prepare; make kernelrelease; make -j4; make prepare; make kernelrelease; make -j4 INSTALL_MOD_PATH=/tmp/MODULES modules_install
> > 
> > and this will:
> >  make prepare; make kernelrelease; make -j4; make kernelrelease; make -j4 INSTALL_MOD_PATH=/tmp/MODULES modules_install
> 
> Right. And this is because of this in the main Makefile:
> 
> # Create temporary dir for module support files
> # clean it up only when building all modules
> cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
>                   $(if $(KBUILD_MODULES),; rm -f $(MODVERDIR)/*)
> 
> The list of modules to install is created from files found in 
> $(MODVERDIR)/. This is cleared when KBUILD_MODULES is set.  Oddly 
> enough, KBUILD_MODULES is _not_ globally set when building individual 
> modules probably not to clear MODVERDIR. This requires explicit override 
> like in this rule:
> 
> %.ko: prepare scripts FORCE
> 	$(cmd_crmodverdir)
> 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)  \
> 	  $(build)=$(build-dir) $(@:.ko=.o)
> 
> One could wonder why $(cmd_crmodverdir) is executed again here given 
> that it is already part of the "prepare" target, but that's an 
> orthogonal issue.
> 
> Another question is whether or not KBUILD_MODULES is the right criteria 
> for clearing MODVERDIR. My first reaction is to say it is not, but I 
> can't come up with anything better at the moment.
> 
> And KBUILD_MODULES must be set for any target that results in 
> vmlinux being built (and there are many of them including arch specific) 
> whenever CONFIG_TRIM_UNUSED_KSYMS=y. Can this be enforced elsewhere in 
> the Makefile, like in the recipe for $(vmlinux-dirs)? I don't know. IMHO 
> this will only make things even less pretty than they are now.
> 
> In the mean time, though, I'm wondering why you have to do "make 
> prepare" twice, or even at all.

well, not that I really wanted to execute it twice, it just was at
the beginning of the build/packaging script that I touched some 6-7
years ago.

> So, given all the above considerations, would it be possible for you to 
> "fix" your build script instead?

sure.

thanks.

	-ss
