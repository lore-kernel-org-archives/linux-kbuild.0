Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from main.gmane.org ([80.91.229.2]:56651 "EHLO ciao.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757318AbYGPPuH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2008 11:50:07 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KJ9GU-0007A1-6x
	for linux-kbuild@vger.kernel.org; Wed, 16 Jul 2008 15:50:02 +0000
Received: from 82-135-208-232.static.zebra.lt ([82.135.208.232])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Jul 2008 15:50:02 +0000
Received: from paulius.zaleckas by 82-135-208-232.static.zebra.lt with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Jul 2008 15:50:02 +0000
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Subject: make fails to create correct arch include symlink
Date: Wed, 16 Jul 2008 18:41:26 +0300
Message-ID: <g5l4r7$bc9$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Here is what happens:
---
[paulius@home linux-2.6]$ make all ARCH=arm CROSS_COMPILE=arm-linux-
   CHK     include/linux/version.h
make[1]: `include/asm-arm/mach-types.h' is up to date.
   CHK     include/linux/utsrelease.h
ERROR: the symlink include/asm points to asm-x86 but asm-arm was expected
        set ARCH or save .config and run 'make mrproper' to fix it
make: *** [include/asm] Error 1
---

I know that 'make mrproper' will work, but
"set ARCH or save .config and run 'make mrproper' to fix it"
ARCH is set, but it fails!

BR,
Paulius Zaleckas

