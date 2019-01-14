Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:30387 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfANDQy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 Jan 2019 22:16:54 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unused baseprereq
Date: Mon, 14 Jan 2019 12:16:45 +0900
Message-Id: <1547435805-8110-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit eea199b445f6 ("kbuild: remove unnecessary LEX_PREFIX and
YACC_PREFIX") removed the last users of this macro.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 525bff6..3081603 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -24,10 +24,6 @@ depfile = $(subst $(comma),_,$(dot-target).d)
 basetarget = $(basename $(notdir $@))
 
 ###
-# filename of first prerequisite with directory and extension stripped
-baseprereq = $(basename $(notdir $<))
-
-###
 # Escape single quote for use in echo statements
 escsq = $(subst $(squote),'\$(squote)',$1)
 
-- 
2.7.4
