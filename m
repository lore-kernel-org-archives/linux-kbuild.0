Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:35711 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751241AbdBFG6A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Feb 2017 01:58:00 -0500
Received: by mail-lf0-f42.google.com with SMTP id n124so39292573lfd.2
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Feb 2017 22:57:54 -0800 (PST)
From: Matti Aaltonen <matti.aaltonen@unikie.com>
Subject: [PATCH] kbuild: Add the source tree path to the Makefile.gcc-plugins path
Date: Mon,  6 Feb 2017 08:57:24 +0200
Message-Id: <20170206065724.3937-1-matti.aaltonen@darkmatter.ae>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.com, Matti Aaltonen <matti.aaltonen@darkmatter.ae>

Make sure that the Makefile.gcc-plugins is found also when
the build is not started from the kernel root directory.

Signed-off-by: Matti Aaltonen <matti.aaltonen@darkmatter.ae>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 96b27a8..d085504 100644
--- a/Makefile
+++ b/Makefile
@@ -651,7 +651,7 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
 # Tell gcc to never replace conditional load with a non-conditional one
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
 
-include scripts/Makefile.gcc-plugins
+include $(srctree)/scripts/Makefile.gcc-plugins
 
 ifdef CONFIG_READABLE_ASM
 # Disable optimizations that make assembler listings hard to read.
-- 
2.9.3

