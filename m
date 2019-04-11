Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:35826 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfDKOdQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 10:33:16 -0400
From: Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V1 1/3] kbuild: serialize modules and modules_install
Date: Thu, 11 Apr 2019 07:20:13 -0700
Message-Id: <1554992415-292288-2-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com>
References: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: Steve Sistare <steven.sistare@oracle.com>

"make -j 16 modules modules_install" allows both targets to run concurrently
and produces warnings and incorrect results in the install area.  Force
them to be run serially, the same way that "install modules_install" is
already seralized.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 026fbc4..4988dcc 100644
--- a/Makefile
+++ b/Makefile
@@ -291,9 +291,11 @@ ifneq ($(filter $(clean-targets),$(MAKECMDGOALS)),)
         endif
 endif
 
-# install and modules_install need also be processed one by one
-ifneq ($(filter install,$(MAKECMDGOALS)),)
-        ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
+# modules_install and {install or modules} need to be processed one by one
+ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
+        ifneq ($(filter install,$(MAKECMDGOALS)),)
+	        mixed-targets := 1
+        else ifneq ($(filter modules,$(MAKECMDGOALS)),)
 	        mixed-targets := 1
         endif
 endif
-- 
1.8.3.1
