Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg010.nifty.com ([202.248.44.36]:44404 "EHLO
	conuserg010-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752175AbbCZMAO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Mar 2015 08:00:14 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: do not add $(bounds-file) and $(offsets-file) to targets
Date: Thu, 26 Mar 2015 20:59:52 +0900
Message-Id: <1427371192-29966-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org

$(always) is added to targets by scripts/Makefile.build.
Moreover, filechk does not need .*.cmd files.

Adding these two files to targets is redundant.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Kbuild | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Kbuild b/Kbuild
index 96d0629..6f0d82a 100644
--- a/Kbuild
+++ b/Kbuild
@@ -36,7 +36,7 @@ endef
 bounds-file := include/generated/bounds.h
 
 always  := $(bounds-file)
-targets := $(bounds-file) kernel/bounds.s
+targets := kernel/bounds.s
 
 # We use internal kbuild rules to avoid the "is up to date" message from make
 kernel/bounds.s: kernel/bounds.c FORCE
@@ -53,7 +53,6 @@ $(obj)/$(bounds-file): kernel/bounds.s FORCE
 offsets-file := include/generated/asm-offsets.h
 
 always  += $(offsets-file)
-targets += $(offsets-file)
 targets += arch/$(SRCARCH)/kernel/asm-offsets.s
 
 # We use internal kbuild rules to avoid the "is up to date" message from make
-- 
1.9.1

