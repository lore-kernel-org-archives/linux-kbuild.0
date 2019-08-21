Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:18151 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbfHURdL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 13:33:11 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unneeded comments and code from scripts/basic/Makefile
Date: Thu, 22 Aug 2019 02:32:47 +0900
Message-Id: <20190821173247.14933-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Kbuild descends into scripts/basic/ even before the Kconfig.
I do not expect any other host programs added to this Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/basic/Makefile | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index 548aeb592806..7c9cb80d097b 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -1,16 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-###
-# This Makefile lists the most basic programs used during the build process.
-# The programs listed herein are what are needed to do the basic stuff,
-# such as fix file dependencies.
-# This initial step is needed to avoid files to be recompiled
-# when kernel configuration changes (which is what happens when
-# .config is included by main Makefile.
-# ---------------------------------------------------------------------------
-# fixdep: 	 Used to generate dependency information during build process
+#
+# fixdep: used to generate dependency information during build process
 
 hostprogs-y	:= fixdep
 always		:= $(hostprogs-y)
-
-# fixdep is needed to compile other host programs
-$(addprefix $(obj)/,$(filter-out fixdep,$(always))): $(obj)/fixdep
-- 
2.17.1
