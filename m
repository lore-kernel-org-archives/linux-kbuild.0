Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:41877 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754695AbYE1TMg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 May 2008 15:12:36 -0400
Date: Wed, 28 May 2008 21:13:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Message-ID: <20080528191315.GA6979@uranus.ravnborg.org>
References: <20080521144211.902CD37652C@pmx1.sophos.com> <20080521190453.GA12638@uranus.ravnborg.org> <20080521194806.GJ22488@duo.random> <20080528190907.GA6466@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080528190907.GA6466@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrea Arcangeli <andrea@qumranet.com>
Cc: tvrtko.ursulin@sophos.com, linux-kbuild@vger.kernel.org

On Wed, May 28, 2008 at 09:09:07PM +0200, Sam Ravnborg wrote:
> On Wed, May 21, 2008 at 09:48:08PM +0200, Andrea Arcangeli wrote:
> > On Wed, May 21, 2008 at 09:04:53PM +0200, Sam Ravnborg wrote:
> > > Andrea Arcangeli <andrea@qumranet.com> reported a similar issue.
> > > I have not gotten around to look at it yet.
> > > I minimal Makefile that exhibits the problem
> > > would be helpfull!
> > 
> > I don't have the minimal but I can easily provide you a way to
> > reproduce:
> > 
> > git clone git://git.kernel.org/pub/scm/virt/kvm/kvm-userspace.git
> > cd kvm-userspace
> > patch -p1 -R <../belowinlinedworkaround
> > ./configure --kerneldir=/usr/src/anykernel
> > cd kernel
> > make
> > 
> > The below has the benefit of making more robust and higher prio the
> > inclusion of external-module-compat so it may not to be backed out
> > after this 2.6.26-rc regression is fixed.
> > 
> > The problem is that the $(src) in the EXTRA_CFLAGS below is expanded
> > to "".
> 
> I have now tried to reproduce this bug with no luck.
> - I tried to clone the git tree and follow your instructions.
>   But it failed to build due to some files missing in the
>   kernel directory so I gace up on that.
> - Then I tried to create a few Makefiles for an external
>   module. I used a copy of the ext-2 filesystem and modifided
>   the Makefile like below:
> #
> # Makefile for the linux ext2-filesystem routines.
> #
> 
> obj-m += ext2.o
> 
> ext2-y := balloc.o dir.o file.o fsync.o ialloc.o inode.o \
>           ioctl.o namei.o super.o symlink.o
> 
> EXTRA_CFLAGS := -I$(src)
> 
> 
> Manually inspecting the command lines to gcc told me that $(src) was
> properly expanded.
> 
> So something more subtle is going on.
> 
> Can I ask you to in an empty directory to create
> a Makefile like this:
> obj-m := foo.o
> ccflags-y := -I$(src)

[Forgot the rest of the instructions...]
touch foo.c

and then run:
make -C path/to/kernelsrc/ M=`pwd` V=1

Inspect the gcc commandlien to see if the last -I
contains the expected value (which is `pwd`)

	Sam
