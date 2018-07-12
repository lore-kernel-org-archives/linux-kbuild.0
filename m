Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:50899 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbeGLKsq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 06:48:46 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: suppress warnings from 'getconf LFS_*'
Date: Thu, 12 Jul 2018 19:38:36 +0900
Message-Id: <1531391916-24086-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Suppress warnings for systems that do not recognize LFS_*.

 getconf: no such configuration parameter `LFS_CFLAGS'
 getconf: no such configuration parameter `LFS_LDFLAGS'
 getconf: no such configuration parameter `LFS_LIBS'

Fixes: d7f14c66c273 ("kbuild: Enable Large File Support for hostprogs")
Reported-by: Chen Feng <puck.chen@hisilicon.com>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 0f035ae..abc74f8 100644
--- a/Makefile
+++ b/Makefile
@@ -353,9 +353,9 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
 	  else echo sh; fi ; fi)
 
-HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS)
-HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
-HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
+HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
+HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
+HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 
 HOSTCC       = gcc
 HOSTCXX      = g++
-- 
2.7.4

