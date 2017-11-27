Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:57119 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751292AbdK0LHk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 06:07:40 -0500
From: Paolo Pisati <paolo.pisati@canonical.com>
Subject: [PATCH v3] scripts/package: snap-pkg target
Date: Mon, 27 Nov 2017 12:07:34 +0100
Message-Id: <1511780854-7213-1-git-send-email-paolo.pisati@canonical.com>
In-Reply-To: <20171114123834.xsjiy2ynvott4gae@brain>
References: <20171114123834.xsjiy2ynvott4gae@brain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Behan Webster <behanw@converseincode.com>, Matthias Kaehlcke <mka@chromium.org>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

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
Changes since v2:
 - use a tarball to instead of cloning the src tree via git
 - set 'kernel-with-firmware: false' to accomodate for
   'firmware_install' removal

Changes since v1:
 - slightly improve the messaging
---
 .gitignore                         |  5 +++++
 scripts/package/Makefile           | 16 ++++++++++++++++
 scripts/package/snapcraft.template | 14 ++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 scripts/package/snapcraft.template

diff --git a/.gitignore b/.gitignore
index f6050b8..705e099 100644
--- a/.gitignore
+++ b/.gitignore
@@ -66,6 +66,11 @@ modules.builtin
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
index 9ed96aef..5996300 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -95,6 +95,21 @@ bindeb-pkg: FORCE
 
 clean-dirs += $(objtree)/debian/
 
+# snap-pkg
+# ---------------------------------------------------------------------------
+snap-pkg: FORCE
+	rm -rf $(objtree)/snap
+	mkdir $(objtree)/snap
+	$(MAKE) clean
+	$(call cmd,src_tar,$(KERNELPATH))
+	sed "s@KERNELRELEASE@$(KERNELRELEASE)@; \
+		s@SRCTREE@$(shell realpath $(KERNELPATH).tar.gz)@" \
+		$(srctree)/scripts/package/snapcraft.template > \
+		$(objtree)/snap/snapcraft.yaml
+	cd $(objtree)/snap && \
+	snapcraft --target-arch=$(UTS_MACHINE)
+
+clean-dirs += $(objtree)/snap/
 
 # tarball targets
 # ---------------------------------------------------------------------------
@@ -139,6 +154,7 @@ help: FORCE
 	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
 	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
+	@echo '  snap-pkg            - Build only the binary kernel snap package (will connect to external hosts)'
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
diff --git a/scripts/package/snapcraft.template b/scripts/package/snapcraft.template
new file mode 100644
index 0000000..626d278e
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
+    source-type: tar
+    kernel-with-firmware: false
-- 
2.7.4

