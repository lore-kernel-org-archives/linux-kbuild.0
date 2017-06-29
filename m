Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:57217 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752105AbdF2MLv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jun 2017 08:11:51 -0400
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] kbuild: Enable Large File Support for hostprogs
Date: Thu, 29 Jun 2017 14:11:36 +0200
Message-Id: <20170629121136.16860-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, kernel@pengutronix.de, Ben Hutchings <ben@decadent.org.uk>

This fixes the following build error for me when building on an 32 bit
machine using an XFS file system:

	$ make scripts/basic/fixdep
	  HOSTCC  scripts/basic/fixdep
	fixdep: error fstat'ing depfile: scripts/basic/.fixdep.d: Value too large for defined data type

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e40c471abe29..2c72207ce298 100644
--- a/Makefile
+++ b/Makefile
@@ -301,9 +301,15 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
 	  else echo sh; fi ; fi)
 
+HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS)
+HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
+HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
+
 HOSTCC       = gcc
 HOSTCXX      = g++
-HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
+HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
+HOSTLDFLAGS  = $(HOST_LFS_LDFLAGS)
+HOST_LOADLIBES = $(HOST_LFS_LIBS)
 HOSTCXXFLAGS = -O2
 
 ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
@@ -417,7 +423,7 @@ KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(S
 
 export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
 export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP
+export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
 export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
-- 
2.11.0

