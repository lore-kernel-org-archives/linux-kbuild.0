Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:60066 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729291AbfG3P7O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 11:59:14 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/4] kbuild: modpost: include .*.cmd files only when targets exist
Date: Wed, 31 Jul 2019 00:58:59 +0900
Message-Id: <20190730155902.5557-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, stable@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

A build rule fails, the .DELETE_ON_ERROR special target removes the
target, but does nothing for the .*.cmd file, which might be corrupted.
So, .*.cmd files should be included only when the corresponding targets
exist.

Commit 392885ee82d3 ("kbuild: let fixdep directly write to .*.cmd
files") missed to fix up this file.

Fixes: 392885ee82d3 ("kbuild: let fixdep directly write to .*.cmd")
Cc: <stable@vger.kernel.org> # v5.0+
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 6b19c1a4eae5..ad4b9829a456 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -145,10 +145,8 @@ FORCE:
 # optimization, we don't need to read them if the target does not
 # exist, we will rebuild anyway in that case.
 
-cmd_files := $(wildcard $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
+existing-targets := $(wildcard $(sort $(targets)))
 
-ifneq ($(cmd_files),)
-  include $(cmd_files)
-endif
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
 .PHONY: $(PHONY)
-- 
2.17.1
