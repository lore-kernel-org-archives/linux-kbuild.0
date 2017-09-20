Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:17665 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751873AbdITNBx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 09:01:53 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3] kbuild: (bin)rpm-pkg: fix version number handling
Date: Wed, 20 Sep 2017 22:01:26 +0900
Message-Id: <1505912486-30251-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Riku Voipio <riku.voipio@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

The "Release:" field of the spec file is determined based on the
.version file.

However, the .version file is not copied to the source tar file.
So, when we build the kernel from the source package, the UTS_VERSION
always indicates #1.  This does not match with "rpm -q".

The kernel UTS_VERSION and "rpm -q" do not agree for binrpm-pkg, either.
Please note the kernel has already been built before the spec file is
created.  Currently, mkspec invokes mkversion.  This script returns an
incremented version.  So, the "Release:" field of the spec file is
greater than the version in the kernel by one.

For the source package build (where .version file is missing), we can
give KBUILD_BUILD_VERSION=%{release} to the build command.

For the binary package build, we can simply read out the .version file
because it contains the version number that was used for building the
kernel image.

We can remove scripts/mkversion because scripts/package/Makefile need
not touch the .version file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - add ' 2>/dev/null || echo 1' in case .config is missing for rpm-pkg

Changes in v2:
  - Remove bogus comment in mkspec

 scripts/mkversion        | 6 ------
 scripts/package/Makefile | 5 -----
 scripts/package/mkspec   | 6 ++----
 3 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 scripts/mkversion

diff --git a/scripts/mkversion b/scripts/mkversion
deleted file mode 100644
index c12addc..0000000
--- a/scripts/mkversion
+++ /dev/null
@@ -1,6 +0,0 @@
-if [ ! -f .version ]
-then
-    echo 1
-else
-    expr 0`cat .version` + 1
-fi
diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 71b4a8a..73f9f31 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -50,8 +50,6 @@ rpm-pkg rpm: FORCE
 	$(MAKE) clean
 	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
 	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
-	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
-	mv -f $(objtree)/.tmp_version $(objtree)/.version
 	rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
 	rm $(KERNELPATH).tar.gz kernel.spec
 
@@ -60,9 +58,6 @@ rpm-pkg rpm: FORCE
 binrpm-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
 	$(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
-	$(CONFIG_SHELL) $(srctree)/scripts/mkversion > $(objtree)/.tmp_version
-	mv -f $(objtree)/.tmp_version $(objtree)/.version
-
 	rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 	rm binkernel.spec
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index bf3e9ab..f47f17a 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -27,9 +27,7 @@ __KERNELRELEASE=`echo $KERNELRELEASE | sed -e "s/-/_/g"`
 echo "Name: kernel"
 echo "Summary: The Linux Kernel"
 echo "Version: $__KERNELRELEASE"
-# we need to determine the NEXT version number so that uname and
-# rpm -q will agree
-echo "Release: `. $srctree/scripts/mkversion`"
+echo "Release: $(cat .version 2>/dev/null || echo 1)"
 echo "License: GPL"
 echo "Group: System Environment/Kernel"
 echo "Vendor: The Linux Community"
@@ -77,7 +75,7 @@ fi
 echo "%build"
 
 if ! $PREBUILT; then
-echo "make clean && make %{?_smp_mflags}"
+echo "make clean && make %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}"
 echo ""
 fi
 
-- 
2.7.4

