Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outmail011.snc4.facebook.com ([66.220.144.143]:48284 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751559Ab1EDUow (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 16:44:52 -0400
Date: Wed, 4 May 2011 13:44:51 -0700
From: Arun Sharma <asharma@fb.com>
Subject: Re: make rpm-pkg and version mismatch
Message-ID: <20110504204451.GA28259@dev1756.snc6.facebook.com>
References: <20110503212706.GA26044@dev1756.snc6.facebook.com>
 <4DC1B5CF.3070803@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DC1B5CF.3070803@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arun Sharma <asharma@fb.com>, linux-kbuild@vger.kernel.org

On Wed, May 04, 2011 at 10:23:43PM +0200, Michal Marek wrote:
> Dne 3.5.2011 23:27, Arun Sharma napsal(a):
> >
> >make rpm-pkg produces files that look like: kernel-2.6.39rc5-2.x86_64.rpm
> >However, uname -r produces 2.6.39rc5 (-2 is missing).
> >
> >This differs from how some of the distributors are packaging the kernel.
> >Their setup includes %{release} in uname -r.
> 
> Distributors have control over the kernel uname -r string. make rpm,
> on the other hand, needs to work with both the vanilla version
> strings, as well as any crazy suffixes the user comes up with. Hence
> it uses the uname -v version number as the rpm release, which is
> always defined.

Distributors have been doing this traditionally by hacking on the
EXTRAVERSION. But with the stable kernel series also using it,
EXTRAVERSION seems a bit busy.

> 
> Please don't do that. make rpm has to work with the version string
> set by the kernel, not the other way around.

Right.  Here's an alternative approach:

Could we modify the version string provided by the kernel to include
the version string (which is derived from scripts/mkversion)

--- a/Makefile
+++ b/Makefile
@@ -363,11 +363,14 @@ KBUILD_AFLAGS_MODULE  := -DMODULE
 KBUILD_CFLAGS_MODULE  := -DMODULE
 KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
 
-# Read KERNELRELEASE from include/config/kernel.release (if it exists)
-KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
+# Read ___KERNELRELEASE from include/config/kernel.release (if it exists)
+___KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
+# Append the release version only once. 
+# Note: .version could change during the build.
+KERNELRELEASE ?= $(___KERNELRELEASE)-$(shell /bin/sh scripts/mkversion)
 KERNELVERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
-export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
+export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION ___KERNELRELEASE

Since mkspec uses the same string for %{release} we get the same
consistency as a distributor built rpm.

 -Arun
