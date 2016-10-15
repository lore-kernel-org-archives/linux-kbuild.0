Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.osadl.at ([92.243.35.153]:51960 "EHLO mail.osadl.at"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754480AbcJOPpH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Oct 2016 11:45:07 -0400
From: Andreas Platschek <andreas.platschek@opentech.at>
Subject: [PATCH] Makefile: fix reference to sparse documentation
Date: Sat, 15 Oct 2016 15:33:56 +0000
Message-Id: <1476545636-18906-1-git-send-email-andreas.platschek@opentech.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Platschek <andreas.platschek@opentech.at>

Documenation/sparse.txt was moved to Documentation/dev-tools/sparse.rst,
this fixes the reference.

Signed-off-by: Andreas Platschek <andreas.platschek@opentech.at>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d8c784d..d7157a1 100644
--- a/Makefile
+++ b/Makefile
@@ -170,7 +170,7 @@ MAKEFLAGS += --no-print-directory
 # Use 'make C=2' to enable checking of *all* source files, regardless
 # of whether they are re-compiled or not.
 #
-# See the file "Documentation/sparse.txt" for more details, including
+# See the file "Documentation/dev-tools/sparse.rst" for more details, including
 # where to get the "sparse" utility.
 
 ifeq ("$(origin C)", "command line")
-- 
2.9.3

