Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:53328 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfBVHkW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Feb 2019 02:40:22 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 1/6] kbuild: move tools_silent to a more relevant place
Date: Fri, 22 Feb 2019 16:40:06 +0900
Message-Id: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This would disturb the change the sub-make part. Move it near the
tools/ target.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bf4e77b..82091b8 100644
--- a/Makefile
+++ b/Makefile
@@ -90,7 +90,6 @@ endif
 
 ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
   quiet=silent_
-  tools_silent=s
 endif
 
 export quiet Q KBUILD_VERBOSE
@@ -1678,6 +1677,11 @@ image_name:
 	@echo $(KBUILD_IMAGE)
 
 # Clear a bunch of variables before executing the submake
+
+ifeq ($(quiet),silent_)
+tools_silent=s
+endif
+
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
 	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/
-- 
2.7.4
