Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:52929 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbZIUOhb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Sep 2009 10:37:31 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] warn about use of uninstalled kernel headers
Date: Mon, 21 Sep 2009 16:37:12 +0200
References: <830a8fa70909161930r518a9644ja954ced2ae5814b4@mail.gmail.com> <2375c9f90909171849n429bc474heabdc4d4fd064226@mail.gmail.com> <20090918045259.GA23333@merkur.ravnborg.org>
In-Reply-To: <20090918045259.GA23333@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200909211637.12983.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Am?rico Wang <xiyou.wangcong@gmail.com>, Caveh Jalali <ecaveh@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 18 September 2009, Sam Ravnborg wrote:
> > > I think we should no longer have the include2 directory at all with new kernels.
> > >
> > > LINUXINCLUDE already contains the right path in theory:
> > >
> > > LINUXINCLUDE    := -Iinclude \
> > >                   $(if $(KBUILD_SRC),-Iinclude2 -I$(srctree)/include) \
> > >                   -I$(srctree)/arch/$(hdr-arch)/include               \
> > >                   -include include/linux/autoconf.h
> > 
> > Hmm, at least in mmotm, we still have include2...
> > 
> > Maybe Sam is queueing the patches to remove include2?
> I have them queued - yes.
> But as they never hit -next they will wait another cycle.

Variations of this are starting to turn into a FAQ. How about
printing a useful warning when someone tries to use the kernel
headers without installing them first?

	Arnd <><
---
User applications frequently hit problems when they try to use
the kernel headers directly, rather than the exported headers.

This adds an explicit warning for this case, and points to
a URL holding an explanation of why this is wrong and what
to do about it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/kernel.h     |    6 ++++++
 scripts/headers_install.pl |    2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index d6320a3..f392d72 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -656,6 +656,12 @@ extern int do_sysinfo(struct sysinfo *info);
 
 #endif /* __KERNEL__ */
 
+#ifndef __EXPORTED_HEADERS__
+#ifndef __KERNEL__
+#warning Attempt to use kernel headers from user space, see http://kernelnewbies.org/KernelHeaders
+#endif /* __KERNEL__ */
+#endif /* __EXPORTED_HEADERS__ */
+
 #define SI_LOAD_SHIFT	16
 struct sysinfo {
 	long uptime;			/* Seconds since boot */
diff --git a/scripts/headers_install.pl b/scripts/headers_install.pl
index c6ae405..b89ca2c 100644
--- a/scripts/headers_install.pl
+++ b/scripts/headers_install.pl
@@ -20,7 +20,7 @@ use strict;
 
 my ($readdir, $installdir, $arch, @files) = @ARGV;
 
-my $unifdef = "scripts/unifdef -U__KERNEL__";
+my $unifdef = "scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__";
 
 foreach my $file (@files) {
 	local *INFILE;
