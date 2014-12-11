Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:36588 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965088AbaLKKMs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Dec 2014 05:12:48 -0500
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: use mixed-targets when two or more config targets are given
Date: Thu, 11 Dec 2014 19:12:34 +0900
Message-Id: <1418292754-2987-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org

"make kvmconfig" expects that the .config has already been created,
but some people might want to create the .config and run kvmconfig
in one shot command, like this:

  $ make defconfig kvmconfig

To make sure this command works correctly even if -j* option is set,
we must handle them one by one.
This commit turns on mixed-targets when $(MAKECMDGOALS) includes
at least one config target and also includes another target.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d9af2be..3272609 100644
--- a/Makefile
+++ b/Makefile
@@ -500,7 +500,7 @@ endif
 ifeq ($(KBUILD_EXTMOD),)
         ifneq ($(filter config %config,$(MAKECMDGOALS)),)
                 config-targets := 1
-                ifneq ($(filter-out config %config,$(MAKECMDGOALS)),)
+                ifneq ($(words $(MAKECMDGOALS)),1)
                         mixed-targets := 1
                 endif
         endif
-- 
1.9.1

