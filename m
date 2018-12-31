Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34394 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbeLaBFT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Dec 2018 20:05:19 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove UIMAGE_IN and UIMAGE_OUT
Date: Mon, 31 Dec 2018 10:05:01 +0900
Message-Id: <1546218301-14163-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The only/last user of UIMAGE_IN/OUT was removed by commit 4722a3e6b716
("microblaze: fix multiple bugs in arch/microblaze/boot/Makefile").

The input and output should always be $< and $@.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3ceaa2e..05a3e40 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -371,15 +371,13 @@ UIMAGE_TYPE ?= kernel
 UIMAGE_LOADADDR ?= arch_must_set_this
 UIMAGE_ENTRYADDR ?= $(UIMAGE_LOADADDR)
 UIMAGE_NAME ?= 'Linux-$(KERNELRELEASE)'
-UIMAGE_IN ?= $<
-UIMAGE_OUT ?= $@
 
-quiet_cmd_uimage = UIMAGE  $(UIMAGE_OUT)
+quiet_cmd_uimage = UIMAGE  $@
       cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
 			-C $(UIMAGE_COMPRESSION) $(UIMAGE_OPTS-y) \
 			-T $(UIMAGE_TYPE) \
 			-a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
-			-n $(UIMAGE_NAME) -d $(UIMAGE_IN) $(UIMAGE_OUT)
+			-n $(UIMAGE_NAME) -d $< $@
 
 # XZ
 # ---------------------------------------------------------------------------
-- 
2.7.4
