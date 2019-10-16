Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:16529 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfJPFRI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 01:17:08 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: reduce KBUILD_SINGLE_TARGETS as descending into subdirectories
Date: Wed, 16 Oct 2019 14:15:46 +0900
Message-Id: <20191016051547.11399-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

KBUILD_SINGLE_TARGETS does not need to contain all the targets.
Change it to keep track the targets only from the current directory
and its subdirectories.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a9e47953ca53..dcbb0124dac4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -469,15 +469,15 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 
 ifdef single-build
 
+KBUILD_SINGLE_TARGETS := $(filter $(obj)/%, $(KBUILD_SINGLE_TARGETS))
+
 curdir-single := $(sort $(foreach x, $(KBUILD_SINGLE_TARGETS), \
 			$(if $(filter $(x) $(basename $(x)).o, $(targets)), $(x))))
 
 # Handle single targets without any rule: show "Nothing to be done for ..." or
 # "No rule to make target ..." depending on whether the target exists.
 unknown-single := $(filter-out $(addsuffix /%, $(subdir-ym)), \
-			$(filter $(obj)/%, \
-				$(filter-out $(curdir-single), \
-					$(KBUILD_SINGLE_TARGETS))))
+			$(filter-out $(curdir-single), $(KBUILD_SINGLE_TARGETS)))
 
 __build: $(curdir-single) $(subdir-ym)
 ifneq ($(unknown-single),)
-- 
2.17.1
