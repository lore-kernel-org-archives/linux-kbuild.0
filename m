Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:39015 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752366Ab2DOK5o (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Apr 2012 06:57:44 -0400
Received: from [192.168.2.104] (unknown [82.235.130.199])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 0B34ED48047
	for <linux-kbuild@vger.kernel.org>; Sun, 15 Apr 2012 12:57:36 +0200 (CEST)
Message-ID: <4F8AABDB.2060608@fnac.net>
Date: Sun, 15 Apr 2012 13:07:07 +0200
From: Paul Chavent <paul.chavent@fnac.net>
MIME-Version: 1.0
Subject: REMAP_VECTORS_TO_RAM option in arch/arm/Kconfig-nommu hidden
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi

I don't see the REMAP_VECTORS_TO_RAM option in the menuconfig of the 3.2.14 kernel in nommu mode (even i had set the DRAM_BASE).

Without this option, the CONFIG_VECTORS_BASE remain to zero.

I had to do the following modifications to be ale to see the option.

--- Kconfig-nommu.orig  2012-04-15 12:51:51.000000000 +0200
+++ Kconfig-nommu       2012-04-15 12:52:05.000000000 +0200
@@ -34,8 +34,7 @@
           used instead of the auto-probing which utilizes the register.

  config REMAP_VECTORS_TO_RAM
-       bool 'Install vectors to the beginning of RAM' if DRAM_BASE
-       depends on DRAM_BASE
+       bool 'Install vectors to the beginning of RAM'
         help
           The kernel needs to change the hardware exception vectors.
           In nommu mode, the hardware exception vectors are normally

Even with only one of "if DRAM_BASE" or "depends on DRAM_BASE", it doesn't appear in the menu.

Regards.

Paul.

P.S : i'm not a list member, could you cc me you reply please ?

