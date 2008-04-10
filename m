Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:34551 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751736AbYDJTvM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Apr 2008 15:51:12 -0400
Received: from midway.site ([71.117.215.127]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Thu, 10 Apr 2008 12:51:09 -0700
Date: Thu, 10 Apr 2008 12:51:09 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: unnecessary "tristate"ness in Kconfig files
Message-Id: <20080410125109.0b575f62.rdunlap@xenotime.net>
In-Reply-To: <alpine.LFD.1.00.0802131142210.9575@localhost.localdomain>
References: <alpine.LFD.1.00.0802131142210.9575@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Wed, 13 Feb 2008 11:46:00 -0500 (EST) Robert P. J. Day wrote:

> 
>   can someone correct me if my thinking is out of whack here?
> consider init/Kconfig:
> 
> ...
> config IKCONFIG
>         tristate "Kernel .config support"
>         ---help---
>           This option enables the complete Linux kernel ".config" file
>           contents to be saved in the kernel. It provides documentation
>           of which kernel options are used in a running kernel or in an
>           on-disk kernel.  This information can be extracted from the kernel
>           image file with the script scripts/extract-ikconfig and used as
>           input to rebuild the current kernel or to build another kernel.
>           It can also be extracted from a running kernel by reading
>           /proc/config.gz if enabled (below).
> 
> config IKCONFIG_PROC
>         bool "Enable access to .config through /proc/config.gz"
>         depends on IKCONFIG && PROC_FS
>         ---help---
>           This option enables access to the kernel configuration file
>           through /proc/config.gz.
> ...
> 
>   now why is IKCONFIG tristate instead of simple bool?  it's used
> solely as a dependency for IKCONFIG_PROC, and that's used in
> kernel/configs.c thusly:
> 
> ...
> #ifdef CONFIG_IKCONFIG_PROC
> ...
> #endif
> ...

and it's used in kernel/Makefile:

obj-$(CONFIG_IKCONFIG) += configs.o

>   so it's easy to see that it should be selectable, but it's *not*
> clear to see why it should be *tristate*.  what is the value of its
> tristate-ness?  thanks.

Did you test building with CONFIG_IKCONFIG=m ?
How did you evaluate that it (tristate) is unnecessary?

---
~Randy
PS:  IKCONFIG was originally a bool.  Someone from Google
thought it would be interesting to make it a loadable module.
I disagreed, but the patch was merged anyway.
PPS:  Sorry about the delayed reply.
