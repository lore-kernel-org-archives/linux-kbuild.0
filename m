Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1-g21.free.fr ([212.27.42.1]:53347 "EHLO smtp1-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760071AbZCSRoC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Mar 2009 13:44:02 -0400
Message-ID: <0a0401c9a8b9$fa181c30$f9b5a8c0@pii350>
From: "Gilles Espinasse" <g.esp@free.fr>
Subject: [PATCH] Be able to build pmac driver without IDE built-in
Date: Thu, 19 Mar 2009 18:41:46 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

No reason to need IDE built-in to be able to compile pmac driver
Tested to work on 2.6.29-rc8 and 2.6.28.8 with ide and pmac as modules
inside an initramfs

 Signed-off-by: Gilles Espinasse <g.esp@free.fr>

--- linux-2.6.28/drivers/ide/Kconfig.old 2009-03-19 16:36:34.000000000 +0100
+++ linux-2.6.28/drivers/ide/Kconfig 2009-03-19 16:35:49.000000000 +0100
@@ -676,7 +676,7 @@
 # TODO: BLK_DEV_IDEDMA_PCI -> BLK_DEV_IDEDMA_SFF
 config BLK_DEV_IDE_PMAC
  tristate "PowerMac on-board IDE support"
- depends on PPC_PMAC && IDE=y
+ depends on PPC_PMAC && IDE
  select IDE_TIMINGS
  select BLK_DEV_IDEDMA_PCI
  help

