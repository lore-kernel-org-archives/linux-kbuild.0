Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:11808 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752245AbYEPJdB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 May 2008 05:33:01 -0400
Date: Fri, 16 May 2008 02:32:43 -0700
From: Joel Becker <Joel.Becker@oracle.com>
Subject: Re: Kbuild Makefile output
Message-ID: <20080516093243.GA499@mail.oracle.com>
References: <20080515205840.GA814@mail.oracle.com> <225576.17638.qm@web95110.mail.in2.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <225576.17638.qm@web95110.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: murtuja bharmal <murtuja_bharmal@yahoo.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, May 16, 2008 at 07:03:55AM +0100, murtuja bharmal wrote:
> 
> --- Joel Becker <Joel.Becker@oracle.com> wrote:
> 
> > 1) Have the build name the output files
> > appropritately.  That is,
> > compile foo.c to foo-kernel.o and foo-userspace.o. 
> > Then link as needed.
> > The makefile dependencies Just Work.
> > 
> 
> Thanks Joel,
> In case of Solution 1.
> what changes required in Makefile.
> I mean how to build foo-kernel.c from foo.c using
> kbuild makefile.

	I still prefer solution 2, but for solution 1, you could do
multiple things.  You could leave them as 
them foo.o and foo-userspace.o.  That is, build the kernel drivers
without a rename.  Whatever you do, you're going to hvae to be
consistent.  So...

> Suppose this is my makefile
> 
> obj-m := mymodule.o
> 
> mymodule-objs += \
>          dir1/foo.o   \
>          dir2/bar.o   
> 
> all:
>          make -C /usr/src/linux M=`pwd` modules.
> 
> I only want to change name for foo.c to foo-kernel.o,
> not for bar.c.

	Why would you do that?  bar.c is part of the kernel driver, so
it should be bar-kernel.o if you are renaming.  You don't have to
rename, of course.  You could use 'foo.o' for kernel objects and
'foo-userspace.o' for userspace objects.

Joel
-- 

"People with narrow minds usually have broad tongues."

Joel Becker
Principal Software Developer
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127
