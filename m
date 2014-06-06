Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:47413 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751984AbaFFBbM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jun 2014 21:31:12 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile13) with ESMTP id s561VBwe018123
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:11 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili12) with ESMTP id s561VAo25854
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 5/5] kbuild: create directory of .o files from shlib-objs notation
Date: Fri,  6 Jun 2014 10:31:03 +0900
Message-Id: <1402018263-30670-6-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Assume we have a Makefile like this:

  hostprogs-y := foo
  foo-objs := bar.o baz.so
  baz-objs := qux/quux.o

In this case, Kbuild fails to create qux/ directory.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 scripts/Makefile.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index b0e1a64..4bb237b 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -68,6 +68,8 @@ host-objdirs := $(foreach f,$(__hostprogs), $(dir $(f)))
 host-objdirs += $(foreach f,$(__hostprogs),                   \
                     $(foreach m,$($(f)-objs) $($(f)-cxxobjs), \
                         $(dir $(m))))
+# directory of .o files from shlib-objs notation
+host-objdirs += $(foreach m,$(host-cshobjs), $(dir $(m)))
 
 host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
 
-- 
1.9.1

