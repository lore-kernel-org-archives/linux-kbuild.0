Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:55788 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752035Ab0JHACD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:03 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 02/33] Staging: batman-adv: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:22 -0400
Message-Id: <1286496113-11897-2-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y n Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/batman-adv/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/batman-adv/Makefile b/drivers/staging/batman-adv/Makefile
index 4b5c434..7892428 100644
--- a/drivers/staging/batman-adv/Makefile
+++ b/drivers/staging/batman-adv/Makefile
@@ -19,4 +19,4 @@
 #
 
 obj-$(CONFIG_BATMAN_ADV) += batman-adv.o
-batman-adv-objs := main.o bat_debugfs.o bat_sysfs.o send.o routing.o soft-interface.o icmp_socket.o translation-table.o bitarray.o hash.o ring_buffer.o vis.o hard-interface.o aggregation.o originator.o unicast.o
+batman-adv-y := main.o bat_debugfs.o bat_sysfs.o send.o routing.o soft-interface.o icmp_socket.o translation-table.o bitarray.o hash.o ring_buffer.o vis.o hard-interface.o aggregation.o originator.o unicast.o
-- 
1.7.3.1.50.g1e633

