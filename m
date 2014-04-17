Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:54111 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754235AbaDQCoL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Apr 2014 22:44:11 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] selinux,kbuild: remove unnecessary $(hostprogs-y) from clean-files
Date: Thu, 17 Apr 2014 11:42:26 +0900
Message-Id: <1397702546-25349-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: selinux@tycho.nsa.gov, Masahiro Yamada <yamada.m@jp.panasonic.com>

Files added to hostprogs-y are cleaned. (See scripts/Makefile.clean)
Adding them to clean-files is redundant.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

 scripts/selinux/genheaders/Makefile | 1 -
 scripts/selinux/mdp/Makefile        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
index 417b165..1d1ac51 100644
--- a/scripts/selinux/genheaders/Makefile
+++ b/scripts/selinux/genheaders/Makefile
@@ -2,4 +2,3 @@ hostprogs-y	:= genheaders
 HOST_EXTRACFLAGS += -Isecurity/selinux/include
 
 always		:= $(hostprogs-y)
-clean-files	:= $(hostprogs-y)
diff --git a/scripts/selinux/mdp/Makefile b/scripts/selinux/mdp/Makefile
index eb365b3..dba7eff 100644
--- a/scripts/selinux/mdp/Makefile
+++ b/scripts/selinux/mdp/Makefile
@@ -2,4 +2,4 @@ hostprogs-y	:= mdp
 HOST_EXTRACFLAGS += -Isecurity/selinux/include
 
 always		:= $(hostprogs-y)
-clean-files	:= $(hostprogs-y) policy.* file_contexts
+clean-files	:= policy.* file_contexts
-- 
1.8.3.2

