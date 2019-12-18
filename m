Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mxwww.masterlogin.de ([95.129.51.220]:42554 "EHLO
        mxwww.masterlogin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLRLzR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 06:55:17 -0500
From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH] kbuild: Add DTC_CPP_FLAGS
Date: Wed, 18 Dec 2019 12:46:25 +0100
Message-Id: <20191218114625.28438-1-frank-w@public-files.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

With this Patch we are able to change cpp-preprocessor options
(e.g. -D...) for using conditions (#ifdef) in devicetree files
and dynamically add include searchpaths

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3fa32f83b2d7..c722a6c7786a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -177,7 +177,7 @@ DTC_INCLUDE    := $(srctree)/scripts/dtc/include-prefixes
 
 dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
 		 $(addprefix -I,$(DTC_INCLUDE))                          \
-		 -undef -D__DTS__
+		 -undef -D__DTS__ $(DTC_CPP_FLAGS)
 
 # Useful for describing the dependency of composite objects
 # Usage:
-- 
2.17.1
