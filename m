Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:33982 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753894AbbIBNMG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Sep 2015 09:12:06 -0400
From: ulfalizer.lkml@gmail.com
Subject: [PATCH] Makefile: .PHONY is not a variable, but PHONY is
Date: Wed,  2 Sep 2015 15:11:19 +0200
Message-Id: <1441199479-12576-1-git-send-email-ulfalizer.lkml@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ulfalizer@gmail.com, mmarek@suse.com, trivial@kernel.org

From: Ulf Magnusson <ulfalizer@gmail.com>

.PHONY is a target, not a variable.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 24c9e3d..4835d24 100644
--- a/Makefile
+++ b/Makefile
@@ -1609,6 +1609,6 @@ endif	# skip-makefile
 PHONY += FORCE
 FORCE:
 
-# Declare the contents of the .PHONY variable as phony.  We keep that
+# Declare the contents of the PHONY variable as phony.  We keep that
 # information in a variable so we can use it in if_changed and friends.
 .PHONY: $(PHONY)
-- 
2.1.4

