Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:35239 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732543AbfHFKDq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 06:03:46 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kbuild: fix false-positive need-builtin
Date: Tue,  6 Aug 2019 19:03:21 +0900
Message-Id: <20190806100323.22919-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

The current implementation of need-builtin is false-positive,
for example, in the following Makefile:

  obj-m := foo/
  obj-y := foo/bar/

..., where foo/built-in.a is not required.

Fixes: f7adc3124da0 ("kbuild: create built-in.o automatically if parent directory wants it")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0d434d0afc0b..3fe0c73e002c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -487,7 +487,8 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 
 PHONY += $(subdir-ym)
 $(subdir-ym):
-	$(Q)$(MAKE) $(build)=$@ need-builtin=$(if $(findstring $@,$(subdir-obj-y)),1)
+	$(Q)$(MAKE) $(build)=$@ \
+	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
-- 
2.17.1
