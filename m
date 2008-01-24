Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37478 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759002AbYAXWER (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:17 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 75/77] asm-generic/vmlix.lds.h: simplify __mem{init,exit}* dependencies
Date: Thu, 24 Jan 2008 23:03:56 +0100
Message-Id: <1201212238-4369-75-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Adrian Bunk <bunk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

From: Adrian Bunk <bunk@kernel.org>

Simplify the dependencies on __mem{init,exit}* (ACPI_HOTPLUG_MEMORY requires
MEMORY_HOTPLUG).

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/asm-generic/vmlinux.lds.h |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e0a56fb..2948530 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -29,8 +29,7 @@
 #define CPU_DISCARD(sec) *(.cpu##sec)
 #endif
 
-#if defined(CONFIG_MEMORY_HOTPLUG) || defined(CONFIG_ACPI_HOTPLUG_MEMORY) \
-	|| defined(CONFIG_ACPI_HOTPLUG_MEMORY_MODULE)
+#if defined(CONFIG_MEMORY_HOTPLUG)
 #define MEM_KEEP(sec)    *(.mem##sec)
 #define MEM_DISCARD(sec)
 #else
-- 
1.5.4.rc3.14.g44397

