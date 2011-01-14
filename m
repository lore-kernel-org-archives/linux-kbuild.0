Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta09.emeryville.ca.mail.comcast.net ([76.96.30.96]:51815 "EHLO
	qmta09.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757211Ab1ANONY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:13:24 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 06/27] m68k: change to new flag variables
Date: Fri, 14 Jan 2011 06:12:29 -0800
Message-Id: <1556db889c7d733160669d1b8d37b47d86b3eda5.1295006565.git.mfm@muteddisk.com>
In-Reply-To: <cover.1295006561.git.mfm@muteddisk.com>
References: <cover.1295006561.git.mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y and EXTRA_AFLAGS with asflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
---
 arch/m68k/math-emu/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/math-emu/Makefile b/arch/m68k/math-emu/Makefile
index a0935bf..547c23c 100644
--- a/arch/m68k/math-emu/Makefile
+++ b/arch/m68k/math-emu/Makefile
@@ -2,8 +2,8 @@
 # Makefile for the linux kernel.
 #
 
-#EXTRA_AFLAGS += -DFPU_EMU_DEBUG
-#EXTRA_CFLAGS += -DFPU_EMU_DEBUG
+#asflags-y := -DFPU_EMU_DEBUG
+#ccflags-y := -DFPU_EMU_DEBUG
 
 obj-y		:= fp_entry.o fp_scan.o fp_util.o fp_move.o fp_movem.o \
 			fp_cond.o fp_arith.o fp_log.o fp_trig.o
-- 
1.7.3.4

