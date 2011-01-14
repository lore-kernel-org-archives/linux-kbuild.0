Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta14.emeryville.ca.mail.comcast.net ([76.96.27.212]:41094
	"EHLO qmta14.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757225Ab1ANONZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:13:25 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 07/27] microblaze: change to new flag variable
Date: Fri, 14 Jan 2011 06:12:30 -0800
Message-Id: <cc64e68a71abc5be604000a1e41a075941b07cbc.1295006565.git.mfm@muteddisk.com>
In-Reply-To: <cover.1295006561.git.mfm@muteddisk.com>
References: <cover.1295006561.git.mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
---
 arch/microblaze/kernel/cpu/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/microblaze/kernel/cpu/Makefile b/arch/microblaze/kernel/cpu/Makefile
index 59cc7bc..fceed4e 100644
--- a/arch/microblaze/kernel/cpu/Makefile
+++ b/arch/microblaze/kernel/cpu/Makefile
@@ -6,7 +6,7 @@ ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_cache.o = -pg
 endif
 
-EXTRA_CFLAGS += -DCPU_MAJOR=$(CPU_MAJOR) -DCPU_MINOR=$(CPU_MINOR) \
+ccflags-y := -DCPU_MAJOR=$(CPU_MAJOR) -DCPU_MINOR=$(CPU_MINOR) \
 		-DCPU_REV=$(CPU_REV)
 
 obj-y += cache.o cpuinfo.o cpuinfo-pvr-full.o cpuinfo-static.o mb.o pvr.o
-- 
1.7.3.4

