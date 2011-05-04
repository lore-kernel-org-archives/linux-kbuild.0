Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:52314 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755488Ab1EDVGq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 17:06:46 -0400
Message-ID: <4DC1C006.70107@suse.cz>
Date: Wed, 04 May 2011 23:07:18 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: make rpm-pkg and version mismatch
References: <20110503212706.GA26044@dev1756.snc6.facebook.com> <4DC1B5CF.3070803@suse.cz> <20110504204451.GA28259@dev1756.snc6.facebook.com>
In-Reply-To: <20110504204451.GA28259@dev1756.snc6.facebook.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arun Sharma <asharma@fb.com>
Cc: linux-kbuild@vger.kernel.org

Dne 4.5.2011 22:44, Arun Sharma napsal(a):
> On Wed, May 04, 2011 at 10:23:43PM +0200, Michal Marek wrote:
>> Please don't do that. make rpm has to work with the version string
>> set by the kernel, not the other way around.
> 
> Right.  Here's an alternative approach:
> 
> Could we modify the version string provided by the kernel to include
> the version string (which is derived from scripts/mkversion)
> 
> --- a/Makefile
> +++ b/Makefile
> @@ -363,11 +363,14 @@ KBUILD_AFLAGS_MODULE  := -DMODULE
>  KBUILD_CFLAGS_MODULE  := -DMODULE
>  KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
>  
> -# Read KERNELRELEASE from include/config/kernel.release (if it exists)
> -KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
> +# Read ___KERNELRELEASE from include/config/kernel.release (if it exists)
> +___KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
> +# Append the release version only once. 
> +# Note: .version could change during the build.
> +KERNELRELEASE ?= $(___KERNELRELEASE)-$(shell /bin/sh scripts/mkversion)
>  KERNELVERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)

Again, please don't do that. Most users don't give a damn about make
rpm. If I build a pristine 2.6.39-rc6, I want uname -r report
2.6.39-rc6, not 2.6.39-rc6-1. not 2.6.39-rc6-2 or anything like that. If
I wanted to decorate the release string, I would set
CONFIG_LOCALVERSION, but please do not make that choice for me. make rpm
is a simple tool to allow developers easily copy kernels from their
build machine to another machine where they can test stuff. If you want
something more advanced, use the spec file from your distro.

Michal
