Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:59511 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfGIJc6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:32:58 -0400
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH 4/4] debian: add generic rule file
Date: Tue,  9 Jul 2019 11:32:39 +0200
Message-Id: <1562664759-16009-4-git-send-email-info@metux.net>
In-Reply-To: <1562664759-16009-1-git-send-email-info@metux.net>
References: <1562664759-16009-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, info@metux.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com

Adding a generic debian rule file, so we can build the directly
via usual Debian package build tools (eg. git-buildpackage,
dck-buildpackage, etc). It expects the .config file already
placed in the source tree.

The rule file contains a rule for creating debian/control and
other metadata - this is done similar to the 'deb-pkg' make rule,
scripts/packaging/mkdebian.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 .gitignore   |  1 +
 MAINTAINERS  |  6 ++++++
 debian/rules | 27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100755 debian/rules

diff --git a/.gitignore b/.gitignore
index 7587ef56..01d742c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -69,6 +69,7 @@ modules.builtin
 # Debian directory (make deb-pkg)
 #
 /debian/
+!/debian/rules
 
 #
 # Snap directory (make snap-pkg)
diff --git a/MAINTAINERS b/MAINTAINERS
index 558acf2..56e034c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4516,6 +4516,12 @@ F:	include/uapi/linux/dccp.h
 F:	include/linux/tfrc.h
 F:	net/dccp/
 
+DEBIAN PACKAGING FILES
+M:	Enrico Weigelt <info@metux.net>
+L:	linux-kbuild@vger.kernel.org
+S:	Maintained
+F:	debian/
+
 DECnet NETWORK LAYER
 W:	http://linux-decnet.sourceforge.net
 L:	linux-decnet-user@lists.sourceforge.net
diff --git a/debian/rules b/debian/rules
new file mode 100755
index 0000000..c2f0319
--- /dev/null
+++ b/debian/rules
@@ -0,0 +1,27 @@
+#!/usr/bin/make -f
+# SPDX-License-Identifier: GPL-2.0
+
+export MAKE
+export KERNELARCH           = $(shell $(MAKE) kernelarch)
+export KERNELRELEASE        = $(shell $(MAKE) kernelrelease)
+export KBUILD_DEBARCH       = $(shell dpkg-architecture -qDEB_HOST_ARCH)
+export KBUILD_BUILD_VERSION = $(shell $(MAKE) kernellocalversion)
+export KDEB_RULES           = debian/rules.auto
+export KDEB_SOURCENAME      = linux-source
+export ARCH                 = $(KERNELARCH)
+
+debian/control debian/changelong debian/arch debian/copyright:
+debian/control:
+	./scripts/package/mkdebian
+
+build:	debian/control
+	$(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC=
+
+binary-arch:	debian/control
+	$(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC= intdeb-pkg
+
+clean:
+	rm -rf debian/*tmp debian/files debian/changelog debian/control debian/copyright debian/rules.auto debian/arch
+	$(MAKE) clean
+
+binary: binary-arch
-- 
1.9.1
