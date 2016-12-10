Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:33360 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752280AbcLJVEM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Dec 2016 16:04:12 -0500
Received: by mail-io0-f171.google.com with SMTP id d9so112472804ioe.0
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Dec 2016 13:04:12 -0800 (PST)
Date: Sat, 10 Dec 2016 16:04:09 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [regression ?] kbuild: fix building bzImage with CONFIG_TRIM_UNUSED_KSYMS
 enabled
In-Reply-To: <20161210072305.GA6394@jagdpanzerIV.localdomain>
Message-ID: <alpine.LFD.2.20.1612101506520.1657@knanqh.ubzr>
References: <20161209024357.GB4661@jagdpanzerIV.localdomain> <20161209025637.GC4661@jagdpanzerIV.localdomain> <alpine.LFD.2.20.1612082235510.1657@knanqh.ubzr> <20161209045857.GD4661@jagdpanzerIV.localdomain> <alpine.LFD.2.20.1612091302540.1657@knanqh.ubzr>
 <20161210072305.GA6394@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Jarod Wilson <jarod@redhat.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On Sat, 10 Dec 2016, Sergey Senozhatsky wrote:

> On (12/09/16 13:07), Nicolas Pitre wrote:
> [..]
> > > build:
> > > make -j4 > build_log 2>&1
> > > 
> > > package:
> > > make -j4 INSTALL_MOD_PATH="${pkgdir}" modules_install >> build_log 2>&1
> > 
> > Weird.
> 
> it is. sorry for long reply, it took me some time to track it down.
> turned out, the script also does `prepare' and `kernelrelease'. so
> the sequence of commands in my build script is
> 
> 	make prepare
> 	make kernelrelease
> # functon build
> 	make -j4
> # finction package
> 	make -j4 INSTALL_MOD_PATH=XXXX modules_install
> 
> 
> now. the problem here is that, apparently, and I didn't know that,
> "make prepare" and "make kernelrelease" are executed twice.
> 
> - first time when I build the kernel
>  make prepare
>  make kernelrelease
>  make -j4
> 
> - second time when I install the modules
>  make prepare
>  make kernelrelease
>  make -j4 INSTALL_MOD_PATH=XXXX modules_install
> 
> 
> so this will not install modules:
>  make prepare; make kernelrelease; make -j4; make prepare; make kernelrelease; make -j4 INSTALL_MOD_PATH=/tmp/MODULES modules_install
> 
> and this will:
>  make prepare; make kernelrelease; make -j4; make kernelrelease; make -j4 INSTALL_MOD_PATH=/tmp/MODULES modules_install

Right. And this is because of this in the main Makefile:

# Create temporary dir for module support files
# clean it up only when building all modules
cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
                  $(if $(KBUILD_MODULES),; rm -f $(MODVERDIR)/*)

The list of modules to install is created from files found in 
$(MODVERDIR)/. This is cleared when KBUILD_MODULES is set.  Oddly 
enough, KBUILD_MODULES is _not_ globally set when building individual 
modules probably not to clear MODVERDIR. This requires explicit override 
like in this rule:

%.ko: prepare scripts FORCE
	$(cmd_crmodverdir)
	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)  \
	  $(build)=$(build-dir) $(@:.ko=.o)

One could wonder why $(cmd_crmodverdir) is executed again here given 
that it is already part of the "prepare" target, but that's an 
orthogonal issue.

Another question is whether or not KBUILD_MODULES is the right criteria 
for clearing MODVERDIR. My first reaction is to say it is not, but I 
can't come up with anything better at the moment.

And KBUILD_MODULES must be set for any target that results in 
vmlinux being built (and there are many of them including arch specific) 
whenever CONFIG_TRIM_UNUSED_KSYMS=y. Can this be enforced elsewhere in 
the Makefile, like in the recipe for $(vmlinux-dirs)? I don't know. IMHO 
this will only make things even less pretty than they are now.

In the mean time, though, I'm wondering why you have to do "make 
prepare" twice, or even at all.  Semantically, we could think of 
"prepare" as meaning to set things up for the build.  That could imply 
the erasing of some temporary files or even product files. Therefore 
that shouldn't be appropriate before a "modules_install" IMHO. 
Furthermore the "prepare" target is not listed amongst the documented 
make targets neither in the README file nor in the "make help" output.

So, given all the above considerations, would it be possible for you to 
"fix" your build script instead?


Nicolas
