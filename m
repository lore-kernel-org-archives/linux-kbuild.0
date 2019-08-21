Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:35857 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfHUHCT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 03:02:19 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/4] kbuild: remove unneeded '+' marker from cmd_clean
Date: Wed, 21 Aug 2019 16:02:05 +0900
Message-Id: <20190821070205.8297-4-yamada.masahiro@socionext.com>
In-Reply-To: <20190821070205.8297-1-yamada.masahiro@socionext.com>
References: <20190821070205.8297-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This '+' was added a long time ago:

|commit c23e6bf05f7802e92fd3da69a1ed35e56f9c85bb (HEAD)
|Author: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
|Date:   Mon Oct 28 01:16:34 2002 -0600
|
|    kbuild: Fix a "make -j<N>" warning
|
|diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
|index 2c843e0380bc..e7c392fd5788 100644
|--- a/scripts/Makefile.clean
|+++ b/scripts/Makefile.clean
|@@ -42,7 +42,7 @@ quiet_cmd_clean = CLEAN   $(obj)
|
| __clean: $(subdir-ymn)
| ifneq ($(strip $(__clean-files) $(clean-rule)),)
|-       $(call cmd,clean)
|+       +$(call cmd,clean)
| else
|        @:
| endif

At that time, cmd_clean contained '$(clean-rule)', which was able to
invoke sub-make. That was why "make -j<N> clean" showed:
warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.

It is not the case any more. cmd_clean now just runs the 'rm' command.
The '+' marker is pointless.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.clean | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 798e8717c1d9..29281a20cf8e 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -59,7 +59,7 @@ quiet_cmd_clean    = CLEAN   $(obj)
 
 __clean: $(subdir-ymn)
 ifneq ($(strip $(__clean-files)),)
-	+$(call cmd,clean)
+	$(call cmd,clean)
 endif
 	@:
 
-- 
2.17.1
