Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:47411 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751671AbaFFBbM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jun 2014 21:31:12 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile13) with ESMTP id s561VA45018121
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili13) with ESMTP id s561VAJ32536
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 1/5] kbuild: fix a typo in scripts/Makefile.host
Date: Fri,  6 Jun 2014 10:30:59 +0900
Message-Id: <1402018263-30670-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

---
 scripts/Makefile.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 6689364..395a240 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -44,7 +44,7 @@ host-cmulti	:= $(foreach m,$(__hostprogs),\
 host-cobjs	:= $(sort $(foreach m,$(__hostprogs),$($(m)-objs)))
 
 # C++ code
-# C++ executables compiled from at least on .cc file
+# C++ executables compiled from at least one .cc file
 # and zero or more .c files
 host-cxxmulti	:= $(foreach m,$(__hostprogs),$(if $($(m)-cxxobjs),$(m)))
 
-- 
1.9.1

