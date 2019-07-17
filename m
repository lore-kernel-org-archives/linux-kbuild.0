Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:62970 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfGQGS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:26 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 06/12] kbuild: modsign: read modules.order instead of $(MODVERDIR)/*.mod
Date: Wed, 17 Jul 2019 15:17:54 +0900
Message-Id: <20190717061800.10018-7-yamada.masahiro@socionext.com>
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Towards the goal of removing MODVERDIR, read out modules.order to get
the list of modules to be signed. This is simpler than parsing *.mod
files in $(MODVERDIR).

The modules_sign target is only supported for in-kernel modules.
So, this commit does not take care of external modules.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 scripts/Makefile.modsign | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.modsign b/scripts/Makefile.modsign
index da56aa78d245..d7325cefe709 100644
--- a/scripts/Makefile.modsign
+++ b/scripts/Makefile.modsign
@@ -8,8 +8,7 @@ __modsign:
 
 include scripts/Kbuild.include
 
-__modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
-modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
+modules := $(sort $(shell cat modules.order))
 
 PHONY += $(modules)
 __modsign: $(modules)
-- 
2.17.1
