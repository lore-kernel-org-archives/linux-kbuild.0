Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:41241 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfGWELk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jul 2019 00:11:40 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unused objectify macro
Date: Tue, 23 Jul 2019 13:11:26 +0900
Message-Id: <20190723041126.19897-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit 415008af3219 ("docs-rst: convert lsm from DocBook to ReST")
removed the last users of this macro.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 12666fc922ea..10ba926ae292 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -185,9 +185,6 @@ echo-cmd = $(if $($(quiet)cmd_$(1)),\
 # printing commands
 cmd = @set -e; $(echo-cmd) $(cmd_$(1))
 
-# Add $(obj)/ for paths that are not absolute
-objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
-
 ###
 # if_changed      - execute command if any prerequisite is newer than
 #                   target, or command line has changed
-- 
2.17.1
