Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:50327 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212Ab1GaTpG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 31 Jul 2011 15:45:06 -0400
From: Aunt Tillie <lacombar@gmail.com>
Subject: [PATCH] kbuild: honor the ARCH setting of the existing configuration
Date: Sun, 31 Jul 2011 15:44:57 -0400
Message-Id: <1312141497-13854-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Aunt Tillie <lacombar@gmail.com>

This change make Kbuild honor the ARCH setting of the existing configuration, if
any .config is present so that it does not get reset if there is a conflict
with the default ARCH for the platform and the current setting.

Signed-off-by: Arnaud Lacombe aka. Aunt Tillie <lacombar@gmail.com>
---
 Makefile |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index f676d15..bb2f1fc 100644
--- a/Makefile
+++ b/Makefile
@@ -192,7 +192,12 @@ SUBARCH := $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
 # Default value for CROSS_COMPILE is not to prefix executables
 # Note: Some architectures assign CROSS_COMPILE in their arch/*/Makefile
 export KBUILD_BUILDHOST := $(SUBARCH)
-ARCH		?= $(SUBARCH)
+ifeq ($(shell test -e .config && echo y),y)
+ARCH		?= $(shell sed '/^\# Linux\/\(.*\) .* Kernel Configuration/!d; s//\1/' .config)
+endif
+ifeq ($(ARCH),)
+ARCH		:= $(SUBARCH)
+endif
 CROSS_COMPILE	?= $(CONFIG_CROSS_COMPILE:"%"=%)
 
 # Architecture as present in compile.h
-- 
1.7.6.153.g78432

