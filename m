Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbgFUAXU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Jun 2020 20:23:20 -0400
Received: from omr2.cc.vt.edu (omr2.cc.ipv6.vt.edu [IPv6:2607:b400:92:8400:0:33:fb76:806e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D877C061796
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Jun 2020 17:23:20 -0700 (PDT)
Received: from mr4.cc.vt.edu (mr4.cc.vt.edu [IPv6:2607:b400:92:8300:0:7b:e2b1:6a29])
        by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 05KIqfRh025355
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Jun 2020 14:52:41 -0400
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        by mr4.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 05KIqZJj000656
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Jun 2020 14:52:40 -0400
Received: by mail-qt1-f197.google.com with SMTP id s44so3757239qtc.11
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Jun 2020 11:52:40 -0700 (PDT)
From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
Subject: kbuild: separate kerneldoc warnings from compiler warnings
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 20 Jun 2020 14:52:33 -0400
Message-ID: <591473.1592679153@turing-police>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This patch introduces a new build flag 'K=1' which controls whether kerneldoc
warnings should be issued, separating them from the compiler warnings that W=
controls.

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>

diff --git a/Makefile b/Makefile
index 29abe44ada91..b1c0f9484a66 100644
--- a/Makefile
+++ b/Makefile
@@ -1605,6 +1605,7 @@ PHONY += help
 	@echo  '                       (sparse by default)'
 	@echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
 	@echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
+	@echo  '  make K=1   [targets] Warn about problems in kerneldoc comments'
 	@echo  '  make W=n   [targets] Enable extra build checks, n=1,2,3 where'
 	@echo  '		1: warnings which may be relevant and do not occur too often'
 	@echo  '		2: warnings which occur quite often but may still be relevant'
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2e8810b7e5ed..9bcb77f5a5f1 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -100,7 +100,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
         cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 endif
 
-ifneq ($(KBUILD_EXTRA_WARN),)
+ifneq ($(KBUILD_KDOC_WARN),)
   cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
 endif
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 4aea7cf71d11..3fd5881c91b0 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -17,6 +17,12 @@ endif
 
 export KBUILD_EXTRA_WARN
 
+ifeq ("$(origin K)", "command line")
+  KBUILD_KDOC_WARN := $(K)
+endif
+
+export KBUILD_KDOC_WARN
+
 #
 # W=1 - warnings which may be relevant and do not occur too often
 #
