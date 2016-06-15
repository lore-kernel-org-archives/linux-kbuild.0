Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:49402 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753648AbcFOPpM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Jun 2016 11:45:12 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 06/11] ARM: don't include removed directories
Date: Wed, 15 Jun 2016 17:45:48 +0200
Message-Id: <20160615154553.3177021-7-arnd@arndb.de>
In-Reply-To: <20160615154553.3177021-1-arnd@arndb.de>
References: <20160615154553.3177021-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>

Three platforms used to have header files in include/mach that
are now all gone, but the removed directories are still being
included, which leads to -Wmissing-include-dirs warnings.

This removes the extra -I flags.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-mvebu/Makefile    | 3 +--
 arch/arm/mach-realview/Makefile | 3 +--
 arch/arm/mach-s5pv210/Makefile  | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-mvebu/Makefile b/arch/arm/mach-mvebu/Makefile
index ecf9e0c3b107..568863e1513c 100644
--- a/arch/arm/mach-mvebu/Makefile
+++ b/arch/arm/mach-mvebu/Makefile
@@ -1,5 +1,4 @@
-ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/$(src)/include \
-	-I$(srctree)/arch/arm/plat-orion/include
+ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-orion/include
 
 AFLAGS_coherency_ll.o		:= -Wa,-march=armv7-a
 CFLAGS_pmsu.o			:= -march=armv7-a
diff --git a/arch/arm/mach-realview/Makefile b/arch/arm/mach-realview/Makefile
index dae8d86ef4cc..404882130956 100644
--- a/arch/arm/mach-realview/Makefile
+++ b/arch/arm/mach-realview/Makefile
@@ -1,8 +1,7 @@
 #
 # Makefile for the linux kernel.
 #
-ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/$(src)/include \
-	-I$(srctree)/arch/arm/plat-versatile/include
+ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-versatile/include
 
 obj-y					:= core.o
 obj-$(CONFIG_REALVIEW_DT)		+= realview-dt.o
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index 72b9e9671507..fa7fb716e388 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -5,7 +5,7 @@
 #
 # Licensed under GPLv2
 
-ccflags-$(CONFIG_ARCH_MULTIPLATFORM) += -I$(srctree)/$(src)/include -I$(srctree)/arch/arm/plat-samsung/include
+ccflags-$(CONFIG_ARCH_MULTIPLATFORM) += -I$(srctree)/arch/arm/plat-samsung/include
 
 # Core
 
-- 
2.9.0

