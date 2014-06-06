Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:44096 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751912AbaFFBbM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jun 2014 21:31:12 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile11) with ESMTP id s561VA3Z026801
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili16) with ESMTP id s561VAM32546
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 4/5] kbuild: clean-up and bug fix of scripts/Makefile.host
Date: Fri,  6 Jun 2014 10:31:02 +0900
Message-Id: <1402018263-30670-5-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Assume we have a Makefile like this:

  hostprogs-y := foo
  foo-cxxobjs := bar/baz.o
  foo-objs := qux/quux.o

In this case, Kbuild creates bar/ directory,
but fails to create qux/ directory.

This commit re-writes directory creation more simply,
fixing that bug.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 scripts/Makefile.host | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index e6abc2e..b0e1a64 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -64,13 +64,9 @@ host-cshobjs	:= $(sort $(foreach m,$(host-cshlib),$($(m:.so=-objs))))
 # output directory for programs/.o files
 # hostprogs-y := tools/build may have been specified. Retrieve directory
 host-objdirs := $(foreach f,$(__hostprogs), $(dir $(f)))
-# directory of .o files from prog-objs notation
-host-objdirs += $(foreach f,$(host-cmulti),                  \
-                    $(foreach m,$($(f)-objs),                \
-                        $(dir $(m))))
-# directory of .o files from prog-cxxobjs notation
-host-objdirs += $(foreach f,$(host-cxxmulti),                  \
-                    $(foreach m,$($(f)-cxxobjs),                \
+# directory of .o files from prog-objs or prog-cxxobjs notation
+host-objdirs += $(foreach f,$(__hostprogs),                   \
+                    $(foreach m,$($(f)-objs) $($(f)-cxxobjs), \
                         $(dir $(m))))
 
 host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
-- 
1.9.1

