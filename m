Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:64385 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733190AbfBNDGF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Feb 2019 22:06:05 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/8] kbuild: move tools_silent to a more relevant place
Date: Thu, 14 Feb 2019 12:05:18 +0900
Message-Id: <1550113521-23577-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This would disturb the change the sub-make part. Move it near the
tools/ target.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3956e93..0180b23 100644
--- a/Makefile
+++ b/Makefile
@@ -90,7 +90,6 @@ endif
 
 ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
   quiet=silent_
-  tools_silent=s
 endif
 
 export quiet Q KBUILD_VERBOSE
@@ -1664,6 +1663,11 @@ image_name:
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
