Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:41535 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750769AbaCTCIn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Mar 2014 22:08:43 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile12) with ESMTP id s2K28fZb008468
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2014 11:08:41 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili12) with ESMTP id s2K28fo27438
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2014 11:08:41 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2] kbuild: move "quote" to Kbuild.include to be consistent
Date: Thu, 20 Mar 2014 11:08:20 +0900
Message-Id: <1395281300-4330-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

Changes in v2:
 - I forgot to add Signed-off-by in v1.
   I am resending this.


 scripts/Kbuild.include | 1 +
 scripts/Makefile.lib   | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 547e15d..2ec6829 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -3,6 +3,7 @@
 
 # Convenient variables
 comma   := ,
+quote   := "
 squote  := '
 empty   :=
 space   := $(empty) $(empty)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 79c059e..a4ee8d2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -368,7 +368,3 @@ quiet_cmd_xzmisc = XZMISC  $@
 cmd_xzmisc = (cat $(filter-out FORCE,$^) | \
 	xz --check=crc32 --lzma2=dict=1MiB) > $@ || \
 	(rm -f $@ ; false)
-
-# misc stuff
-# ---------------------------------------------------------------------------
-quote:="
-- 
1.8.3.2

