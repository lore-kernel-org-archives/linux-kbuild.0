Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:38953 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751311AbdILKLi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 06:11:38 -0400
From: Paolo Pisati <paolo.pisati@canonical.com>
Subject: [PATCH v2] scripts/package: snap-pkg target
Date: Tue, 12 Sep 2017 12:11:31 +0200
Message-Id: <1505211091-19295-1-git-send-email-paolo.pisati@canonical.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti@gmail.com>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Following in footsteps of other targets like 'deb-pkg, 'rpm-pkg' and 'tar-pkg',
this patch adds a 'snap-pkg' target for the creation of a Linux kernel snap
package using the kbuild infrastructure.

A snap, in its general form, is a self contained, sandboxed, universal package
and it is intended to work across multiple distributions and/or devices. A snap
package is distributed as a single compressed squashfs filesystem.

A kernel snap is a snap package carrying the Linux kernel, kernel modules,
accessory files (DTBs, System.map, etc) and a manifesto file.  The purpose of a
kernel snap is to carry the Linux kernel during the creation of a system image,
eg. Ubuntu Core, and its subsequent upgrades.

For more information on snap packages: https://snapcraft.io/docs/

Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>
---
Changes since v1:
 - slightly improve the messaging
---
 .gitignore                         |  5 +++++
 scripts/package/Makefile           | 14 ++++++++++++++
 scripts/package/snapcraft.template | 14 ++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 scripts/package/snapcraft.template

diff --git a/.gitignore b/.gitignore
index 0c39aa2..638c492 100644
--- a/.gitignore
+++ b/.gitignore
@@ -59,6 +59,11 @@ Module.symvers
 /debian/
 
 #
+# Snap directory (make snap-pkg)
+#
+/snap/
+
+#
 # tar directory (make tar*-pkg)
 #
 /tar-install/
diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 71b4a8a..cfa1b2d 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -99,6 +99,19 @@ bindeb-pkg: FORCE
 
 clean-dirs += $(objtree)/debian/
 
+# snap-pkg
+# ---------------------------------------------------------------------------
+snap-pkg: FORCE
+	rm -rf $(objtree)/snap
+	mkdir $(objtree)/snap
+	sed "s@KERNELRELEASE@$(KERNELRELEASE)@; \
+		s@SRCTREE@$(shell realpath $(srctree))@" \
+		$(srctree)/scripts/package/snapcraft.template > \
+		$(objtree)/snap/snapcraft.yaml
+	cd $(objtree)/snap && \
+	snapcraft --target-arch=$(UTS_MACHINE)
+
+clean-dirs += $(objtree)/snap/
 
 # tarball targets
 # ---------------------------------------------------------------------------
@@ -143,6 +156,7 @@ help: FORCE
 	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
 	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
+	@echo '  snap-pkg            - Build only the binary kernel snap package (will connect to external hosts)'
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
diff --git a/scripts/package/snapcraft.template b/scripts/package/snapcraft.template
new file mode 100644
index 0000000..2e7ffc8
--- /dev/null
+++ b/scripts/package/snapcraft.template
@@ -0,0 +1,14 @@
+name: kernel
+version: KERNELRELEASE
+summary: Linux kernel
+description: The upstream Linux kernel
+grade: stable
+confinement: strict
+type: kernel
+
+parts:
+  kernel:
+    plugin: kernel
+    source: SRCTREE
+    source-type: git
+    kconfigfile: SRCTREE/.config
-- 
2.7.4

