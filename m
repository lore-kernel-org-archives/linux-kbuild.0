Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:47648 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751774AbaFFBn7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jun 2014 21:43:59 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile14) with ESMTP id s561hvJs009379
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:43:57 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili12) with ESMTP id s561hvo02706
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:43:57 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] scripts/Makefile.clean: clean also $(extra-m) and $(extra-)
Date: Fri,  6 Jun 2014 10:43:55 +0900
Message-Id: <1402019035-2190-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 scripts/Makefile.clean | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 686cb0d..a651cee 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -40,8 +40,8 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
 # build a list of files to remove, usually relative to the current
 # directory
 
-__clean-files	:= $(extra-y) $(always)                  \
-		   $(targets) $(clean-files)             \
+__clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
+		   $(always) $(targets) $(clean-files)   \
 		   $(host-progs)                         \
 		   $(hostprogs-y) $(hostprogs-m) $(hostprogs-)
 
-- 
1.9.1

