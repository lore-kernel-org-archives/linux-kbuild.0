Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728558AbgDMMEn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 08:04:43 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0586C03BC88
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 04:58:20 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id w29so6441636qtv.3
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 04:58:20 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
Subject: [PATCH] kbuild: arch/$(SUBARCH)/include/generated/ aren't cleaned by mrproper
Date: Mon, 13 Apr 2020 08:58:15 -0300
Message-Id: <20200413115815.141587-1-vitor@massaru.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org, michal.lkml@markovi.net, linux-kernel@vger.kernel.org, brendanhiggins@google.com, skhan@linuxfoundation.org

This bug was introduced in this commit a788b2ed81abe

Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 70def4907036..e1a79796032e 100644
--- a/Makefile
+++ b/Makefile
@@ -532,7 +532,8 @@ outputmakefile:
 ifdef building_out_of_srctree
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
-		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
+		 -d $(srctree)/arch/$(SRCARCH)/include/generated -o \
+		 -d $(srctree)/arch/$(SUBARCH)/include/generated ]; then \
 		echo >&2 "***"; \
 		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
 		echo >&2 "*** in $(abs_srctree)";\
@@ -1388,6 +1389,7 @@ CLEAN_FILES += modules.builtin modules.builtin.modinfo modules.nsdeps
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .tmp_objdiff \
+		  arch/$(SUBARCH)/include/generated \
 		  debian/ snap/ tar-install/
 MRPROPER_FILES += .config .config.old .version \
 		  Module.symvers \
-- 
2.25.1
