Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:48043 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753022Ab0HWQNd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Aug 2010 12:13:33 -0400
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] sh: fix kconfig warning
Date: Mon, 23 Aug 2010 12:11:12 -0400
Message-Id: <1282579872-16609-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-sh <linux-sh@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

warning: (SUPERH32) selects HAVE_HW_BREAKPOINT which has unmet direct dependencies (PERF_EVENTS)

This warning was causing Kconfig to segfault.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 arch/sh/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 33990fa..06645b6 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -45,7 +45,7 @@ config SUPERH32
 	select HAVE_ARCH_KGDB
 	select HAVE_HW_BREAKPOINT
 	select HAVE_MIXED_BREAKPOINTS_REGS
-	select PERF_EVENTS if HAVE_HW_BREAKPOINT
+	select PERF_EVENTS
 	select ARCH_HIBERNATION_POSSIBLE if MMU
 
 config SUPERH64
-- 
1.7.2.30.gc37d7.dirty

