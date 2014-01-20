Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:37670 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbaATFIM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jan 2014 00:08:12 -0500
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile12) with ESMTP id s0K58A9P005430
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2014 14:08:10 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili13) with ESMTP id s0K58AJ18981
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2014 14:08:10 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: specify build_docproc as a phony target
Date: Mon, 20 Jan 2014 14:08:08 +0900
Message-Id: <1390194488-14993-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

PHONY target is more suitable for "build_docproc" target.

Because PHONY targets are always executed, they do not
have to take FORCE as a prerequisite.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 scripts/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 01e7adb..1d07860 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -27,10 +27,10 @@ always		:= $(hostprogs-y) $(hostprogs-m)
 hostprogs-y += unifdef docproc
 
 # These targets are used internally to avoid "is up to date" messages
-PHONY += build_unifdef
-build_unifdef: scripts/unifdef FORCE
+PHONY += build_unifdef build_docproc
+build_unifdef: $(obj)/unifdef
 	@:
-build_docproc: scripts/docproc FORCE
+build_docproc: $(obj)/docproc
 	@:
 
 subdir-$(CONFIG_MODVERSIONS) += genksyms
-- 
1.8.3.2

