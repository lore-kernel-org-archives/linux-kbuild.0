Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:42382 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730119AbfILQXJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 12:23:09 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/4] kbuild: clear KBUILD_MODULES in top Makefile if CONFIG_MODULES=n
Date: Fri, 13 Sep 2019 01:22:53 +0900
Message-Id: <20190912162254.9603-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190912162254.9603-1-yamada.masahiro@socionext.com>
References: <20190912162254.9603-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Do not try to build any module-related artifacts when CONFIG_MODULES
is disabled.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - New patch

 Makefile               | 4 ++++
 scripts/Makefile.build | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index adc0cabe2382..0ecc62dbe234 100644
--- a/Makefile
+++ b/Makefile
@@ -1797,6 +1797,10 @@ single-build = $(if $(filter-out $@/, $(single-no-ko)),1)
 
 endif
 
+ifndef CONFIG_MODULES
+KBUILD_MODULES :=
+endif
+
 # FIXME Should go into a make.lib or something
 # ===========================================================================
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index fb29c898604a..aab9a14fa78d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -76,7 +76,7 @@ else ifneq ($(real-obj-y),)
 builtin-target := __warn-orphan-obj-y
 endif
 
-ifeq ($(CONFIG_MODULES)$(need-modorder),y1)
+ifdef need-modorder
 modorder-target := $(obj)/modules.order
 endif
 
-- 
2.17.1
