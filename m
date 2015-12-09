Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:52869 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753203AbbLIVjH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2015 16:39:07 -0500
Date: Wed, 9 Dec 2015 22:32:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Behaviour of kernel makefiles when entering a subdir using a
 config symbol = m
Message-ID: <20151209213255.GA11031@ravnborg.org>
References: <56687204.4080404@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56687204.4080404@ti.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

On Wed, Dec 09, 2015 at 08:25:08PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> I wonder if this is as designed, or a bug:
> 
> I have a makefile which has
> 
> obj-$(CONFIG_FOO) += foo/
> 
> In the foo directory, I have a makefile which has
> 
> obj-$(CONFIG_FOO_BAR) += bar.o
> 
> The values of the variables are
> 
> CONFIG_FOO=m
> CONFIG_FOO_BAR=y
> 
> When building the kernel with the above setup, I would expect make to
> enter the foo/ directory, and build 'bar.o' into the kernel image.
> 
> And make does enter the directory, and does compile 'bar.o', but I think
> 'bar.o' doesn't end up anywhere. At least it's not compiled into the
> kernel image.
kbuild may enter a sub directory for two purposes:
1) to build object files to be part of the final image
   Only subdirs specified using obj-y is visited.

2) to build object files that will be included in a module
   Subdirs specified with obj-y and obj-m is visited

Since you have the following code in your Makefile:

    obj-m += foo/

then foo/ is only visited to build modules.

So bar.o is built but is NOT included in the final image.
This is also the behaviour you see.

	Sam
