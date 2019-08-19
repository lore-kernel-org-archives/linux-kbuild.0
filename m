Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:64650 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfHSESO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 00:18:14 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] .gitignore: ignore modules.order explicitly
Date: Mon, 19 Aug 2019 13:18:07 +0900
Message-Id: <20190819041807.11433-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The pattern '*.order' was added by commit c6025f4c8bbe ("kbuild: ignore
*.order files") to ignore modules.order files.

I do not see any other user of the '.order' extension.

Ignore 'modules.order' explicitly instead of '*.order'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 2030c7a4d2f8..ce2c6348d372 100644
--- a/.gitignore
+++ b/.gitignore
@@ -34,7 +34,6 @@
 *.mod.c
 *.o
 *.o.*
-*.order
 *.patch
 *.s
 *.so
@@ -46,6 +45,7 @@
 *.xz
 Module.symvers
 modules.builtin
+modules.order
 
 #
 # Top-level generic files
-- 
2.17.1
