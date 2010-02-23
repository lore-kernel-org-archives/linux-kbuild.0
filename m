Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp2.it.da.ut.ee ([193.40.5.67]:47875 "EHLO smtp2.it.da.ut.ee"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752412Ab0BWIkX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2010 03:40:23 -0500
Date: Tue, 23 Feb 2010 10:17:48 +0200 (EET)
From: Meelis Roos <mroos@linux.ee>
Subject: CROSS_COMPILE not taken into account on parisc64?
Message-ID: <alpine.SOC.1.00.1002231008460.18041@math.ut.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-parisc@vger.lernel.org, linux-kbuild@vger.kernel.org

I am trying to build 2.6.33-rc* for a 64-bit parisc machine (using 
kernel.package in Debian unstable if it matters). The build 
fails assembling any .ko files with objcopy:

objcopy --add-gnu-debuglink=/home/mroos/linux-2.6/debian/linux-image-2.6.33-rc8-00173-g627fa17/usr/lib/debug/lib/modules/2.6.33-rc8-00173-g627fa17/kernel/drivers/cdrom/cdrom.ko /home/mroos/linux-2.6/debian/linux-image-2.6.33-rc8-00173-g627fa17/lib/modules/2.6.33-rc8-00173-g627fa17/kernel/drivers/cdrom/cdrom.ko
objcopy:/home/mroos/linux-2.6/debian/linux-image-2.6.33-rc8-00173-g627fa17/lib/modules/2.6.33-rc8-00173-g627fa17/kernel/drivers/cdrom/cdrom.ko: File format not recognized

Trying hppa64-linux-gnu-objcopy by hand works - but we should be using 
this cross compile prefix automatically.

We do have
OBJDUMP         = $(CROSS_COMPILE)objdump
in main Makefile, and

ifdef CONFIG_64BIT
UTS_MACHINE     := parisc64
CHECKFLAGS      += -D__LP64__=1 -m64
WIDTH           := 64
CROSS_COMPILE   := hppa64-linux-gnu-
else # 32-bit
WIDTH           :=
endif

in arch/parisc/Makefile so it seems OK at the first glance.

grep 64BIT .config tells
CONFIG_64BIT=y
CONFIG_PHYS_ADDR_T_64BIT=y

so this is correct too.

However, I see no inclusion of arch-specific Makefile before the 
assignment of OBJCOPY in main Makefile. Could this be the problem?

-- 
Meelis Roos (mroos@linux.ee)
