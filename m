Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:26266 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752622AbdI3BLJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:11:09 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 8/9] kbuild: rpm-pkg: keep spec file until make mrproper
Date: Sat, 30 Sep 2017 10:10:10 +0900
Message-Id: <1506733811-24636-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Michal Marek <mmarek@suse.com>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti@gmail.com>, linux-kernel@vger.kernel.org

If build fails during (bin)rpm-pkg, the spec file is not cleaned by
anyone until the next successful build of the package.

We do not have to immediately delete the spec file in case somebody
may want to take a look at it.  Instead, make them ignored by git,
and cleaned up by make mrproper.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore               | 5 +++++
 scripts/package/Makefile | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index 0c39aa2..4f034b8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -54,6 +54,11 @@ Module.symvers
 /Module.markers
 
 #
+# RPM spec file (make rpm-pkg)
+#
+/*.spec
+
+#
 # Debian directory (make deb-pkg)
 #
 /debian/
diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index b559671..70eea1e 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -51,7 +51,6 @@ rpm-pkg rpm: FORCE
 	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
 	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
 	+rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
-	rm $(KERNELPATH).tar.gz kernel.spec
 
 # binrpm-pkg
 # ---------------------------------------------------------------------------
@@ -60,7 +59,8 @@ binrpm-pkg: FORCE
 	$(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
 	+rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
-	rm binkernel.spec
+
+clean-files += $(objtree)/*.spec
 
 # Deb target
 # ---------------------------------------------------------------------------
-- 
2.7.4

