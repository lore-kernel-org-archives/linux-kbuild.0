Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:52365 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932657AbdHVNEO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Aug 2017 09:04:14 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] kbuild: update comments of Makefile.asm-generic
Date: Tue, 22 Aug 2017 21:09:53 +0800
Message-ID: <1503407393-1107-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 scripts/Makefile.asm-generic | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index 95f7d80..a6c8c17 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -1,9 +1,9 @@
 # include/asm-generic contains a lot of files that are used
 # verbatim by several architectures.
 #
-# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
+# This Makefile reads the file arch/$(SRCARCH)/include/$(src)/Kbuild
 # and for each file listed in this file with generic-y creates
-# a small wrapper file in $(obj) (arch/$(SRCARCH)/include/generated/asm)
+# a small wrapper file in $(obj) (arch/$(SRCARCH)/include/generated/$(src))
 
 kbuild-file := $(srctree)/arch/$(SRCARCH)/include/$(src)/Kbuild
 -include $(kbuild-file)
-- 
2.1.0



