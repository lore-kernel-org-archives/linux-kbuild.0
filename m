Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:48887 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfANI3u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jan 2019 03:29:50 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unused archmrproper
Date: Mon, 14 Jan 2019 17:29:29 +0900
Message-Id: <1547454569-27319-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, uclinux-h8-devel@lists.sourceforge.jp, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

No one uses archmrproper.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile            | 4 ++--
 arch/h8300/Makefile | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 68898cc..a9c54e1 100644
--- a/Makefile
+++ b/Makefile
@@ -1360,11 +1360,11 @@ mrproper: rm-dirs  := $(wildcard $(MRPROPER_DIRS))
 mrproper: rm-files := $(wildcard $(MRPROPER_FILES))
 mrproper-dirs      := $(addprefix _mrproper_,scripts)
 
-PHONY += $(mrproper-dirs) mrproper archmrproper
+PHONY += $(mrproper-dirs) mrproper
 $(mrproper-dirs):
 	$(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
 
-mrproper: clean archmrproper $(mrproper-dirs)
+mrproper: clean $(mrproper-dirs)
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
 
diff --git a/arch/h8300/Makefile b/arch/h8300/Makefile
index 4003ddc..f801f37 100644
--- a/arch/h8300/Makefile
+++ b/arch/h8300/Makefile
@@ -37,8 +37,6 @@ libs-y	+= arch/$(ARCH)/lib/
 
 boot := arch/h8300/boot
 
-archmrproper:
-
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
 
-- 
2.7.4
