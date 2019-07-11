Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:59527 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfGKFpz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:55 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 05/11] kbuild: modinst: read modules.order instead of $(MODVERDIR)/*.mod
Date: Thu, 11 Jul 2019 14:44:28 +0900
Message-Id: <20190711054434.1177-6-yamada.masahiro@socionext.com>
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Towards the goal of removing MODVERDIR, read out modules.order to get
the list of modules to be installed. This is simpler than parsing *.mod
files in $(MODVERDIR).

For external modules, $(KBUILD_EXTMOD)/modules.order should be read.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.modinst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0dae402661f3..5a4579e76485 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -8,10 +8,7 @@ __modinst:
 
 include scripts/Kbuild.include
 
-#
-
-__modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
-modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
+modules := $(sort $(shell cat $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order))
 
 PHONY += $(modules)
 __modinst: $(modules)
-- 
2.17.1
