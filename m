Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:57953 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751693AbaFFBbM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jun 2014 21:31:12 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile12) with ESMTP id s561VAdY005146
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili15) with ESMTP id s561VAB10864
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 3/5] kbuild: clean up scripts/Makefile.host
Date: Fri,  6 Jun 2014 10:31:01 +0900
Message-Id: <1402018263-30670-4-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

$(dir $(f)) always returns non-empty string.

So, $(if $(dir $(f)),$(dir $(f)) is equivalent to $(dir $(f)).

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 scripts/Makefile.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 2632adf..e6abc2e 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -63,15 +63,15 @@ host-cshobjs	:= $(sort $(foreach m,$(host-cshlib),$($(m:.so=-objs))))
 
 # output directory for programs/.o files
 # hostprogs-y := tools/build may have been specified. Retrieve directory
-host-objdirs := $(foreach f,$(__hostprogs), $(if $(dir $(f)),$(dir $(f))))
+host-objdirs := $(foreach f,$(__hostprogs), $(dir $(f)))
 # directory of .o files from prog-objs notation
 host-objdirs += $(foreach f,$(host-cmulti),                  \
                     $(foreach m,$($(f)-objs),                \
-                        $(if $(dir $(m)),$(dir $(m)))))
+                        $(dir $(m))))
 # directory of .o files from prog-cxxobjs notation
 host-objdirs += $(foreach f,$(host-cxxmulti),                  \
                     $(foreach m,$($(f)-cxxobjs),                \
-                        $(if $(dir $(m)),$(dir $(m)))))
+                        $(dir $(m))))
 
 host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
 
-- 
1.9.1

