Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:29100 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbfHYBb7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Aug 2019 21:31:59 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: clean up subdir-ymn calculation in Makefile.clean
Date: Sun, 25 Aug 2019 10:31:39 +0900
Message-Id: <20190825013139.12913-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Remove some variables.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.clean | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index fc38a34128d4..e367eb95c5c0 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -17,17 +17,8 @@ include $(if $(wildcard $(kbuild-dir)/Kbuild), $(kbuild-dir)/Kbuild, $(kbuild-di
 # Figure out what we need to build from the various variables
 # ==========================================================================
 
-__subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
-subdir-y	+= $(__subdir-y)
-__subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
-subdir-m	+= $(__subdir-m)
-__subdir-	:= $(patsubst %/,%,$(filter %/, $(obj-)))
-subdir-		+= $(__subdir-)
-
-# Subdirectories we need to descend into
-
-subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
-subdir-ymn      := $(sort $(subdir-ym) $(subdir-))
+subdir-ymn := $(sort $(subdir-y) $(subdir-m) $(subdir-) \
+		$(patsubst %/,%, $(filter %/, $(obj-y) $(obj-m) $(obj-))))
 
 # Add subdir path
 
-- 
2.17.1
