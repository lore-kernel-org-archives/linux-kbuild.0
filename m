Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from web95116.mail.in2.yahoo.com ([203.104.18.168]:28386 "HELO
	web95116.mail.in2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1764583AbYEOSBk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 May 2008 14:01:40 -0400
Date: Thu, 15 May 2008 19:01:37 +0100 (BST)
From: murtuja bharmal <murtuja_bharmal@yahoo.com>
Subject: Re: Kbuild Makefile output
In-Reply-To: <20080515174222.GB24024@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <140961.15510.qm@web95116.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hello Sam,

Thanks for reply.
Actually Problem is.
As I told you I have near near about 1000 file that
compiles for single module creation which spread in
multiple directies in 2.4 with lots of makefile.

Now I have created single makefile to compile all this
file and able to create kernel module.

But now the problem is lots of file included in kernel
module, compiled twice or even more then twice for
user space (whithou kernel flag set) and kernel space
and this userspace binary is not a part of kbuild
makefile.

Previously in 2.4 we use to put all output object file
in different directories for kernel module and user
binaries based in their compilation Flags.

Now after attaching kbuild makefile with this system,
kbuild make all object file in source directory itself
becasue of that userspace makefiles not able to
compile those file again. Because one object file is
already there by kbuild. So I am not able create
userspace binary.

Now either solution is generate kbuild object file in
different directory not in source directory as per our
previous design or make a copy of exsisting file with
some other name. One for kernel and one for user
space.

So I thought lets check the possibility of generating
all kernel related object file in some other directory
not in source directory.


Thanks 
Murtuja

--- Sam Ravnborg <sam@ravnborg.org> wrote:

> On Thu, May 15, 2008 at 11:07:19PM +0530, murtuja
> bharmal wrote:
> > Hello All.
> > I want to collect all my object file in
> onedirectory and then want to create a kernel
> module.
> > For example: This my directory structure.
> > dir
> > |
> > --------------------------------------
> > |            |        |        |
> > dir1    dir2       dir3   dir4
> > This is my makefile in 'dir'.
> > obj-m := test.o
> > test-objs += \
> >                 dir1/test1.o  \
> >                 dir2/test2.o  \
> >                 dir3/test3.o
> > all:
> >             make -C /usr/src/linux M=`pwd` modules
> > 
> > Now I want to save all output objectfile test1.o
> test2.o test3.o in one directory
> > called 'dir4' not in source directory. 'test.o'
> should look all this object file in 'dir4' for
> linking, not in the source directory and 'test.ko'
> should also be create in 'dir4'.
> > Can any one tell me, what is require changes in
> Kernel Makefile for the same.
> 
> Do not do that...
> 
> If you really need to do so - please explain why so
> we can understand the rationale.
> There are ~2000 modules that does not need this so
> what makes your maodule so special?
> 
> [Added kbuild@vger to cc as you also asked there]
> 
> 	Sam
> 



      Connect with friends all over the world. Get Yahoo! India Messenger at http://in.messenger.yahoo.com/?wm=n/
