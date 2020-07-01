Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:46532 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgGADaX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 23:30:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: always create directories of targets
Date: Wed,  1 Jul 2020 12:29:51 +0900
Message-Id: <20200701032951.409675-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Currently, the directories of objects are automatically created
only for O= builds.

It should not hurt to cater to this for in-tree builds too.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ca24c3077fef..98013fcde935 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -517,15 +517,13 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
-ifdef building_out_of_srctree
 # Create directories for object files if they do not exist
-obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
+obj-dirs := $(sort $(patsubst %/,%, $(dir $(targets))))
 # If targets exist, their directories apparently exist. Skip mkdir.
 existing-dirs := $(sort $(patsubst %/,%, $(dir $(existing-targets))))
 obj-dirs := $(strip $(filter-out $(existing-dirs), $(obj-dirs)))
 ifneq ($(obj-dirs),)
 $(shell mkdir -p $(obj-dirs))
 endif
-endif
 
 .PHONY: $(PHONY)
-- 
2.25.1
