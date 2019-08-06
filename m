Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:35533 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732584AbfHFKD6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 06:03:58 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: generate modules.order only in directories visited by obj-y/m
Date: Tue,  6 Aug 2019 19:03:22 +0900
Message-Id: <20190806100323.22919-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190806100323.22919-1-yamada.masahiro@socionext.com>
References: <20190806100323.22919-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

The modules.order files in directories visited by the chain of obj-y
or obj-m are merged to the upper-level ones, and become parts of the
top-level modules.order. On the other hand, there is no need to
generate modules.order in directories visited by subdir-y or subdir-m.
They would become orphan anyway.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3fe0c73e002c..37a1d2cd49d4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -488,7 +488,8 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 PHONY += $(subdir-ym)
 $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
-	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1)
+	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1) \
+	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
-- 
2.17.1
