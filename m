Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from m12-13.163.com ([220.181.12.13]:56005 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731594AbfHFGXm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:23:42 -0400
From: Xiao Yang <ice_yangxiao@163.com>
Subject: [PATCH] kbuild: Remove unused variable TMPO of ld-option
Date: Tue,  6 Aug 2019 14:23:16 +0800
Message-Id: <20190806062316.30784-1-ice_yangxiao@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, yangx.jy@cn.fujitsu.com, Xiao Yang <ice_yangxiao@163.com>

ld-option implementation has been simplified so variable TMPO
is no longer needed.

Fixes: Commit 0294e6f4a000 ("kbuild: simplify ld-option implementation")
Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 scripts/Kbuild.include | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 4b0432e095ae..13a6f627351d 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -91,12 +91,11 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
 # automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP="$(TMPOUT).$$$$.tmp";	\
-	TMPO="$(TMPOUT).$$$$.o";	\
 	if ($(1)) >/dev/null 2>&1;	\
 	then echo "$(2)";		\
 	else echo "$(3)";		\
 	fi;				\
-	rm -f "$$TMP" "$$TMPO")
+	rm -f "$$TMP")
 
 # as-option
 # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
-- 
2.21.0
