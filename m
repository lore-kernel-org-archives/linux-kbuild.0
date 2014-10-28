Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34447 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751375AbaJ1OSZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Oct 2014 10:18:25 -0400
Subject: [PATCH] Makefile: sort list of defconfig targets in make help output
From: Konstantin Khlebnikov <k.khlebnikov@samsung.com>
Date: Tue, 28 Oct 2014 17:18:20 +0400
Message-id: <20141028141820.14137.64256.stgit@buzz>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Without sorting this list is completely unreadable for ARCH=arm.

Signed-off-by: Konstantin Khlebnikov <k.khlebnikov@samsung.com>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 52c1297..63f05dc 100644
--- a/Makefile
+++ b/Makefile
@@ -1234,7 +1234,7 @@ rpm: include/config/kernel.release FORCE
 # ---------------------------------------------------------------------------
 
 boards := $(wildcard $(srctree)/arch/$(SRCARCH)/configs/*_defconfig)
-boards := $(notdir $(boards))
+boards := $(sort $(notdir $(boards)))
 board-dirs := $(dir $(wildcard $(srctree)/arch/$(SRCARCH)/configs/*/*_defconfig))
 board-dirs := $(sort $(notdir $(board-dirs:/=)))
 

