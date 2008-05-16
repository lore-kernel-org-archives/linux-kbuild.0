Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from web95110.mail.in2.yahoo.com ([203.104.18.162]:48885 "HELO
	web95110.mail.in2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752515AbYEPLge (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 May 2008 07:36:34 -0400
Date: Fri, 16 May 2008 12:36:30 +0100 (BST)
From: murtuja bharmal <murtuja_bharmal@yahoo.com>
Subject: Re: Kbuild Makefile output
In-Reply-To: <20080516093243.GA499@mail.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Message-ID: <114572.24054.qm@web95110.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Becker <Joel.Becker@oracle.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>



> On Fri, May 16, 2008 at 07:03:55AM +0100, murtuja
> bharmal wrote:
> > 
> > --- Joel Becker <Joel.Becker@oracle.com> wrote:
> > 
> > > 1) Have the build name the output files
> > > appropritately.  That is,
> > > compile foo.c to foo-kernel.o and
> foo-userspace.o. 
> > > Then link as needed.
> > > The makefile dependencies Just Work.
> > > 
> > 
> > Thanks Joel,
> > In case of Solution 1.
> > what changes required in Makefile.
> > I mean how to build foo-kernel.c from foo.c using
> > kbuild makefile.
> 
> 	I still prefer solution 2, but for solution 1, you
> could do
> multiple things.  You could leave them as 
> them foo.o and foo-userspace.o.  That is, build the
> kernel drivers
> without a rename.  Whatever you do, you're going to
> hvae to be
> consistent.  So...
> 
> > Suppose this is my makefile
> > 
> > obj-m := mymodule.o
> > 
> > mymodule-objs += \
> >          dir1/foo.o   \
> >          dir2/bar.o   
> > 
> > all:
> >          make -C /usr/src/linux M=`pwd` modules.
> > 
> > I only want to change name for foo.c to
> foo-kernel.o,
> > not for bar.c.
> 
> 	Why would you do that?  bar.c is part of the kernel
> driver, so
> it should be bar-kernel.o if you are renaming.  You
> don't have to
> rename, of course.  You could use 'foo.o' for kernel
> objects and
> 'foo-userspace.o' for userspace objects.
> 

Actaually foo.c is common file for kernel space and
user space and bar.c is only a part of kernel space.
Anyway if we can change object file name for all
source file without changing source file name, then
also no issue but I just want to know whether it is
possible or not.

I tried to hard to find out way to put object file in
differnet directory not in source directory, to change
a name of individual object file or all object file,
other then source name.
But didn't find any clear idea in internet or kbuild
documentation.

I think in case of 2.4 lots things is possible because
we are using it as normal makefile.

Thanks 
Murtuja 


      Chocoholics&#39; paradise! Enter here - http://in.search.yahoo.com/search?&fr=na_onnetwork_mail_taglines&ei=UTF-8&rd=r1&p=chocolates
