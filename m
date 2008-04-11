Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:11605 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758418AbYDKA5Y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Apr 2008 20:57:24 -0400
Date: Thu, 10 Apr 2008 17:56:30 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH v2] documentation: build source files in Documentation
 sub-dir
Message-Id: <20080410175630.d862af9e.randy.dunlap@oracle.com>
In-Reply-To: <20080409145409.615cd236.akpm@linux-foundation.org>
References: <20080403124529.3f2efb79.randy.dunlap@oracle.com>
	<20080408134613.a047a7b6.akpm@linux-foundation.org>
	<20080409123551.42c5da0d.randy.dunlap@oracle.com>
	<20080409145409.615cd236.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, sam@ravnborg.org, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>

On Wed, 9 Apr 2008 14:54:09 -0700 Andrew Morton wrote:

> On Wed, 9 Apr 2008 12:35:51 -0700
> Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 
> > On Tue, 8 Apr 2008 13:46:13 -0700 Andrew Morton wrote:
> > 
> > > On Thu, 3 Apr 2008 12:45:29 -0700 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > > 
> > > > Currently source files in the Documentation/ sub-dir can easily bit-rot
> > > > since they are not generally buildable, either because they are hidden
> > > > in text files or because there are no Makefile rules for them.
> > > > This needs to be fixed so that the source files remain usable and good
> > > > examples of code instead of bad examples.
> > > > 
> > > > Add the ability to build source files that are in the Documentation/ dir.
> > > > Add to Kconfig as "BUILD_DOCSRC" config symbol.
> > > > 
> > > > Use "CONFIG_BUILD_DOCSRC=1 make ..." to build objects from the
> > > > Documentation/ sources.  Or enable BUILD_DOCSRC in the *config system.
> > > > 
> > > > The Makefiles use $objdir/usr/include for header files, so doing
> > > > "make headers_install" is required.  This is done for you if you enable
> > > > CONFIG_HEADERS_CHECK=y.
> > > > 
> > > > Note: needs documentation-move-spidev_fdx-example-to-its-own-source-file.patch
> > > > from -mm patchset.
> > > 
> > > argh, I'm getting several warnings and at least two build errors from this.
> > > One is:
> > > 
> > > In file included from /usr/src/devel/usr/include/linux/netlink.h:5,
> > >                  from /usr/src/devel/usr/include/linux/genetlink.h:4,
> > >                  from Documentation/accounting/getdelays.c:26:
> > > /usr/src/devel/usr/include/linux/types.h:166: error: expected specifier-qualifier-list before '__kernel_daddr_t'
> > > 
> > > (i386 allmodconfig).
> > > 
> > > I think I'll disable this patch for now..
> > 
> > Oh drat and curses.
> > 
> > Change all -I$(srctree) in Makefiles to -I$(objtree).
> > New (full) patch file with only that change is below.
> > I can send a patch with only those changes if you prefer that.
> > 
> > Cross-build using O= works now.
> 
> I wasn't using O=.
> 
> It turns out that this is breakage introduced by git-x86.patch. 
> Reproducible via:
> 
> setenv ARCH i386
> make mrproper
> make allmodconfig
> gcc -I$(/bin/pwd)/include Documentation/accounting/getdelays.c -o getdelays
> 
> In file included from /usr/src/devel/include/linux/netlink.h:5,
>                  from /usr/src/devel/include/linux/genetlink.h:4,
>                  from Documentation/accounting/getdelays.c:26:
> /usr/src/devel/include/linux/types.h:203: error: expected specifier-qualifier-list before '__kernel_daddr_t'


Those __kernel_* types shouldn't be used outside of the #ifdef __KERNEL__
block, should they?

Patch below fixes kernel side for me.  Don't have any idea what it
may do to userspace users of the header file.

---
 include/linux/types.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- mmotm-2008-0410-0157.orig/include/linux/types.h
+++ mmotm-2008-0410-0157/include/linux/types.h
@@ -200,8 +200,8 @@ typedef u32 resource_size_t;
 #endif	/* __KERNEL__ */
 
 struct ustat {
-	__kernel_daddr_t	f_tfree;
-	__kernel_ino_t		f_tinode;
+	daddr_t			f_tfree;
+	ino_t			f_tinode;
 	char			f_fname[6];
 	char			f_fpack[6];
 };
