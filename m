Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ftp.linux-mips.org ([194.74.144.162]:48052 "EHLO
	ftp.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752043AbYAKOSU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jan 2008 09:18:20 -0500
Received: from localhost.localdomain ([127.0.0.1]:12190 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S28579578AbYAKOST (ORCPT <rfc822;linux-kbuild@vger.kernel.org>
	+ 1 other); Fri, 11 Jan 2008 14:18:19 +0000
Date: Fri, 11 Jan 2008 14:17:54 +0000
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: (Try #3) [Patch 2/8] MIPS: Remove 'TOPDIR' from Makefiles
Message-ID: <20080111141754.GC19900@linux-mips.org>
References: <20080101071311.GA2496@hacking> <20080101072238.GC2496@hacking> <20080101101540.GB28913@uranus.ravnborg.org> <jefxxhlkxb.fsf@sykes.suse.de> <20080101175754.GC31575@uranus.ravnborg.org> <20080102062135.GE2493@hacking>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080102062135.GE2493@hacking>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: WANG Cong <xiyou.wangcong@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Andreas Schwab <schwab@suse.de>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@osdl.org>, linux-mips@linux-mips.org

On Wed, Jan 02, 2008 at 02:21:36PM +0800, WANG Cong wrote:

> >> Shouldn't that use $(LINUXINCLUDE), or $(KBUILD_CPPFLAGS)?
> >It would be better to use $(LINUXINCLUDE) as we then pull in all config
> >symbols too and do not have to hardcode kbuild internal names (include2).
> 
> OK. Refine this patch.

LDSCRIPT also needed fixing to get builds in a separate object directory
working again.

I've applied below fix.

  Ralf

From 8babf06e1265214116fb8ffc634c04df85597c52 Mon Sep 17 00:00:00 2001
From: WANG Cong <xiyou.wangcong@gmail.com>
Date: Wed, 2 Jan 2008 14:21:36 +0800
Subject: [PATCH] [MIPS] Lasat: Fix built in separate object directory.

Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>

[Ralf: The LDSCRIPT script needed fixing, too]

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

diff --git a/arch/mips/lasat/image/Makefile b/arch/mips/lasat/image/Makefile
index 5332449..7ccd40d 100644
--- a/arch/mips/lasat/image/Makefile
+++ b/arch/mips/lasat/image/Makefile
@@ -12,11 +12,11 @@ endif
 
 MKLASATIMG = mklasatimg
 MKLASATIMG_ARCH = mq2,mqpro,sp100,sp200
-KERNEL_IMAGE = $(TOPDIR)/vmlinux
+KERNEL_IMAGE = vmlinux
 KERNEL_START = $(shell $(NM) $(KERNEL_IMAGE) | grep " _text" | cut -f1 -d\ )
 KERNEL_ENTRY = $(shell $(NM) $(KERNEL_IMAGE) | grep kernel_entry | cut -f1 -d\ )
 
-LDSCRIPT= -L$(obj) -Tromscript.normal
+LDSCRIPT= -L$(srctree)/$(obj) -Tromscript.normal
 
 HEAD_DEFINES := -D_kernel_start=0x$(KERNEL_START) \
 		-D_kernel_entry=0x$(KERNEL_ENTRY) \
@@ -24,7 +24,7 @@ HEAD_DEFINES := -D_kernel_start=0x$(KERNEL_START) \
 		-D TIMESTAMP=$(shell date +%s)
 
 $(obj)/head.o: $(obj)/head.S $(KERNEL_IMAGE)
-	$(CC) -fno-pic $(HEAD_DEFINES) -I$(TOPDIR)/include -c -o $@ $<
+	$(CC) -fno-pic $(HEAD_DEFINES) $(LINUXINCLUDE) -c -o $@ $<
 
 OBJECTS = head.o kImage.o
 
