Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25301 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752595AbdI3BKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:10:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 7/9] kbuild: rpm-pkg: fix jobserver unavailable warning
Date: Sat, 30 Sep 2017 10:10:09 +0900
Message-Id: <1506733811-24636-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

If "make rpm-pkg" or "make binrpm-pkg" is run with -j[jobs] option,
the following warning message is displayed.

  warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.

Follow the suggestion.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 73f9f31..b559671 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -50,7 +50,7 @@ rpm-pkg rpm: FORCE
 	$(MAKE) clean
 	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
 	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
-	rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
+	+rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
 	rm $(KERNELPATH).tar.gz kernel.spec
 
 # binrpm-pkg
@@ -58,7 +58,7 @@ rpm-pkg rpm: FORCE
 binrpm-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
 	$(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
-	rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
+	+rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 	rm binkernel.spec
 
-- 
2.7.4

