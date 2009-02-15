Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:51028 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753161AbZBOKON (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Feb 2009 05:14:13 -0500
Date: Sun, 15 Feb 2009 11:16:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Is this a kbuild system's BUG?
Message-ID: <20090215101605.GA29792@uranus.ravnborg.org>
References: <91b13c310901200215t1b40ac1eid0a704d6c55522bc@mail.gmail.com> <20090120134719.GA18924@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090120134719.GA18924@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crquan@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, Jan 20, 2009 at 02:47:19PM +0100, Sam Ravnborg wrote:
> On Tue, Jan 20, 2009 at 06:15:29PM +0800, Cheng Renquan wrote:
> > Hello,
> > 
> > as the prepare target said,
> > 
> >   prepare         - Set up for building external modules
> > 
> > it should setup a environment for external modules building, right?
> > 
> > I unpacked linux-2.6.28.tar.bz2 to /usr/src/linux-2.6.28/, copied a
> > good .config,
> > "make prepare" under it,
> > 
> > but if I use it to build an external module under $PWD/kernel, it complains,
> > 
> > $ env -i make -C /usr/src/linux-2.6.28/ M=$PWD/kernel
> > make: Entering directory `/usr/src/linux-2.6.28'
> > 
> >   WARNING: Symbol version dump /usr/src/linux-2.6.28/Module.symvers
> >            is missing; modules will have no dependencies and modversions.
> > 
> >   Building modules, stage 2.
> >   MODPOST 1 modules
> > /bin/sh: scripts/mod/modpost: No such file or directory
> > make[1]: *** [__modpost] Error 127
> > make: *** [modules] Error 2
> > make: Leaving directory `/usr/src/linux-2.6.28'
> > 
> > it seems OK if I do a "make scritps/" in advance, so should we add scripts
> > depend to prepare?
> Yes.
> I wonder why this is not done today??
> 
> Can I ask you to try it out and see if anythings breaks.

I took a second look at this - and this time I actually read the documentation
we have. From Documentation/kbuild/modules.txt:

--- 2.4 Preparing the kernel tree for module build

        To make sure the kernel contains the information required to
        build external modules the target 'modules_prepare' must be used.
        'modules_prepare' exists solely as a simple way to prepare
        a kernel source tree for building external modules.
        Note: modules_prepare will not build Module.symvers even if
        CONFIG_MODVERSIONS is set. Therefore a full kernel build
        needs to be executed to make module versioning work.



This does not answer why we do not run the scripts target as part
of the prepare target. But it is at least documented what to do.

	Sam
