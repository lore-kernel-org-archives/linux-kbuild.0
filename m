Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:16530 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbfJPFRI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 01:17:08 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: make target builds much faster
Date: Wed, 16 Oct 2019 14:15:47 +0900
Message-Id: <20191016051547.11399-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191016051547.11399-1-yamada.masahiro@socionext.com>
References: <20191016051547.11399-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since commit 394053f4a4b3 ("kbuild: make single targets work more
correctly"), building single targets is really slow.

Speed it up by not descending into unrelated directories.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index dcbb0124dac4..7eabbb66a65c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -479,7 +479,10 @@ curdir-single := $(sort $(foreach x, $(KBUILD_SINGLE_TARGETS), \
 unknown-single := $(filter-out $(addsuffix /%, $(subdir-ym)), \
 			$(filter-out $(curdir-single), $(KBUILD_SINGLE_TARGETS)))
 
-__build: $(curdir-single) $(subdir-ym)
+single-subdirs := $(foreach d, $(subdir-ym), \
+			$(if $(filter $(d)/%, $(KBUILD_SINGLE_TARGETS)), $(d)))
+
+__build: $(curdir-single) $(single-subdirs)
 ifneq ($(unknown-single),)
 	$(Q)$(MAKE) -f /dev/null $(unknown-single)
 endif
-- 
2.17.1
