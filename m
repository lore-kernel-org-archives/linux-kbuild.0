Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:52570 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbeILLr1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Sep 2018 07:47:27 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: remove dead code in cmd_files calculation in top Makefile
Date: Wed, 12 Sep 2018 15:43:30 +0900
Message-Id: <1536734610-22173-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1536734610-22173-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536734610-22173-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Nobody sets 'targets' in the top-level Makefile or arch/*/Makefile,
hence $(targets) is empty.

$(wildcard .*.cmd) will do for including the .vmlinux.cmd file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4b76e22..8f6dbfc 100644
--- a/Makefile
+++ b/Makefile
@@ -1721,8 +1721,7 @@ cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
                   $(if $(KBUILD_MODULES),; rm -f $(MODVERDIR)/*)
 
 # read all saved command lines
-
-cmd_files := $(wildcard .*.cmd $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
+cmd_files := $(wildcard .*.cmd)
 
 ifneq ($(cmd_files),)
   $(cmd_files): ;	# Do not try to update included dependency files
-- 
2.7.4
